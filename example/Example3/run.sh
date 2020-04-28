#!/bin/sh
#$ -S /bin/sh
#Version1.0	hewm@genomics.org.cn	2020-02-18
echo Start Time : 
date
../../bin/LDBlockShow   -InVCF ../Example1/Test.vcf.gz   -OutPut  out   -Region  Ghir_D11:24100000:24200000  -BlockType  3

#/zfssz5/BC_PUB/Software/03.Soft_ALL/plink-1.9/plink	--vcf	../Example1/Test.vcf.gz	--geno	0.1	-maf	0.01	--blocks	no-pheno-req	--out	plink	--allow-extra-chr	
#cp  ../Example1/out.* ./; 
#rm  out.blocks.gz  ; mv    plink.blocks.det   out.blocks ; gzip  out.blocks ; rm  plink.*
#../../bin/ShowLDSVG -InPreFix  ./out   -OutPut out.svg

echo End Time : 
date
