#if defined(ARCH_LINUX64) || defined(ARCH_ANDROID64)
  #include "openssl/opensslconf.x64.h"
#endif

#if defined(ARCH_LINUX32) || defined(ARCH_ANDROID32)
  #include "openssl/opensslconf.x86.h"
#endif

#ifdef ARCH_MACOS64
  #include "openssl/opensslconf.macos64.h"
#endif

#ifdef ARCH_IOS64
  #include "openssl/opensslconf.ios64.h"
#endif
