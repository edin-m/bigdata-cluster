docker start nodemaster node2 node3

docker exec -u hadoop -it nodemaster start-dfs.sh
docker exec -u hadoop -it nodemaster start-yarn.sh
docker exec -u hadoop -it nodemaster mapred --daemon start historyserver
