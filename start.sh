#!/bin/bash

./wait-for-it.sh localhost:${PUBSUB_PORT} -- python3 create_topic.py ${PUBSUB_PROJECT} ${PUBSUB_TOPIC} &

gcloud beta emulators pubsub start --project=${PUBSUB_PROJECT} --data-dir=/var/pubsub --host-port=0.0.0.0:${PUBSUB_PORT} --log-http --verbosity=debug --user-output-enabled