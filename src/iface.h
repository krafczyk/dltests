#ifndef iface_HDR
#define iface_HDR

class InterfaceClass {
	public:
		InterfaceClass() {};
		virtual ~InterfaceClass() {};

		virtual void storeValue(int in) = 0;
		virtual int getValue() = 0;
};

typedef InterfaceClass* creator_t();
typedef void destroyer_t(InterfaceClass*);

#endif
