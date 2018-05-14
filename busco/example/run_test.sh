#!/bin/bash

# Test BUSCOv3 container

cd /data

# ## T. grandiflorum (mecat, arrow-corrected, quickmerged using dovetail scaffolds)
IN_FILE=NW_018403266.1.fasta
OUT_DIR=busco_test
TMP_DIR=$(pwd)/tmp

mkdir -p ${TMP_DIR}

python /busco/scripts/run_BUSCO.py \
--in ${IN_FILE} \
--out ${OUT_DIR} \
--lineage_path /embryophyta_odb9 \
--mode genome -c 1 \
--tmp_path ${TMP_DIR}
