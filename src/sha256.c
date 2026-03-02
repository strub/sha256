#include <stdint.h>
#include <string.h>
#include <stdio.h>

#include "sha256.h"

static const uint32_t SHA256_INIT_STATE[SHA256_STATE_u32_SIZE] = {
  0x6a09e667u, 0xbb67ae85u, 0x3c6ef372u, 0xa54ff53au,
  0x510e527fu, 0x9b05688cu, 0x1f83d9abu, 0x5be0cd19u
};

static inline void store_be32(uint8_t out[4], uint32_t x) {
  out[0] = (uint8_t)(x >> 24);
  out[1] = (uint8_t)(x >> 16);
  out[2] = (uint8_t)(x >> 8);
  out[3] = (uint8_t)x;
}

extern void sha256__compress(uint32_t*, const uint8_t*);

void sha256(const uint8_t *msg, size_t len, uint8_t *out) {
  sha256_state_t state;
  uint8_t last[2 * SHA256_BLOCK_SIZE];
  size_t blocks = len / SHA256_BLOCK_SIZE;
  size_t rem = len % SHA256_BLOCK_SIZE;
  uint64_t bit_len = (uint64_t)len * 8u;

  memcpy(state.u32, SHA256_INIT_STATE, sizeof(state.u32));

  for (size_t i = 0; i < blocks; ++i) {
    sha256__compress(&state.u32[0], &msg[i * SHA256_BLOCK_SIZE]);
  }

  memset(last, 0, sizeof(last));
  if (rem != 0u) {
    memcpy(last, &msg[blocks * SHA256_BLOCK_SIZE], rem);
  }
  last[rem] = 0x80u;

  size_t len_pos = (rem < 56u) ? 56u : 120u;
  for (size_t i = 0; i < 8; ++i) {
    last[len_pos + 7u - i] = (uint8_t)(bit_len >> (i * 8u));
  }

  sha256__compress(&state.u32[0], &last[0]);
  if (len_pos == 120u) {
    sha256__compress(&state.u32[0], &last[SHA256_BLOCK_SIZE]);
  }

  for (size_t i = 0; i < SHA256_STATE_u32_SIZE; ++i) {
    store_be32(&out[i * 4u], state.u32[i]);
  }
}
