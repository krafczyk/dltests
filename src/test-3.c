#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>

int main(int argc, char** argv) {
	void* handle;
	int (*Ac)(int);
	char* error;

	handle = dlopen("libAc.so", RTLD_NOW | RTLD_GLOBAL);
	if(!handle) {
		fprintf(stderr, "%s\n", dlerror());
		return 1;
	}

	Ac = dlsym(handle, "Ac");
	if ((error = dlerror()) != NULL) {
		fprintf(stderr, "%s\n", error);
		return 1;
	}

	int in = 5;
	printf("%i -> %i\n", in , (*Ac)(in));
	return 0;
}
