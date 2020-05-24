import sys

def create_topic():
  from google.cloud import pubsub_v1

  publisher = pubsub_v1.PublisherClient()
  topic_path = publisher.topic_path(sys.argv[1], sys.argv[2])

  topic = publisher.create_topic(topic_path)

  print("Topic created: {}".format(topic))

def create_subscription():
    from google.cloud import pubsub_v1

    subscriber = pubsub_v1.SubscriberClient()
    topic_path = subscriber.topic_path(sys.argv[1], sys.argv[2])
    subscription_path = subscriber.subscription_path(
        sys.argv[1], sys.argv[3]
    )

    subscription = subscriber.create_subscription(
        subscription_path, topic_path
    )

    print("Subscription created: {}".format(subscription))

    subscriber.close()

if __name__ == "__main__":
  create_topic()
  create_subscription()