import org.apache.spark.{SparkConf, SparkContext}

object WordCount {
  def main( args:Array[String] ){
//    val logFile = "hdfs://nodemaster:9000/tmp/" // Should be some file on your system
    val logFile = "hdfs://nodemaster:9000/app/data/README.md" // Should be some file on your system

    val conf = new SparkConf().setAppName("wordCount")
    val sc = new SparkContext(conf)
    val input = sc.textFile(logFile)
    val words = input.flatMap(line => line.split(" "))
    val counts = words.map(word => (word, 1)).reduceByKey{case (x, y) => x + y}
    print(counts)

    val x = sc.parallelize(List(1, 1, 1, 1, 1))
    val c = x.reduce((x, y) => {
      println(x, y)
      x + y
    })

    println(c)


//    val spark = SparkSession.builder.appName("Simple Application").config("spark.master", "local").getOrCreate()
//    val logData = spark.read.textFile(logFile).cache()
//    val numAs = logData.filter(line => line.contains("a")).count()
//    val numBs = logData.filter(line => line.contains("b")).count()
//    println(s"Lines with a: $numAs, Lines with b: $numBs")
//    spark.stop()


//    val conf = new SparkConf().setMaster("local[*]").setAppName("KafkaReceiver")
//    val ssc = new StreamingContext(conf, Seconds(10))
//    val kafkaStream = KafkaUtils.createStream(ssc, "zoo1:2181,zoo2:2182,zoo3:2183","spark-streaming-consumer-group", Map("acadgild-topic" -> 5))
//    //need to change the topic name and the port number accordingly
//    val words = kafkaStream.flatMap(x =>  x._2.split(" "))
//    val wordCounts = words.map(x => (x, 1)).reduceByKey(_ + _)
//    kafkaStream.print()  //prints the stream of data received
//    wordCounts.print()   //prints the wordcount result of the stream
//    ssc.start()
//    ssc.awaitTermination()
  }
}
