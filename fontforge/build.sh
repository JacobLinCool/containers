#!/bin/sh
set -ex

cd $(dirname $0)

docker buildx bake --push --set "*.platform=linux/arm64/v8,linux/amd64"
