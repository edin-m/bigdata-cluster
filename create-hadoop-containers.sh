# one time (on client) > echo "Y" | ssh-keygen -t rsa -P "" -f /Users/edin-m/bigdata/cluster-hadoop-docker/config/id_rsa

sudo apt-get install -y openssh-client
docker network create --subnet=172.18.0.0/16 hadoopnet

docker build -t hadoop -f hadoop/Dockerfile .

docker run -d --net hadoopnet --ip 172.18.1.1 -p 9000:9000 -p 9870:9870 -p 8088:8088 -p 50070:50070 -p 50090:50090 -p 10020:10020 \
    --hostname nodemaster \
    --add-host node2:172.18.1.2 --add-host node3:172.18.1.3 \
    --add-host zoo1:172.18.1.51 --add-host node2:172.18.1.52 --add-host node3:172.18.1.53 \
    --name nodemaster -v /bigdata:/bigdata -it hadoop
docker run -d --net hadoopnet --ip 172.18.1.2 --hostname node2 --add-host nodemaster:172.18.1.1 --add-host node3:172.18.1.3 --name node2 -it hadoop
docker run -d --net hadoopnet --ip 172.18.1.3 --hostname node3 --add-host nodemaster:172.18.1.1 --add-host node2:172.18.1.2 --name node3 -it hadoop

# format zookeeper
# https://www.i-programmer.info/projects/31-systems/11781-configuring-hadoop-high-availability-clusters.html
# docker exec -u hadoop nodemaster hdfs zkfc -formatZK

# format hdfs
docker exec -u hadoop nodemaster hdfs namenode -format
docker exec -u hadoop nodemaster start-dfs.sh
docker exec -u hadoop nodemaster start-yarn.sh
docker exec -u hadoop nodemaster mapred --daemon start historyserver

docker exec -u hadoop nodemaster hdfs dfs -mkdir -p /tmp
docker exec -u hadoop nodemaster hdfs dfs -ls /

docker exec -u hadoop nodemaster hdfs dfs -touch /tmp/wicked.txt
docker exec -u hadoop nodemaster hdfs dfs -ls /tmp
# hadoop/bin/hdfs dfs -ls hdfs://192.168.33.10:9000/
