#include "iface_impl.h"

InterfaceImplementation::InterfaceImplementation() {
	A = new int;
	*A = 0;
}

InterfaceImplementation::~InterfaceImplementation() {
	delete A;
}

void InterfaceImplementation::storeValue(int in) {
	*A = in;
}
int InterfaceImplementation::getValue() {
	return *A;
}

extern "C" {
	InterfaceClass* CreateInterfaceImplementation() {
		return new InterfaceImplementation;
	}
	void DestroyInterfaceImplementation(InterfaceClass* p) {
		delete p;
	}
}
