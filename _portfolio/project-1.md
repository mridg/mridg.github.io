---
title: "Multicore RISC-V Processor with Cache Coherence"
excerpt: "A multicore, 5-stage pipelined RISC-V processor in SystemVerilog with full cache coherence across cores."
collection: portfolio
slug: "multicore-riscv"
tagline: "5-stage pipeline, coherent caches"
stack: "SystemVerilog"
domain: "architecture"
year: 2026
# repo: "https://github.com/mridg/..."
---

Designed and implemented a multicore 5-stage pipelined RISC-V processor with
instruction and data cache hierarchies, then built cache coherence protocols to keep
memory consistent across cores. Implemented full pipeline control logic — hazard
detection, forwarding, and branch handling — and built a simulation-based verification
suite to validate both functional correctness and architectural performance.

Built from the ISA spec rather than a reference design, which is where most of the
debugging time went.

<p class="term-proj__todo">[Add a repo/writeup link in the front matter, and drop in a block diagram or waveform capture when you have one.]</p>
