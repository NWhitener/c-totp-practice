#ifndef SHA1_H 
#define SHA1_H

#include <stdint.h>
#include <stddef.h>

#define SHA1_BLOCK_SIZE 64
#define SHA1_DIGEST_LENGTH 20 

typedef struct {
	uint32_t state[5]; 
	uint64_t bitlen; 
	uint8_t data[SHA1_BLOCK_SIZE]; 
	uint32_t datalen; 
} sha1_ctx; 

void sha1_init(sha1_ctx * ctx); 
void sha1_update(sha1_ctx *ctc, const uint8_t *data, size_t len); 
void sha1_final(sha1_ctx *ctx, uint8_t digest[SHA1_DIGEST_LENGTH]); 
void sha1_compute(const uint8_t *data, size_t len, uint8_t digest[SHA1_DIGEST_LENGTH]); 


#endif 
