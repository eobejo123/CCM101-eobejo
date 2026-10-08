# Reflection

Writing a docker-compose.yml file makes a cloud engineer's job
considerably easier than manually typing commands, because the entire
application stack — every container, environment variable, port, and
dependency — is captured in one readable file. Instead of remembering
and retyping a long docker run command for each container, you run one
command and Docker handles the rest. The file also serves as
documentation and can be version-controlled, shared, and reused across
environments.

If you make an indentation error in a YAML file, such as using a Tab
instead of spaces, the file will usually fail to parse entirely —
Docker Compose will throw a syntax error and refuse to start any
containers, since YAML relies on consistent indentation to understand
which settings belong to which service. This makes careful, consistent
spacing essential when editing Compose files by hand.

We used environment variables like MYSQL_PASSWORD in the Compose file
so that sensitive configuration values aren't hardcoded into the
application itself. This keeps credentials easier to manage, lets the
same Docker image be reused across different environments by simply
swapping the variables, and keeps secrets out of version control when
pulled from an external .env file.

Deploying a fully functional enterprise cloud storage system in just a
few minutes felt like a real turning point in understanding what cloud
engineers actually do day-to-day — the complexity of standing up a
private "Google Drive" alternative was handled almost entirely by the
Compose file, which showed how much infrastructure-as-code abstracts
away.

Since Mission 1, my understanding of cloud computing has shifted from
thinking of it as "someone else's computer" to recognizing it as a
discipline built on repeatable, automatable infrastructure — from
provisioning a single VM, to managing storage, to now orchestrating
multiple linked containers as code rather than as manual steps.
