Gem::Specification.new do |s|
  s.name = %q{johnson}
  s.version = "1.0.0.200807031344"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Barnette", "Aaron Patterson", "Yehuda Katz", "Matthew Draper"]
  s.date = %q{2008-07-03}
  s.default_executable = %q{johnson}
  s.description = %q{Johnson wraps JavaScript in a loving Ruby embrace.}
  s.email = %q{johnson-talk@googlegroups.com}
  s.executables = ["johnson"]
  s.extensions = ["Rakefile"]
  s.extra_rdoc_files = ["README.rdoc", "cross-compile.txt"]
  s.files = ["CHANGELOG", "MANIFEST", "MINGW32.mk", "README.rdoc", "Rakefile", "bin/johnson", "cross-compile.txt", "ext/spidermonkey/context.c", "ext/spidermonkey/context.h", "ext/spidermonkey/conversions.c", "ext/spidermonkey/conversions.h", "ext/spidermonkey/debugger.c", "ext/spidermonkey/debugger.h", "ext/spidermonkey/extconf.rb", "ext/spidermonkey/extensions.c", "ext/spidermonkey/extensions.h", "ext/spidermonkey/global.c", "ext/spidermonkey/global.h", "ext/spidermonkey/idhash.c", "ext/spidermonkey/idhash.h", "ext/spidermonkey/immutable_node.c", "ext/spidermonkey/immutable_node.c.erb", "ext/spidermonkey/immutable_node.h", "ext/spidermonkey/jroot.h", "ext/spidermonkey/js_land_proxy.c", "ext/spidermonkey/js_land_proxy.h", "ext/spidermonkey/ruby_land_proxy.c", "ext/spidermonkey/ruby_land_proxy.h", "ext/spidermonkey/runtime.c", "ext/spidermonkey/runtime.h", "ext/spidermonkey/spidermonkey.c", "ext/spidermonkey/spidermonkey.h", "johnson.gemspec", "js/johnson/browser.js", "js/johnson/browser/env.js", "js/johnson/browser/jquery.js", "js/johnson/browser/xmlsax.js", "js/johnson/browser/xmlw3cdom.js", "js/johnson/cli.js", "js/johnson/prelude.js", "js/johnson/template.js", "lib/hoe.rb", "lib/johnson.rb", "lib/johnson/cli.rb", "lib/johnson/cli/options.rb", "lib/johnson/error.rb", "lib/johnson/nodes.rb", "lib/johnson/nodes/binary_node.rb", "lib/johnson/nodes/for.rb", "lib/johnson/nodes/for_in.rb", "lib/johnson/nodes/function.rb", "lib/johnson/nodes/list.rb", "lib/johnson/nodes/node.rb", "lib/johnson/nodes/ternary_node.rb", "lib/johnson/parser.rb", "lib/johnson/parser/syntax_error.rb", "lib/johnson/runtime.rb", "lib/johnson/spidermonkey/context.rb", "lib/johnson/spidermonkey/debugger.rb", "lib/johnson/spidermonkey/immutable_node.rb", "lib/johnson/spidermonkey/js_land_proxy.rb", "lib/johnson/spidermonkey/mutable_tree_visitor.rb", "lib/johnson/spidermonkey/ruby_land_proxy.rb", "lib/johnson/spidermonkey/runtime.rb", "lib/johnson/version.rb", "lib/johnson/visitable.rb", "lib/johnson/visitors.rb", "lib/johnson/visitors/dot_visitor.rb", "lib/johnson/visitors/ecma_visitor.rb", "lib/johnson/visitors/enumerating_visitor.rb", "lib/johnson/visitors/sexp_visitor.rb", "lib/rails/init.rb", "test/assets/index.html", "test/assets/jquery_test.html", "test/helper.rb", "test/johnson/browser_test.rb", "test/johnson/conversions/array_test.rb", "test/johnson/conversions/boolean_test.rb", "test/johnson/conversions/callable_test.rb", "test/johnson/conversions/file_test.rb", "test/johnson/conversions/nil_test.rb", "test/johnson/conversions/number_test.rb", "test/johnson/conversions/regexp_test.rb", "test/johnson/conversions/string_test.rb", "test/johnson/conversions/struct_test.rb", "test/johnson/conversions/symbol_test.rb", "test/johnson/conversions/thread_test.rb", "test/johnson/error_test.rb", "test/johnson/extensions_test.rb", "test/johnson/nodes/array_literal_test.rb", "test/johnson/nodes/array_node_test.rb", "test/johnson/nodes/binary_node_test.rb", "test/johnson/nodes/bracket_access_test.rb", "test/johnson/nodes/delete_test.rb", "test/johnson/nodes/do_while_test.rb", "test/johnson/nodes/dot_accessor_test.rb", "test/johnson/nodes/export_test.rb", "test/johnson/nodes/for_test.rb", "test/johnson/nodes/function_test.rb", "test/johnson/nodes/if_test.rb", "test/johnson/nodes/import_test.rb", "test/johnson/nodes/label_test.rb", "test/johnson/nodes/object_literal_test.rb", "test/johnson/nodes/return_test.rb", "test/johnson/nodes/semi_test.rb", "test/johnson/nodes/switch_test.rb", "test/johnson/nodes/ternary_test.rb", "test/johnson/nodes/throw_test.rb", "test/johnson/nodes/try_node_test.rb", "test/johnson/nodes/typeof_test.rb", "test/johnson/nodes/unary_node_test.rb", "test/johnson/nodes/void_test.rb", "test/johnson/nodes/while_test.rb", "test/johnson/nodes/with_test.rb", "test/johnson/prelude_test.rb", "test/johnson/runtime_test.rb", "test/johnson/spidermonkey/context_test.rb", "test/johnson/spidermonkey/immutable_node_test.rb", "test/johnson/spidermonkey/js_land_proxy_test.rb", "test/johnson/spidermonkey/ruby_land_proxy_test.rb", "test/johnson/spidermonkey/runtime_test.rb", "test/johnson/version_test.rb", "test/johnson/visitors/dot_visitor_test.rb", "test/johnson/visitors/enumerating_visitor_test.rb", "test/johnson_test.rb", "test/jquery_units/test.js", "test/jquery_units/test_helper.js", "test/jquery_units/units/ajax.js", "test/jquery_units/units/core.js", "test/jquery_units/units/event.js", "test/jquery_units/units/fx.js", "test/jquery_units/units/offset.js", "test/jquery_units/units/selector.js", "test/jspec/helper.js", "test/jspec/jspec.js", "test/jspec/simple_spec.js", "test/parser_test.rb", "todo/.keep", "vendor/spidermonkey/.cvsignore", "vendor/spidermonkey/Makefile.in", "vendor/spidermonkey/Makefile.ref", "vendor/spidermonkey/README.html", "vendor/spidermonkey/SpiderMonkey.rsp", "vendor/spidermonkey/Y.js", "vendor/spidermonkey/build.mk", "vendor/spidermonkey/config.mk", "vendor/spidermonkey/config/AIX4.1.mk", "vendor/spidermonkey/config/AIX4.2.mk", "vendor/spidermonkey/config/AIX4.3.mk", "vendor/spidermonkey/config/Darwin.mk", "vendor/spidermonkey/config/Darwin1.3.mk", "vendor/spidermonkey/config/Darwin1.4.mk", "vendor/spidermonkey/config/Darwin5.2.mk", "vendor/spidermonkey/config/Darwin5.3.mk", "vendor/spidermonkey/config/HP-UXB.10.10.mk", "vendor/spidermonkey/config/HP-UXB.10.20.mk", "vendor/spidermonkey/config/HP-UXB.11.00.mk", "vendor/spidermonkey/config/IRIX.mk", "vendor/spidermonkey/config/IRIX5.3.mk", "vendor/spidermonkey/config/IRIX6.1.mk", "vendor/spidermonkey/config/IRIX6.2.mk", "vendor/spidermonkey/config/IRIX6.3.mk", "vendor/spidermonkey/config/IRIX6.5.mk", "vendor/spidermonkey/config/Linux_All.mk", "vendor/spidermonkey/config/Mac_OS10.0.mk", "vendor/spidermonkey/config/OSF1V4.0.mk", "vendor/spidermonkey/config/OSF1V5.0.mk", "vendor/spidermonkey/config/SunOS4.1.4.mk", "vendor/spidermonkey/config/SunOS5.10.mk", "vendor/spidermonkey/config/SunOS5.3.mk", "vendor/spidermonkey/config/SunOS5.4.mk", "vendor/spidermonkey/config/SunOS5.5.1.mk", "vendor/spidermonkey/config/SunOS5.5.mk", "vendor/spidermonkey/config/SunOS5.6.mk", "vendor/spidermonkey/config/SunOS5.7.mk", "vendor/spidermonkey/config/SunOS5.8.mk", "vendor/spidermonkey/config/SunOS5.9.mk", "vendor/spidermonkey/config/WINNT4.0.mk", "vendor/spidermonkey/config/WINNT5.0.mk", "vendor/spidermonkey/config/WINNT5.1.mk", "vendor/spidermonkey/config/WINNT5.2.mk", "vendor/spidermonkey/config/WINNT6.0.mk", "vendor/spidermonkey/config/dgux.mk", "vendor/spidermonkey/editline/Makefile.ref", "vendor/spidermonkey/editline/README", "vendor/spidermonkey/editline/editline.3", "vendor/spidermonkey/editline/editline.c", "vendor/spidermonkey/editline/editline.h", "vendor/spidermonkey/editline/sysunix.c", "vendor/spidermonkey/editline/unix.h", "vendor/spidermonkey/fdlibm/.cvsignore", "vendor/spidermonkey/fdlibm/Makefile.in", "vendor/spidermonkey/fdlibm/Makefile.ref", "vendor/spidermonkey/fdlibm/e_acos.c", "vendor/spidermonkey/fdlibm/e_acosh.c", "vendor/spidermonkey/fdlibm/e_asin.c", "vendor/spidermonkey/fdlibm/e_atan2.c", "vendor/spidermonkey/fdlibm/e_atanh.c", "vendor/spidermonkey/fdlibm/e_cosh.c", "vendor/spidermonkey/fdlibm/e_exp.c", "vendor/spidermonkey/fdlibm/e_fmod.c", "vendor/spidermonkey/fdlibm/e_gamma.c", "vendor/spidermonkey/fdlibm/e_gamma_r.c", "vendor/spidermonkey/fdlibm/e_hypot.c", "vendor/spidermonkey/fdlibm/e_j0.c", "vendor/spidermonkey/fdlibm/e_j1.c", "vendor/spidermonkey/fdlibm/e_jn.c", "vendor/spidermonkey/fdlibm/e_lgamma.c", "vendor/spidermonkey/fdlibm/e_lgamma_r.c", "vendor/spidermonkey/fdlibm/e_log.c", "vendor/spidermonkey/fdlibm/e_log10.c", "vendor/spidermonkey/fdlibm/e_pow.c", "vendor/spidermonkey/fdlibm/e_rem_pio2.c", "vendor/spidermonkey/fdlibm/e_remainder.c", "vendor/spidermonkey/fdlibm/e_scalb.c", "vendor/spidermonkey/fdlibm/e_sinh.c", "vendor/spidermonkey/fdlibm/e_sqrt.c", "vendor/spidermonkey/fdlibm/fdlibm.h", "vendor/spidermonkey/fdlibm/fdlibm.mak", "vendor/spidermonkey/fdlibm/fdlibm.mdp", "vendor/spidermonkey/fdlibm/k_cos.c", "vendor/spidermonkey/fdlibm/k_rem_pio2.c", "vendor/spidermonkey/fdlibm/k_sin.c", "vendor/spidermonkey/fdlibm/k_standard.c", "vendor/spidermonkey/fdlibm/k_tan.c", "vendor/spidermonkey/fdlibm/s_asinh.c", "vendor/spidermonkey/fdlibm/s_atan.c", "vendor/spidermonkey/fdlibm/s_cbrt.c", "vendor/spidermonkey/fdlibm/s_ceil.c", "vendor/spidermonkey/fdlibm/s_copysign.c", "vendor/spidermonkey/fdlibm/s_cos.c", "vendor/spidermonkey/fdlibm/s_erf.c", "vendor/spidermonkey/fdlibm/s_expm1.c", "vendor/spidermonkey/fdlibm/s_fabs.c", "vendor/spidermonkey/fdlibm/s_finite.c", "vendor/spidermonkey/fdlibm/s_floor.c", "vendor/spidermonkey/fdlibm/s_frexp.c", "vendor/spidermonkey/fdlibm/s_ilogb.c", "vendor/spidermonkey/fdlibm/s_isnan.c", "vendor/spidermonkey/fdlibm/s_ldexp.c", "vendor/spidermonkey/fdlibm/s_lib_version.c", "vendor/spidermonkey/fdlibm/s_log1p.c", "vendor/spidermonkey/fdlibm/s_logb.c", "vendor/spidermonkey/fdlibm/s_matherr.c", "vendor/spidermonkey/fdlibm/s_modf.c", "vendor/spidermonkey/fdlibm/s_nextafter.c", "vendor/spidermonkey/fdlibm/s_rint.c", "vendor/spidermonkey/fdlibm/s_scalbn.c", "vendor/spidermonkey/fdlibm/s_signgam.c", "vendor/spidermonkey/fdlibm/s_significand.c", "vendor/spidermonkey/fdlibm/s_sin.c", "vendor/spidermonkey/fdlibm/s_tan.c", "vendor/spidermonkey/fdlibm/s_tanh.c", "vendor/spidermonkey/fdlibm/w_acos.c", "vendor/spidermonkey/fdlibm/w_acosh.c", "vendor/spidermonkey/fdlibm/w_asin.c", "vendor/spidermonkey/fdlibm/w_atan2.c", "vendor/spidermonkey/fdlibm/w_atanh.c", "vendor/spidermonkey/fdlibm/w_cosh.c", "vendor/spidermonkey/fdlibm/w_exp.c", "vendor/spidermonkey/fdlibm/w_fmod.c", "vendor/spidermonkey/fdlibm/w_gamma.c", "vendor/spidermonkey/fdlibm/w_gamma_r.c", "vendor/spidermonkey/fdlibm/w_hypot.c", "vendor/spidermonkey/fdlibm/w_j0.c", "vendor/spidermonkey/fdlibm/w_j1.c", "vendor/spidermonkey/fdlibm/w_jn.c", "vendor/spidermonkey/fdlibm/w_lgamma.c", "vendor/spidermonkey/fdlibm/w_lgamma_r.c", "vendor/spidermonkey/fdlibm/w_log.c", "vendor/spidermonkey/fdlibm/w_log10.c", "vendor/spidermonkey/fdlibm/w_pow.c", "vendor/spidermonkey/fdlibm/w_remainder.c", "vendor/spidermonkey/fdlibm/w_scalb.c", "vendor/spidermonkey/fdlibm/w_sinh.c", "vendor/spidermonkey/fdlibm/w_sqrt.c", "vendor/spidermonkey/javascript-trace.d", "vendor/spidermonkey/js.c", "vendor/spidermonkey/js.mak", "vendor/spidermonkey/js.mdp", "vendor/spidermonkey/js.msg", "vendor/spidermonkey/js.pkg", "vendor/spidermonkey/js3240.rc", "vendor/spidermonkey/jsOS240.def", "vendor/spidermonkey/jsapi.c", "vendor/spidermonkey/jsapi.h", "vendor/spidermonkey/jsarena.c", "vendor/spidermonkey/jsarena.h", "vendor/spidermonkey/jsarray.c", "vendor/spidermonkey/jsarray.h", "vendor/spidermonkey/jsatom.c", "vendor/spidermonkey/jsatom.h", "vendor/spidermonkey/jsbit.h", "vendor/spidermonkey/jsbool.c", "vendor/spidermonkey/jsbool.h", "vendor/spidermonkey/jsclist.h", "vendor/spidermonkey/jscntxt.c", "vendor/spidermonkey/jscntxt.h", "vendor/spidermonkey/jscompat.h", "vendor/spidermonkey/jsconfig.h", "vendor/spidermonkey/jsconfig.mk", "vendor/spidermonkey/jscpucfg.c", "vendor/spidermonkey/jscpucfg.h", "vendor/spidermonkey/jsdate.c", "vendor/spidermonkey/jsdate.h", "vendor/spidermonkey/jsdbgapi.c", "vendor/spidermonkey/jsdbgapi.h", "vendor/spidermonkey/jsdhash.c", "vendor/spidermonkey/jsdhash.h", "vendor/spidermonkey/jsdtoa.c", "vendor/spidermonkey/jsdtoa.h", "vendor/spidermonkey/jsdtracef.c", "vendor/spidermonkey/jsdtracef.h", "vendor/spidermonkey/jsemit.c", "vendor/spidermonkey/jsemit.h", "vendor/spidermonkey/jsexn.c", "vendor/spidermonkey/jsexn.h", "vendor/spidermonkey/jsfile.c", "vendor/spidermonkey/jsfile.h", "vendor/spidermonkey/jsfile.msg", "vendor/spidermonkey/jsfun.c", "vendor/spidermonkey/jsfun.h", "vendor/spidermonkey/jsgc.c", "vendor/spidermonkey/jsgc.h", "vendor/spidermonkey/jshash.c", "vendor/spidermonkey/jshash.h", "vendor/spidermonkey/jsify.pl", "vendor/spidermonkey/jsinterp.c", "vendor/spidermonkey/jsinterp.h", "vendor/spidermonkey/jsinvoke.c", "vendor/spidermonkey/jsiter.c", "vendor/spidermonkey/jsiter.h", "vendor/spidermonkey/jskeyword.tbl", "vendor/spidermonkey/jskwgen.c", "vendor/spidermonkey/jslibmath.h", "vendor/spidermonkey/jslock.c", "vendor/spidermonkey/jslock.h", "vendor/spidermonkey/jslocko.asm", "vendor/spidermonkey/jslog2.c", "vendor/spidermonkey/jslong.c", "vendor/spidermonkey/jslong.h", "vendor/spidermonkey/jsmath.c", "vendor/spidermonkey/jsmath.h", "vendor/spidermonkey/jsnum.c", "vendor/spidermonkey/jsnum.h", "vendor/spidermonkey/jsobj.c", "vendor/spidermonkey/jsobj.h", "vendor/spidermonkey/jsopcode.c", "vendor/spidermonkey/jsopcode.h", "vendor/spidermonkey/jsopcode.tbl", "vendor/spidermonkey/jsotypes.h", "vendor/spidermonkey/jsparse.c", "vendor/spidermonkey/jsparse.h", "vendor/spidermonkey/jsprf.c", "vendor/spidermonkey/jsprf.h", "vendor/spidermonkey/jsproto.tbl", "vendor/spidermonkey/jsprvtd.h", "vendor/spidermonkey/jspubtd.h", "vendor/spidermonkey/jsregexp.c", "vendor/spidermonkey/jsregexp.h", "vendor/spidermonkey/jsreops.tbl", "vendor/spidermonkey/jsscan.c", "vendor/spidermonkey/jsscan.h", "vendor/spidermonkey/jsscope.c", "vendor/spidermonkey/jsscope.h", "vendor/spidermonkey/jsscript.c", "vendor/spidermonkey/jsscript.h", "vendor/spidermonkey/jsshell.msg", "vendor/spidermonkey/jsstddef.h", "vendor/spidermonkey/jsstr.c", "vendor/spidermonkey/jsstr.h", "vendor/spidermonkey/jstypes.h", "vendor/spidermonkey/jsutil.c", "vendor/spidermonkey/jsutil.h", "vendor/spidermonkey/jsxdrapi.c", "vendor/spidermonkey/jsxdrapi.h", "vendor/spidermonkey/jsxml.c", "vendor/spidermonkey/jsxml.h", "vendor/spidermonkey/lock_SunOS.s", "vendor/spidermonkey/perfect.js", "vendor/spidermonkey/plify_jsdhash.sed", "vendor/spidermonkey/prmjtime.c", "vendor/spidermonkey/prmjtime.h", "vendor/spidermonkey/resource.h", "vendor/spidermonkey/rules.mk", "vendor/spidermonkey/win32.order"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jbarnette/johnson/wikis}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{johnson}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Johnson wraps JavaScript in a loving Ruby embrace.}
  s.test_files = ["test/johnson/browser_test.rb", "test/johnson/conversions/array_test.rb", "test/johnson/conversions/boolean_test.rb", "test/johnson/conversions/callable_test.rb", "test/johnson/conversions/file_test.rb", "test/johnson/conversions/nil_test.rb", "test/johnson/conversions/number_test.rb", "test/johnson/conversions/regexp_test.rb", "test/johnson/conversions/string_test.rb", "test/johnson/conversions/struct_test.rb", "test/johnson/conversions/symbol_test.rb", "test/johnson/conversions/thread_test.rb", "test/johnson/error_test.rb", "test/johnson/extensions_test.rb", "test/johnson/nodes/array_literal_test.rb", "test/johnson/nodes/array_node_test.rb", "test/johnson/nodes/binary_node_test.rb", "test/johnson/nodes/bracket_access_test.rb", "test/johnson/nodes/delete_test.rb", "test/johnson/nodes/do_while_test.rb", "test/johnson/nodes/dot_accessor_test.rb", "test/johnson/nodes/export_test.rb", "test/johnson/nodes/for_test.rb", "test/johnson/nodes/function_test.rb", "test/johnson/nodes/if_test.rb", "test/johnson/nodes/import_test.rb", "test/johnson/nodes/label_test.rb", "test/johnson/nodes/object_literal_test.rb", "test/johnson/nodes/return_test.rb", "test/johnson/nodes/semi_test.rb", "test/johnson/nodes/switch_test.rb", "test/johnson/nodes/ternary_test.rb", "test/johnson/nodes/throw_test.rb", "test/johnson/nodes/try_node_test.rb", "test/johnson/nodes/typeof_test.rb", "test/johnson/nodes/unary_node_test.rb", "test/johnson/nodes/void_test.rb", "test/johnson/nodes/while_test.rb", "test/johnson/nodes/with_test.rb", "test/johnson/prelude_test.rb", "test/johnson/runtime_test.rb", "test/johnson/spidermonkey/context_test.rb", "test/johnson/spidermonkey/immutable_node_test.rb", "test/johnson/spidermonkey/js_land_proxy_test.rb", "test/johnson/spidermonkey/ruby_land_proxy_test.rb", "test/johnson/spidermonkey/runtime_test.rb", "test/johnson/version_test.rb", "test/johnson/visitors/dot_visitor_test.rb", "test/johnson/visitors/enumerating_visitor_test.rb", "test/johnson_test.rb", "test/parser_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
