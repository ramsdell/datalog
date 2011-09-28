AC_INIT(Datalog, 1.7)

AC_CONFIG_SRCDIR(datalog.c)

AM_INIT_AUTOMAKE

AC_PROG_CC

# Add warning when using GGG
if test "X$GCC" = Xyes ; then
  CFLAGS="$CFLAGS -Wall"
fi

AC_PROG_RANLIB

AC_SEARCH_LIBS([exp], [m])

AC_ARG_WITH([lua],
  [AS_HELP_STRING([--with-lua],
    [use installed lua package (default no)])],
  [],
  [with_lua=no])

# Look for correct version of Lua
if test x$with_lua != xno ; then
  AC_CHECK_HEADERS([lua.h lualib.h])
  AX_LUA_HEADERS_VERSION(501, 502)
  AC_SEARCH_LIBS([lua_pcall], [lua$with_lua_suffix])
fi

AM_CONDITIONAL([NO_LUA], [test x$with_lua = xno])

AC_CONFIG_FILES([Makefile lua/Makefile datalog.spec datalog.lua])

AC_OUTPUT
