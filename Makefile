CXXFLAGS := -g -I .

all: test-1 test-2

test-1: test-1.o libA.so
	g++ $(CXXFLAGS) -o $@ $< -L. -lA

test-1.o: test-1.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

test-2: test-2.o libA.so libB.so
	g++ $(CXXFLAGS) -o $@ $< -L. -lA -lB

test-2.o: test-2.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

libA.so: A.o
	g++ -shared $(CXXFLAGS) -o $@ $^

A.o: A.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

libB.so: B.o
	g++ -shared $(CXXFLAGS) -o $@ $^

B.o: B.cpp
	g++ $(CXXFLAGS) -c $^ -o $@

clean:
	rm -f *.o *.so
	rm -f test-1
