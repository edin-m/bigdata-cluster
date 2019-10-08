
docker run -d --net hadoopnet --ip 172.18.1.81 \
    --hostname hbase1 \
    -p 16010:16010 \
    --add-host hbase2:172.18.1.82 --add-host hbase3:172.18.1.83 \
    --add-host nodemaster:172.18.1.11 --add-host datanode2:172.18.1.12 --add-host datanode3:172.18.1.13 \
    --add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
    --name hbase1 -v /bigdata:/bigdata -it hbase

docker run -d --net hadoopnet --ip 172.18.1.82 \
    --hostname hbase2 \
    -p 16030:16030 \
    --add-host hbase1:172.18.1.81 --add-host hbase3:172.18.1.83 \
    --add-host nodemaster:172.18.1.11 --add-host datanode2:172.18.1.12 --add-host datanode3:172.18.1.13 \
    --add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
    --name hbase2 -v /bigdata:/bigdata -it hbase

docker run -d --net hadoopnet --ip 172.18.1.83 \
    --hostname hbase3 \
    -p 16031:16030 \
    --add-host hbase1:172.18.1.81 --add-host hbase2:172.18.1.82 \
    --add-host nodemaster:172.18.1.11 --add-host datanode2:172.18.1.12 --add-host datanode3:172.18.1.13 \
    --add-host zoo1:172.18.1.51 --add-host zoo2:172.18.1.52 --add-host zoo3:172.18.1.53 \
    --name hbase3 -v /bigdata:/bigdata -it hbase

docker cp cluster/hbase/config/regionservers-1 hbase1:/home/hadoop/hbase/conf/regionservers
docker cp cluster/hbase/config/regionservers-2 hbase2:/home/hadoop/hbase/conf/regionservers
docker cp cluster/hbase/config/regionservers-3 hbase3:/home/hadoop/hbase/conf/regionservers

docker exec -u hadoop hbase1 bash -c 'ssh-keyscan hbase1 >> $HOME/.ssh/known_hosts'
docker exec -u hadoop hbase1 bash -c 'ssh-keyscan hbase2 >> $HOME/.ssh/known_hosts'
docker exec -u hadoop hbase1 bash -c 'ssh-keyscan hbase3 >> $HOME/.ssh/known_hosts'

docker exec -u hadoop hbase2 bash -c 'ssh-keyscan hbase1 >> $HOME/.ssh/known_hosts'
docker exec -u hadoop hbase2 bash -c 'ssh-keyscan hbase1 >> $HOME/.ssh/known_hosts'
docker exec -u hadoop hbase2 bash -c 'ssh-keyscan hbase3 >> $HOME/.ssh/known_hosts'

docker exec -u hadoop hbase3 bash -c 'ssh-keyscan hbase1 >> $HOME/.ssh/known_hosts'
docker exec -u hadoop hbase3 bash -c 'ssh-keyscan hbase2 >> $HOME/.ssh/known_hosts'
docker exec -u hadoop hbase3 bash -c 'ssh-keyscan hbase3 >> $HOME/.ssh/known_hosts'

docker exec -u hadoop hbase1 bash -c '/home/hadoop/hbase/bin/start-hbase.sh'

# http://192.168.33.10:16010,16030,16031
# web hbase1 172.18.1.81:16010
# web hbase2 172.18.1.82:16030
# web hbase3 172.18.1.83:16030



