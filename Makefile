CXXFLAGS := -g -fPIC -I src

all: bin/test-1 bin/test-2 bin/test-3 bin/test-4 bin/test-5 bin/test-6 bin/test-7

bindir:
	if [ ! -d bin ]; then mkdir bin; fi;

libdir:
	if [ ! -d lib ]; then mkdir lib; fi;

bin/test-1: test-1.o lib/libAc.so bindir
	gcc $(CXXFLAGS) -o $@ $< -L lib -lAc

test-1.o: src/test-1.c
	gcc $(CXXFLAGS) -c $^ -o $@

bin/test-2: test-2.o lib/libAc.so lib/libBc.so bindir
	gcc $(CXXFLAGS) -o $@ $< -L lib -lAc -lBc

test-2.o: src/test-2.c
	gcc $(CXXFLAGS) -c $^ -o $@

bin/test-3: test-3.o lib/libAc.so bindir
	gcc $(CXXFLAGS) -o $@ $< -ldl

test-3.o: src/test-3.c
	gcc $(CXXFLAGS) -c $^ -o $@

bin/test-4: test-4.o lib/libAc.so bindir
	gcc $(CXXFLAGS) -o $@ $< -ldl

test-4.o: src/test-4.c
	gcc $(CXXFLAGS) -c $^ -o $@

bin/test-5: test-5.o lib/libAc.so bindir
	gcc $(CXXFLAGS) -o $@ $< -ldl

test-5.o: src/test-5.c
	gcc $(CXXFLAGS) -c $^ -o $@

bin/test-6: test-6.o lib/libiface_impl.so bindir
	g++ $(CXXFLAGS) -o $@ $< -L lib -liface_impl

test-6.o: src/test-6.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

bin/test-7: test-7.o lib/libiface_impl.so bindir
	g++ $(CXXFLAGS) -o $@ $< -ldl

test-7.o: src/test-7.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

lib/libAc.so: Ac.o libdir
	gcc -shared $(CXXFLAGS) -o $@ $<

Ac.o: src/Ac.c
	gcc $(CXXFLAGS) -c $^ -o $@

lib/libBc.so: Bc.o libdir
	gcc -shared $(CXXFLAGS) -o $@ $<

Bc.o: src/Bc.c
	gcc $(CXXFLAGS) -c $^ -o $@

lib/libiface_impl.so: iface_impl.o libdir
	g++ -shared $(CXXFLAGS) -o $@ $<

iface_impl.o: src/iface_impl.cxx
	g++ $(CXXFLAGS) -c $^ -o $@

clean:
	rm -f *.o *.so
	rm -f bin/*
	rm -f lib/*
