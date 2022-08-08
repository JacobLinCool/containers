#!/bin/sh
set -eu

# If no args are given
if [ $# -eq 0 ]; then
  set -- /bin/bash
fi

exec "$@"
