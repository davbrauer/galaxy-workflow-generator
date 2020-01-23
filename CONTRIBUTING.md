# Contributing

New contributions are always welcome. Here we describe how to do so. If you have questions or don't know how to solve a problem using the provided Galaxy instance, please [file an issue](https://github.com/destairdenbi/galaxy-modular-workflow-generator/issues), or [contact us](https://destair.bioinf.uni-leipzig.de/about/).

- [How to use Git](#how-to-use-git)
- [How to use Docker](#how-to-use-docker)
- [How to run the Galaxy workflow generator](#how-to-run-the-galaxy-workflow-generator)
  - [Build the Docker image](#build-the-docker-image)
  - [Run the Docker image](#run-the-docker-image)
  - [Port mapping](#port-mapping)
  - [Storage](#storage)
  - [Restart the container](#restart-the-container)
- [Atoms, tools, plugin](##atoms-tools-plugin)


## How to use Git

All changes to the provided Galaxy instance have to be made through pull requests on [GitHub](https://github.com/). 
If you are new to Git, please try [this tutorial](https://try.github.com/) first. Additional material can be found [here](https://help.github.com/articles/good-resources-for-learning-git-and-github/).  
Once done, you can follow this procedure:

- Fork the current repository, and create your own branch to record your changes
- Commit and [push](https://help.github.com/articles/pushing-to-a-remote/) your changes to your fork
- Open a [pull request](https://help.github.com/articles/creating-a-pull-request/). Your pull request message should include:
  - A description of why the changes should be applied
  - A description of the implementation of the changes
  - A description of how to test the changes
- The pull request should pass the continuous integration tests which are automatically run by GitHub using *e.g.* [Travis CI](https://travis-ci.org/).
- Your pull request will be reviewed and eventually merged
- To keep your copy aligned to the main repository, you need to [syncronise your fork](https://help.github.com/articles/syncing-a-fork/)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## How to use Docker

For usage options, consider referring to the [Docker manual](https://docs.docker.io/). Otherwise, here are some tips for building, running, and modifying the service's underlying Docker container.
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## How to run the Galaxy workflow generator

The following sections explain how to set up the Galaxy workflow generator, and run it with customized parameters.
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


### Build the Docker image

Clone the Galaxy workflow generator
```
$ git clone https://github.com/destairdenbi/galaxy-workflow-generator.git
```

Enter the cloned repository, and build the Docker container locally
```
docker build -t destair-local:latest .
```
<p align="right"><a href="#top">&#x25B2; back to top</a></p>



### Run the Docker image

Execute this command to run the latest Docker image locally

```
docker run -d -p 8080:80 --name destair destair-local:latest
```
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


### Port mapping

You can customize the ports to access the Galaxy workflow generator
```
docker run -p 8081:80 -p 8022:21 quay.io/destair/galaxy-workflow-generator:latest
```
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


### Storage
You can run the Galaxy Docker container by creating a *bind mount* to mount a local directory into the containers /export directory. Galaxy will moves all databases and configurations into the export directory, to store data safely and persistent on your local harddrive.
```
docker run -d -p 8080:80 -v /absolute/path/to/local/directory/:/export/ quay.io/destair/galaxy-workflow-generator:latest
```
You can now modify configurations, atoms and our plugins located in ``/absolute/path/to/local/directory/galaxy-central``
To revert or compare changes with original sources shipped with the image, you can use ``diff`` or ``meld`` on files located in ``/absolute/path/to/local/directory/.distribution_config``
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


### Restart the container

You can restart Galaxy within the running Docker container to reload configuration files, atoms and plugins
```
docker exec destair supervisorctl restart galaxy:
```
<p align="right"><a href="#top">&#x25B2; back to top</a></p>


## Atoms, tools, plugin

To create new atoms, new tools, or modify the plugin to assist users in their analysis, please refer to the dedicated contributing sections:
- [How to contribute to the atoms](https://github.com/destairdenbi/galaxy-atoms)
- [How to contribute to the plugin](https://github.com/destairdenbi/galaxy-webhooks)
- [How to contribute to the tools](https://github.com/destairdenbi/galaxy-tools)
<p align="right"><a href="#top">&#x25B2; back to top</a></p>
