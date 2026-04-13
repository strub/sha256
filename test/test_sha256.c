// -----------------------------------------------------------------
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

// -----------------------------------------------------------------
#include "sha256.h"

// -----------------------------------------------------------------
typedef struct {
  const char *name;
  const uint8_t *msg;
  const char *expected_hex;
} kat_vector_t;

// -----------------------------------------------------------------
static void digest_to_hex(const uint8_t digest[SHA256_DIGEST_SIZE], char out[2 * SHA256_DIGEST_SIZE + 1]) {
  static const char HEX[] = "0123456789abcdef";
  for (size_t i = 0; i < SHA256_DIGEST_SIZE; ++i) {
    out[2 * i] = HEX[digest[i] >> 4];
    out[2 * i + 1] = HEX[digest[i] & 0x0f];
  }
  out[2 * SHA256_DIGEST_SIZE] = '\0';
}

// -----------------------------------------------------------------
static int check_vector(const char *name, const uint8_t *msg, size_t len, const char *expected_hex) {
  uint8_t digest[SHA256_DIGEST_SIZE];
  char got_hex[2 * SHA256_DIGEST_SIZE + 1];

  sha256(msg, len, digest);
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
    "e3b0c44298fc1c149afbf4c8996fb924"
    "27ae41e4649b934ca495991b7852b855"
  },
  {
    "abc",
    (const uint8_t *)"abc",
    "ba7816bf8f01cfea414140de5dae2223"
    "b00361a396177a9cb410ff61f20015ad"
  },
  {
    "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq",
    (const uint8_t *)"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq",
    "248d6a61d20638b8e5c026930c3e6039"
    "a33ce45964ff2167f6ecedd419db06c1"
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
      "cdc76e5c9914fb9281a1c7e284d73e67"
      "f1809a48a497200e046d39ccc7112cd0"
    );
    free(million_a);
  }

  return failed ? 1 : 0;
}
