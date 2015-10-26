# make CC="gcc"
# make CC="musl-gcc"
# make CC="clang"

.PHONY: *.lua *.lua.c

default: luastatic

lua liblua.a:
	cd lua-5.2.4 && make posix
	cp lua-5.2.4/src/liblua.a . 
	cp lua-5.2.4/src/lua . 

luastatic: lua liblua.a
	./lua luastatic.lua luastatic.lua liblua.a

hello: luastatic
	./luastatic test/hello.lua liblua.a
	
sql: luastatic
	lua luastatic.lua test/sql.lua liblua.a test/lsqlite3.a /usr/lib/x86_64-linux-gnu/libsqlite3.a -pthread

run: hello
	./hello

clean:
	cd lua-5.2.4 && make clean
	rm -f liblua.a lua *.lua.c luastatic hello sql
