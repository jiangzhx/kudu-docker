# Kudu Docker

Docker image for building [Apache Kudu](https://github.com/apache/kudu) from sources.

The (very fat) container image can be found on DockerHub [usuresearch/apache-kudu](https://hub.docker.com/r/usuresearch/apache-kudu/)

If you only want **to run Apache Kudu**, please consider the image from project [kudu-docker-slim](https://github.com/MartinWeindel/kudu-docker-slim) instead.

## Getting Started

```
docker run -d --rm --name apache-kudu -p 7051:7051 -p 7050:7050 -p 8051:8051 -p 8050:8050 usuresearch/apache-kudu
```

## Build

```
docker build . -t usuresearch/apache-kudu
docker tag usuresearch/apache-kudu usuresearch/apache-kudu:1.7.1
```
