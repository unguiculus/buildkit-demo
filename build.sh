#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

export DOCKER_BUILDKIT=1

echo "${GITHUB_TOKEN?Environment variable must be set}" > github_token

docker build \
    --tag buildkit-demo \
    --build-arg owner="${OWNER?Environment variable must be set}" \
    --build-arg repo="${REPO?Environment variable must be set}" \
    --secret id=github_token,src=github_token .
