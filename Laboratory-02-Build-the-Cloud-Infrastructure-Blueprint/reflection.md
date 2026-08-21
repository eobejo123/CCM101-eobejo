# Reflection

Going into this lab, I honestly thought cloud infrastructure was mostly
just marketing language — "the cloud" as some vague concept. Actually
poking around a real Linux server through KillerCoda changed that pretty
fast. Seeing my own CPU, memory, and IP address come back from real
commands made the whole thing feel a lot more concrete than it did just
reading about it.

### 1. Which cloud infrastructure component do you think is the most important? Why?
I'd lean toward networking, actually. The module explains that networking
resources "enable communication between cloud services, virtual machines,
storage systems, and end users" (Chapter 2, p. 61) — and that stuck with
me, because no matter how powerful a compute resource is or how much data
storage holds, none of it means anything if nothing can actually reach it.
A server with zero network access is basically just an expensive paperweight.

### 2. How does Linux support cloud computing?
Linux shows up everywhere in cloud environments, and after this lab I get
why. The module points out that Linux "remains the dominant operating
system for cloud servers" (Chapter 2, p. 69) — and every single task in
this activity, start to finish, happened through a Linux terminal. No
graphical interface, just commands, which honestly makes automation and
remote management a lot more practical at scale.

### 3. Why is technical documentation important before deploying infrastructure?
This one clicked for me through the university LMS example in the module —
a system that struggled under load during enrollment because of "limited
hardware resources" (Chapter 2, p. 61). Without documentation, nobody
even knows what they're working with in the first place, so any fix or
scaling decision is basically a guess.

### 4. What new skills did you learn during this laboratory activity?
Reading system specs straight from the command line was new territory for
me, along with comparing how AWS, Azure, and GCP name their equivalent
services differently. Building an actual architecture diagram in Draw.io
was also a first — turning abstract components into something visual.

### 5. How has your GitHub portfolio improved after completing this mission?
It's starting to look like an actual body of work now instead of a single
assignment sitting by itself. Two labs in, and the portfolio's showing
real progression — from basic Linux navigation in Lab 1 to actually
investigating and documenting infrastructure in Lab 2.
