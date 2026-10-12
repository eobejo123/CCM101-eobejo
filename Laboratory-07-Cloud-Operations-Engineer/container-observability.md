# Container Observability

## 404 Error Log Entry
172.17.0.1 - - [12/Oct/2026:11:05:32 +0000] "GET /hidden-admin-page HTTP/1.1" 404 153 "-" "curl/8.5.0" "-"

Application logs are vital for troubleshooting because they record the
exact request, timestamp, and response code for every event, letting an
engineer pinpoint precisely what a user did and where it failed instead of
guessing. Without logs, a vague complaint like "the site is broken" would
be nearly impossible to trace back to a specific cause.

## Real-Time Resource Usage (docker stats)
At the time of the screenshot, the `client-website` container was using:
- **Memory Usage:** 2.73MiB / 1.859GiB (0.14%)
- **CPU %:** 0.00%

These numbers confirm the container is running efficiently and is nowhere
near exhausting the host's available CPU or memory.

