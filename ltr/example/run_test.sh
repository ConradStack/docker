#!/bin/bash

#	Run the ltrharvest/ltrdigest/... pipeline on Theobroma grandiflorum assembly


# See:
# - http://genometools.org/tools/gt_chseqids.html
# requirements:
# - genometools (ltrharvest & ltrdigest)
# - vmatch (mkvtree & vmatch)
# - ltrsift ( for rule_filters; see 'gt select' command)


cp /data/NW_018397255.1.fasta /out/

# create suffix
gt suffixerator -clipdesc -showprogress -md5 -tis -des -ssp -bck -lcp -suf -dna -indexname /out/ltr_test -db /out/NW_018397255.1.fasta

# run ltr_harvest
# (nb -> '-seqids' argument might cause issues with ltr_digest (below) )
gt ltrharvest -index /out/ltr_test -out /out/ltr_test.ltrharvest.out.fasta -outinner /out/ltr_test.ltrharvest.outinner.fasta -gff3 /out/ltr_test.ltrharvest.gff3 \
 -seqids -v -overlaps best -seed 30 -minlenltr 100 -maxlenltr 2000 -mindistltr 1000 -maxdistltr 25000 -similar 80 -mintsd 4 -maxtsd 20 -vic 60 -xdrop 5 -mat 2 -mis -2 -ins -3 -del -3 \
> /out/ltrharvest.log

# clustering analysis (recommend in manual)
mkvtree -db /out/ltr_test.ltrharvest.out.fasta -indexname /out/ltr_test.ltrharvest.out.fasta -dna -pl -allout -v

vmatch -dbcluster 95 7 /out/Cluster-ltr_test.ltrharvest.out -p -d -seedlength 50 -l 1101 -exdrop 9 \
/out/ltr_test.ltrharvest.out.fasta \
> /out/vmatch.log


# run ltr_digest

## sort input 
gt gff3 -sort /out/ltr_test.ltrharvest.gff3 > /out/ltr_test.ltrharvest.sorted.gff3

## run
gt ltrdigest  -seqnamelen 50 \
-seqfile /out/NW_018397255.1.fasta -usedesc \
-pptlen 10 30 -hmms /data/hmms/*.hmm \
-outfileprefix /out/ltr_test.ltrdigest /out/ltr_test.ltrharvest.sorted.gff3 /out/ltr_test \
> /out/ltr_test.ltrdigest.gff3


# filter out matches that do not have 
# - remove all LTR retrotransposon candidates that don't have any domain hit at all (to help get rid of things that might not be LTR retrotransposon insertions)
gt select -rule_files /ltrsift/filters/filter_protein_match.lua -- < /out/ltr_test.ltrdigest.gff3 > /out/ltr_test.ltrdigest.filtered.gff3







