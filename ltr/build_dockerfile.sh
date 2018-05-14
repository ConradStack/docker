#!/bin/bash


# Build and tag:
docker build -f Dockerfile -t "conradstack/ltr:latest" .

# (optional) Test the image:
## create directory to hold output
mkdir -p ./example/output
## run test script in the container 
docker run --rm -v `pwd`/example:/data:ro -v `pwd`/example/output:/out:rw -it conradstack/ltr /bin/bash -c /data/run_test.sh
