module Johnson
  module SpiderMonkey
    class RubyLandProxy

      class NativeRubyLandProxy < FFI::AutoPointer
        def self.make(runtime, jsvalue, name)
          SpiderMonkey.JS_AddNamedRootRT(runtime, jsvalue.to_ptr, name)
          self.new(jsvalue.to_ptr, self.new_releaser(runtime, jsvalue))
        end
        # Use a method to create the Proc to avoid binding the
        # AutoPointer instance inside the Proc.
        def self.new_releaser(runtime, jsvalue)
          Proc.new do |ptr| 
            runtime.send(:jsids).delete(jsvalue.value) if runtime.send(:jsids).has_key?(jsvalue.value)
            SpiderMonkey.JS_RemoveRootRT(runtime, ptr)
          end
        end
      end
      
      include Enumerable

      attr_reader :proxy_js_value
      alias_method :to_ary, :to_a

      class << self
        protected :new

        def make(runtime, value, name = '')
          if runtime.send(:jsids).has_key?(value)
            runtime.send(:jsids)[value]
          else
            self.new(runtime, value, name)
          end
        end
        # def finalize(runtime, ptr, value, proc)
        #   Proc.new { |*args| proc.call(runtime, ptr, value) }
        # end
        # def release(runtime, ptr, value)
        #   if runtime.send(:jsids).has_key?(value)
        #     runtime.send(:jsids).delete(value)
        #   end
        #   SpiderMonkey.JS_RemoveRootRT(runtime, ptr)
        # end
        # def method_to_proc method
        #   method.to_proc
        # end

      end

      def initialize(runtime, value, name)
        @runtime = runtime
        @proxy_js_value = JSValue.new(@runtime, value)

        @native_proxy= NativeRubyLandProxy.make(runtime, @proxy_js_value, name)
          #          @proxy_js_value.root_rt(binding, name)
        @runtime.send(:jsids)[@proxy_js_value.value] = self
        # ObjectSpace.define_finalizer(self, RubyLandProxy.finalize(runtime, 
        #                                                           @proxy_js_value.to_ptr, 
        #                                                           @proxy_js_value.value, 
        #                                                           RubyLandProxy.method_to_proc(self.class.method(:release))))

      end

      def [](name)
        get(name)
      end

      def []=(name, value)
        set(name, value)
      end

      def to_proc
        @proc ||= Proc.new { |*args| call(*args) }
      end

      def inspect
        toString
      end

      def call(*args)
        call_using(@runtime.global, *args)
      end

      def call_using(this, *args)
        native_call(this, *args)
      end

      def function?
        @proxy_js_value.root(binding) do |js_value|
          SpiderMonkey.JS_TypeOfValue(@runtime.context, js_value.value) == JSTYPE_FUNCTION ? true : false
        end
      end

      def respond_to?(sym)
        name = sym.to_s

        return true if "=" == name[-1, 1]

        found = FFI::MemoryPointer.new(:pointer)

        @proxy_js_value.root(binding)
        js_object = @proxy_js_value.to_object.root

        SpiderMonkey.JS_HasProperty(@runtime.context, js_object, name, found)

        @proxy_js_value.unroot
        js_object.unroot

        found.read_int == JS_TRUE ? true : super 
      end

      def method_missing(sym, *args, &block)
        args << block if block_given?
        
        name = sym.to_s
        assignment = "=" == name[-1, 1]

        # default behavior if the slot's not there

        return super unless assignment || respond_to?(sym)

        unless function_property?(name)
          # for arity 0, treat it as a get
          return self[name] if args.empty?

          # arity 1 and quacking like an assignment, treat it as a set
          return self[name[0..-2]] = args[0] if assignment && 1 == args.size
        end        
        
        # okay, must really be a function
        call_function_property(name, *args)
      end

      def size
        length
      end

      def each

        @proxy_js_value.root(binding)
        js_object = @proxy_js_value.to_object.root(binding)

        if SpiderMonkey.JS_IsArrayObject(@runtime.context, js_object) == JS_TRUE

          length = FFI::MemoryPointer.new(:uint)
          
          SpiderMonkey.JS_GetArrayLength(@runtime.context, js_object, length)

          length.read_int.times do |i|
            element = FFI::MemoryPointer.new(:long)
            SpiderMonkey.JS_GetElement(@runtime.context, js_object, i, element)

            @proxy_js_value.unroot
            js_object.unroot

            yield JSValue.new(@runtime, element).to_ruby
          end
          
        else
          
          ids = JSIdArray.new(SpiderMonkey.JS_Enumerate(@runtime.context, js_object))
          ids_ptr = ids.to_ptr
          property = FFI::MemoryPointer.new(:long)

          ids[:length].times do |i|
            
            js_key = FFI::MemoryPointer.new(:long)
            # FIXME: size of int must be retrieved in other way
            SpiderMonkey.JS_IdToValue(@runtime.context, ids_ptr.get_int(4 + i*4) , js_key)

            js_key_value = JSValue.new(@runtime, js_key).root(binding)
            
            if SpiderMonkey.JSVAL_IS_STRING(js_key.read_long)

              SpiderMonkey.JS_GetProperty(@runtime.context, js_object,
                                          SpiderMonkey.JS_GetStringBytes(SpiderMonkey.JSVAL_TO_STRING(js_key_value.value)), 
                                          property)

            else

              SpiderMonkey.JS_GetElement(@runtime.context, 
                                         js_object,
                                         SpiderMonkey.JSVAL_TO_INT(js_key_value.value), 
                                         property)
            end

            property_value = JSValue.new(@runtime, property).root(binding)

            key = js_key_value.to_ruby
            value = property_value.to_ruby

            @proxy_js_value.unroot
            js_object.unroot
            js_key_value.unroot
            property_value.unroot

            yield key, value

          end            

          SpiderMonkey.JS_DestroyIdArray(@runtime.context, ids)

        end

      end

      def length
        @proxy_js_value.root(binding)
        js_object = @proxy_js_value.to_object.root(binding)

        length = FFI::MemoryPointer.new(:uint)

        if SpiderMonkey.JS_IsArrayObject(@runtime.context, js_object) == JS_TRUE
          SpiderMonkey.JS_GetArrayLength(@runtime.context, js_object, length)
          @proxy_js_value.unroot
          js_object.unroot
          return length.read_int          
        else
          ids = JSIdArray.new(SpiderMonkey.JS_Enumerate(@runtime.context, js_object))
          length = ids[:length]
          SpiderMonkey.JS_DestroyIdArray(@runtime.context, ids)

          @proxy_js_value.unroot
          js_object.unroot

          return length
        end

      end

      private

      def call_function_property(name, *args)

        @proxy_js_value.root(binding)

        function = FFI::MemoryPointer.new(:long)
          
        SpiderMonkey.JS_GetProperty(@runtime.context, @proxy_js_value.to_object, name, function)
        
        function_value = JSValue.new(@runtime, function).root(binding)

        funtype = SpiderMonkey.JS_TypeOfValue(@runtime.context, function_value.value)

        # FIXME: should raise an error if the property is not a function
        if (funtype == JSTYPE_FUNCTION)
          result = call_js_function_value(@proxy_js_value, function_value, *args)
        end

        @proxy_js_value.unroot
        function_value.unroot

        result
      end

      def function_property?(name)
        @proxy_js_value.root(binding)
        js_object = @proxy_js_value.to_object.root(binding)

        property = FFI::MemoryPointer.new(:long)

        SpiderMonkey.JS_GetProperty(@runtime.context, js_object, name, property)
        property_value = JSValue.new(@runtime, property).root(binding)

        type = SpiderMonkey.JS_TypeOfValue(@runtime.context, property_value.value)

        @proxy_js_value.unroot
        js_object.unroot
        property_value.unroot
       
        type == SpiderMonkey::JSTYPE_FUNCTION ? true : false
      end

      def get(name)
        @proxy_js_value.root(binding) do |proxy_value|

          retval = FFI::MemoryPointer.new(:long)

          if name.kind_of?(Fixnum)
            SpiderMonkey.JS_GetElement(@runtime.context, proxy_value.to_object, name, retval)
          else
            SpiderMonkey.JS_GetProperty(@runtime.context, proxy_value.to_object, name, retval)
          end

          JSValue.new(@runtime, retval).to_ruby
        end
      end

      def set(name, value)

        @proxy_js_value.root(binding)

        Convert.to_js(@runtime, value).root do |js_value|

          case name
          
          when Fixnum
            SpiderMonkey.JS_SetElement(@runtime.context, @proxy_js_value.to_object, name, js_value)
          else
            SpiderMonkey.JS_SetProperty(@runtime.context, @proxy_js_value.to_object, name, js_value)
          end

        end

        @proxy_js_value.unroot
        value
      end

      def native_call(this, *args)

        unless function?
          raise "This Johnson::SpiderMonkey::RubyLandProxy isn't a function."
        end

        @proxy_js_value.root do |proxy_value|
          call_js_function_value(Convert.to_js(@runtime, this), proxy_value, *args)
        end
      end

      def call_js_function_value(target, function, *args)

        target.root(binding)
        function.root(binding)
        
        if SpiderMonkey.JSVAL_IS_OBJECT(target.value) == JS_FALSE
          raise "Target must be an object!"
        end
        
        js_value_args = args.map { |arg| Convert.to_js(@runtime, arg).root(binding) }
        
        js_args_ptr = FFI::MemoryPointer.new(:long, args.size).write_array_of_int(js_value_args.map { |js_value| js_value.value } )

        result = FFI::MemoryPointer.new(:long)

        SpiderMonkey.JS_CallFunctionValue(@runtime.context, target.to_object, function.value, args.size, js_args_ptr, result)

        js_value_args.each { |arg| arg.unroot }
        target.unroot
        function.unroot

        JSValue.new(@runtime, result).to_ruby
      end

    end
  end
end