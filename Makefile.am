SUBDIRS = lua
bin_PROGRAMS = datalog
lib_LIBRARIES = libdatalog.a
include_HEADERS = datalog.h
info_TEXINFOS = datalog.texi
pkgdata_DATA = datalog.lua datalog.html
noinst_PROGRAMS = bin2c

AM_CPPFLAGS = -I$(srcdir)/lua

libdatalog_a_SOURCES = datalog.h loader.c datalog.c

datalog_SOURCES = interp.c
datalog_LDADD = libdatalog.a lua/liblua.a -lm
datalog_DEPENDENCIES = libdatalog.a lua/liblua.a

BUILT_SOURCES = dl_lua.h

bin2c_SOURCES = bin2c.c

dl_lua.h:	bin2c$(EXEEXT) datalog.lua
	./bin2c -o $@ datalog.lua

AM_MAKEINFOHTMLFLAGS = --no-split

EXTRA_DIST = datalog.html try.sh ancestor.prolog ancestor.txt		\
bidipath.prolog bidipath.txt laps.prolog laps.txt long.prolog long.txt	\
path.prolog path.txt pq.prolog pq.txt revpath.prolog revpath.txt	\
true.prolog true.txt says.prolog says.txt
