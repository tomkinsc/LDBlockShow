#!/bin/sh
#$ -S /bin/sh
echo Start Time : 
date
../../bin/LDBlockShow   -InVCF   ../Example1/Test.vcf.gz    -OutPut  out -InGWAS gwas.pvlue     -InGFF  In.gff   -Region  Ghir_D11:24100000:24200000 -OutPng
#../../bin/ShowLDSVG	-InPreFix out -OutPut out.svg -InGWAS   gwas.pvlue  -Cutline  7  -InGFF  In.gff  -crGene lightblue:grey:orange -showNum
#../../bin/ShowLDSVG	-InPreFix	out	-OutPut	out.svg		-InGFF	In.gff	
echo End Time : 
date
