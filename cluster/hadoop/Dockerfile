FROM cluster-base

# setup hadoop
RUN wget -P /home/hadoop https://archive.apache.org/dist/hadoop/core/hadoop-3.2.0/hadoop-3.2.0.tar.gz && \
	tar -C /home/hadoop -xf /home/hadoop/hadoop-3.2.0.tar.gz && \
	rm -rf /home/hadoop/hadoop-3.2.0.tar.gz && \
	mv /home/hadoop/hadoop-3.2.0 /home/hadoop/hadoop

# set environment variables
ENV HADOOP_HOME /home/hadoop/hadoop
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV HADOOP_MAPRED_HOME $HADOOP_HOME 
ENV HADOOP_COMMON_HOME $HADOOP_HOME 
ENV HADOOP_HDFS_HOME $HADOOP_HOME 
ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
ENV YARN_HOME $HADOOP_HOME
ENV PATH $HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

# set hadoop-env.sh
RUN echo "export HADOOP_HOME=/home/hadoop/hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HADOOP_CONF_DIR=/home/hadoop/hadoop/etc/hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_NAMENODE_USER=hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_DATANODE_USER=hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_SECONDARYNAMENODE_USER=hadoop" >> /home/hadoop/hadoop/etc/hadoop/hadoop-env.sh

# create folders for nodes
RUN mkdir -p /home/hadoop/data/nameNode \
	/home/hadoop/data/dataNode \
	/home/hadoop/data/nameNodeSecondary \
	/home/hadoop/data/tmp /home/hadoop/hadoop/logs
ADD configs/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
ADD configs/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
ADD configs/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
ADD configs/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
ADD configs/workers $HADOOP_HOME/etc/hadoop/workers

# permissions
# RUN chown hadoop -R /home/hadoop/data
# RUN chown hadoop -R /home/hadoop/hadoop


## Other stuff

# Gradle
#ARG gradle_version=3.5
#RUN \
  cd /home/hadoop && \
  wget https://services.gradle.org/distributions/gradle-${gradle_version}-bin.zip && \
  unzip -d /home/hadoop/gradle gradle-${gradle_version}-bin.zip && \
  rm gradle-${gradle_version}-bin.zip

# ENV PATH="${PATH}:/home/hadoop/gradle/gradle-${gradle_version}/bin"

CMD service ssh start && bash


