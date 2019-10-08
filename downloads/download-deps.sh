# a script to download common dependencies so docker need not

# zookeeper
wget -P downloads https://www-eu.apache.org/dist/zookeeper/stable/apache-zookeeper-3.5.5-bin.tar.gz

# hadoop
wget -P downloads https://archive.apache.org/dist/hadoop/core/hadoop-3.2.0/hadoop-3.2.0.tar.gz
tar -C downloads -xf downloads/hadoop-3.2.0.tar.gz

# spark
wget -P downloads https://www-eu.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.6.tgz
tar -C downloads -xf downloads/spark-2.4.4-bin-hadoop2.6.tgz

# kafka
wget -P downloads https://www-eu.apache.org/dist/kafka/2.3.0/kafka_2.12-2.3.0.tgz

# gradle
wget -P downloads https://downloads.gradle-dn.com/distributions/gradle-5.6.2-bin.zip
unzip -d downloads downloads/gradle-5.6.2-bin.zip

# hbase
wget -P downloads https://www-eu.apache.org/dist/hbase/2.2.1/hbase-2.2.1-bin.tar.gz
tar -C downloads -xf downloads/hbase-2.2.1-bin.tar.gz

