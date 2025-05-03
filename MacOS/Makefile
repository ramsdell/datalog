vpath %.h ..
vpath %.c ..

all:	datalog

datalog:	../interp.c ../loader.c ../datalog.c dl_lua.h
	cc -O -I../lua -o $@ ../interp.c ../loader.c ../datalog.c -llua

dl_lua.h:	bin2c ../datalog.lua
	cp ../datalog.lua datalog.lua
	./bin2c -o $@ datalog.lua

clean:
	rm bin2c datalog.lua datalog dl_lua.h
