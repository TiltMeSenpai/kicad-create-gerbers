FROM registry.gitlab.com/tiltmesenpai/kicad-nightly-runner/kicad-nightly-runner:latest

COPY entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
