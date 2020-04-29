#-*- coding : utf-8 -*-
# @--time--:2019/4/11-15:05
# @--file_name--:pyspark_streaming.py
# @--IED--:PyCharm      
# @--login_user--:lihui
# @--author--:lihui
# @--describe--:
# @--note--:
# 一个DStream 对应了时间维度上的多个RDD
#map和flatmap的区别：
#map：
# 会对每一条输入进行指定的操作，然后为每一条输入返回一个对象；
#flatMap:
# 则是两个操作的集合——正是“先映射后扁平化”：
#    操作1：同map函数一样：对每一条输入进行指定的操作，然后为每一条输入返回一个对象
#    操作2：最后将所有对象合并为一个对象



from pyspark import SparkContext,SparkConf
from pyspark.streaming import StreamingContext
from pyspark.sql import SQLContext,SparkSession,Row
from sklearn.externals import joblib
import  numpy as np
import os
import pymysql

os.chdir("D:\sparkstreaming\postgraduate_prediction")
log_regre=joblib.load("./logistic_regression.m")

db = pymysql.connect("127.0.0.1", "root", "123456", "postgraduate_prediction")
cursor = db.cursor()

def update(line):
    line_data=line.split(",")
    id,user_id,data=line_data[0],line_data[1],line_data[2:]
    result=log_regre.predict(np.array([int(i) for i in data]).reshape(1, -1))[0]
    sql="update post_data set result=%d where id =%d and user_id =%d"%(result,id,user_id)
    cursor.execute(sql)
    db.commit()
    print("更新结果数据id:%d，user_id:%d，result:%d"%(id,user_id,result))
    return result

# sc = SparkContext(conf=SparkConf().setMaster("local[2]").setAppName("postgraduate_ml_prediction"))
sc = SparkContext("local[2]", "postgraduate_ml_prediction")
stc = StreamingContext(sc, 1)

lines = stc.socketTextStream("127.0.0.1", 10000)
line=lines.flatMap(lambda line:line.split(" "))
line.pprint()
result=line.map(lambda line:update(line))
result.pprint()



stc.start()
stc.awaitTermination()
db.close()
