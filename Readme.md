# Programs to test DL loading

A set of programs to test and demonstrate correct usage of DL library loading.

## C examples

These examples first test the C interface

### test-1

Direct linking with a library containing a function definition

### test-2

Direct linking with a library containgin a function definition which uses a function definition in another library.

### test-3

DL loading of simple function from library containing that library definition

### test-4

DL loading of function with another function from another library inside it.

### test-5

Incorrect DL loading of function with another function from another library inside it. This should fail and result in a undefined symbol error.

## C++ examples

These examples test working with C++ classes with the DL interface.

### test-6

Direct linking with a library containing a class specialization definition

### test-7

DL loading and destroying of factory function for creating specialized class

