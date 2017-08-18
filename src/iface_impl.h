#ifndef iface_impl_HDR
#define iface_impl_HDR

#include "iface.h"

class InterfaceImplementation : public InterfaceClass {
	public:
		InterfaceImplementation();
		virtual ~InterfaceImplementation();

		virtual void storeValue(int in);
		virtual int getValue();

	private:
		int* A;
};

#endif
