
# LDBlockShow
<b>LDBlockShow: a fast and effective tool for Show Region Linkage disequilibrium heatmap Figure analysis based on variant call format files</b>

###  1) Install
------------

<b>a). linux/Unix&nbsp;&nbsp;&nbsp;   [Download](https://github.com/BGI-shenzhen/LDBlockShow/archive/v1.25.tar.gz) </b>
</br><b>b). MaxOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   [Download](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/src/LDBlockShow-1.25_mac.tar.gz) </b>
  
  </br> Pre-installations follows are required before installing/run LDBlockShow
  </br> </br> 1 g++   : g++ with [--std=c++11](https://gcc.gnu.org/) > 4.8+ is recommended
  </br> 2 zlib  : [zlib](https://zlib.net/) > 1.2.3 is recommended
  </br> 3 <b>perl:SVG.pm</b>     : [perl](https://www.perl.org/) with [SVG.pm](https://metacpan.org/release/SVG) is recommended



</br>
Method1 For <b>linux/Unix</b>
<pre>
        git clone https://github.com/BGI-shenzhen/LDBlockShow.git
        chmod 755 configure  ;  ./configure;
        make;
        mv LDBlockShow  bin/;    #     [rm *.o]
</pre>

</br>**Note:** If fail to link,try to <b>re-install</b> the libraries [**_zlib_**](https://zlib.net/)

Method2 For <b>linux/Unix</b> and <b> macOS </b>
<pre>
        tar -zxvf  LDBlockShowXXX.tar.gz
        cd LDBlockShowXXX;
        chmod 755 configure  ;
        cd src;
        make ; make clean                            # or [sh make.sh]		
        ../bin/LDBlockShow		
</pre>
**Note:** For <b>macOS</b> if plink do no work, please re-download [**mac _plinks_**](https://www.cog-genomics.org/plink2/) and replace into Dir [LDBlockShowXXX/bin]
</br>**Note:** If fail to link,try to <b>re-install</b> the libraries [**_zlib_**](https://zlib.net/)

###  2) Introduction
------------
Linkage disequilibrium (LD) Blocks [1] is the most important and most common analysis in the population resequencing[2]. Special in the self-pollinated crops, the LD Blocks for Special region (seletion region,gwas region) is show more detailed information to pick the Specified genes.
</br>Compared with the other two softwares, the results of LDBlocksShow are the same and use less computing resources (DataSet at 1000 sample with 1000 sites). For ordinary users, LDBlocksShow is more friendly and simple to use
</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;see the below <b>Advantages</b> part for more excellent part.
</br>
**Note:** The new software algorithm of <b>ShowLDSVG</b> merges the same color blocks to reduce the output file size, and can now reach tens of thousands of sites(may be 5w). 1000 sites only output 3.1M out.svg , Combined with parameter [<b>-NumGradien</b>] reduction the color gradien

* <b> Parameter description</b>
```php
 ./bin/LDBlockShow

        Usage: LDBlockShow  -InVCF  <in.vcf.gz>  -OutPut <outPrefix>  -Region  chr1:10000-20000

                -InVCF          <str>     Input SNP VCF Format
                -OutPut         <str>     OutPut File of LD Blocks
                -Region         <str>     In One Region to show LD info svg Figure


                -SeleVar        <int>     Select statistic for deal. 1: D' 2: R^2[1]
                -SubPop         <str>     SubGroup Sample File List[ALLsample]
                -BlockType      <int>     method to detect Block [beta] [1]
                                           1. Block by PLINK (Gabriel method)
                                           2. Solid Spine of LD RR/D' 3. Blockcut with self-defined RR or D'
                                           4. FixBlock by input blocks files

                -InGWAS         <str>     InPut GWAS Pvalue File(chr site Pvalue)
                -InGFF          <str>     InPut GFF3 file to show Gene CDS and name

                -BlockCut       <float>   'Strong LD' cutoff and ratio for BlockType3[0.85:0.90]
                -FixBlock       <str>      Input fixed block region
                -MerMinSNPNum   <int>      merger color grids when SNPnumber over N[50]

                -help                      Show more Parameters and help [hewm2008 v1.25]

```

###  3) Example
------------

</br>See more detailed Usage in the <b>[Chinese Documentation](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/LDBlocksShow_Manual_Chinese.pdf)</b>
</br>See more detailed Usage in the <b>[English Documentation](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/LDBlocksShow_Manual_English.pdf)</b>
</br>and see the example Dir and  Manual.pdf for more detailed


* Example 1)  show Figure with Defaut LD Blocks

<pre>
../../bin/LDBlockShow   -InVCF Test.vcf.gz   -OutPut  out   -Region  Ghir_D11:24100000:24200000  -OutPng
# if you want to use R^2 for stat ,just add parameters  [-SeleVar 2]
</pre>
Example Result Show

![out.png](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/example/Example1/out.png)


* Example 2)   Output LDHeatMap combined with GWAS statistics
```
../../bin/LDBlockShow   -InVCF ../Example1/Test.vcf.gz -OutPut out -Region Ghir_D11:24100000:24200000 -InGWAS gwas.pvlue
#../../bin/ShowLDSVG    -InPreFix     out     -OutPut out.svg -InGWAS gwas.pvlue -Cutline  7   -ShowNum -OutPng
```
Example Result Show

![out.png](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/example/Example2/out.png)


* Example 3) show Figure with genomic annotation
```
../../bin/LDBlockShow   -InVCF   ../Example1/Test.vcf.gz    -OutPut  out -InGWAS gwas.pvlue     -InGFF  In.gff   -Region  Ghir_D11:24100000:24200000
#../../bin/ShowLDSVG    -InPreFix out -OutPut out.svg -InGWAS   gwas.pvlue  -Cutline  7  -InGFF  In.gff  -crGene lightblue:grey:orange -showNum
#../../bin/ShowLDSVG    -InPreFix       out     -OutPut out.svg         -InGFF  In.gff -OutPng
```
Example Result Show

![out.png](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/example/Example3/out.png)



###  4) Advantages
To evaluate the performance of LDBlockShow, we used test VCF files to generate the LD heatmap by using LDBlockShow, Haploview[4], and LDheatmap[5]. The calculated r<sup>2</sup> and D’ values of LDBlockShow is the same with other tools. As shown in Figure below, LDBlockShow is more time and memory saving than other tools.
</br></br>
![Advantages](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/example/Fig/out2.png)
</br> Comparison of computing cost for LDBlockShow, LDheatmap and Haploview. CPU time (A) and memory cost (B) for different methods are shown with a fix SNP number of 100 and sample size
</br></br> As shown in Table below, LDBlockShow can generate the plots of LD heatmap and interested statistics or annotation results simultaneously. In addition, LDBlockShow also supports subgroup analysis
</br>
|          <b>Performance</b>              |    <b>LDBlockShow</b>   |   <b>Haploview</b>    |  <b>LDheatmap</b>     |
|:-----------------------------------------|:-----------------------:|:---------------------:|:---------------------:|
|<i><b>Input</b></i>                       |                         |                       |                       |
|Calculation from VCF files directly       |            &radic;      |        &times;        |         &times;       |
|Support subgroup analysis                 |            &radic;      |        &times;        |         &times;       |
|<i><b>Output</b></i>                      |                         |                       |                       |
|Visualize additional statistics or genomic|            &radic;      |        &times;        |         &times;       |
|annotation simultaneously                 |            &radic;      |        &times;        |         &times;       |
|Compressed SVG                            |            &radic;      |        &times;        |         &times;       |
|PNG file                                  |            &radic;      |        &radic;        |         &times;       |
|Block region                              |            &radic;      |        &radic;        |         &times;       |
|LD measurement                            |     R<sup>2</sup>/D'    |           D'          |   R<sup>2</sup>       |  


###  5) Results
------------
A LD heatMap images which I draw before.

![heatmap](https://github.com/BGI-shenzhen/LDBlockShow/blob/master/example/Fig/out1.png)

###  6) Discussing
------------
- [:email:](https://github.com/BGI-shenzhen/LDBlockShow) hewm2008@gmail.com / hewm2008@qq.com
- join the<b><i> QQ Group : 125293663</b></i>

######################swimming in the sky and flying in the sea #############################
