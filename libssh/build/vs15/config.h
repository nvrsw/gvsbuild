/* Name of package */
#define PACKAGE "libssh"

/* Version number of package */
#define VERSION "0.9.0"

/* #undef LOCALEDIR */
/* #undef DATADIR */
#define LIBDIR "lib"
#define PLUGINDIR "plugins-4"
/* #undef SYSCONFDIR */
#define BINARYDIR "C:/gtk-build/build/x64/release/libssh/build/vs15/build"
#define SOURCEDIR "C:/gtk-build/build/x64/release/libssh"

/* Global bind configuration file path */
#define GLOBAL_BIND_CONFIG "/etc/ssh/libssh_server_config"

/* Global client configuration file path */
#define GLOBAL_CLIENT_CONFIG "/etc/ssh/ssh_config"

/************************** HEADER FILES *************************/

/* Define to 1 if you have the <argp.h> header file. */
/* #undef HAVE_ARGP_H */

/* Define to 1 if you have the <aprpa/inet.h> header file. */
/* #undef HAVE_ARPA_INET_H */

/* Define to 1 if you have the <glob.h> header file. */
/* #undef HAVE_GLOB_H */

/* Define to 1 if you have the <valgrind/valgrind.h> header file. */
/* #undef HAVE_VALGRIND_VALGRIND_H */

/* Define to 1 if you have the <pty.h> header file. */
/* #undef HAVE_PTY_H */

/* Define to 1 if you have the <utmp.h> header file. */
/* #undef HAVE_UTMP_H */

/* Define to 1 if you have the <util.h> header file. */
/* #undef HAVE_UTIL_H */

/* Define to 1 if you have the <libutil.h> header file. */
/* #undef HAVE_LIBUTIL_H */

/* Define to 1 if you have the <sys/time.h> header file. */
/* #undef HAVE_SYS_TIME_H */

/* Define to 1 if you have the <sys/utime.h> header file. */
#define HAVE_SYS_UTIME_H 1

/* Define to 1 if you have the <io.h> header file. */
#define HAVE_IO_H 1

/* Define to 1 if you have the <termios.h> header file. */
/* #undef HAVE_TERMIOS_H */

/* Define to 1 if you have the <unistd.h> header file. */
/* #undef HAVE_UNISTD_H */

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <openssl/aes.h> header file. */
#define HAVE_OPENSSL_AES_H 1

/* Define to 1 if you have the <wspiapi.h> header file. */
#define HAVE_WSPIAPI_H 1

/* Define to 1 if you have the <openssl/blowfish.h> header file. */
/* #undef HAVE_OPENSSL_BLOWFISH_H */

/* Define to 1 if you have the <openssl/des.h> header file. */
#define HAVE_OPENSSL_DES_H 1

/* Define to 1 if you have the <openssl/ecdh.h> header file. */
#define HAVE_OPENSSL_ECDH_H 1

/* Define to 1 if you have the <openssl/ec.h> header file. */
#define HAVE_OPENSSL_EC_H 1

/* Define to 1 if you have the <openssl/ecdsa.h> header file. */
#define HAVE_OPENSSL_ECDSA_H 1

/* Define to 1 if you have the <pthread.h> header file. */
/* #undef HAVE_PTHREAD_H */

/* Define to 1 if you have eliptic curve cryptography in openssl */
#define HAVE_OPENSSL_ECC 1

/* Define to 1 if you have eliptic curve cryptography in gcrypt */
/* #undef HAVE_GCRYPT_ECC */

/* Define to 1 if you have eliptic curve cryptography */
#define HAVE_ECC 1

/* Define to 1 if you have DSA */
#define HAVE_DSA 1

/* Define to 1 if you have gl_flags as a glob_t sturct member */
/* #undef HAVE_GLOB_GL_FLAGS_MEMBER */

/*************************** FUNCTIONS ***************************/

/* Define to 1 if you have the `EVP_aes128_ctr' function. */
#define HAVE_OPENSSL_EVP_AES_CTR 1

/* Define to 1 if you have the `EVP_aes128_cbc' function. */
#define HAVE_OPENSSL_EVP_AES_CBC 1

/* Define to 1 if you have the `EVP_aes128_gcm' function. */
#define HAVE_OPENSSL_EVP_AES_GCM 1

/* Define to 1 if you have the `CRYPTO_THREADID_set_callback' function. */
/* #undef HAVE_OPENSSL_CRYPTO_THREADID_SET_CALLBACK */

/* Define to 1 if you have the `CRYPTO_ctr128_encrypt' function. */
#define HAVE_OPENSSL_CRYPTO_CTR128_ENCRYPT 1

/* Define to 1 if you have the `EVP_CIPHER_CTX_new' function. */
#define HAVE_OPENSSL_EVP_CIPHER_CTX_NEW 1

/* Define to 1 if you have the `EVP_KDF_CTX_new_id' function. */
/* #undef HAVE_OPENSSL_EVP_KDF_CTX_NEW_ID */

/* Define to 1 if you have the `OPENSSL_ia32cap_loc' function. */
/* #undef HAVE_OPENSSL_IA32CAP_LOC */

/* Define to 1 if you have the `snprintf' function. */
#define HAVE_SNPRINTF 1

/* Define to 1 if you have the `_snprintf' function. */
#define HAVE__SNPRINTF 1

/* Define to 1 if you have the `_snprintf_s' function. */
#define HAVE__SNPRINTF_S 1

/* Define to 1 if you have the `vsnprintf' function. */
#define HAVE_VSNPRINTF 1

/* Define to 1 if you have the `_vsnprintf' function. */
#define HAVE__VSNPRINTF 1

/* Define to 1 if you have the `_vsnprintf_s' function. */
#define HAVE__VSNPRINTF_S 1

/* Define to 1 if you have the `isblank' function. */
#define HAVE_ISBLANK 1

/* Define to 1 if you have the `strncpy' function. */
#define HAVE_STRNCPY 1

/* Define to 1 if you have the `strndup' function. */
/* #undef HAVE_STRNDUP */

/* Define to 1 if you have the `cfmakeraw' function. */
/* #undef HAVE_CFMAKERAW */

/* Define to 1 if you have the `getaddrinfo' function. */
#define HAVE_GETADDRINFO 1

/* Define to 1 if you have the `poll' function. */
/* #undef HAVE_POLL */

/* Define to 1 if you have the `select' function. */
#define HAVE_SELECT 1

/* Define to 1 if you have the `clock_gettime' function. */
/* #undef HAVE_CLOCK_GETTIME */

/* Define to 1 if you have the `ntohll' function. */
#define HAVE_NTOHLL 1

/* Define to 1 if you have the `htonll' function. */
#define HAVE_HTONLL 1

/* Define to 1 if you have the `strtoull' function. */
#define HAVE_STRTOULL 1

/* Define to 1 if you have the `__strtoull' function. */
/* #undef HAVE___STRTOULL */

/* Define to 1 if you have the `_strtoui64' function. */
#define HAVE__STRTOUI64 1

/* Define to 1 if you have the `glob' function. */
/* #undef HAVE_GLOB */

/* Define to 1 if you have the `explicit_bzero' function. */
/* #undef HAVE_EXPLICIT_BZERO */

/* Define to 1 if you have the `memset_s' function. */
/* #undef HAVE_MEMSET_S */

/* Define to 1 if you have the `SecureZeroMemory' function. */
#define HAVE_SECURE_ZERO_MEMORY 1

/* Define to 1 if you have the `cmocka_set_test_filter' function. */
/* #undef HAVE_CMOCKA_SET_TEST_FILTER */

/*************************** LIBRARIES ***************************/

/* Define to 1 if you have the `crypto' library (-lcrypto). */
#define HAVE_LIBCRYPTO 1

/* Define to 1 if you have the `gcrypt' library (-lgcrypt). */
/* #undef HAVE_LIBGCRYPT */

/* Define to 1 if you have the 'mbedTLS' library (-lmbedtls). */
/* #undef HAVE_LIBMBEDCRYPTO */

/* Define to 1 if you have the `pthread' library (-lpthread). */
/* #undef HAVE_PTHREAD */

/* Define to 1 if you have the `cmocka' library (-lcmocka). */
/* #undef HAVE_CMOCKA */

/**************************** OPTIONS ****************************/

/* #undef HAVE_GCC_THREAD_LOCAL_STORAGE */
#define HAVE_MSC_THREAD_LOCAL_STORAGE 1

/* #undef HAVE_FALLTHROUGH_ATTRIBUTE */
/* #undef HAVE_UNUSED_ATTRIBUTE */

/* #undef HAVE_CONSTRUCTOR_ATTRIBUTE */
/* #undef HAVE_DESTRUCTOR_ATTRIBUTE */

/* #undef HAVE_GCC_VOLATILE_MEMORY_PROTECTION */

#define HAVE_COMPILER__FUNC__ 1
#define HAVE_COMPILER__FUNCTION__ 1

/* #undef HAVE_GCC_BOUNDED_ATTRIBUTE */

/* Define to 1 if you want to enable GSSAPI */
/* #undef WITH_GSSAPI */

/* Define to 1 if you want to enable ZLIB */
#define WITH_ZLIB 1

/* Define to 1 if you want to enable SFTP */
#define WITH_SFTP 1

/* Define to 1 if you want to enable server support */
#define WITH_SERVER 1

/* Define to 1 if you want to enable DH group exchange algorithms */
#define WITH_GEX 1

/* Define to 1 if you want to enable blowfish cipher support */
/* #undef WITH_BLOWFISH_CIPHER */

/* Define to 1 if you want to enable debug output for crypto functions */
/* #undef DEBUG_CRYPTO */

/* Define to 1 if you want to enable debug output for packet functions */
/* #undef DEBUG_PACKET */

/* Define to 1 if you want to enable pcap output support (experimental) */
#define WITH_PCAP 1

/* Define to 1 if you want to enable calltrace debug output */
/* #undef DEBUG_CALLTRACE */

/* Define to 1 if you want to enable NaCl support */
/* #undef WITH_NACL */

/*************************** ENDIAN *****************************/

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
/* #undef WORDS_BIGENDIAN */
