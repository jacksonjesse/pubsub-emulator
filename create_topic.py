import sys

def create_topic():
  from google.cloud import pubsub_v1

  publisher = pubsub_v1.PublisherClient()
  topic_path = publisher.topic_path(sys.argv[1], sys.argv[2])

  topic = publisher.create_topic(topic_path)

  print("Topic created: {}".format(topic))

if __name__ == "__main__":
  create_topic()