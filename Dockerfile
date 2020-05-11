FROM google/cloud-sdk:291.0.0-alpine

ENV PUBSUB_PROJECT test
ENV PUBSUB_PORT 8085

# Install Java for the Pub/Sub emulator
RUN apk --update add openjdk11-jre

# Create a volume for Pub/Sub data to reside
RUN mkdir -p /var/pubsub
VOLUME /var/pubsub

# Install emulator
RUN gcloud components install pubsub-emulator beta --quiet

EXPOSE ${PUBSUB_PORT}

CMD ["sh", "-c", "gcloud beta emulators pubsub start --project=${PUBSUB_PROJECT} --data-dir=/var/pubsub --host-port=0.0.0.0:${PUBSUB_PORT} --log-http --verbosity=debug --user-output-enabled"]