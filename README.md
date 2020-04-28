
# LDBlockShow
<b>LDBlockShow: a fast and effective tool for Show Region Linkage disequilibrium heatmap Figure analysis based on variant call format files</b>


###  1) Install
------------

<b> [Download](https://github.com/BGI-shenzhen/LDBlockShow/archive/v1.20.tar.gz) </b>

</br>
Method1 For <b>linux/Unix</b> and <b> macOS </b>
<pre>
        git clone https://github.com/BGI-shenzhen/LDBlockShow.git
        chmod 755 configure  ;  ./configure;
        make;
        mv LDBlockShow  bin/;    #     [rm *.o]
</pre>

**Note:** If fail to link,try to <b>re-install</b> the libraries [**_zlib_**](https://zlib.net/)


Method2 For <b>linux/Unix</b> and <b> macOS </b>
<pre>
        tar -zxvf  LDBlockShowXXX.tar.gz
        cd LDBlockShowXXX;
        chmod 755 configure  ;
        cd src;
        make ; make clean                            # or [sh make.sh]		
        ../bin/LDBlockShow		
</pre>
**Note:** If fail to link,try to <b>re-install</b> the libraries [**_zlib_**](https://zlib.net/)

For <b>linux/Unix </b> and <b>macOS </b> compile
  </br> </br> Pre-installations follows are required before installing/run LDBlockShow
  </br> 1 g++   : g++ with [--std=c++11](https://gcc.gnu.org/) > 4.8+ is recommended
  </br> 2 zlib  : [zlib](https://zlib.net/) > 1.2.3 is recommended
  </br> 3 perl:SVG.pm     : [perl](https://www.perl.org/) with [SVG.pm](https://metacpan.org/release/SVG) is recommended



###  2) Introduction
------------
Linkage disequilibrium (LD) Blocks [1] is the most important and most common analysis in the population resequencing[2]. Special in the self-pollinated crops, the LD Blocks for Special region (seletion region,gwas region) is show more detailed information to pick the Specified genes.
Compared with the other two softwares, the results of LDBlocksShow are the same and use less computing resources (DataSet at 1000 sample with 1000 sites). For ordinary users, LDBlocksShow is more friendly and simple to use

|     Software     |   Mem (G)   |  Cpu Time (h)   |       Result       | Statistics |
|:----------------:|:------------|:----------------|:-------------------|:-----------|
| Haploview4.2.jar |      95     |       36        |    HeatMap+Block   |    R^2     |
| R:Ldheatmap 0.99 |      1      |       48        |       HeatMap      |    R^2     |
| LDBlockShow 1.03 |      1      |       1         | HeatMap+Block+GWAS |   R^2/D'   |

**Note:** The new software algorithm of <b>ShowLDSVG</b> merges the same color blocks to reduce the output file size, and can now reach tens of thousands of sites(may be 5w). 1000 sites only output 3.1M out.svg , Combined with parameter [-NumGradien] reduction the color gradien

* <b> Parameter description</b>
```php
 ./bin/LDBlockShow

	Usage: LDBlockShow  -InVCF  <in.vcf.gz>  -OutPut <outPrefix>  -Region  chr1:10000:20000

		-InVCF        <str>     Input SNP VCF Format
		-OutPut       <str>     OutPut File of LD Blocks

		-Region       <str>     In One Region to show LD info svg Figture

		-SeleVar      <int>     Select statistic for deal. 1: R^2  2: D'[1]
		-BlockType    <int>     method to detect Block [beta] [1]
		                        1: Gabriel Method 2 Solid Spine of LD
		                        3: Block by Created plink

		-help                   Show more Parameters and help [hewm2008 v1.20]

```

###  3) Example
------------

See more detailed Usage in the <b>[Chinese Documentation](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/LDBlocksShow_Manual.pdf)</b>
and see the example Dir and  Manual.pdf for more detailed


* Example 1)  show Figure with Defaut LD Blocks

<pre>
../../bin/LDBlockShow   -InVCF Test.vcf.gz   -OutPut  out   -Region  Ghir_D11:24100000:24200000
# if you want to use D' for stat ,just add parameters  [-SeleVar 2] 
</pre>
Example Result Show

![out.png](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/example/Example1/out.png)


* Example 2)  show Figure with Defaut LD Blocks   + GWAS
```
#../../bin/ShowLDSVG	-InPreFix	../Example1/out	-OutPut	out.svg	-InGWAS	gwas.pvlue
../../bin/ShowLDSVG	-InPreFix	../Example1/out	-OutPut	out.svg	-InGWAS	gwas.pvlue -Cutline  7 -ShowRR 
```
Example Result Show

![out.png](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/example/Example2/out.png)


* Example 3) show Figure with Plinks LD Blocks
```
../../bin/LDBlockShow   -InVCF ../Example1/Test.vcf.gz   -OutPut  out   -Region  Ghir_D11:24100000:24200000  -BlockType 3
```
Example Result Show will be the same with Example 1)

* Exampl 4) show Figure with Plinks LD Blocks  + GWAS
```
#../../bin/ShowLDSVG	-InPreFix	../Example3/out	-OutPut	out.svg	-InGWAS	gwas.pvlue
../../bin/ShowLDSVG	-InPreFix	../Example3/out	-OutPut	out.svg	-InGWAS	gwas.pvlue -Cutline  7
```
Example Result Show will be the same with Example 2)

* Example 5)  show Figure with Defaut LD Blocks   + GeneStruct(GeneName)
```
#../../bin/ShowLDSVG	-InPreFix	../Example1/out	-OutPut	out.svg	-InGff In.gff
../../bin/ShowLDSVG	-InPreFix	../Example1/out	-OutPut	out.svg	-InGff In.gff -InGWAS	gwas.pvlue -Cutline  7
```
Example Result Show

![out.png](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/example/Fig/out2.png)



###  4) Results
------------
A LD heatMap images which I draw before.

![out.png](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/example/Fig/out1.png)

###  5) Discussing
------------
- [:email:](https://github.com/BGI-shenzhen/LDBlockShow) hewm2008@gmail.com / hewm2008@qq.com
- join the<b><i> QQ Group : 125293663</b></i>

######################swimming in the sky and flying in the sea #############################
