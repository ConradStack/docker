#!/bin/bash

# Build docker image using specific git commit

# COMMIT ID:
GIT_COMMIT=cb8e254feee3d1fb2ff37e9426ab86fa47cf9b40

# Build and tag with last 6 digits of commit id
docker build \
--build-arg git_commit=${GIT_COMMIT} \
-f Dockerfile -t "vcftools:${GIT_COMMIT: -6}" .


