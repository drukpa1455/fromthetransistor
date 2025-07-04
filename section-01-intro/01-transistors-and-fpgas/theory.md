# Theory: Transistors and FPGAs

## Deeper Dive into Transistor Physics

While we don't need to build transistors, understanding their operation helps you appreciate the abstraction layers we're building on.

### MOSFET: The Modern Transistor

The MOSFETs (Metal-Oxide-Semiconductor Field-Effect Transistors) used in modern chips have three terminals:

```
      G (Gate)
      |
S --[===]-- D
(Source)    (Drain)
      |
    Channel
```

- **Gate (G)**: Controls the transistor (like a valve handle)
- **Source (S)**: Where current enters (like water inlet)
- **Drain (D)**: Where current exits (like water outlet)
- **Channel**: The controllable path between source and drain

### The Switching Mechanism - What Actually Happens

When voltage is applied to the gate, three things happen in sequence:

1. **Creates an electric field**:
   - An electric field is like an invisible force that pushes on electrons
   - Think of it like gravity, but for electrical charges
   - Just as gravity pulls objects down, an electric field pushes electrons in a specific direction
   - In a MOSFET, the electric field pushes electrons **toward the gate** (if it's positively charged) or **away from the gate** (if negatively charged)
   - The stronger the voltage, the stronger this "push"

2. **Changes conductivity of the channel**:
   - Conductivity = how easily electricity can flow through something
   - Think of it like a water pipe: wide-open pipe allows lots of flow, narrow pipe restricts flow
   - Copper wire has high conductivity (electricity flows easily, like a wide pipe)
   - Rubber has low conductivity (electricity barely flows, like a blocked pipe)
   - In a transistor, the electric field can change the material between source and drain from "blocked" to "wide open"
   - When electrons are attracted to the gate area, they form a conductive "channel" between source and drain
   - When electrons are repelled, no conductive channel exists

3. **Controls current flow**:
   - When the channel becomes conductive: current flows (transistor is ON = 1)
   - When the channel becomes non-conductive: no current flows (transistor is OFF = 0)

This is the fundamental binary operation that makes all digital computation possible.

### Why Silicon? The Complete Picture

Silicon is the material of choice because of four critical properties:

**Abundant and cheap**:
- Silicon is the second most abundant element in Earth's crust (after oxygen)
- It's basically sand - silicon dioxide (SiO₂) is what beach sand is made of
- We literally have unlimited supplies, making it incredibly cheap
- Compare this to rare metals like gold or platinum which would be impossibly expensive

**Precise control at atomic scale**:
- Silicon atoms can be arranged in perfect crystal structures
- We can replace individual silicon atoms with other atoms (like boron or phosphorus)
- This process is called "doping" - like adding a tiny amount of food coloring to water
- By controlling exactly which atoms go where, we can control electrical properties
- Modern fabrication can place atoms with precision of about 5 nanometers (about 50 atoms wide)

**Forms stable oxide layers**:
- Silicon naturally forms silicon dioxide (SiO₂) when exposed to oxygen
- This oxide layer is like a perfect insulator - electricity can't pass through it
- It's chemically stable - won't dissolve or change over time
- This oxide becomes the insulating layer in the transistor gate
- It's so stable that silicon chips can last decades without degrading

**Ideal electrical properties**:
- Silicon is a "semiconductor" - it's between a conductor and insulator
- Pure silicon barely conducts electricity
- But when you add tiny amounts of other atoms (doping), you can make it very conductive
- This controllability is perfect for making switches
- It also handles heat well and doesn't break down easily

### Scale Perspective: From Atoms to Architecture

To understand the magnitude of what we're building:

```
Scale Comparison:
Human hair:    100,000 nm wide
Modern chip:     5,000 nm process
Transistor:          5 nm wide  (50-100 atoms)
Silicon atom:        0.2 nm

Transistors per hair width: 20,000
Atoms per transistor: 50-100
```

- A human hair is about 100,000 nanometers wide
- Modern transistors are about 5 nanometers wide
- That means you could fit **20,000 transistors** across the width of a human hair
- A single transistor contains only about **50-100 atoms**

## FPGA Architecture Deep Dive

### CLB: Configurable Logic Blocks

Each CLB contains several components working together like a small processing unit:

```
CLB Internal Structure:
                    
Input[0] ──┐        ┌─── [LUT] ──┐
Input[1] ──┤        │            │
Input[2] ──┤ Input  │            ├─── [MUX] ──┐
Input[3] ──┤ Router │            │            │
Input[4] ──┤        │            │            │
Input[5] ──┘        └─── [LUT] ──┘            │
                                              │
Config[0:63] ─────────────────────────────────┤
                                              │
Clock ────────────────────────────────────────┤
                                              │
                                              ├─── [FF] ──── Output
                                              │
                                              └─── Direct Output
```

Let's define each component:

**LUT (Look-Up Table)**:
- A small memory that stores answers to all possible input combinations
- Think of it like a multiplication table, but for any logic function
- Like a recipe book: given ingredients (inputs), what dish do you make (output)?
- For a 2-input LUT: stores 4 values (one for each combination: 00, 01, 10, 11)
- For a 6-input LUT: stores 64 values (2⁶ = 64 combinations)

**Flip-Flops (FF)**:
- Digital memory elements that store one bit (0 or 1)
- They "remember" their value until told to change
- Like a light switch that stays in position until you flip it
- Like a parking spot that stays occupied until the car leaves
- Synchronized to a clock signal - they only change at specific times
- Essential for creating sequential logic (where timing and order matter)

**Multiplexers (MUX)**:
- Digital switches that select between multiple inputs
- Like a railway junction that routes trains to different tracks
- Like a TV remote that chooses which channel to display
- A 2-to-1 MUX chooses between two inputs based on a control signal
- If control = 0, output = input A; if control = 1, output = input B

### How Transistors Build LUTs

Understanding the transistor foundation of LUTs helps explain FPGA efficiency:

```
6-Input LUT Implementation:
                
Input[0] ──┐
Input[1] ──┤
Input[2] ──┤ Address  ┌─────────────────┐
Input[3] ──┤ Decoder  │  64-bit Memory  │── Output
Input[4] ──┤ (6→64)   │  (SRAM cells)   │
Input[5] ──┘          └─────────────────┘
                             │
Config[0:63] ────────────────┘

Each SRAM cell ≈ 6 transistors
Total per LUT ≈ 64 × 6 = 384 transistors
Plus address decoder ≈ 100 transistors
Total per LUT ≈ 500 transistors
```

This explains why:
- **FPGAs are "expensive" in transistor count** - lots of overhead for flexibility
- **Custom chips (ASICs) are more efficient** - no configuration overhead
- **Bigger FPGAs cost exponentially more** - transistor count scales with capacity
- **Configuration time matters** - millions of bits to load into SRAM

### Routing Network Architecture

FPGAs have a hierarchical routing network designed like a city transportation system:

```
FPGA Routing Hierarchy:
                     
┌─────────────────────────────────────────────────────────────┐
│                    Long Lines (Highways)                    │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    │
│  │    CLB      │    │    CLB      │    │    CLB      │    │
│  │  ┌─────┐    │    │  ┌─────┐    │    │  ┌─────┐    │    │
│  │  │ LUT │    │    │  │ LUT │    │    │  │ LUT │    │    │
│  │  │  FF │    │    │  │  FF │    │    │  │  FF │    │    │
│  │  └─────┘    │    │  └─────┘    │    │  └─────┘    │    │
│  └─────────────┘    └─────────────┘    └─────────────┘    │
│          │                  │                  │          │
│  ┌───────┼──────────────────┼──────────────────┼───────┐  │
│  │  Local Routing (Streets)  │                  │       │  │
│  │                          │                  │       │  │
│  │  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐  │
│  │  │Switch Box   │    │Switch Box   │    │Switch Box   │  │
│  │  │  [×] [×]    │    │  [×] [×]    │    │  [×] [×]    │  │
│  │  │  [×] [×]    │    │  [×] [×]    │    │  [×] [×]    │  │
│  │  └─────────────┘    └─────────────┘    └─────────────┘  │
│  └─────────────────────────────────────────────────────────┘
└─────────────────────────────────────────────────────────────┘
```

**Local routing**:
- Short wires connecting nearby CLBs
- Like neighborhood streets connecting houses
- Fast but limited distance
- Low power consumption

**Long Lines**:
- Wires that span across the entire chip
- Like highways connecting distant cities
- Slower but can reach anywhere
- Higher power consumption

**Switch Boxes**:
- Programmable connection points
- Like traffic intersections with controllable traffic lights
- Configuration bits determine which wires connect to which
- Each switch = multiple transistors

### Memory Resources

Modern FPGAs include different types of memory, each optimized for different uses:

```
FPGA Memory Hierarchy:
                    
Distributed RAM     Block RAM (BRAM)      UltraRAM
(LUT-based)        (Dedicated blocks)    (Large blocks)
                                        
┌─────────────┐    ┌─────────────────┐   ┌─────────────────┐
│    32×1     │    │    18Kb block   │   │    288Kb block  │
│ ┌─────────┐ │    │ ┌─────────────┐ │   │ ┌─────────────┐ │
│ │   LUT   │ │    │ │    BRAM     │ │   │ │  UltraRAM   │ │
│ │ as RAM  │ │    │ │  dedicated  │ │   │ │  dedicated  │ │
│ └─────────┘ │    │ └─────────────┘ │   │ └─────────────┘ │
└─────────────┘    └─────────────────┘   └─────────────────┘
     Small             Medium               Large
   Flexible           Efficient            Bulk Storage
```

**Distributed RAM**:
- Uses LUTs as small memories instead of logic functions
- Like using your desk drawers as storage instead of workspace
- Flexible but smaller capacity (32-128 bits per LUT)
- Good for small **buffers**, **FIFOs**, or **register files**
- Available wherever you have unused LUTs

Let's define these terms:

**Buffers**: Temporary storage areas for data
- Like a waiting room where data sits before being processed
- Used to smooth out timing differences between fast and slow components
- Example: CPU produces data faster than memory can accept it, so buffer holds the excess

**FIFOs (First In, First Out)**: Data structures where first item stored is first item retrieved
- Like a line at a coffee shop - first person in line gets served first
- Used for queues, communication between components running at different speeds
- Example: Network packets waiting to be transmitted

**Register Files**: Collections of registers that processors use for temporary storage
- Like a set of numbered boxes where the CPU keeps its working data
- Much faster than main memory, but limited in quantity
- Example: ARM processor has 16 general-purpose registers (R0-R15)

**Block RAM (BRAM)**:
- Large chunks of memory (usually 9Kb to 36Kb each)
- Like having filing cabinets built into the FPGA
- Fast access, but limited quantity (hundreds of blocks)
- Perfect for storing programs, lookup tables, or frame buffers
- Dual-port capable (two independent access ports)

**UltraRAM** (newer FPGAs):
- Very large memory blocks (several megabytes)
- Like having a warehouse attached to your factory
- For applications needing lots of memory (AI/ML, video processing)
- Fewer blocks available, but massive capacity each

### DSP Blocks: Hardware Math Units

Dedicated hardware for mathematical operations, like having a calculator built into the FPGA:

```
DSP Block Architecture:
                    
Input A (25-bit) ──┐
                   ├─── [Multiplier] ──┐
Input B (18-bit) ──┘     (43-bit)      │
                                       ├─── [Adder] ──── Output
Input C (48-bit) ──────────────────────┘   (48-bit)    (48-bit)
                                       
Clock ──────────────────────┐
                            │
Config ──────────────────────┼─── [Control Logic]
                            │
                            └─── [Pipeline Registers]
```

**Multiplication**: Computing A × B very fast
**Addition/Subtraction**: Computing A + B or A - B  
**Accumulation**: Adding up a series of numbers (A + B + C + D...)
**Digital signal processing**: Filtering, transforms, FFTs

These are much faster than building the same functions using LUTs - like using a hardware calculator instead of doing math by hand.

## FPGA Configuration: From Verilog to Silicon

### Understanding Bits and Transistors

A fundamental concept that's often misunderstood:

**A bit is NOT just one transistor**:
- A bit is a unit of information (0 or 1)
- To **store** one bit reliably, you typically need 4-6 transistors arranged in a memory cell
- To **process** one bit, you might need 2-20 transistors depending on the operation

**Example: SRAM cell (stores 1 bit)**:
```
SRAM Cell (6 transistors):
                    
Vcc ──┐    ┌── Vcc
      │    │
     [T1] [T2]
      │    │
   ┌──┼────┼──┐
   │  │    │  │
  [T3]│    │[T4]
   │  │    │  │
   └──┼────┼──┘
      │    │
     [T5] [T6]
      │    │
    Word   Word
    Line   Line
```

Each transistor plays a specific role in storing and accessing the bit.

### Bitstream Scale and Complexity

A bitstream is like a very detailed instruction manual:

```
Bitstream Structure:
                    
Configuration Memory Map:
┌─────────────────────┐
│  CLB[0] Config      │ ← 64 bits for LUT
│  CLB[0] Routing     │ ← 200 bits for connections
│  CLB[0] Control     │ ← 50 bits for MUX/FF
├─────────────────────┤
│  CLB[1] Config      │ ← 64 bits for LUT
│  CLB[1] Routing     │ ← 200 bits for connections
│  CLB[1] Control     │ ← 50 bits for MUX/FF
├─────────────────────┤
│       ...           │
├─────────────────────┤
│  BRAM[0] Config     │ ← 16,384 bits for memory
│  BRAM[0] Control    │ ← 20 bits for control
├─────────────────────┤
│       ...           │
└─────────────────────┘
```

**Scale perspective:**
- A typical FPGA bitstream contains **millions to tens of millions of bits**
- If each bit requires ~6 transistors to store, that's **60-600 million transistors** just for configuration storage
- But remember: each configured LUT and routing switch represents **hundreds more transistors** doing the actual work

### The Configuration Process

Think of this like installing an operating system, but for hardware:

1. **Bitstream Generation**: 
   - Your Verilog design gets converted into a bitstream by synthesis tools
   - This bitstream contains millions of bits that control every switch and LUT
   - Like compiling source code into machine code, but for hardware

2. **Configuration**: 
   - The bitstream is loaded into the FPGA's internal SRAM
   - Think of it like loading a program into RAM
   - Each bit goes to a specific transistor-based memory cell that controls switches and LUTs
   - Takes milliseconds to seconds depending on bitstream size

3. **Operation**: 
   - Now the FPGA operates according to your design
   - All the switches are set (each switch = multiple transistors)
   - All the LUTs are programmed (each LUT = hundreds of transistors)
   - Your hardware design is now "running" in silicon

4. **Reconfiguration**: 
   - Load a different bitstream to completely change what the FPGA does
   - It's like reformatting your computer and installing a different OS
   - The same physical hardware can become a CPU, GPU, network processor, etc.

## Simulation vs. Physical Hardware

For this course, we'll be using **simulation** rather than physical FPGAs. Here's why this approach serves our learning goals:

### Simulation with Verilator

**Verilator** is our primary tool:
- Software that simulates FPGA behavior on your computer
- Takes your Verilog code and runs it like a program
- Shows you exactly how your design would behave on real hardware
- Much faster for learning and debugging

### Why Simulation for Learning?

**Advantages**:
- **Immediate feedback**: See your designs working instantly
- **Perfect debugging**: Can examine every internal signal
- **No hardware constraints**: Focus on concepts, not physical limitations
- **Safe experimentation**: Can't break anything with bad code
- **Accessibility**: Everyone can run simulations on their laptop
- **Cost**: No hardware purchase required

**Educational focus**:
- **Concept mastery**: Understand how processors work before worrying about physical implementation
- **Rapid iteration**: Test ideas quickly without hardware delays
- **Comprehensive coverage**: Explore designs that would be impractical in hardware

### Real Hardware Integration

**Section 7** of the curriculum covers real hardware implementation:
- By then you'll understand whether you want to invest in physical FPGAs
- You'll have the foundation to appreciate the hardware-specific challenges
- The concepts you learn in simulation apply directly to real hardware

## The Abstraction Stack

Understanding where we fit in the complete stack helps appreciate each layer's role:

```
From Verilog to Silicon:
                    
┌─────────────────────┐
│  Your Verilog Design │ ← What you write
└─────────────────────┘
            │
            ▼
┌─────────────────────┐
│  Synthesis Tools     │ ← Convert to logic gates
│  (Yosys, Vivado)    │
└─────────────────────┘
            │
            ▼
┌─────────────────────┐
│  Place & Route       │ ← Arrange on chip
│  (Physical layout)  │
└─────────────────────┘
            │
            ▼
┌─────────────────────┐
│  Bitstream           │ ← Configuration data
│  (Millions of bits) │
└─────────────────────┘
            │
            ▼
┌─────────────────────┐
│  FPGA Configuration  │ ← Loading the design
│  (Hardware setup)   │
└─────────────────────┘
            │
            ▼
┌─────────────────────┐
│  CLBs and Routing    │ ← Physical implementation
│  (Configured logic) │
└─────────────────────┘
            │
            ▼
┌─────────────────────┐
│  Transistors         │ ← Millions of switches
│  (Silicon switches) │
└─────────────────────┘
            │
            ▼
┌─────────────────────┐
│  Silicon Physics     │ ← Atoms and electrons
│  (Quantum effects)  │
└─────────────────────┘
```

Each layer abstracts away complexity while building on the layer below. We start at the Verilog level and work our way up the software stack, understanding how each abstraction enables the next.

## Modern FPGA Families

Understanding the landscape helps with future decisions:

### Intel (formerly Altera)
- **Cyclone**: Low-cost, perfect for learning ($50-500)
- **Arria**: Mid-range performance ($500-2000)
- **Stratix**: High-performance ($2000+)

### AMD (formerly Xilinx)
- **Spartan**: Cost-optimized, good for students
- **Artix**: Low-power applications
- **Kintex**: Performance/watt optimized
- **Virtex**: Highest performance, most expensive

## Connection to Our Journey

Every component we'll build in this course ultimately becomes transistor-level implementations:

- **Processors**: Thousands of CLBs working together to execute instructions
- **Memory systems**: Using Block RAM and distributed memory for data storage
- **I/O interfaces**: Dedicated input/output blocks for communication
- **System integration**: Routing networks connecting everything together

The beauty of FPGAs is that we can focus on the architectural concepts (how to build a CPU) while the FPGA handles the transistor-level implementation details (actually making it work in silicon).

## Further Reading

For deeper understanding:
- "Digital Design and Computer Architecture" by Harris & Harris
- "FPGAs: Instant Access" by Clive Maxfield  
- "The Elements of Computing Systems" by Nisan & Schocken
- Vendor documentation (Intel/AMD FPGA user guides)

Understanding this foundation will make everything that follows more meaningful. You're not just learning to code - you're learning to think like a computer architect. 