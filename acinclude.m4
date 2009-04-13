# AC_LUA_LIB_CHECK_VERSION(VERSION)
# ---------------------------------
# Checks if -llua has the correct version

AC_DEFUN([AC_LUA_LIB_CHECK_VERSION],
[AC_MSG_CHECKING([whether -llua version is $1])
AC_RUN_IFELSE(
[#include <string.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

int main(int argc, char **argv)
{
  lua_State *L = luaL_newstate();
  luaopen_base(L);
  lua_getglobal(L, "_VERSION");
  const char *version = lua_tostring(L, -1);
  return version == 0 || strcmp(version + 4, "$1") != 0;
}],
[AC_MSG_RESULT([yes])],
[AC_MSG_ERROR([wrong version])])])
