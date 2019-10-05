docker network create --subnet=172.18.0.0/16 hadoopnet

# inside vagrant
# cd /bigdata

# base image 
docker build -t cluster-base -f cluster/base/Dockerfile cluster/base

# zookeeper
docker build -t zookeeper -f cluster/zookeeper/Dockerfile cluster/zookeeper

# hadoop
docker build -t hadoop -f cluster/hadoop/Dockerfile cluster/hadoop

# Kafka
docker build -t kafka -f cluster/kafka/Dockerfile cluster/kafka

# Spark
docker build -t spark -f cluster/spark/Dockerfile cluster/spark



