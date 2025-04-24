// File: WordCount.scala
import org.apache.spark.sql.SparkSession

object WordCount {
def main(args: Array[String]): Unit = {
val spark = SparkSession.builder()
.appName("WordCount")
.master("local[*]")
.getOrCreate()

val textFile = spark.read.textFile("input.txt")
val counts = textFile
  .flatMap(line => line.split("\\s+"))
  .groupByKey(identity)
  .count()

counts.show()
spark.stop()

    }
}
