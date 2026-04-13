#include <stdint.h>
#include <string.h>
#include <stdio.h>

#include "sha512.h"

static const uint64_t SHA512_INIT_STATE[SHA512_STATE_u64_SIZE] = {
  0x6a09e667f3bcc908ull, 0xbb67ae8584caa73bull,
  0x3c6ef372fe94f82bull, 0xa54ff53a5f1d36f1ull,
  0x510e527fade682d1ull, 0x9b05688c2b3e6c1full,
  0x1f83d9abfb41bd6bull, 0x5be0cd19137e2179ull
};

static inline void store_be64(uint8_t out[8], uint64_t x) {
  out[0] = (uint8_t)(x >> 56);
  out[1] = (uint8_t)(x >> 48);
  out[2] = (uint8_t)(x >> 40);
  out[3] = (uint8_t)(x >> 32);
  out[4] = (uint8_t)(x >> 24);
  out[5] = (uint8_t)(x >> 16);
  out[6] = (uint8_t)(x >> 8);
  out[7] = (uint8_t)x;
}

extern void sha512__compress(uint64_t*, const uint8_t*);

void sha512(const uint8_t *msg, size_t len, uint8_t *out) {
  sha512_state_t state;
  uint8_t last[2 * SHA512_BLOCK_SIZE];
  size_t blocks = len / SHA512_BLOCK_SIZE;
  size_t rem = len % SHA512_BLOCK_SIZE;
  uint64_t bit_len = (uint64_t)len * 8u;

  memcpy(state.u64, SHA512_INIT_STATE, sizeof(state.u64));

  for (size_t i = 0; i < blocks; ++i) {
    sha512__compress(&state.u64[0], &msg[i * SHA512_BLOCK_SIZE]);
  }

  memset(last, 0, sizeof(last));
  if (rem != 0u) {
    memcpy(last, &msg[blocks * SHA512_BLOCK_SIZE], rem);
  }
  last[rem] = 0x80u;

  size_t len_pos = (rem < 112u) ? 112u : 240u;

  /* 128-bit length: upper 64 bits are zero for len < 2^61 */
  for (size_t i = 0; i < 8; ++i) {
    last[len_pos + 15u - i] = (uint8_t)(bit_len >> (i * 8u));
  }

  sha512__compress(&state.u64[0], &last[0]);
  if (len_pos == 240u) {
    sha512__compress(&state.u64[0], &last[SHA512_BLOCK_SIZE]);
  }

  for (size_t i = 0; i < SHA512_STATE_u64_SIZE; ++i) {
    store_be64(&out[i * 8u], state.u64[i]);
  }
}
