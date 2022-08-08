#!/bin/sh
set -eu

# Run dockerd if it's not running
docker info > /dev/null 2>&1 || sudo bash -c 'dockerd > /dockerd.log 2>&1 &' || true

# If no args are given
if [ $# -eq 0 ]; then
  set -- /bin/bash
fi

exec "$@"
