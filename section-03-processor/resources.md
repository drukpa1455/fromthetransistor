# Resources: Building a CPU

## Essential Books

### CPU Architecture Fundamentals
- **"Computer Organization and Design"** by Patterson & Hennessy - The RISC-V edition is modern
- **"Digital Design and Computer Architecture: ARM Edition"** by Harris & Harris - Specifically for ARM
- **"Computer Architecture: A Constructive Approach"** by Arvind et al. - Build-oriented

### ARM-Specific Resources
- **"See MIPS Run"** by Dominic Sweetman - Excellent CPU internals (applicable to ARM)
- **"The Definitive Guide to ARM Cortex-M3"** by Joseph Yiu - ARM specific

## Classic Papers

### RISC and CPU Design
- ["RISC: A Reduced Instruction Set Computer"](https://dl.acm.org/doi/10.1145/641914.641917) - Patterson & Ditzel (1980)
- ["The Case for RISC"](https://ieeexplore.ieee.org/document/762816) - Patterson (1985)
- ["An Efficient Algorithm for Exploiting Multiple Arithmetic Units"](https://dl.acm.org/doi/10.1147/rd.111.0025) - Tomasulo (1967) - Classic on pipelining
- ["Very High-Speed Computing Systems"](https://ieeexplore.ieee.org/document/1449272) - Flynn (1966) - Flynn's taxonomy

## ARM Architecture Documentation

### Official ARM Resources
- [ARM7TDMI Technical Reference Manual](https://developer.arm.com/documentation/ddi0029/g) - Your main reference
- [ARMv4 Architecture Reference Manual](https://developer.arm.com/documentation/ddi0100/e) - Complete ISA
- ["The ARM Architecture"](https://cs107e.github.io/readings/armv6.pdf) - Comprehensive overview

### ARM Assembly Learning
- [Azeria Labs ARM Assembly](https://azeria-labs.com/writing-arm-assembly-part-1/) - Great ARM assembly tutorial
- [ARM Assembly Quick Reference](https://courses.cs.washington.edu/courses/cse469/18wi/Materials/arm64.pdf) - Handy syntax guide

## CPU Design Resources

### Visual Learning
- [Visual CPU Simulator](https://www.visual6502.org/) - See how real CPUs work
- [From Nand to Tetris](https://www.nand2tetris.org/) - Gentler introduction to CPU building
- ["Building a Modern Computer From First Principles"](https://www.nand2tetris.org/papers/01-Nand2Tetris.pdf) - Nisan & Schocken

## Assembler Development

### Parsing and Code Generation
- **"Writing An Interpreter In Go"** by Thorsten Ball - Good parsing techniques
- ["Two-Pass Assembler Design"](https://www.geeksforgeeks.org/introduction-of-assembler/) - Classic approach
- [Let's Build an Assembler](https://medium.com/@lorenzopassi/lets-build-an-assembler-in-python-b1f240c3a1e3) - Practical walkthrough

## YouTube Videos

### CPU Design Fundamentals
- [Building an 8-bit CPU from Scratch](https://www.youtube.com/playlist?list=PLowKtXNTBypGqImE405J2565dvjafglHU) - Ben Eater's complete series
- [CPU Design: Pipelining](https://www.youtube.com/watch?v=jHhzpur6lII) - MIT lecture on pipelining
- [How CPUs Read Machine Code](https://www.youtube.com/watch?v=yl8vPW5hydQ) - Computerphile

### ARM-Specific Videos
- [ARM Assembly Basics](https://www.youtube.com/playlist?list=PLmxT2pVYo5LB5EzTPZGfFN0c2GDiSXgQe) - Computerphile series
- [Building a RISC-V CPU Core](https://www.youtube.com/watch?v=0Qm0k9ABzOI) - Robert Baruch (good reference even for ARM)

### Assembler Implementation
- [Writing an Assembler from Scratch](https://www.youtube.com/watch?v=MpBVyW7sLAw) - Live coding session

## Tools and Documentation

### Development Tools
- [GDB Quick Reference](https://users.ece.utexas.edu/~adnan/gdb-refcard.pdf) - Essential for debugging
- [Verilator Documentation](https://www.veripool.org/verilator/) - For CPU simulation

### Alternative Architectures (for reference)
- [RISC-V from Scratch](https://twilco.github.io/riscv-from-scratch/2019/03/10/riscv-from-scratch-1.html) - Good implementation example

## Study Path

### Before Starting
1. **Complete nand2tetris** if you need CPU fundamentals
2. **Watch Ben Eater's 8-bit CPU series** - understand CPU building process
3. **Read the ARM7TDMI manual** - understand your target architecture

### During This Section
1. **Study ARM assembly** - understand the instruction set deeply
2. **Build instruction decoder first** - most complex part
3. **Test each component individually** - unit testing approach
4. **Use visual tools** - draw pipeline diagrams

### Building Your CPU
1. **Start with single-cycle design** - simplest approach
2. **Test with simple programs** - basic arithmetic first
3. **Add pipelining later** - optimization step
4. **Build comprehensive test suite** - catch regressions

## Common Challenges

### CPU Design Pitfalls
- **Instruction encoding complexity** - ARM has many formats
- **Branch prediction** - affects performance significantly
- **Memory alignment** - ARM requires aligned accesses
- **Conditional execution** - ARM's unique feature

### Assembler Implementation
- **Two-pass requirement** - forward references need second pass
- **Symbol table management** - labels and addresses
- **Instruction encoding** - bit manipulation complexity
- **Error handling** - good diagnostics are crucial

### Testing Strategy
- **Unit tests per instruction** - verify each operation
- **Integration tests** - whole programs
- **Edge cases** - boundary conditions
- **Performance benchmarks** - measure cycle counts

---

*Focus on getting a minimal working CPU first - you can always add complexity later. The ARM7TDMI is powerful but the core concepts are manageable.* 