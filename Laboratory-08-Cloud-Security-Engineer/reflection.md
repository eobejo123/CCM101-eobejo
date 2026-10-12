# Reflection

A host-based firewall protects a server even if the physical network
perimeter is breached because it enforces security at the server itself,
not just at the network's edge. Even if an attacker gets past a router or
network firewall and reaches the machine directly, UFW still evaluates
every connection attempt against its own rules and drops anything that
isn't explicitly allowed — the server doesn't trust the network it's on.

Managing open network ports is critical to reducing a server's attack
surface because every open port is a potential entry point. A port
running a service with a known vulnerability is an invitation for an
attacker; closing every port except the ones a server actually needs
eliminates entire categories of attack before they're even attempted.

Leaving a database port like 3306 open to the public internet is
dangerous because it lets anyone on the internet attempt to connect
directly to the database, bypassing the application layer entirely.
Databases often hold the most sensitive data in a system, and a
database exposed directly to brute-force login attempts or known
exploits can be compromised without ever touching the web application
in front of it.

Completing this mission changed my perspective on how easily a server
can be compromised — before configuring UFW myself, I didn't fully
appreciate that a brand-new, freshly deployed server is vulnerable the
moment it goes online, not just after months of neglect. A single
missed step, like enabling the firewall before allowing SSH, can lock
out an administrator just as easily as a misconfigured rule can leave a
server wide open.

My GitHub portfolio now reflects eight completed missions, each building
on the last — from basic Linux navigation in Mission 1 through
infrastructure as code, observability, and now security hardening. Looking
back at the repository as a whole, it reads less like a set of disconnected
assignments and more like a progression toward actual cloud engineering
practice.
