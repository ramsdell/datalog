AC_INIT(Datalog, 1.4)

AC_CONFIG_SRCDIR(datalog.c)

AM_INIT_AUTOMAKE

AC_PROG_CC

# Add warning when using GGG
if test "X$GCC" = Xyes ; then
  CFLAGS="$CFLAGS -Wall"
fi

AC_PROG_RANLIB

AC_CONFIG_FILES([Makefile lua/Makefile datalog.spec datalog.lua])

AC_OUTPUT
