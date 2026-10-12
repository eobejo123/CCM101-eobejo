# Security Audit Report

## The Principle of Least Privilege (PoLP)
The Principle of Least Privilege means giving a user, program, or process
only the exact permissions it needs to do its job, and nothing more. It's
important for cloud user accounts because if an account with excessive
permissions is ever compromised, the damage an attacker can do is limited
only to what that account was allowed to touch — a tightly scoped account
keeps a single breach from becoming a full system compromise.

## Attack Surface
A virtual machine's attack surface is the total number of points where an
unauthorized user could potentially get in — every open port, running
service, installed package, and user account counts toward it. The
smaller the attack surface, the fewer opportunities an attacker has to
find a vulnerability, which is why hardening a server means disabling or
removing anything that isn't strictly necessary.

## Default Deny Policy
Blocking all traffic by default and only allowing specific, known-necessary
connections is safer than trying to block known attackers individually,
because it's impossible to predict every malicious IP address or attack
pattern in advance. A default deny policy assumes all traffic is untrusted
unless explicitly proven otherwise, closing off every unknown or future
threat rather than reacting to each one after the fact.
