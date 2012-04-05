bin_PROGRAMS = datalog
lib_LTLIBRARIES = libdatalog.la
include_HEADERS = datalog.h
info_TEXINFOS = datalog.texi
pkgdata_DATA = datalog.lua datalog.html
dist_man_MANS = datalog.1
noinst_PROGRAMS = bin2c
dist_noinst_SCRIPTS = datalogimport datalogexport

if NO_LUA
  SUBDIRS = lua
  AM_CPPFLAGS = -I$(srcdir)/lua
  LOCAL_LIBLUA = lua/liblua.a
endif

libdatalog_la_SOURCES = datalog.h loader.c datalog.c
libdatalog_la_LDFLAGS = -version-info 0:0:0

datalog_SOURCES = interp.c
datalog_LDADD = libdatalog.la $(LOCAL_LIBLUA)
datalog_DEPENDENCIES = libdatalog.la $(LOCAL_LIBLUA)

BUILT_SOURCES = dl_lua.h

bin2c_SOURCES = bin2c.c

dl_lua.h:	bin2c$(EXEEXT) datalog.lua
	./bin2c -o $@ datalog.lua

AM_MAKEINFOHTMLFLAGS = --no-split

EXTRA_DIST = datalog.html try.sh ancestor.prolog ancestor.txt		\
bidipath.prolog bidipath.txt laps.prolog laps.txt long.prolog long.txt	\
path.prolog path.txt pq.prolog pq.txt revpath.prolog revpath.txt	\
true.prolog true.txt says.prolog says.txt add.lua
