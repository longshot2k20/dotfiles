# Kafka 2 brokers brokers 0->:9093,1->:9094

/usr/local/Cellar/kafka/2.3.1/libexec
/usr/local/etc/kafka
/usr/local/Cellar/kafka/2.3.1/libexec/logs

## data write-ahead logs

$HOME/Data/appData/kafka/data/broker0/kafka-logs
$HOME/Data/appData/kafka/data/broker0/kafka-logs

## start kafka brokers

```console
kafka-start
```

## stop kafka brokers

```console
kafka-stop
```

## validate the install

@see https://www.datageekinme.com/general/setup/setting-up-my-mac-kafka/
@see https://kafka.apache.org/documentation/#quickstart

```console
kafka-topics --zookeeper localhost:2181 --create --replication-factor 1 --partitions 2 --topic first-topic
kafka-topics --zookeeper localhost:2181 --list
# open two terminal w/vertical split
kafka-console-producer --broker-list localhost:9093,localhost:9094 --topic first-topic
kafka-console-consumer --bootstrap-server localhost:9093,localhost:9094 --topic first-topic --from-beginning
```

# Errors

Offsets topic replications
Caused by not setting offsets.topic.replication.factor=1 in broker server[x].properties
Default value is 3, since there are only 2 brokers it cant successfully replicate

```console
server.log.2020-06-21-09:[2020-06-21 10:19:29,526] ERROR [KafkaApi-0] Number of alive brokers '2' does not meet the required replication factor '3' for the offsets topic (configured via 'offsets.topic.replication.factor'). This error can be ignored if the cluster is starting up and not all brokers are up yet. (kafka.server.KafkaApis)
```
