# .1.1x => hadoop
# .1.5x => zookeeper
# .1.6x => kafka
# .1.7x => spark

docker run -d \
	--net hadoopnet --ip 172.18.1.71 --hostname sparkmaster \
	-p 7077:7077 -p 8080:8080 \
	--add-host sparknode2:172.18.1.72 --add-host sparknode3:172.18.1.73 \
    --add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
	--add-host nodemaster:172.18.1.11 --add-host node2:172.18.1.2 --add-host node3:172.18.1.13 \
	--name sparkmaster -it spark

docker run -d \
	--net hadoopnet --ip 172.18.1.72 --hostname sparknode2 \
	-p 7078:7077 -p 8081:8081 \
	--add-host sparkmaster:172.18.1.71 --add-host sparknode3:172.18.1.73 \
    --add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
	--add-host nodemaster:172.18.1.11 --add-host node2:172.18.1.2 --add-host node3:172.18.1.13 \
	--name sparknode2 -it spark

docker run -d \
	--net hadoopnet --ip 172.18.1.73 --hostname sparknode3 \
	-p 7079:7077 -p 8082:8081 \
	--add-host sparkmaster:172.18.1.71 --add-host sparknode2:172.18.1.72 \
    --add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
	--add-host nodemaster:172.18.1.11 --add-host node2:172.18.1.2 --add-host node3:172.18.1.13 \
	--name sparknode3 -it spark

docker exec -u hadoop -it sparkmaster start-master.sh
docker exec -u hadoop -it sparknode2 start-slave.sh sparkmaster:7077
docker exec -u hadoop -it sparknode3 start-slave.sh sparkmaster:7077


# spark master ui: http://192.168.33.10:8080/
# spark workers ui: http://192.168.33.10:8081/ http://192.168.33.10:8082/
# bin/spark-submit --master spark://192.168.33.10:7077 --deploy-mode cluster --class io.leres.bigdata5.WordCount hdfs://nodemaster:9000/tmp/bigdata5-all-1.0-SNAPSHOT.jar