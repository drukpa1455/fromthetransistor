# Development Environment Setup

## Prerequisites for MacBook with M-Series Chip

This guide will set up everything you need to work through the "From the Transistor to the Web Browser" curriculum on a MacBook with Apple Silicon.

### Required Tools

#### 1. Homebrew Package Manager
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 2. Core Development Tools
```bash
# Essential build tools
brew install git make cmake

# Cross-compilation toolchain for ARM
brew install --cask gcc-arm-embedded

# Python for assembler and scripts
brew install python@3.11
pip3 install pytest

# Verilog simulation
brew install verilator

# Text processing and utilities
brew install ripgrep fd tree
# Note: hexdump is built into macOS, no installation needed

# Optional but helpful
brew install gtkwave  # For viewing waveforms from Verilog simulations
```

#### 3. Haskell for Compiler Development
```bash
# Install GHCup (Haskell installer)
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# After installation, restart terminal and install latest GHC and Cabal
ghcup install ghc 9.4.7
ghcup install cabal latest
ghcup set ghc 9.4.7
```

#### 4. QEMU for Testing
```bash
# ARM emulation for testing our code
brew install qemu
```

### Directory Structure
```bash
mkdir -p ~/fromthetransistor
cd ~/fromthetransistor
git clone [this-repo] .
```

### Verification
Run this script to verify your setup:
```bash
./tools/scripts/verify-setup.sh
```

### VS Code Extensions (Recommended)
- Verilog-HDL/SystemVerilog/Bluespec SystemVerilog
- Haskell
- Python
- ARM Assembly
- GitLens

### Terminal Setup
- Use iTerm2 or built-in Terminal
- Ensure you have a good monospace font (SF Mono, Menlo, or Fira Code)
- 256-color support enabled

## What We're Building Towards

By the end of this curriculum, you'll have:
- A working ARM7 processor in Verilog
- A C compiler written in Haskell
- A UNIX-like operating system in C
- A text-based web browser
- Deep understanding of every layer of the stack

Ready to start with Section 1! 