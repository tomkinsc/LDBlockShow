#!/bin/sh
#$ -S /bin/sh
echo Start Time : 
date
../../bin/ShowLDSVG	-InPreFix	../Example1/out	-OutPut	out.svg	-InGWAS	gwas.pvlue	-Cutline	7	-InGFF	In.gff	
#../../bin/ShowLDSVG	-InPreFix	../Example1/out	-OutPut	out.svg		-InGFF	In.gff	
echo End Time : 
date
