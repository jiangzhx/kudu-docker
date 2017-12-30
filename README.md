# Kudu Docker
Development docker image for [Apache Kudu](https://github.com/apache/kudu) build from sources

Image can be found on [DockerHub](https://hub.docker.com/r/usuresearch/apache-kudu/)

## Getting Started

```
docker run -d --rm --name apache-kudu -p 7051:7051 -p 7050:7050 -p 8051:8051 -p 8050:8050 usuresearch/apache-kudu

```
