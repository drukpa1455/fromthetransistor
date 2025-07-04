# Resources: Building a C Compiler

## Essential Books

### Primary Compiler Guides
- **"Writing a C Compiler"** by Nora Sandler - Your primary guide
- **"Crafting Interpreters"** by Robert Nystrom - [Free online](https://craftinginterpreters.com/)
- **"Engineering a Compiler"** by Cooper & Torczon - More practical than Dragon Book

### Advanced Compiler Theory
- **"Modern Compiler Implementation in C"** by Andrew Appel - Good middle ground
- **"Compilers: Principles, Techniques, and Tools"** by Aho et al. - The "Dragon Book"
- **"The C Programming Language"** by Kernighan & Ritchie - K&R C specification

## Classic Compiler Papers

### Foundational Papers
- ["A History of T-diagrams"](https://dl.acm.org/doi/10.1145/794584.794585) - Bratman (1961)
- ["Compiler Construction for Digital Computers"](https://dl.acm.org/doi/10.5555/578789) - Gries (1971)
- ["A Catalogue of Optimizing Transformations"](https://www.clear.rice.edu/comp512/Lectures/Papers/1971-allen-catalog.pdf) - Allen (1971)

### Parser Generation
- ["YACC: Yet Another Compiler-Compiler"](https://dl.acm.org/doi/10.5555/800068.802145) - Johnson (1975)
- ["Register Allocation & Spilling via Graph Coloring"](https://dl.acm.org/doi/10.1145/800230.806984) - Chaitin (1982)

## Haskell for Compilers

### Functional Language Implementation
- **"Write You a Haskell"** by Stephen Diehl - [Free online](http://dev.stephendiehl.com/fun/)
- **"Implementing Functional Languages"** by Peyton Jones - Classic text
- [Haskell LLVM Tutorial](http://www.stephendiehl.com/llvm/) - Compiler in Haskell
- ["The Glasgow Haskell Compiler"](https://dl.acm.org/doi/10.5555/1267950.1267954) - Architecture paper

## Linkers and Loaders

### Essential Linking Knowledge
- **"Linkers and Loaders"** by John Levine - The definitive guide
- [Ian Lance Taylor's Linker Essays](https://lwn.net/Articles/276782/) - 20-part series!
- ["ELF: Executable and Linkable Format"](https://refspecs.linuxfoundation.org/elf/elf.pdf) - Specification
- ["Shared Libraries"](https://akkadia.org/drepper/dsohowto.pdf) - Ulrich Drepper

### Dynamic Linking
- ["Shared Libraries in SunOS"](https://dl.acm.org/doi/10.5555/1267257.1267269) - Gingell et al. (1987)
- ["How To Write Shared Libraries"](https://akkadia.org/drepper/dsohowto.pdf) - Ulrich Drepper

## C Library Implementation

### Standard Library Development
- [musl libc source](https://musl.libc.org/) - Clean, readable libc implementation
- **"The Standard C Library"** by P.J. Plauger - Implementation details
- ["A Malloc Tutorial"](http://www.inf.udec.cl/~leo/Malloc_tutorial.pdf) - Memory allocation
- [The C Library Reference Guide](https://www.acm.uiuc.edu/webmonkeys/book/c_guide/)

## Networking Hardware Integration

### Ethernet/Network Hardware
- ["Ethernet: Distributed Packet Switching"](https://dl.acm.org/doi/10.1145/360248.360253) - Metcalfe & Boggs (1976)
- [IEEE 802.3 Ethernet Standard](https://standards.ieee.org/standard/802_3-2018.html)

## YouTube Videos

### Compiler Development
- [Let's Build a Compiler](https://www.youtube.com/playlist?list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y) - Immo Landwerth's series
- [Making a Compiler](https://www.youtube.com/watch?v=wSdV1M7n4gQ) - Computerphile overview
- [How Do Compilers Work?](https://www.youtube.com/watch?v=bVKV6HcKLJA) - Low Level Learning
- [Writing a Simple C Compiler](https://www.youtube.com/watch?v=N9B2KeAWXgE) - Live coding walkthrough

### Linking and Libraries
- [How Linkers Work](https://www.youtube.com/watch?v=0vXKUm8Fwxo) - Matt Godbolt talk
- [Building libc from Scratch](https://www.youtube.com/watch?v=PSIokPgT0bI) - Conference talk
- [Dynamic Linking Explained](https://www.youtube.com/watch?v=dOfucXtyEsU) - Matt Godbolt

### Hardware Integration
- [Ethernet Controller Basics](https://www.youtube.com/watch?v=ceqhZg1dPJg) - Hardware interfacing

## Tools and Documentation

### Development Tools
- [GDB Quick Reference](https://users.ece.utexas.edu/~adnan/gdb-refcard.pdf) - Essential for debugging
- [Git Quick Reference](https://education.github.com/git-cheat-sheet-education.pdf) - Version control

### Standards and Specifications
- [C99 Standard](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf) - Language spec
- [ELF Specification](https://refspecs.linuxfoundation.org/elf/elf.pdf) - Object file format
- [POSIX.1-2017](https://pubs.opengroup.org/onlinepubs/9699919799/) - OS system calls

## Study Path

### Before Starting
1. **Read "Writing a C Compiler" first** - your primary guide
2. **Study C deeply** - understand the language you're compiling
3. **Learn about ELF format** - understand target output

### During This Section
1. **Build incrementally** - start with minimal compiler
2. **Test extensively** - use existing C programs as tests
3. **Study existing compilers** - read musl libc source
4. **Focus on one feature at a time** - don't try to implement everything

### Building Your Compiler
1. **Lexer and parser first** - get syntax analysis working
2. **Simple code generation** - basic arithmetic expressions
3. **Add control flow** - if/else, loops
4. **Function calls** - most complex feature
5. **Standard library** - printf, malloc, etc.

## Common Challenges

### Compiler Design Pitfalls
- **Scope and symbol management** - variable visibility
- **Type checking** - C's complex type system
- **Code generation** - register allocation
- **Error handling** - good diagnostics are crucial

### Linking Challenges
- **Symbol resolution** - matching definitions and references
- **Relocation** - adjusting addresses
- **Library dependencies** - order matters
- **Position-independent code** - for shared libraries

### C Library Implementation
- **System call interface** - OS-specific code
- **Memory management** - malloc/free implementation
- **String handling** - null termination complexity
- **I/O buffering** - printf/scanf internals

---

*Focus on getting a minimal working compiler first - you can always add optimizations and features later. The goal is understanding the complete compilation process from source to executable.* 