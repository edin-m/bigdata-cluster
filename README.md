
# hadoopnet
172.18.0.0/16

172.18.1.1x => hadoop
172.18.1.5x => zookeeper
172.18.1.6x => kafka
172.18.1.7x => spark

# zookeeper servers
zoo1			172.18.1.51			2181 =>	2181
zoo2			172.18.1.52			2181 => 2182
zoo3			172.18.1.53			2181 => 2183

# hadoop servers
nodemaster		172.18.1.11
				jobtracker 9001
				jobhistory 10020
				jobhistory web 19888
				name node http 50070
				name node secondary 50090
datanode1		172.18.1.12
datanode2		172.18.1.13

