# .1.1x => hadoop
# .1.5x => zookeeper
# .1.6x => kafka
# .1.7x => spark

docker run -d --net hadoopnet --ip 172.18.1.11 \
	-p 9000:9000 -p 9870:9870 -p 8088:8088 -p 50070:50070 -p 50090:50090 -p 10020:10020 \
    --hostname nodemaster \
    --add-host datanode2:172.18.1.12 --add-host datanode3:172.18.1.13 \
    --add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
    --name nodemaster -v /bigdata:/bigdata -it hadoop

docker run -d \
	--net hadoopnet --ip 172.18.1.12 \
	--hostname datanode2 \
	--add-host nodemaster:172.18.1.11 --add-host datanode3:172.18.1.13 \
    --add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
	--name datanode2 -it hadoop

docker run -d --net hadoopnet --ip 172.18.1.13 \
	--hostname datanode3 \
	--add-host nodemaster:172.18.1.11 --add-host datanode2:172.18.1.12 \
    --add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
	--name datanode3 -it hadoop

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


# web: 
# http://192.168.33.10:8088/cluster
# http://192.168.33.10:50070/dfshealth.html#tab-overview