#ifndef SHA256_H_
# define SHA256_H_

# include <sys/types.h>
# include <stdint.h>

#define SHA256_STATE_u32_SIZE  8u
#define SHA256_BLOCK_SIZE     64u
#define SHA256_DIGEST_SIZE    32u

typedef struct {
	uint32_t u32[SHA256_STATE_u32_SIZE];
} sha256_state_t;

void sha256(const uint8_t *msg, size_t len, uint8_t *out);

#endif // !SHA256_H_
