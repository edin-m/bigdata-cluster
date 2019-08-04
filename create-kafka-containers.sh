docker rm -f kafka1 kafka2

docker build -t kafka -f kafka/Dockerfile .

docker run -d --net hadoopnet --ip 172.18.1.61 -p 9092:9092 --hostname kafka1 \
	--add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
	--add-host kafka2:172.18.1.62 \
	--name kafka1 -it kafka

docker run -d --net hadoopnet --ip 172.18.1.62 -p 9093:9092 --hostname kafka2 \
	--add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
	--add-host kafka1:172.18.1.61 \
	--name kafka2 -it kafka

docker cp kafka/config/server-1.properties kafka1:/home/hadoop/kafka/config/server.properties
docker cp kafka/config/server-2.properties kafka2:/home/hadoop/kafka/config/server.properties

docker start kafka1
sleep 5

docker start kafka2
sleep 5

docker start kafka1 kafka2
sleep 5

docker exec kafka1 bash -c '$KAFKA_HOME/bin/kafka-topics.sh --delete  --zookeeper zoo1 --topic TestTopic'
docker exec kafka1 bash -c '$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zoo1 --replication-factor 2 --partitions 1 --topic TestTopic'
docker exec kafka1 bash -c '$KAFKA_HOME/bin/kafka-topics.sh --list --zookeeper zoo1'
docker exec kafka1 bash -c '$KAFKA_HOME/bin/kafka-topics.sh --describe --zookeeper zoo1 --topic TestTopic'


