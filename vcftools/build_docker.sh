#!/bin/bash

# Build docker image using specific git commit

# COMMIT ID:
GIT_COMMIT=cb8e254feee3d1fb2ff37e9426ab86fa47cf9b40


# Build and tag with last 6 digits of commit id
docker build \
--build-arg git_commit=${GIT_COMMIT} \
--label "git.commit.full=${GIT_COMMIT}" \
--label "git.commit.short=${GIT_COMMIT: -6}" \
-f Dockerfile -t "vcftools" .


## Example usage:
### NOTE: Use the --stdout argument to vcftools to send output 

### Calculate sample frequency (output to stdout):
#> docker run -v `pwd`:/data --rm -t vcftools --stdout --vcf ./data/all_snps.vcf --freq --out data/junk

### Filter out SNPs with a single allele or more than two alleles (output vcf sent to ./`pwd`/biallelic.recode.vcf):
#> docker run -v `pwd`:/data --rm vcftools --vcf /data/all_snps.vcf --min-alleles 2 --max-alleles 2 --out /data/biallelic --recode --recode-INFO-all


