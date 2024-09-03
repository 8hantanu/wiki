# LLVM 🐉

LLVM is a set of libraries and components, used to build compilers, optimize existing code etc.

The below diagram[^agil] is a good representation:

```text
                          optimizer (opt)
                              _____
                             |     v
     .c file  -->  AST  -->  LLVM IR  -->  assembly
               ^         ^             ^
             parser   lowering      backend
                                     (llc)
    \____________________/  \_____________________/
        Clang Frontend                LLVM
```

## IR

Intermediate Representation (IR) is a low-level programming language that serves as a common representation for code within the LLVM ecosystem.

## References

[^agil]: [A Gentle Introduction to LLVM IR](https://mcyoung.xyz/2023/08/01/llvm-ir/)
[^langref]: [LLVM Language Reference Manual](https://llvm.org/docs/LangRef.html)
