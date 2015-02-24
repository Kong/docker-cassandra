# java
#
# VERSION       Cassandra 2.1.3

# use the centos base image provided by dotCloud
FROM mashape/docker-java7
MAINTAINER Marco Palladino, marco@mashape.com

ENV CASSANDRA_VERSION 2.1.3-1

# adding repo to yum
RUN echo -e "[datastax]\nname = DataStax Repo for Apache Cassandra\nbaseurl = http://rpm.datastax.com/community\nenabled = 1\ngpgcheck = 0" > /etc/yum.repos.d/datastax.repo

# installing Cassandra
RUN yum -y install dsc21-$CASSANDRA_VERSION cassandra21-$CASSANDRA_VERSION

RUN sed -i -r -e 's@^rpc_address.*$@rpc_address: 0\.0\.0\.0@' /etc/cassandra/conf/cassandra.yaml
RUN sed -i -r -e 's@^# broadcast_rpc_address.*$@broadcast_rpc_address: 127\.0\.0\.1@' /etc/cassandra/conf/cassandra.yaml

CMD ["cassandra", "-f"]

EXPOSE 22 8888 7000 7001 7199 7199 9042 9160
