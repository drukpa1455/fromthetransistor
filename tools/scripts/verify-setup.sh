#!/bin/bash

# From the Transistor - Development Environment Verification Script
# For MacBook with M-Series Chip

echo "🔧 Verifying development environment setup..."
echo "================================================"

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track if any checks fail
FAILED=0

check_command() {
    local cmd=$1
    local description=$2
    local required=${3:-true}
    
    if command -v "$cmd" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $description: $(which $cmd)"
        if [ "$cmd" = "python3" ]; then
            echo "    Version: $(python3 --version)"
        elif [ "$cmd" = "verilator" ]; then
            echo "    Version: $(verilator --version | head -1)"
        elif [ "$cmd" = "ghc" ]; then
            echo "    Version: $(ghc --version)"
        fi
    else
        if [ "$required" = true ]; then
            echo -e "${RED}✗${NC} $description: Not found"
            FAILED=1
        else
            echo -e "${YELLOW}⚠${NC} $description: Not found (optional)"
        fi
    fi
}

echo "Checking required tools:"
echo "------------------------"

# Essential tools
check_command "git" "Git version control"
check_command "make" "Make build system"
check_command "cmake" "CMake build system"
check_command "python3" "Python 3"
check_command "pip3" "Python package manager"
check_command "verilator" "Verilog simulator"

# Cross-compilation tools
check_command "arm-none-eabi-gcc" "ARM cross-compiler"

# Haskell toolchain
check_command "ghc" "Glasgow Haskell Compiler"
check_command "cabal" "Haskell package manager"

# QEMU for emulation
check_command "qemu-system-arm" "QEMU ARM emulator"

# Utilities
check_command "rg" "Ripgrep search tool"
check_command "fd" "Fast find utility"
check_command "tree" "Directory tree utility"

# Check hexdump (built into macOS)
if command -v "hexdump" &> /dev/null; then
    echo -e "${GREEN}✓${NC} Hex dump utility: $(which hexdump) (built-in)"
else
    echo -e "${RED}✗${NC} Hex dump utility: Not found (should be built into macOS)"
fi

echo ""
echo "Checking optional tools:"
echo "------------------------"

# Optional tools
check_command "gtkwave" "GTKWave waveform viewer" false

echo ""
echo "Checking Python packages:"
echo "-------------------------"

# Check Python packages
python3 -c "import pytest" 2>/dev/null && echo -e "${GREEN}✓${NC} pytest: Available" || echo -e "${RED}✗${NC} pytest: Missing (run: pip3 install pytest)"

echo ""
echo "System Information:"
echo "-------------------"
echo "Architecture: $(uname -m)"
echo "OS: $(uname -s) $(uname -r)"
echo "Processor: $(sysctl -n machdep.cpu.brand_string 2>/dev/null || echo "Unknown")"

echo ""
echo "Directory Structure Check:"
echo "-------------------------"

if [ -f "README.md" ]; then
    echo -e "${GREEN}✓${NC} README.md found"
else
    echo -e "${RED}✗${NC} README.md not found - are you in the right directory?"
    FAILED=1
fi

if [ -d ".git" ]; then
    echo -e "${GREEN}✓${NC} Git repository initialized"
else
    echo -e "${YELLOW}⚠${NC} Not a git repository"
fi

# Check if curriculum structure exists
if [ -d "section-01-intro" ]; then
    echo -e "${GREEN}✓${NC} Curriculum structure found"
else
    echo -e "${RED}✗${NC} Curriculum sections not found"
    FAILED=1
fi

echo ""
if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 All required tools are installed and ready!${NC}"
    echo ""
    echo "You're ready to start your journey from transistors to web browsers."
    echo "Begin with: cd section-01-intro && cat README.md"
    echo ""
    echo "Don't forget to check out your progress tracking files:"
    echo "- docs/personal-progress.md"
    echo "- docs/milestones.md"
else
    echo -e "${RED}❌ Some required tools are missing.${NC}"
    echo ""
    echo "Please install missing tools using the setup guide:"
    echo "cat docs/setup.md"
    exit 1
fi 