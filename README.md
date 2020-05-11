# [Google Cloud Pub/Sub Emulator](https://hub.docker.com/repository/docker/jessejacksondocker/pubsub-emulator)

This repository contains configuration for a Docker image that contains the Google Cloud Pub/Sub emulator. It is simply a Dockerised version of https://cloud.google.com/pubsub/docs/emulator.

## Usage

### Command Line
This shell statement shows the basic usage, which will create a Pub/Sub emulator running on port 8085, with a project name of "test".

```shell script
docker run --rm --publish 8085:8085 jacksonjesse/pubsub-emulator:latest
```

You can also configure the Pub/Sub project name an exposure port:

```shell script
docker run --rm --env PUBSUB_PROJECT=myproject --env PUBSUB_PORT=10101 --publish 10101:10101 jessejacksondocker/pubsub-emulator:latest
```

### Docker Compose

This is the equivalent configuration for `docker-compose`, with custom environment variables for the project name and Pub/Sub port.

```shell script
version: '3'
  services:
    pubsub:
      image: jessejacksondocker/pubsub-emulator:latest
      environment:
        - PUBSUB_PORT=10101
        - PUBSUB_PROJECT=myproject
```