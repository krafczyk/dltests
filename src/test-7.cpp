#include <cstdio>
#include <dlfcn.h>
#include "iface.h"

int main(int argc, char** argv) {
	void* handle;
	char* error;

	handle = dlopen("libiface_impl.so", RTLD_NOW | RTLD_GLOBAL);
	if(!handle) {
		fprintf(stderr, "%s\n", dlerror());
		return 1;
	}

	creator_t* creator = (creator_t*) dlsym(handle, "CreateInterfaceImplementation");
	if ((error = dlerror()) != NULL) {
		fprintf(stderr, "%s\n", error);
		return 1;
	}

	destroyer_t* destroyer = (destroyer_t*) dlsym(handle, "DestroyInterfaceImplementation");
	if ((error = dlerror()) != NULL) {
		fprintf(stderr, "%s\n", error);
		return 1;
	}

	InterfaceClass* iface = creator();

	int in = 5;
	printf("Storing value %i\n", in);

	iface->storeValue(in);
	printf("Got value %i\n", iface->getValue());
	if(iface->getValue() == in) {
		printf("Got correct value!\n");
	} else {
		printf("ERROR!\n");
		destroyer(iface);
		return -1;
	}
	destroyer(iface);
	return 0;
}
