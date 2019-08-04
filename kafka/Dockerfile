FROM all-base

######

# install kafka
RUN wget http://apache.mirror.ba/kafka/2.3.0/kafka_2.12-2.3.0.tgz -P /home/hadoop
RUN tar -xf /home/hadoop/kafka_2.12-2.3.0.tgz -C /home/hadoop
RUN mv /home/hadoop/kafka_2.12-2.3.0 /home/hadoop/kafka
RUN rm /home/hadoop/kafka_2.12-2.3.0.tgz

# configure env
ENV KAFKA_HOME /home/hadoop/kafka
ENV PATH $PATH:$KAFKA_HOME/bin

# chown
RUN chown -R hadoop /home/hadoop/kafka

CMD $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties