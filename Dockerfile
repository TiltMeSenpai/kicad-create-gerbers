FROM ubuntu:22.04

# This is done because hub and software-properties-common should be *relatively* stable
# However, kicad-nightly changes... well, nightly. This allows docker builds that can
# cache layers to minimize their delta.

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -yq software-properties-common hub \
    && rm -rf /var/lib/apt/lists/* # remove the cached files.

# Copy gerber build scripts
COPY kicadScripts/plot_gerbers.py /usr/bin/plot_gerbers.py
RUN  chmod +x /usr/bin/plot_gerbers.py
# Set up environment variables to allow python to access kicad-nightly
ENV LD_LIBRARY_PATH "/usr/lib/kicad-nightly/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"
ENV PYTHONPATH      "/usr/lib/kicad-nightly/lib/python3/dist-packages/:$PYTHONPATH"

# Do the frequently rotating things last
RUN add-apt-repository --yes ppa:kicad/kicad-dev-nightly && apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -yq kicad-nightly \
    && rm -rf /var/lib/apt/lists/* # remove the cached files.

COPY entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
