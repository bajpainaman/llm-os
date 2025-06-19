# LLM-RAG-OS: Hybrid Semantic Operating System

This repository hosts early research and prototyping work for an operating system that leverages Large Language Models (LLMs) with Retrieval-Augmented Generation (RAG). The project is in the **Foundation & Research** phase as documented in `Agents.MD`.

## Quick Start

A helper script is provided to automate the initial environment setup and kernel build steps described in `day1.MD`.

```bash
./scripts/day1_setup.sh
```

The script installs basic build dependencies, clones the kernel source, compiles it, and performs a QEMU boot test. Many steps require sudo privileges and sufficient hardware resources.

See `SprintPlan.MD` for sprint goals and `ImplimentationGuide.MD` for design details.
