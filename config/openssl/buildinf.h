#if defined(ARCH_LINUX64) || defined(ARCH_ANDROID64)
  #include "buildinf.x64.h"
#endif

#if defined(ARCH_LINUX32) || defined(ARCH_ANDROID32)
  #include "buildinf.x86.h"
#endif

#ifdef ARCH_MACOS64
  #include "buildinf.macos64.h"
#endif

#ifdef ARCH_IOS64
  #include "buildinf.ios64.h"
#endif
