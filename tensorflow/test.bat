del *.lib *.obj *.exe *.exp

clang-cl /MD /c /O2 registry.cc
clang-cl /MD /c /O2 main.cpp
clang-cl /MD /c /O2 a.cpp

llvm-lib /out:a.lo.lib a.obj

lld-link /OPT:ICF /OPT:REF /out:ok.exe main.obj /WHOLEARCHIVE:a.lo.lib registry.obj

llvm-lib /llvmlibthin /out:a-thin.lo.lib a.obj
@rem you can get different error in each run
lld-link /OPT:ICF /OPT:REF /out:fail.exe main.obj /WHOLEARCHIVE:a-thin.lo.lib registry.obj
lld-link /OPT:ICF /OPT:REF /out:fail.exe main.obj /WHOLEARCHIVE:a-thin.lo.lib registry.obj
lld-link /OPT:ICF /OPT:REF /out:fail.exe main.obj /WHOLEARCHIVE:a-thin.lo.lib registry.obj
lld-link /OPT:ICF /OPT:REF /out:fail.exe main.obj /WHOLEARCHIVE:a-thin.lo.lib registry.obj
lld-link /OPT:ICF /OPT:REF /out:fail.exe main.obj /WHOLEARCHIVE:a-thin.lo.lib registry.obj
lld-link /OPT:ICF /OPT:REF /out:fail.exe main.obj /WHOLEARCHIVE:a-thin.lo.lib registry.obj
lld-link /OPT:ICF /OPT:REF /out:fail.exe main.obj /WHOLEARCHIVE:a-thin.lo.lib registry.obj
lld-link /OPT:ICF /OPT:REF /out:fail.exe main.obj /WHOLEARCHIVE:a-thin.lo.lib registry.obj
lld-link /OPT:ICF /OPT:REF /out:fail.exe main.obj /WHOLEARCHIVE:a-thin.lo.lib registry.obj
