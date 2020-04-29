#-*- coding : utf-8 -*-
# @--time--:2019/3/21-21:05
# @--file_name--:prediction.py
# @--IED--:PyCharm      
# @--login_user--:hxp                    
# @--author--:HXP
# @--describe--:
# @--note--:
from pyspark import SparkConf, SparkContext
from pyspark.streaming import StreamingContext

sc = SparkContext("local[1]", "postgraduate")
ssc = StreamingContext(sc, 2)
lines = ssc.socketTextStream("localhost", 8080)
words = lines.flatMap(lambda line: line.split(","))
pairs = words.map(lambda word: (word, 1))
wordCounts = pairs.reduceByKey(lambda x, y: x + y)
outputFile = "F:\课程\spark\sparkSteaming\postgraduate_prediction"
wordCounts.saveAsTextFiles(outputFile)
print(wordCounts)
ssc.start()
ssc.awaitTermination()