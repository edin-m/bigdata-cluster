FROM all-base

# setup zookeeper
RUN wget http://apache.mirror.ba/zookeeper/stable/apache-zookeeper-3.5.5-bin.tar.gz -P /home/hadoop
RUN tar -xf /home/hadoop/apache-zookeeper-3.5.5-bin.tar.gz -C /home/hadoop
RUN mv /home/hadoop/apache-zookeeper-3.5.5-bin /home/hadoop/apache-zookeeper
RUN rm /home/hadoop/apache-zookeeper-3.5.5-bin.tar.gz

# setup env
ENV ZOOKEEPER_HOME /home/hadoop/apache-zookeeper
ENV PATH $PATH:$ZOOKEEPER_HOME/bin
RUN mkdir /home/hadoop/zookeeper-data
RUN mkdir /home/hadoop/zookeeper-logs
ADD zookeeper/config/zoo.cfg $ZOOKEEPER_HOME/conf/zoo.cfg

# ownership
RUN chown -R hadoop /home/hadoop/apache-zookeeper
RUN chown -R hadoop /home/hadoop/zookeeper-data
RUN chown -R hadoop /home/hadoop/zookeeper-logs

CMD bash


