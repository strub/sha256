#ifndef SHA512_H_
# define SHA512_H_

# include <sys/types.h>
# include <stdint.h>

#define SHA512_STATE_u64_SIZE  8u
#define SHA512_BLOCK_SIZE    128u
#define SHA512_DIGEST_SIZE    64u

typedef struct {
	uint64_t u64[SHA512_STATE_u64_SIZE];
} sha512_state_t;

void sha512(const uint8_t *msg, size_t len, uint8_t *out);

#endif // !SHA512_H_
