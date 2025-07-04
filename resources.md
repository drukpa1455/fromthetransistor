# From the Transistor: General Resources

*This file contains foundational resources, study methodology, and cross-cutting tools that apply to the entire curriculum. Each section also has its own specific resources file.*

## Foundational Papers and Books

### Computing Theory and History
- **"The Art of Computer Programming"** by Donald Knuth - The definitive work
- **"Structure and Interpretation of Computer Programs"** by Abelson & Sussman - MIT classic
- ["On Computable Numbers"](https://www.cs.virginia.edu/~robins/Turing_Paper_1936.pdf) - Turing (1936)
- ["First Draft of a Report on the EDVAC"](https://dl.acm.org/doi/10.5555/1102046.1102047) - von Neumann (1945)
- ["The Computer as a Communication Device"](https://dl.acm.org/doi/10.1145/1476936.1477020) - Licklider & Taylor (1968)

### Systems Design Philosophy
- ["Reflections on Trusting Trust"](https://dl.acm.org/doi/10.1145/358198.358210) - Ken Thompson (1984)
- ["The Rise of Worse is Better"](https://www.dreamsongs.com/RiseOfWorseIsBetter.html) - Richard Gabriel
- ["No Silver Bullet"](https://dl.acm.org/doi/10.1109/MC.1987.1663532) - Fred Brooks (1987)
- ["Out of the Tar Pit"](https://github.com/papers-we-love/papers-we-love/blob/master/design/out-of-the-tar-pit.pdf) - Moseley & Marks (2006)

### Low-Level Programming
- **"Hacker's Delight"** by Henry Warren - Bit twiddling tricks
- **"The Mythical Man-Month"** by Fred Brooks - Project management wisdom
- **"Code Complete"** by Steve McConnell - Software construction

## Study Order Suggestions

### Recommended Sequence
1. **Start with nand2tetris** if you need a gentler introduction
2. **Learn Verilog basics** through HDLBits before starting your CPU
3. **Build a simple 8-bit CPU first** as practice (Ben Eater's videos help)
4. **Read xv6 source code** before starting your OS
5. **Implement a toy compiler** (like for arithmetic expressions) before tackling C

### Prerequisites by Section
- **Section 1 (Intro)**: Basic digital logic, Boolean algebra
- **Section 2 (Bringup)**: Section 1 + HDLBits Verilog basics
- **Section 3 (Processor)**: Sections 1-2 + computer architecture fundamentals
- **Section 4 (Compiler)**: Sections 1-3 + C programming proficiency
- **Section 5 (OS)**: Sections 1-4 + systems programming experience
- **Section 6 (Browser)**: Sections 1-5 + networking fundamentals
- **Section 7 (Hardware)**: All sections + electronics basics

## Complete Project Video Series

These channels/series show complete computer builds from scratch:

### Full System Builds
- **[Ben Eater's Complete Computer Build](https://www.youtube.com/c/BenEater)** - Building a 6502 computer on breadboards
- **[James Sharman's 8-bit Pipelined CPU](https://www.youtube.com/c/weirdboyjim)** - 100+ video series building a CPU
- **[Andreas Kling's OS Development](https://www.youtube.com/c/AndreasKling)** - Building SerenityOS from scratch
- **[George Hotz's From the Transistor](https://www.youtube.com/watch?v=zjnxu6L5RJQ)** - 12-hour course similar to your project

### Focused Implementation Series
- **[Writing a RISC-V Emulator from Scratch](https://www.youtube.com/playlist?list=PLP29wDx6QmW7HaCrRydOrk3uC6b7vHGxP)** - Full implementation series
- **[Let's Build a Compiler](https://www.youtube.com/playlist?list=PLRAdsfhKI4OWNOSfS7EUu5GRAVmze1t2y)** - Immo Landwerth's series
- **[Writing an OS from Scratch](https://www.youtube.com/playlist?list=PLHh55M_Kq4OApWScZyPl5HhgsTJS9MZ6M)** - Complete OS series

## Influential YouTube Channels

### Hardware and Low-Level
- [Ben Eater](https://www.youtube.com/c/BenEater) - Building computers on breadboards
- [Robert Baruch](https://www.youtube.com/c/RobertBaruch) - FPGA and CPU design
- [James Sharman](https://www.youtube.com/c/weirdboyjim) - 8-bit CPU build series
- [EEVblog](https://www.youtube.com/c/EevblogDave) - Electronics engineering
- [Phil's Lab](https://www.youtube.com/c/PhilS94) - PCB design and RF

### Software and Theory
- [Computerphile](https://www.youtube.com/user/Computerphile) - Computer science concepts
- [MIT OpenCourseWare](https://www.youtube.com/c/mitocw) - Academic computer science
- [Low Level Learning](https://www.youtube.com/c/LowLevelLearning) - Systems programming

## Essential Blogs to Follow

### Deep Technical Content
- [Fabien Sanglard](https://fabiensanglard.net/) - Deep technical dives into systems
- [Julia Evans](https://jvns.ca/) - Great explanations of systems concepts
- [Dan Luu](https://danluu.com/) - Hardware and software deep dives

### Development Methodology
- [Joel on Software](https://www.joelonsoftware.com/) - Software development wisdom
- [Coding Horror](https://blog.codinghorror.com/) - Programming insights

## Debugging and Tools Videos

### Essential Debugging Skills
- [Debugging with GDB](https://www.youtube.com/watch?v=PorfLSr3DDI) - Essential for OS development
- [Logic Analyzer Tutorial](https://www.youtube.com/watch?v=u1DYs2I-_lU) - Hardware debugging
- [Using Oscilloscopes](https://www.youtube.com/watch?v=CzY2abWCVTY) - EEVblog basics

### Development Tools
- [Git Tutorial Series](https://www.youtube.com/playlist?list=PL-osiE80TeTuRUfjRe54Eea17-YfnOOAx) - Version control mastery
- [Vim Tutorial](https://www.youtube.com/watch?v=IiwGbcd8S7I) - Editor efficiency
- [Make Tutorial](https://www.youtube.com/watch?v=zeEMISsjO38) - Build automation

## Time-Saving Tips

### Development Strategy
- Use existing test suites where possible (CPU instruction tests, C compiler tests)
- Start with minimal implementations and iterate
- Keep a detailed blog/notes - you'll forget why you made certain decisions
- Version control everything from day one
- Build debugging tools as you go (CPU trace, memory dumps, etc.)

### Learning Approach
- **Skim classic papers** for historical context and big ideas
- **Use books as reference** when implementing each section
- **Watch videos** when stuck or needing visual explanation
- **Join communities** for specific questions and debugging help

### Common Pitfalls to Avoid
- Don't try to implement everything at once
- Don't optimize prematurely - get it working first
- Don't skip testing - build comprehensive test suites
- Don't work in isolation - engage with communities

## Paper Repositories

### Academic Resources
- [Papers We Love](https://paperswelove.org/) - Curated CS papers with discussions
- [The Morning Paper](https://blog.acolyer.org/) - Daily CS paper summaries (archive)
- [ACM Digital Library](https://dl.acm.org/) - Academic paper database
- [IEEE Xplore](https://ieeexplore.ieee.org/) - Engineering papers
- [arXiv CS](https://arxiv.org/list/cs/recent) - Preprint server

## Communities

### Reddit Communities
- [r/osdev](https://www.reddit.com/r/osdev/) - Operating system development
- [r/FPGA](https://www.reddit.com/r/FPGA/) - FPGA community
- [r/ECE](https://www.reddit.com/r/ECE/) - Electrical and computer engineering
- [r/programming](https://www.reddit.com/r/programming/) - General programming
- [r/ComputerScience](https://www.reddit.com/r/compsci/) - CS theory and practice

### IRC and Discord
- [##osdev on Libera.Chat](https://libera.chat/) - IRC channel for OS development
- [#fpga on Libera.Chat](https://libera.chat/) - FPGA development
- [OSDev Discord](https://discord.gg/RnCtsqD) - Active OS development community

### Technical Communities
- [Lobste.rs](https://lobste.rs/) - Technical community, good for project blogs
- [Hacker News](https://news.ycombinator.com/) - Tech news and discussion
- [Stack Overflow](https://stackoverflow.com/) - Programming Q&A

## Documentation and Standards

### Key Specifications to Have Handy
- [ARM Architecture Reference Manuals](https://developer.arm.com/documentation/)
- [IEEE Standards](https://standards.ieee.org/) - Ethernet, JTAG, etc.
- [POSIX.1-2017](https://pubs.opengroup.org/onlinepubs/9699919799/) - OS system calls
- [ELF Specification](https://refspecs.linuxfoundation.org/elf/elf.pdf) - Object file format
- [C99 Standard](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf) - Language spec

### Quick Reference Cards
- [ARM Assembly Quick Reference](https://courses.cs.washington.edu/courses/cse469/18wi/Materials/arm64.pdf)
- [Verilog Quick Reference](https://sutherland-hdl.com/pdfs/verilog_2001_ref_guide.pdf)
- [GDB Quick Reference](https://users.ece.utexas.edu/~adnan/gdb-refcard.pdf)
- [Git Quick Reference](https://education.github.com/git-cheat-sheet-education.pdf)

## Project Inspiration

### Complete Systems Built from Scratch
- [RISC-V from Scratch](https://twilco.github.io/riscv-from-scratch/2019/03/10/riscv-from-scratch-1.html)
- [bootOS](https://github.com/nanochess/bootOS) - OS in 512 bytes
- [xv6-riscv](https://github.com/mit-pdos/xv6-riscv) - Teaching OS
- [SerenityOS](https://serenityos.org/) - Modern OS from scratch

### Browser Engines
- [Servo](https://servo.org/) - Modern browser engine in Rust
- [Ladybird](https://ladybird.dev/) - Browser built from scratch
- [Let's Build a Browser Engine](https://limpet.net/mbrubeck/2014/08/08/toy-layout-engine-1.html) - Tutorial series

## Resource Usage Strategy

### Books vs Papers vs Videos
- **Books**: Comprehensive coverage, best for deep understanding
- **Papers**: Original ideas and specific techniques, often more concise
- **Videos**: Visual learning, seeing the process, and motivation
- **Online tutorials**: Quick practical knowledge and troubleshooting

### Reading Strategy
1. **Skim the classic papers** for historical context and big ideas
2. **Use books as reference** when implementing each section
3. **Watch videos** when stuck or needing visual explanation
4. **Join communities** for specific questions and debugging help

### Video Usage Tips
- **Overview videos** help understand concepts before diving into implementation
- **Live coding sessions** show the actual development process and common pitfalls
- **Complete series** demonstrate that these projects are achievable
- **Hardware videos** are especially valuable since books can't show the physical aspects

Consider watching the overview videos for each section before starting, then refer to specific implementation videos when you get stuck.

---

*Remember: This is a marathon, not a sprint. Celebrate small victories! The goal is deep understanding, not just completing the project.* 