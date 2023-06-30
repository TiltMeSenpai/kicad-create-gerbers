#!/bin/bash
export LD_LIBRARY_PATH="/usr/lib/kicad/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"
export PYTHONPATH="/usr/lib/kicad/lib/python3/dist-packages/:$PYTHONPATH"

echo "Running in $(pwd)"
# shhhhhh it's ok
git config --global --add safe.directory /github/workspace

git describe --tags || git fetch --tags
python3 /usr/bin/plot_gerbers.py $1 $(git describe --tags || git rev-parse --short HEAD || echo "UNKNOWN")
