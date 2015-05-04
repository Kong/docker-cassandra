# docker-cassandra

A Docker image for running a single-node [Cassandra](http://cassandra.apache.org/) cluster.

- Dockerhub repo: [mashape/cassandra](https://registry.hub.docker.com/u/mashape/cassandra/)

## How to use this image

To start a container running this image:

```shell
$ docker run -d -p 9042:9042 --name cassandra mashape/cassandra
```

This container will expose your cluster on your host port `9042`, the default Cassandra port. If you wish to change this port, keep in mind that the `-p` arguments expects: `host-port:container-port`. Feel free to change the host port.

#### Volumes

###### Using a custom Cassandra configuration

This container stores the Cassandra configuration (usually in `/etc/cassandra/`) in a [Data Volume][docker-data-volume]. You can mount this volume from your host machine by doing so:

```shell
$ docker run -d \
    -v /path/to/your/etc/cassandra/:/etc/cassandra \
    -p 9042:9042 \
    --name cassandra \
    mashape/cassandra
```

###### Data storage

This container also stores the actual storage data (usually in `/var/lib/cassandra/`) in a [Data Volume][docker-data-volume]. You can mount this volume from your host machine by doing so:

```shell
$ docker run -d \
    -v /path/to/your/var/lib/cassandra/:/var/lib/cassandra \
    -p 9042:9042 \
    --name cassandra \
    mashape/cassandra
```

## User Feedback

#### Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue][github-new-issue].

#### Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue][github-new-issue], especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

[github-new-issue]: https://github.com/Mashape/docker-cassandra/issues/new
[docker-data-volume]: https://docs.docker.com/userguide/dockervolumes/
