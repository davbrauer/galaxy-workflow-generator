# Contributing

New contributions are always welcome. Here we describe how to do so. If instead you have questions or don't know how to solve a problem using the provided Galaxy instance, please file an [issue](https://github.com/destairdenbi/galaxy-modular-workflow-generator/issues), or contact us [here](https://destair.bioinf.uni-leipzig.de/about/).

## Using Git

All changes to the provided Galaxy instance have to be made through pull requests on [GitHub](https://github.com/). 
If you are new to Git, try [this tutorial](https://try.github.com/) first. Additional material can be found [here](https://help.github.com/articles/good-resources-for-learning-git-and-github/). Once done, follow this procedure:

* Fork the current repository, and create your own branch to record your changes.
* Commit and push your changes to your [fork](https://help.github.com/articles/pushing-to-a-remote/).
* Open a [pull request](https://help.github.com/articles/creating-a-pull-request/). You pull request message should include:
   * A description of why the changes should be applied.
   * A description of the implementation of the changes.
   * A description of how to test the changes.
* The pull request should pass the continuous integration tests which are automatically run by GitHub using e.g. Travis CI.
* Your pull request will be reviewed and eventually merged.
* To keep your copy aligned to the main repository, you need to [syncronise your fork](https://help.github.com/articles/syncing-a-fork/). Make sure to do this frequently.

## Advanced usage, ports and storage

For advanced usage options, consider referring to the [Docker manual](https://docs.docker.io/). Otherwise, here are some tips for modifying the service's underlying Docker container to remap ports and export its content in a directory on your system, 
To do so, follow these procedures:

* To make Docker exporting the contents of its ``/export`` directory on local disk:

```
docker run -v /absolute/path/to/local/directory/:/export/ [...]
```

* To remap the ports for accessing Galaxy server e.g via url ``localhost``:

```
docker run -p 8080:80 -p 8021:21 [...]
```

## Tours

For creating new interactive tours and testing them within the provided Galaxy instance, follow this procedure:

* Launch the Docker container with an attached local volume:

```
docker run -d -p 8080:80 -v /absolute/path/to/local/directory/:/export/ destair/galaxy-modular-workflow-generator:latest
```

* Copy your new tutorial in the tours directory:

```
/absolute/path/to/local/directory/galaxy-central/config/plugins/tours
```

* Reload the Galaxy Docker container:

```
docker exec CONTAINER_ID supervisorctl restart galaxy:
```

## Testing Webhooks

For testing the Galaxy webhook, follow [this procedure](https://github.com/destairdenbi/webhooks).
