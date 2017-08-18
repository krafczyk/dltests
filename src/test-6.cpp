#include <cstdio>
#include "iface.h"
#include "iface_impl.h"

int main(int argc, char** argv) {
	InterfaceClass* iface = (InterfaceClass*) new InterfaceImplementation;

	int in = 5;
	printf("Storing value %i\n", in);

	iface->storeValue(in);
	printf("Got value %i\n", iface->getValue());
	if(iface->getValue() == in) {
		printf("Got correct value!\n");
	} else {
		printf("ERROR!\n");
		delete iface;
		return -1;
	}
	delete iface;
	return 0;
}
