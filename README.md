de.STAIR - Galaxy Workbench for guided generation of RNA-Seq Workflows
======================================================================

:whale: Galaxy Docker repository

# Installed tools

 * FASTQC

# Requirements

 - [Docker](https://docs.docker.com/installation/) for Linux / Windows / OSX
 - [Kitematic](https://kitematic.com/) for Windows / OS-X (Optional)

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
        
# Troubleshooting
    
```
docker run --net host -d -p 8080:80 destairdenbi/galaxy-guided-rna-seq:latest
```

For more details about this command line or specific usage, please consult the
[`README`](https://github.com/bgruening/docker-galaxy-stable/blob/master/README.md) of the main Galaxy Docker image, on which the current image is based.

# Contributers
 - Konstantin Riege
 - Andrea Bagnacani
 - Steffen Lott
 - Markus Wolfien

# Original Contributors
 - Bjoern Gruening
 - Bérénice Batut


# Support & Bug Reports

destair@leibniz-fli.de
