#!/bin/sh
set -ex

cd $(dirname $0)

docker buildx bake --push --set "*.platform=linux/arm64/v8,linux/amd64"

regctl -v info image copy ghcr.io/jacoblincool/homework-space jacoblincool/homework-space
