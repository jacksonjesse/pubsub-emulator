FROM google/cloud-sdk:293.0.0-slim

ENV PUBSUB_PROJECT test
ENV PUBSUB_TOPIC test
ENV PUBSUB_PORT 8085

# Install gcloud Pub/Sub Python module
COPY requirements.txt /
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Create a volume for Pub/Sub data to reside
RUN mkdir -p /var/pubsub
VOLUME /var/pubsub

# add an extra source here for Java as this does not come by default in Buster
RUN echo "deb http://ftp.us.debian.org/debian sid main" | tee -a /etc/apt/sources.list
RUN apt-get update

# Remove this package as Java tries to install an older version which this gets in the way of
RUN apt-get -yq remove libgcc-8-dev

# Install Java for the Pub/Sub emulator, and the emulator
RUN apt-get -yq install openjdk-8-jdk google-cloud-sdk-pubsub-emulator

COPY create_topic.py /
COPY start.sh /
COPY wait-for-it.sh /

EXPOSE ${PUBSUB_PORT}

CMD ["./start.sh"]