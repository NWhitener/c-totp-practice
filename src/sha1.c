#include "../include/sha1.h" 
#include <stdio.h>


#define K_0 0x5A827999
#define k_1 0x6ED9EBA1
#define k_2 0x8F1BBCDC
#define k_3 0xCA62C1D6

uint32_t rotate_left(uint32_t val, unsigned int n); 


uint32_t rotate_left(uint32_t val, unsigned int n){
	return (val << n) | (val >> (32-n));
}
