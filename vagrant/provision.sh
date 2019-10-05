sudo apt-get update
sudo apt-get -y install bridge-utils vim curl wget 
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update

sudo apt-get install -y docker-ce openssh-client
sudo service docker start
# run docker under vagrant
sudo groupadd docker
sudo usermod -aG docker vagrant

sudo apt-get install -y openjdk-8-jdk-headless
sudo update-alternatives --config java
sudo update-alternatives --config javac

JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
echo "export JAVA_HOME=$JAVA_HOME" >> /home/vagrant/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH:/bigdata/hadoop/bin" >> /home/vagrant/.bashrc

