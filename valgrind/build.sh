#!/bin/sh
set -ex

cd $(dirname $0)

docker buildx build --platform linux/amd64,linux/arm64 --tag ghcr.io/jacoblincool/valgrind --push .

regctl -v info image copy ghcr.io/jacoblincool/valgrind jacoblincool/valgrind
