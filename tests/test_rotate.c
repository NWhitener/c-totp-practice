#include <stdio.h>
#include <stdint.h>

extern uint32_t rotate_left(uint32_t val, unsigned int n); 

int main(){
	struct {
		uint32_t value; 
		unsigned int bits; 
		uint32_t expected; 
	} tests[] = {
		{0x00000001, 1, 0x00000002}, 
		{0x80000000, 1, 0x00000001}, 
		{0x12345678, 4, 0x23456781}, 
		{0xFFFFFFFF, 5, 0xFFFFFFFF}, 
		{0x0F0F0F0F, 8, 0x0F0F0F0F}, 
		{0x00000001, 32, 0x00000001}, 
	}; 
	
	int n_tests = sizeof(tests)/sizeof(tests[0]); 
	int passed = 0; 
	int i; 
	for (i=0; i < n_tests; i++){
		uint32_t result = rotate_left(tests[i].value, tests[i].bits); 
		if (result == tests[i].expected){
			printf("Test %d passed\n", i); 
			passed++;
		}
		else {
			printf("Test %d failed: rotate_left(0x%08X, %u) = 0x%08X, expected 0x%08X\n", i, tests[i].value, tests[i].bits, result, tests[i].expected);
		}
	}
	printf("Passed %d/%d tests\n", passed, n_tests); 
	return (passed == n_tests) ? 0 :1;

}
