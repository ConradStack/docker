#!/bin/bash

# download busco datasets:
## Plants (embryophyta):
wget http://busco.ezlab.org/datasets/embryophyta_odb9.tar.gz
## Fungi:
wget http://busco.ezlab.org/datasets/basidiomycota_odb9.tar.gz
## Eukaryota:
wget http://busco.ezlab.org/datasets/eukaryota_odb9.tar.gz

# Build and tag:
docker build -f Dockerfile -t "conradstack/busco:latest" .

# (optional) Test the image:
## create directory to hold output
#mkdir -p ./example/output
## run test script in the container 
docker run --rm \
-v `pwd`/example:/data:rw -it conradstack/busco /bin/bash -c /data/run_test.sh


