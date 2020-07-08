#!/bin/sh
#$ -S /bin/sh
#Version1.0	hewm@genomics.org.cn	2020-02-07
echo Start Time : 
date
../../bin/LDBlockShow   -InVCF ../Example1/Test.vcf.gz -OutPut out -Region Ghir_D11:24100000:24200000 -InGWAS gwas.pvlue  -OutPng
#../../bin/ShowLDSVG	-InPreFix	out	-OutPut	out.svg	-InGWAS	gwas.pvlue -Cutline  7	 -ShowRR
echo End Time : 
date
