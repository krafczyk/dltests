CXXFLAGS := -g -I src

all: bin/test-1 bin/test-2

bindir:
	if [ ! -d bin ]; then mkdir bin; fi;

libdir:
	if [ ! -d lib ]; then mkdir lib; fi;

bin/test-1: test-1.o lib/libA.so bindir
	g++ $(CXXFLAGS) -o $@ $< -L lib -lA

test-1.o: src/test-1.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

bin/test-2: test-2.o lib/libA.so lib/libB.so bindir
	g++ $(CXXFLAGS) -o $@ $< -L lib -lA -lB

test-2.o: src/test-2.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

lib/libA.so: A.o libdir
	g++ -shared $(CXXFLAGS) -o $@ $<

A.o: src/A.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

lib/libB.so: B.o libdir
	g++ -shared $(CXXFLAGS) -o $@ $<

B.o: src/B.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

clean:
	rm -f *.o *.so
	rm -f bin/*
	rm -f lib/*
