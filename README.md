[![Build Status](https://travis-ci.org/destair/galaxy-guided-rna-seq.svg?branch=master)](https://travis-ci.org/destair/galaxy-guided-rna-seq)
[![Docker Repository on Quay](https://quay.io/repository/destair/galaxy-guided-rna-seq/status "Docker Repository on Quay")](https://quay.io/repository/destair/galaxy-guided-rna-seq)

Galaxy Modular Workflow Generator for guided data analysis
============================================

The Galaxy Modular Workflow Generator is a self-contained Galaxy instance, comprising a set of analysis tools and related guided tours.  
Guided tours are usually associated with consolidated workflows, composed of multiple tools, each of which is explained in terms of its function and parametrization options. However, such structure presents an analysis as monolithic: tools are pre-selected, and executed in cascade until the result is retrieved. With this unbreakable flow, users cannot readily appreciate the existence of alternative routes (tools) to compose their workflow analyses. At the same time, trainers willing to include such information within the designated training material, would have to continuously update every workflow mentioning each alternative tool.  
To overcome these limitations, in the Galaxy Modular Workflow Generator we provide guided tours that focus on tools rather than workflows, therefore enabling users to perform a specific analysis not by strictly following a pre-defined path, but by walking one.

- [Usage](#usage)
  - [Requirements](#requirements)
  - [Docker configuration](#docker-configuration)
  - [Launch](#launch)
  - [Credentials](#credentials)
- [Available tools](#available-tools)
  - [Quality control](#quality-control)
  - [Read mapping](#read-mapping)
  - [RNA structure prediction and analysis](#rna-structure-prediction-and-analysis)
  - [Differential gene expression analysis](#differential-gene-expression-analysis)
  - [Utilities](#utilities)
- [Contributors](#contributors)
- [Support](#support)
- [MIT license](#mit-license)


# Usage
This Galaxy instance is provided as a Docker container, developed from [Docker Galaxy Stable](https://github.com/bgruening/docker-galaxy-stable). To run it, you only need to have [Docker](https://www.docker.com/) set up.
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## Requirements
[Docker](https://www.docker.com/) can be installed in different ways:
- For non-\*nix users, Kitematic provides a [Docker installation for both OSX and Windows](https://kitematic.com/)
- For \*nix users, follow the [Docker installation for Linux](https://docs.docker.com/installation).
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## Launch
The Galaxy Docker container can be launched in different ways:
- For non-\*nix users, this can be achieved [from Kitematic's interface](https://www.youtube.com/watch?v=fYer4Xdw_h4)
- For \*nix users, this can be achieved by
```
$ docker run -d -p 8080:80 https://quay.io/repository/destair/galaxy-guided-rna-seq
```
The Galaxy instance will open in a browser window at the address
```
localhost:8080
```
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## Credentials
The Galaxy administrator user has
- username: admin@galaxy.org
- password: admin

To be able to use the modular workflow generator, a user nees to be logged in.
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Available tools


## Quality control

Tool | Description | Reference
--- | --- | ---
[Cutadapt](https://cutadapt.readthedocs.io/en/stable) | Error-tolerant adapter removal tool for High-Throughput Sequencing reads | [Martin 2011](https://doi.org/10.14806/ej.17.1.200)
[FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) | A quality control tool for high throughput sequence data | -
[MultiQC](https://github.com/ewels/MultiQC) | Bioinformatics analysis result aggregator | -
[Sickle](https://github.com/najoshi/sickle) | Windowed adaptive trimming tool for FASTQ files | Joshi et al. 2011
[Trim Galore!](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/) | Quality control tool for read trimming and filtering of NGS data | -
[Trimmomatic](https://www.usadellab.org/cms/?page=trimmomatic) | Quality control tool for read trimming and filtering of Illumina NGS data | [Bolger et al. 2014](https://doi.org/10.1093/bioinformatics/btu170)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## Read Mapping

Tool | Description | Reference
--- | --- | ---
[Bowtie2](https://bowtie-bio.sourceforge.net/bowtie2/index.shtml) | Fast and sensitive read alignment | [Langmead et al. 2012](https://doi.org/10.1038/nmeth.1923) 
[BWA](https://bio-bwa.sourceforge.net/) | Software package for mapping low-divergent sequences against a large reference genome | [Li and Durbin 2010](https://doi.org/10.1093/bioinformatics/btp698)
[HISAT2](https://ccb.jhu.edu/software/hisat2/) | Hierarchical indexing for spliced alignment of transcripts | [Pertea et al. 2016](https://doi.org/10.1038/nprot.2016.095)
[Segemehl](https://www.bioinf.uni-leipzig.de/Software/segemehl/) | Short sequence read to reference genome mapper | [Hoffmann et al. 2009](https://doi.org/10.1371/journal.pcbi.1000502)
[STAR](https://github.com/alexdobin/STAR) | Rapid spliced aligner for RNA-seq data | [Dobin et al. 2013](https://academic.oup.com/bioinformatics/article/29/1/15/272537/STAR-ultrafast-universal-RNA-seq-aligner)
[TopHat](https://ccb.jhu.edu/software/tophat/index.shtml) | Splice junction mapper for RNA-Seq reads. TopHat aligns RNA-Seq reads to mammalian-sized genomes using the short read aligner Bowtie, then analyzes the results to identify splice junctions between exons | [Trapnell et al. 2009](https://doi.org/10.1093/bioinformatics/btp120)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## RNA structure prediction and analysis

Tool | Description | Reference
--- | --- | ---
[ViennaRNA](https://www.tbi.univie.ac.at/RNA/) | A software library of tools for predicting and comparing RNA secondary structures | [Lorenz et al. 2011](https://doi.org/10.1186/1748-7188-6-26)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## Differential gene expression analysis

Tool | Description | Reference
--- | --- | ---
[Cufflinks](https://github.com/cole-trapnell-lab/cufflinks) | Estimation of transcripts abundances, and tests for differential expression and regulation in RNA-Seq samples | [Trapnell et al. 2012](https://doi.org/10.1038/nbt.2450)
[CummeRbund](https://compbio.mit.edu/cummeRbund/) | Visualize Cufflinks RNA-Seq output | -
[DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) | Differential gene expression analysis based on the negative binomial distribution | [Love et al. 2014](https://doi.org/10.1186/s13059-014-0550-8)
[DeXSeq](https://bioconductor.org/packages/release/bioc/html/DEXSeq.html) | Differential exon usage, using RNA-seq exon counts between samples with different experimental designs | [Anders et al. 2012](https://doi.org/10.1101/gr.133744.111)
[featureCounts](http://bioinf.wehi.edu.au/featureCounts/) | Genomic feature read count tool for summarising of genes, exons, and promoter counts | [Liao et al. 2014](https://doi.org/10.1093/bioinformatics/btt656)
[htseq-count](https://www-huber.embl.de/HTSeq/doc/count.html) | Tool for counting reads in features | [Anders et al. 2015](https://doi.org/10.1093%2Fbioinformatics%2Fbtu638)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## Utilities

Tool | Description | Reference
--- | --- | ---
[SAMtools](https://samtools.sourceforge.net/) | Utilities for manipulating alignments in the SAM format | [Heng et al. 2009](https://doi.org/10.1093/bioinformatics/btp352)
[BLAST+](ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST) | A software library of tools for sequence similarity search | [Camacho et al. 2009](https://doi.org/10.1186/1471-2105-10-421)
[SortMeRNA](https://bioinfo.lifl.fr/RNA/sortmerna/) | A tool for filtering, mapping and OTU-picking NGS reads in metatranscriptomic and -genomic data | [Kopylova et al. 2011](https://doi.org/10.1093/bioinformatics/bts611)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Contributors

 - [Andrea Bagnacani](https://github.com/bagnacan)
 - [Bérénice Batut](https://github.com/bebatut)
 - [Björn Grüning](https://github.com/bgruening)
 - [Steffen Lott](https://github.com/lotts)
 - [Konstantin Riege](https://github.com/koriege)
 - [Markus Wolfien](https://github.com/mwolfien)
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
