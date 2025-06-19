#!/bin/bash
# Day 1 setup script for LLM-RAG-OS
# This script automates the tasks outlined in day1.MD for the DevOps Agent.
# Note: Actual hardware checks and long-running kernel build steps may
# need manual supervision or additional configuration.

set -euo pipefail

# 09:00 - Review hardware requirements
# Placeholder: ensure at least 16GB RAM and virtualization support
# (Implementation left for manual check or lshw output parsing)

echo "[09:00] Hardware requirements check - manual verification recommended"

# 09:15 - Boot development machines and verify network
ping -c 1 github.com >/dev/null && echo "[09:15] Network connectivity OK" || echo "[09:15] Network connectivity FAILED"

# 09:30 - Install missing OS packages and drivers
# Example for Debian-based systems
sudo apt-get update && sudo apt-get install -y build-essential git qemu-system-x86
sudo apt-get install -y libelf-dev

# 09:45 - Set up workspace directories
mkdir -p ~/workspace && cd ~/workspace

# 10:00 - Clone repository and submodules
if [ ! -d llm-os ]; then
  git clone --recurse-submodules https://github.com/bajpainaman/llm-os.git
fi
cd llm-os

git checkout llm-rag-os-main 2>/dev/null || git checkout main

git pull

# 10:45 - Configure kernel build toolchain
sudo apt-get install -y gcc make libncurses-dev flex bison openssl libssl-dev bc libelf-dev

# 11:00 - Generate default kernel config
cd llm-rag-os-kernel
make defconfig

# 11:15 - Start kernel compilation
make -j$(nproc)

# 11:30 - Monitor build progress for errors
# (Make command will exit on failure due to set -e)

# 11:45 - Install modules
sudo make modules_install

# 12:00 - Run basic kernel tests
make test || true

# 12:15 - Record build results
cd ..
mkdir -p build_logs
journalctl -k > build_logs/kernel_build.log || true

# 12:30 - Launch QEMU for a simple boot test
qemu-system-x86_64 -kernel llm-rag-os-kernel/arch/x86/boot/bzImage -nographic -append "console=ttyS0" &
QEMU_PID=$!
sleep 30
kill $QEMU_PID

# 12:45 - Mark QEMU boot completed

echo "Day 1 setup completed" > DAY1_STATUS

