FROM cluster-base

USER hadoop

# setup hbase
RUN wget -P /home/hadoop https://www-eu.apache.org/dist/hbase/2.2.1/hbase-2.2.1-bin.tar.gz
RUN \
	tar -C /home/hadoop -xf /home/hadoop/hbase-2.2.1-bin.tar.gz && \
	mv /home/hadoop/hbase-2.2.1 /home/hadoop/hbase && \
	rm /home/hadoop/hbase-2.2.1-bin.tar.gz

# setup env
ENV HBASE_HOME /home/hadoop/hbase
ENV PATH $PATH:$HBASE_HOME/bin
ADD config/hbase-site.xml $HBASE_HOME/conf/hbase-site.xml
RUN echo "export HBASE_MANAGES_ZK=false" >> /home/hadoop/hbase/conf/hbase-env.sh
RUN echo "export JAVA_HOME=$JAVA_HOME" >> /home/hadoop/hbase/conf/hbase-env.sh

USER root
RUN chown hadoop:hadoop /home/hadoop/hbase/conf/hbase-site.xml

CMD service ssh start && bash