# Reflection

A host server's resources matter even when every container on it is
behaving perfectly, because the containers are completely dependent on
that underlying machine. No matter how well a container is set up, it
can't outperform the hardware it sits on — if the host runs low on RAM or
disk space, the container suffers regardless of its own configuration.

If a user reported being unable to log in, `docker logs` would let me
pull up the exact requests the server received around that time. From
there I could check for failed login attempts, 500-level server errors, or
requests that stalled out, which would narrow down whether the issue
originated on the client's end, somewhere in the network, or inside the
application itself.

Logs and metrics serve different purposes. Logs, which I worked with in
Checkpoint 4, are detailed records tied to specific moments in time — they
explain *why* something went wrong. Metrics, covered in Checkpoint 5, are
numbers like CPU and memory usage tracked continuously — they show *that*
something is currently happening. In short, metrics flag that there's a
problem, and logs are what you dig into afterward to find the cause.

Enterprise environments monitoring thousands of containers can't rely on
checking each one by hand the way I did with `docker stats`. Instead,
something like Prometheus continuously pulls metrics from every server and
container into a central time-series database, and Grafana converts that
into dashboards engineers can read at a glance. That kind of centralized,
automated setup is what makes monitoring at scale realistic.

This lab noticeably sharpened how I approach troubleshooting in Linux. My
instinct now is to go straight to the actual data — pulling numbers from
`free`, `df`, and `top`, then comparing that against what the container
logs and live metrics show — rather than guessing at a cause before I've
looked at any evidence.
