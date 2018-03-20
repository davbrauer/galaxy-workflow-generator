[![Docker Repository on Quay](https://quay.io/repository/destair/galaxy-guided-rna-seq/status "Docker Repository on Quay")](https://quay.io/repository/destair/galaxy-guided-rna-seq)

Galaxy Workbench for guided RNA-Seq Analysis
============================================

:whale: Galaxy Docker repository for guided RNA-Seq analysis


# Installed tools

### Quality control

Tool | Description | Reference
--- | --- | ---
[FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) | A quality control tool for high throughput sequence data | -
[MultiQC](https://github.com/ewels/MultiQC) | Bioinformatics analysis result aggregator | -
[Trim Galore!](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/) | Quality control tool for read trimming and filtering of NGS data | -
[Trimmomatic](https://www.usadellab.org/cms/?page=trimmomatic) | Quality control tool for read trimming and filtering of Illumina NGS data | [Bolger et al. 2014](https://doi.org/10.1093/bioinformatics/btu170)

<p align="right"><a href="#top">&#x25B2; back to top</a></p>

### RNA-Seq

Tool | Description | Reference
--- | --- | ---
[SortMeRNA](https://bioinfo.lifl.fr/RNA/sortmerna/) | A tool for filtering, mapping and OTU-picking NGS reads in metatranscriptomic and -genomic data | [Kopylova et al. 2011](https://doi.org/10.1093/bioinformatics/bts611)
[RESeQC](https://rseqc.sourceforge.net/) | Visualization of RNA-Seq data | [Wang et al. 2012](https://doi.org/10.1093/bioinformatics/bts356)

<p align="right"><a href="#top">&#x25B2; back to top</a></p>

### Read Mapping

Tool | Description | Reference
--- | --- | ---
[Bowtie2](https://bowtie-bio.sourceforge.net/bowtie2/index.shtml) | Fast and sensitive read alignment | [Langmead et al. 2012](https://doi.org/10.1038/nmeth.1923) 
[BWA](https://bio-bwa.sourceforge.net/) | Software package for mapping low-divergent sequences against a large reference genome | [Li and Durbin 2009](https://doi.org/10.1093/bioinformatics/btp324), [Li and Durbin 2010](https://doi.org/10.1093/bioinformatics/btp698)
[HISAT2](https://ccb.jhu.edu/software/hisat2/) | Hierarchical indexing for spliced alignment of transcripts | [Pertea et al. 2016](https://doi.org/10.1038/nprot.2016.095)
[segemehl](https://www.bioinf.uni-leipzig.de/Software/segemehl/) | Short sequence read to reference genome mapper | [Hoffmann et al. 2009](https://doi.org/10.1371/journal.pcbi.1000502)
[STAR](https://github.com/alexdobin/STAR) | Rapid spliced aligner for RNA-seq data | [Dobin et al. 2013](https://academic.oup.com/bioinformatics/article/29/1/15/272537/STAR-ultrafast-universal-RNA-seq-aligner)
[TopHat](https://ccb.jhu.edu/software/tophat/index.shtml) | Splice junction mapper for RNA-Seq reads. TopHat aligns RNA-Seq reads to mammalian-sized genomes using the short read aligner Bowtie, then analyzes the results to identify splice junctions between exons | [Trapnell et al. 2009](https://doi.org/10.1093/bioinformatics/btp120)

<p align="right"><a href="#top">&#x25B2; back to top</a></p>

## RNA structure prediction and analysis

Tool | Description | Reference
--- | --- | ---
[ViennaRNA](https://www.tbi.univie.ac.at/RNA/) | A software library of tools for predicting and comparing RNA secondary structures | [Lorenz et al. 2011](https://doi.org/10.1186/1748-7188-6-26)

<p align="right"><a href="#top">&#x25B2; back to top</a></p>

### Quantification

Tool | Description | Reference
--- | --- | ---
[featureCounts](http://bioinf.wehi.edu.au/featureCounts/) | Genomic feature read count tool for summarising of genes, exons, and promoter counts | [Liao et al. 2014](https://doi.org/10.1093/bioinformatics/btt656)
[htseq-count](https://www-huber.embl.de/HTSeq/doc/count.html) | Tool for counting reads in features | [Anders et al. 2015](https://doi.org/10.1093%2Fbioinformatics%2Fbtu638)

<p align="right"><a href="#top">&#x25B2; back to top</a></p>

### Differential expression analysis

Tool | Description | Reference
--- | --- | ---
[Cufflinks](https://github.com/cole-trapnell-lab/cufflinks) | Estimation of transcripts abundances, and tests for differential expression and regulation in RNA-Seq samples | [Trapnell et al. 2012](https://doi.org/10.1038/nbt.2450)
[CummeRbund](https://compbio.mit.edu/cummeRbund/) | Visualize Cufflinks RNA-Seq output | -
[DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) | Differential gene expression analysis based on the negative binomial distribution | [Love et al. 2014](https://doi.org/10.1186/s13059-014-0550-8)
[DeXSeq](https://bioconductor.org/packages/release/bioc/html/DEXSeq.html) | Differential exon usage, using RNA-seq exon counts between samples with different experimental designs | [Anders et al. 2012](https://doi.org/10.1101/gr.133744.111)

<p align="right"><a href="#top">&#x25B2; back to top</a></p>

### Utilities

Tool | Description | Reference
--- | --- | ---
[SAMtools](https://samtools.sourceforge.net/) | Utilities for manipulating alignments in the SAM format | [Heng et al. 2009](https://doi.org/10.1093/bioinformatics/btp352)
[deepTools](https://deeptools.github.io/) | A software library of tools for exploring high throughput sequencing data | [Ramirez et al. 2014](https://doi.org/10.1093/nar/gku365), [Ramirez et al. 2016](https://doi.org/10.1093/nar/gkw257)

<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Requirements

 - [Docker](https://docs.docker.com/installation/) for Linux / Windows / OSX
 - [Kitematic](https://kitematic.com/) for Windows / OS-X (Optional)

<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Usage

To launch:

```
docker run -d -p 8080:80 destairdenbi/galaxy-guided-rna-seq:latest
```

To launch with a permanent storage of databases, histories, etc:

```
docker run -d -p 8080:80 -v ~/galaxy-guided-rna-seq_DB:/export destairdenbi/galaxy-guided-rna-seq:latest
```

To access:
```
http://localhost
```

<p align="right"><a href="#top">&#x25B2; back to top</a></p>
     
   
# Troubleshooting
    
```
docker run --net host -d -p 8080:80 destairdenbi/galaxy-guided-rna-seq:latest
```

For more details about this command line or specific usage, please consult the
[`README`](https://github.com/bgruening/docker-galaxy-stable/blob/master/README.md) of the main Galaxy Docker image, on which the current image is based.


# Contributers

 - Andrea Bagnacani
 - Bérénice Batut
 - Bjoern Gruening
 - Steffen Lott
 - Konstantin Riege
 - Markus Wolfien

<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# History

 - 0.1: Initial release!

<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Support & Bug Reports

You can file an [issue](https://github.com/destairdenbi/galaxy-guided-rna-seq/issues), or contact us [here](https://destair.bioinf.uni-leipzig.de/about/).

<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# MIT license

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

<p align="right"><a href="#top">&#x25B2; back to top</a></p>
