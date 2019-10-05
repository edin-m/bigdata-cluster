docker run -d --net hadoopnet --ip 172.18.1.51 \
	-p 2181:2181 \
	--hostname zoo1 \
	--add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
	--name zoo1 -v /bigdata:/bigdata zookeeper

docker run -d --net hadoopnet --ip 172.18.1.52 \
	-p 2182:2181 \
	--hostname zoo2 \
	--add-host zoo1:172.18.1.51 --add-host zoo3:172.18.1.53 \
	--name zoo2 zookeeper

docker run -d --net hadoopnet --ip 172.18.1.53 \
	-p 2183:2181 \
	--hostname zoo3 \
	--add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 \
	--name zoo3 zookeeper

docker exec zoo1 bash -c 'echo 1 > /home/hadoop/zookeeper-data/myid'
docker exec zoo2 bash -c 'echo 2 > /home/hadoop/zookeeper-data/myid'
docker exec zoo3 bash -c 'echo 3 > /home/hadoop/zookeeper-data/myid'

docker exec zoo1 bash -c '$ZOOKEEPER_HOME/bin/zkServer.sh start'
docker exec zoo2 bash -c '$ZOOKEEPER_HOME/bin/zkServer.sh start'
docker exec zoo3 bash -c '$ZOOKEEPER_HOME/bin/zkServer.sh start'

docker exec zoo1 bash -c '$ZOOKEEPER_HOME/bin/zkServer.sh status'
docker exec zoo2 bash -c '$ZOOKEEPER_HOME/bin/zkServer.sh status'
docker exec zoo3 bash -c '$ZOOKEEPER_HOME/bin/zkServer.sh status'

