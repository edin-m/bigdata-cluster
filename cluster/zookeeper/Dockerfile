FROM cluster-base

# setup zookeeper
RUN wget https://www-eu.apache.org/dist/zookeeper/stable/apache-zookeeper-3.5.5-bin.tar.gz -P /home/hadoop && \
	tar -xf /home/hadoop/apache-zookeeper-3.5.5-bin.tar.gz -C /home/hadoop && \
	mv /home/hadoop/apache-zookeeper-3.5.5-bin /home/hadoop/apache-zookeeper && \
	rm /home/hadoop/apache-zookeeper-3.5.5-bin.tar.gz

# setup env
ENV ZOOKEEPER_HOME /home/hadoop/apache-zookeeper
ENV PATH $PATH:$ZOOKEEPER_HOME/bin
RUN mkdir /home/hadoop/zookeeper-data
RUN mkdir /home/hadoop/zookeeper-logs
ADD config/zoo.cfg $ZOOKEEPER_HOME/conf/zoo.cfg

CMD bash


