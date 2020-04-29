#-*- coding : utf-8 -*-
from pyspark import SparkContext,SparkConf
from pyspark.streaming import StreamingContext
from sklearn.externals import joblib
import  numpy as np
import os
import pymysql

os.chdir("D:\sparkstreaming\postgraduate_prediction\prediction")
log_regre=joblib.load("./logistic_regression1.m")

def update(line):
    if not line:return
    line=line.split(",")
    id,user_id,data=line[0],line[1],line[2:]
    result=log_regre.predict(np.array([int(i) for i in data]).reshape(1, -1))[0]
    mysql = pymysql.connect("127.0.0.1", "root", "123456", "postgraduate_prediction")
    cursor = mysql.cursor()
    sql="update post_data set result=%d where id =%d and user_id =%d"%(result,id,user_id)
    cursor.execute(sql)
    mysql.commit()
    mysql.close()
    print("更新结果数据id:%d，user_id:%d，result:%d"%(id,user_id,result))
    return result
sc = SparkContext(conf=SparkConf().setMaster("local[2]").setAppName("postgraduate_ml_prediction_streaming"))
stc = StreamingContext(sc,1)

lines = stc.socketTextStream("127.0.0.1", 9999)
result=lines.map(lambda line:update(line))
result.pprint()


stc.start()
stc.awaitTermination()