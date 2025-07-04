# Exercises: Transistors and FPGAs

## Foundational Understanding

### Exercise 1: Transistor Basics

**Question 1.1**: In your own words, explain how a transistor acts as a digital switch. What are the three key components and what happens when the control signal is on vs off?

**Question 1.2**: The reading mentioned that "you can use the output of one transistor to control another transistor." Why is this ability so revolutionary? Give an example of what this chaining enables.

**Question 1.3**: Modern processors contain billions of transistors, each only about 50-100 atoms wide. How do we manage such incredible complexity? What are the three key innovations mentioned that make this possible?

### Exercise 2: Understanding Scale and Materials

**Question 2.1**: Silicon is described as "basically sand." Explain why silicon is ideal for making transistors. Cover at least three of its key properties.

**Question 2.2**: To help visualize the scale: if a human hair is 100,000 nanometers wide and a modern transistor is 5 nanometers wide, how many transistors could fit across a human hair? What does this tell you about the precision required in manufacturing?

**Question 2.3**: What is "doping" in the context of semiconductor manufacturing? Use the food coloring analogy to explain how it works.

### Exercise 3: From Transistors to Logic

**Question 3.1**: If you had to build an AND gate using transistors, how would you arrange them conceptually? (Hint: think about whether you'd wire them in series or parallel)

**Question 3.2**: How would an OR gate differ from an AND gate in transistor arrangement? Why does this difference create different logical behavior?

**Question 3.3**: Why do we use logic gates as an abstraction instead of thinking about individual transistors when designing computer systems?

## FPGA Architecture

### Exercise 4: Understanding FPGAs

**Question 4.1**: What does "Field Programmable" mean in FPGA? Why is this useful compared to a chip that's permanently configured?

**Question 4.2**: An FPGA is described as being like "pre-assembled LEGO blocks." Explain this analogy and how it relates to the logic blocks and programmable switches.

**Question 4.3**: How does an FPGA differ from the processor in your computer? Consider both how they're configured and how they execute tasks.

### Exercise 5: LUT Programming Practice

Now let's work with the core building block - LUTs. Given a 2-input LUT, program it to implement the following functions by filling in the truth tables:

**5.1 OR Gate**:
```
Input A | Input B | Output
   0    |    0    |   ?
   0    |    1    |   ?
   1    |    0    |   ?
   1    |    1    |   ?
```

**5.2 XOR Gate** (output is 1 when inputs are different):
```
Input A | Input B | Output
   0    |    0    |   ?
   0    |    1    |   ?
   1    |    0    |   ?
   1    |    1    |   ?
```

**5.3 Custom Function**: Design a function that outputs 1 only when Input A is 1 AND Input B is 0:
```
Input A | Input B | Output
   0    |    0    |   ?
   0    |    1    |   ?
   1    |    0    |   ?
   1    |    1    |   ?
```

**Question 5.4**: The key insight about LUTs is that "any 2-input logic function can be implemented by just changing what values you store." Explain why this is so powerful for FPGA design.

**Question 5.5**: The reading shows a 6-input LUT example that could implement `(A AND B) OR (C AND D AND E) OR (NOT F)`. How many memory locations does a 6-input LUT need, and why can it implement much more complex functions than a 2-input LUT?

## FPGA Components Deep Dive

### Exercise 6: Understanding FPGA Building Blocks

**Question 6.1**: Explain what a flip-flop (FF) does using the light switch analogy. Why are flip-flops essential for building sequential logic?

**Question 6.2**: What is a multiplexer (MUX)? Use the railway junction analogy to explain how a 2-to-1 MUX works.

**Question 6.3**: In the CLB diagram, data flows through LUT → MUX → FF → Output. Explain what happens at each stage and why this arrangement is useful.

### Exercise 7: Memory and Configuration

**Question 7.1**: What's the difference between Block RAM (BRAM) and Distributed RAM in an FPGA? When would you use each type?

**Question 7.2**: Explain what a bitstream is and how the FPGA configuration process works. In transistor terms, how many transistors might be needed just to store a typical FPGA bitstream?

**Question 7.3**: The reading states you won't need to buy an FPGA for this course. Explain why simulation is better for learning and what Verilator does.

## Connecting Concepts

### Exercise 8: FPGA Resource Estimation

Imagine you want to implement a simple 4-bit counter on an FPGA. This counter:
- Needs 4 flip-flops (one for each bit)
- Needs logic to increment the count (add 1)
- Needs logic to detect overflow and reset to 0

**Question 8.1**: How many LUTs do you estimate this would require? Consider that you need to compute "current_count + 1" and detect when count = 15 (1111 in binary).

**Question 8.2**: What other FPGA resources would you need beyond LUTs? Think about clocking and control signals.

**Question 8.3**: How would the resource requirements change for an 8-bit counter? What does this tell you about how digital systems scale?

## Abstraction and Big Picture

### Exercise 9: Understanding Abstraction Layers

**Question 9.1**: We're "cheating" by starting with FPGAs instead of building transistors. List three advantages and one potential disadvantage of this approach for learning.

**Question 9.2**: The course shows this abstraction hierarchy:
```
Web Browser → OS → Compiler → Processor → Verilog → FPGA → Transistors
```
Pick any two adjacent levels and explain how the higher level builds on and abstracts away complexity from the lower level.

**Question 9.3**: Why is understanding lower levels important even when you're working at higher levels? Give a practical example from computing or another field.

## Research and Modern Context

### Exercise 10: Current Technology

**Question 10.1**: Look up the transistor count in a modern processor (Intel Core i9, AMD Ryzen, or similar). Compare this to an early processor like the Intel 4004 from 1971. What's the ratio of improvement?

**Question 10.2**: Research Moore's Law. Based on current trends, is it still holding true? What are the main challenges facing continued miniaturization?

**Question 10.3**: What alternatives to traditional silicon transistors are being researched? Find at least two examples and briefly explain how they're different.

## Personal Reflection

### Exercise 11: Learning and Understanding

**Question 11.1**: What was the most surprising or interesting thing you learned about transistors or FPGAs? Why did it surprise you?

**Question 11.2**: How has understanding this foundation changed your perspective on the computer you're using right now? Think about the processor in your computer.

**Question 11.3**: What questions do you still have about how computers work at the hardware level? What would you like to understand better?

**Question 11.4**: Looking at the complete curriculum roadmap (all 7 sections), which part are you most excited to learn about? Which part seems most challenging?

---

## Answer Key Location

After completing these exercises, compare your answers with: `./solutions/exercise-answers.md`

Remember: There are often multiple correct ways to think about these concepts. The goal is to build intuition and understanding, not to memorize specific answers.

## Next Steps

Once you've worked through these exercises:

1. **Check your understanding**: Review any questions you found difficult
2. **Review theory**: Go back to theory.md for concepts that weren't clear
3. **Discuss with AI**: Ask an AI assistant to review your answers and provide feedback
4. **Move forward confidently**: You should feel solid on these concepts before proceeding

The goal is to have a rock-solid conceptual foundation before we start writing actual hardware code. These fundamental concepts will appear in every subsequent chapter, so taking time to really understand them now will pay huge dividends later.

Every expert started with these same fundamental questions. The difference is building intuition and connecting concepts, not just memorizing facts! 