# Section 1: Introduction - Cheating Our Way Past the Transistor

**Duration:** 0.5 weeks  
**Goal:** Understand the foundation we're building on and set up our development environment

## Overview

We're going to build a complete computer system from the ground up, but we need to start somewhere practical. While understanding transistors is fascinating, building actual transistors isn't feasible for this course. Instead, we'll "cheat" by starting with FPGAs (Field Programmable Gate Arrays) - which are essentially pre-built collections of transistors that we can configure.

Think of it this way:
- **Transistors** = Individual LEGO blocks
- **FPGAs** = Pre-assembled LEGO baseplates with configurable connections
- **Our job** = Use these baseplates to build complex structures

## Learning Objectives

By the end of this section, you will:
1. Understand what FPGAs are and how they relate to transistors
2. Know why we use simulation instead of real hardware for learning
3. Have a working development environment
4. Understand the scope of what we're building

## Chapters

### [Chapter 1: So About Those Transistors](./01-transistors-and-fpgas/)
- What are transistors and how do they work?
- How FPGAs are built from transistors
- Understanding LUTs (Look-Up Tables) and FPGA architecture
- Why FPGAs let us focus on digital design

### [Chapter 2: Emulation Setup](./02-emulation-setup/)
- Why simulation beats real hardware for learning
- Setting up Verilator for Verilog simulation
- Your first "Hello World" in hardware description
- Understanding the development workflow

## Prerequisites Check

Before diving in, make sure you have:
- [ ] Completed the [development environment setup](../docs/setup.md)
- [ ] Basic comfort with the terminal/command line
- [ ] Willingness to think about problems from first principles

## What's Next?

After completing this section, you'll move to Section 2 where we'll write our first real hardware: a blinking LED and a UART communication interface. These might seem simple, but they're the building blocks for everything that follows.

## Success Criteria

You've successfully completed this section when you can:
- Explain in your own words how FPGAs relate to transistors
- Run a simple Verilog simulation on your computer
- Understand why we're using simulation for this course
- Feel oriented about the journey ahead

Remember: The goal isn't to memorize everything, but to build intuition and practical skills. Every expert was once a beginner, and every complex system is built from simple parts.

Let's begin! 