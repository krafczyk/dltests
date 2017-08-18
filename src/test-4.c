#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>

int main(int argc, char** argv) {
	void* handleA;
	void* handleB;
	int (*Bc)(int);
	char* error;

	handleA = dlopen("libAc.so", RTLD_NOW | RTLD_GLOBAL);
	if(!handleA) {
		fprintf(stderr, "%s\n", dlerror());
		return 1;
	}

	handleB = dlopen("libBc.so", RTLD_NOW | RTLD_GLOBAL);
	if(!handleB) {
		fprintf(stderr, "%s\n", dlerror());
		return 1;
	}

	Bc = dlsym(handleB, "Bc");
	if ((error = dlerror()) != NULL) {
		fprintf(stderr, "%s\n", error);
		return 1;
	}

	int in = 5;
	printf("%i -> %i\n", in , (*Bc)(in));
	return 0;
}
