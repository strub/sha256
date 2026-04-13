// -----------------------------------------------------------------
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

// -----------------------------------------------------------------
#include "sha512.h"

// -----------------------------------------------------------------
typedef struct {
  const char *name;
  const uint8_t *msg;
  const char *expected_hex;
} kat_vector_t;

// -----------------------------------------------------------------
static void digest_to_hex(const uint8_t digest[SHA512_DIGEST_SIZE], char out[2 * SHA512_DIGEST_SIZE + 1]) {
  static const char HEX[] = "0123456789abcdef";
  for (size_t i = 0; i < SHA512_DIGEST_SIZE; ++i) {
    out[2 * i] = HEX[digest[i] >> 4];
    out[2 * i + 1] = HEX[digest[i] & 0x0f];
  }
  out[2 * SHA512_DIGEST_SIZE] = '\0';
}

// -----------------------------------------------------------------
static int check_vector(const char *name, const uint8_t *msg, size_t len, const char *expected_hex) {
  uint8_t digest[SHA512_DIGEST_SIZE];
  char got_hex[2 * SHA512_DIGEST_SIZE + 1];

  sha512(msg, len, digest);
  digest_to_hex(digest, got_hex);

  if (strcmp(got_hex, expected_hex) != 0) {
    fprintf(stderr, "FAIL %s\nexpected: %s\ngot:      %s\n", name, expected_hex, got_hex);
    return 1;
  }

  printf("PASS %s\n", name);
  return 0;
}

// -----------------------------------------------------------------
static const kat_vector_t KAT_VECTORS[] = {
  {
    "empty",
    (const uint8_t *)"",
    "cf83e1357eefb8bd"
    "f1542850d66d8007"
    "d620e4050b5715dc"
    "83f4a921d36ce9ce"
    "47d0d13c5d85f2b0"
    "ff8318d2877eec2f"
    "63b931bd47417a81"
    "a538327af927da3e"
  },
  {
    "abc",
    (const uint8_t *)"abc",
    "ddaf35a193617aba"
    "cc417349ae204131"
    "12e6fa4e89a97ea2"
    "0a9eeee64b55d39a"
    "2192992a274fc1a8"
    "36ba3c23a3feebbd"
    "454d4423643ce80e"
    "2a9ac94fa54ca49f"
  },
  {
    "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq",
    (const uint8_t *)"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq",
    "204a8fc6dda82f0a"
    "0ced7beb8e08a416"
    "57c16ef468b228a8"
    "279be331a703c335"
    "96fd15c13b1b07f9"
    "aa1d3bea57789ca0"
    "31ad85c7a71dd703"
    "54ec631238ca3445"
  },
  {
    "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmno"
    "ijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu",
    (const uint8_t *)
    "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmno"
    "ijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu",
    "8e959b75dae313da"
    "8cf4f72814fc143f"
    "8f7779c6eb9f7fa1"
    "7299aeadb6889018"
    "501d289e4900f7e4"
    "331b99dec4b5433a"
    "c7d329eeb6dd2654"
    "5e96e55b874be909"
  }
};

// -----------------------------------------------------------------
int main(void) {
  int failed = 0;
  for (size_t i = 0; i < sizeof(KAT_VECTORS) / sizeof(KAT_VECTORS[0]); ++i) {
    const kat_vector_t *v = &KAT_VECTORS[i];
    size_t len = strlen((const char *)v->msg);
    failed |= check_vector(v->name, v->msg, len, v->expected_hex);
  }

  {
    uint8_t *million_a = malloc(1000000);
    if (million_a == NULL) {
      fprintf(stderr, "FAIL malloc for million_a\n");
      return 1;
    }
    memset(million_a, 'a', 1000000);

    failed |= check_vector(
      "1,000,000 x 'a'",
      million_a,
      1000000,
      "e718483d0ce76964"
      "4e2e42c7bc15b463"
      "8e1f98b13b204428"
      "5632a803afa973eb"
      "de0ff244877ea60a"
      "4cb0432ce577c31b"
      "eb009c5c2c49aa2e"
      "4eadb217ad8cc09b"
    );
    free(million_a);
  }

  return failed ? 1 : 0;
}
