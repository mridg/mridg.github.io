---
title: "Simulating Collective Communication for Distributed AI Training"
excerpt: "Evaluating and extending SimAI to more accurately simulate NCCL collective communication for distributed AI training."
collection: portfolio
slug: "simai-mscclpp"
tagline: "collective-comm simulation accuracy"
stack: "C++ / Python"
domain: "networks"
year: 2025
# repo: "https://github.com/mridg/..."
---

Evaluated SimAI for simulating NCCL collective communication in distributed AI training
and identified accuracy gaps in how it modeled collective operations. Designed and ran
experiments on the GPU cluster using ns-3 and Astra-Sim, analyzing results with perf,
Flamegraph, and TensorBoard to characterize bottlenecks. Architected and implemented an
MSCCL++-based extension to SimAI to improve simulation accuracy for distributed training
workloads — findings are being used to validate results for a peer-reviewed publication.

Stack: ns-3 · Astra-Sim · NCCL · MSCCL++ · perf · Flamegraph · TensorBoard. Work with
Dr. Xiaoqi Chen, Purdue.

<p class="term-proj__todo">[Link the paper once it's out, or a writeup/poster if you have one.]</p>
