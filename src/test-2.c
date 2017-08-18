#include <stdio.h>
#include "Bc.h"

int main(int argc, char** argv) {
	int in = 5;
	printf("%i -> %i\n", in, Bc(in));
	return 0;
}
