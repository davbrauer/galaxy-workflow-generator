[![Build Status](https://travis-ci.org/destairdenbi/galaxy-modular-workflow-generator.svg?branch=master)](https://travis-ci.org/destairdenbi/galaxy-modular-workflow-generator)
[![Docker Repository on Quay](https://quay.io/repository/destair/galaxy-workflow-generator/status "Docker Repository on Quay")](https://quay.io/repository/destair/galaxy-workflow-generator)

Galaxy workflow generator for assisted RNA-Seq and BS/RRBS-Seq analyses
=======================================================================

With contributions from a growing community of developers and users, the number
of *alternative* Galaxy tools addressing the same questions has steadily risen.
For this reason, it has become harder for the user to make informed decisions
on the selection of tools, and their parameterization.  
The [Galaxy training material](https://galaxyproject.github.io/training-material/)
has helped sharing best-practices where novice and expert users can learn new
methods to carry out their analyses. However, tools are pre-selected by the
community, and the absence of a systematic overview of the available
alternative tools of a Galaxy instance, does not train users on how to evaluate
alternative algorithms and parameterizations.  

The **Galaxy workflow generator** presents a different way of how to assist in
the creation of Galaxy workflows. Here, single or multiple alternative Galaxy
tools are provided as an **atom**: an interactive tour that illustrates tool
options and parameterizations within the context of a selected analysis.  
In this Galaxy instance, we provide sample analyses organized into their
logical **tasks**. For example, an RNA-Seq analysis is organized into:
- Task 1: Quality control and data preprocessing
- Task 2: Genome alignment
- Task 3: Transcript quantification and differential gene expression

Each task can be completed by means of one or more alternative atoms.  
The Galaxy workflow generator embeds a **plugin** that extends the Galaxy
interface with novel interactive dialogs, which compare the alternative atoms
that can be used to solve the current task in the selected analysis. Doing so,
we are able to inform users about alternative tools and parameterizations.  

The Figure below illustrates how the process of selecting atoms and building
workflows takes place. Here, a user is carrying out an RNA-Seq analysis, which
is divided into its three tasks: 1) Quality control and data preprocessing, 2)
Genome alignment, 3) Transcript quantification and differential gene
expression. For each task, the user selects the desired atom in the front-end
interface, and navigates the corresponding interactive tour. The interactive
tour drives the execution of each underlying tool in the Galaxy back-end. Once
each task has been completed, the resulting workflow (traced in red), will thus
be composed of the series of alternative tools of each selected atom,
parameterized according to the interactive tour.

<p align="center">
  <img align="center"
    src="web/process.png"
    width="600px"
    alt="Galaxy workflow generator for assisted RNA-Seq and BS/RRBS-Seq analyses"
    valign="top"/>
</p>

The Galaxy workflow generator collects alternative atoms to carry out RNA-Seq
and BS/RRBS-Seq analyses.

- [Tools](#tools)
  - [Quality control](#quality-control)
  - [Mapping](#mapping)
  - [RNA-Seq](#rna-seq)
  - [BS/RRBS-Seq](#bs-rrbs-seq)
  - [Utilities](#utilities)
- [Installation requirements](#installation-requirements)
- [Run the instance](#run-the-instance)
- [Login credentials](#login-credentials)
- [Support and bug reports](#support-and-bug-reports)
- [Contributing](#contributing)
- [Contributors](#contributors)
- [MIT license](#mit-license)


# Tools


## Quality control

Tool | Description | Reference
:---: | :--- | :---
Cutadapt | Error-tolerant adapter removal tool for High-Throughput Sequencing reads | [Martin 2011](https://doi.org/10.14806/ej.17.1.200)
FastQC | A quality control tool for high throughput sequence data | [Andrews](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
PRINSEQ | A quality control and data preprocessing tool for metagenomic data | [Schmieder et al. 2011](https://doi.org/10.1093/bioinformatics/btr026)
Trim Galore! | Quality control tool for read trimming and filtering of NGS data |
Trimmomatic | Quality control tool for read trimming and filtering of Illumina NGS data | [Bolger et al. 2014](https://doi.org/10.1093/bioinformatics/btu170)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## Mapping

Tool | Description | Reference
:---: | :--- | :---
BWA | Burrows-Wheeler Aligner for mapping low-divergent sequences against a large reference genome | [Li and Durbin 2010](https://doi.org/10.1093/bioinformatics/btp698)
bwameth | Fast and accurate aligner of BS-Seq reads | [Brent et al. 2014](https://arxiv.org/abs/1401.1129)
HISAT2 | Hierarchical indexing for spliced alignment of transcripts | [Pertea et al. 2016](https://doi.org/10.1038/nprot.2016.095)
segemehl | Short sequence read to reference genome mapper | [Otto et al. 2014](https://doi.org/10.1093/bioinformatics/btu146)
STAR | Rapid spliced aligner for RNA-seq data | [Dobin et al. 2013](https://doi.org/10.1093/bioinformatics/bts635)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## RNA-Seq

Tool | Description | Reference
:---: | :--- | :---
BWA | Burrows-Wheeler Aligner for mapping low-divergent sequences against a large reference genome | [Li and Durbin 2010](https://doi.org/10.1093/bioinformatics/btp698)
DESeq2 | Differential gene expression analysis based on the negative binomial distribution | [Love et al. 2014](https://doi.org/10.1186/s13059-014-0550-8)
featureCounts | Genomic feature read count tool for summarising of genes, exons, and promoter counts | [Liao et al. 2014](https://doi.org/10.1093/bioinformatics/btt656)
HISAT2 | Hierarchical indexing for spliced alignment of transcripts | [Pertea et al. 2016](https://doi.org/10.1038/nprot.2016.095)
HTSeq-count | Tool for counting reads in features | [Anders et al. 2015](https://doi.org/10.1093/bioinformatics/btu638)
Rcorrector | A kmer-based error correction method for RNA-seq data | [Song et al. 2015](https://doi.org/10.1186/s13742-015-0089-y)
RSeQC | An RNA-seq Quality Control Package | [Wang et al. 2012](https://doi.org/10.1093/bioinformatics/bts356)
SortMeRNA | A tool for filtering, mapping and OTU-picking NGS reads in metatranscriptomic and -genomic data | [Kopylova et al. 2011](https://doi.org/10.1093/bioinformatics/bts611)
STAR | Rapid spliced aligner for RNA-seq data | [Dobin et al. 2013](https://doi.org/10.1093/bioinformatics/bts635)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## BS/RRBS-Seq

Tool | Description | Reference
:---: | :--- | :---
Bismark | A program to map bisulfite treated sequencing reads to a genome of interest and perform methylation calls | [Krueger et al. 2011](https://doi.org/10.1093/bioinformatics/btr167)
bwameth | Fast and accurate aligner of BS-Seq reads | [Brent et al. 2014](https://arxiv.org/abs/1401.1129)
MethylDackel | A tool to extract per-base methylation metrics from coordinate-sorted and indexed BS-seq alignments | [Ryan](https://github.com/dpryan79/MethylDackel)
segemehl | Short sequence read to reference genome mapper | [Otto et al. 2014](https://doi.org/10.1093/bioinformatics/btu146)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## Utilities

Tool | Description | Reference
:---: | :--- | :---
SAMtools | Utilities for manipulating alignments in the SAM format | [Heng et al. 2009](https://doi.org/10.1093/bioinformatics/btp352)
BEDTools | Utilities for genome arithmetic | [Quinlan et al. 2010](https://doi.org/10.1093/bioinformatics/btq033)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Installation requirements

The only requirement is [Docker](https://www.docker.com/), which can be installed in different ways depending on the underlying system:
- Unix users should follow the [Docker installation for Linux](https://docs.docker.com/installation)
- MacOS 10.12+ users should follow the [Docker installation for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
- Windows 10+ users, should follow the [Docker installation for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
- Non-unix users, whose operative system version is older than the aforementioned one, can rely on [Kitematic](https://kitematic.com/)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Run the instance

- Users not relying on Kitematic can open a terminal, or a Windows PowerShell, and type:
```
$ docker run --net bridge -d -p 8080:80 --name destair --hostname destair quay.io/destair/galaxy-workflow-generator:latest
```
> To allow the use of multiple threads, please prefix the aforementioned command in the following way:
>
> ``
> $ docker run -e "GALAXY_CONFIG_PARALLEL_SLURM_PARAMS=--ntasks=8" -e "GALAXY_CONFIG_PARALLEL_LOCAL_NTASKS=8" ...
> ``

- Kitematic users can launch the Galaxy instance by following [these instructions](https://docs.docker.com/kitematic/userguide/).

After running the container, the Galaxy instance can be accessed from the local web browser, at the address
``
localhost:8080
``.  
We recommend using Google Chrome, Chromium, or Mozilla Firefox.
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Login credentials

To be able to analyse data, users need to be logged in.
- Galaxy users can create an account by clicking on the ``Login or Register`` button, on the top header
- Galaxy administrators can use the default credentials username: `admin`, password: `admin`, and then change settings later on.
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Support and bug reports

If you have questions, or don't know how to solve a problem, please contact us [here](https://destair.bioinf.uni-leipzig.de/about/), or file an [issue](https://github.com/destairdenbi/galaxy-workflow-generator/issues).
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Contributing

New contributions are always welcome. Please read [these instructions](https://github.com/destairdenbi/galaxy-workflow-generator/blob/master/CONTRIBUTING.md) before proceeding in doing so.
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


# Contributors

 - [Andrea Bagnacani](https://github.com/bagnacan)
 - [Bérénice Batut](https://github.com/bebatut)
 - [Björn Grüning](https://github.com/bgruening)
 - [Steffen Lott](https://github.com/lotts)
 - [Konstantin Riege](https://github.com/koriege)
 - [Markus Wolfien](https://github.com/mwolfien)
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
