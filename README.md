# Kudu Docker
Docker image for [Apache Kudu](https://github.com/apache/kudu)

Image can be found on [DockerHub](https://hub.docker.com/r/usuresearch/apache-kudu/)

## Getting Started

```
docker run -d --rm --name apache-kudu -p 7051:7051 -p 7050:7050 -p 8051:8051 -p 8050:8050 usuresearch/apache-kudu
```

## Build

```
docker build . -t usuresearch/apache-kudu
docker tag usuresearch/apache-kudu usuresearch/apache-kudu:1.7.0
```
