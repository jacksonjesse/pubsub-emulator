# [Google Cloud Pub/Sub Emulator](https://hub.docker.com/repository/docker/jessejacksondocker/pubsub-emulator)

This repository contains configuration for a Docker image that contains the Google Cloud Pub/Sub emulator. It is simply a Dockerised version of https://cloud.google.com/pubsub/docs/emulator.

## Usage

### Command Line
This shell statement shows the basic usage, which will create a Pub/Sub emulator running on port 8085, with a project name of "testproject", a default topic of "testtopic" and a subscription of "testsubscription".

```shell script
docker run --rm --publish 8085:8085 jessejacksondocker/pubsub-emulator:latest
```

You can also configure the Pub/Sub project name, topic name, subscription name and exposure port:

```shell script
docker run --rm --env PUBSUB_PROJECT=myproject --env PUBSUB_TOPIC=mytopic --env PUBSUB_SUBSCRIPTION=mysubscription --env PUBSUB_PORT=10101 --publish 10101:10101 jessejacksondocker/pubsub-emulator:latest
```

### Docker Compose

This is the equivalent configuration for `docker-compose`, with custom environment variables for the project name, topic name, subscription name and Pub/Sub port.

```docker-compose
version: '3'
  services:
    pubsub:
      image: jessejacksondocker/pubsub-emulator:latest
      ports:
        - "10101:10101"
      environment:
        - PUBSUB_PORT=10101
        - PUBSUB_PROJECT=myproject
        - PUBSUB_TOPIC=mytopic
        - PUBSUB_SUBSCRIPTION=mysubscription
```