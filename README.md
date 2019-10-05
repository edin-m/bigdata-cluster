
# hadoopnet
172.18.0.0/16

172.18.1.1x => hadoop
172.18.1.5x => zookeeper
172.18.1.6x => kafka
172.18.1.7x => spark

								container => host
# zookeeper servers
zoo1			172.18.1.51			2181 =>	2181
zoo2			172.18.1.52			2181 => 2182
zoo3			172.18.1.53			2181 => 2183

# hadoop servers
nodemaster		172.18.1.11			8088 => 8088, 9000 => 9000, 9870 => 9870, 10020 => 10020, 50070 => 50070, 50090 => 50090
				jobtracker 9001				
				jobhistory 10020
				jobhistory web 19888
				name node http 50070
				name node secondary 50090
datanode1		172.18.1.12
datanode2		172.18.1.13

# kafka servers
kafka1			172.18.1.61 		9092 => 9092
kafka2			172.18.1.62			9092 => 9093

# spark servers
sparkmaster		172.18.1.71			8080 => 8080
sparknode2		172.18.1.72			8081 => 8081
sparkode3		172.18.1.73			8081 => 8082