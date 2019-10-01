# one time (on client) > echo "Y" | ssh-keygen -t rsa -P "" -f /Users/edin-m/bigdata/cluster-hadoop-docker/config/id_rsa

sudo apt-get install -y openssh-client
docker network create --subnet=172.18.0.0/16 hadoopnet

docker build -t all-base -f all-base/Dockerfile .