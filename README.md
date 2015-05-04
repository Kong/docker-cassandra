# mashape/cassandra

A Docker image for running a single-node [Cassandra](http://cassandra.apache.org/) cluster. Hosted on Dockerhub at [mashape/cassandra](https://registry.hub.docker.com/u/mashape/cassandra/).

# Usage

To start a container running this image:

```shell
$ docker run -d -p 9042:9042 --name cassandra mashape/cassandra
```

This container will expose your cluster on your host port `9042`, the default Cassandra port. If you wish to change this port, keep in mind that the `-p` arguments expects: `host-port:container-port`. Feel free to change the host port.

#### Volumes

###### Configuration

This container stores the Cassandra configuration (usually in `/etc/cassandra/`) in a Docker volume. You can mount this volume from your host machine by doing so:

```shell
$ docker run -d \
    -v /path/to/your/etc/cassandra:/etc/cassandra \
    -p 9042:9042 \
    --name cassandra \
    mashape/cassandra
```

###### Data storage

This container also stores the actual data (usually in `/var/lib/cassandra/`) in a Docker volume. You can mount this volume from your host machine by doing so:

```shell
$ docker run -d \
    -v /path/to/your/var/lib/cassandra:/var/lib/cassandra \
    -p 9042:9042 \
    --name cassandra \
    mashape/cassandra
```

##### OS X with boot2docker

To run docker on OS X, follow the instructions at [https://docs.docker.com/installation/mac/](https://docs.docker.com/installation/mac/)

Once the environment is ready, open the port Cassandra will be using on your boot2docker VM (by default `9042`):

```shell
$ boot2docker down # be sure boot2docker is not running
$ VBoxManage modifyvm "boot2docker-vm" --natpf1 "cassandra-port,tcp,,9042,,9042"
$ boot2docker up
```
