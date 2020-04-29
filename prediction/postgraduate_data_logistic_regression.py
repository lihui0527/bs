#-*- coding : utf-8 -*-
from sklearn import datasets
from sklearn.externals import joblib
from sklearn.linear_model import  LogisticRegression
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix
from sklearn.externals import joblib

pd.set_option('display.max_columns',None)
pd.set_option('display.max_rows',None)
pd.set_option('expand_frame_repr',False)
np.set_printoptions(threshold=np.inf)
np.set_printoptions(linewidth=np.inf)

dataset=pd.read_csv("./computer.csv")
#提取出自变量数据
X = dataset.iloc[:, [0,1,2,3,4,5,6,7,8,9,10]].values
#提取出因变量P列数据
y = dataset.iloc[:, 11].values
X=X[:,1:]
# Splitting the dataset into the Training set and Test set
#分成训练集和测试集
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
#第二部分：创建并拟合回归器20190330
#1、利用训练集拟合回归器
from sklearn.linear_model import LinearRegression
regressor=LinearRegression()
regressor.fit(X_train,y_train)


#标准化
# stand=StandardScaler()
# x=stand.fit_transform(x)

# x_train,x_test,y_train,y_test=train_test_split(x,y,random_state=0,test_size=0.25)
#
# #逻辑回归
# log_reg=LogisticRegression(random_state=0)
# log_reg.fit(x_train,y_train)
joblib.dump(regressor, "./logistic_regression1.m")
y_pred=regressor.predict(X_test)

#支持向量机
# svm=SVC(kernel="rbf",random_state=0)
# svm.fit(x_train,y_train)
# y_pred=svm.predict(x_test)

#混淆矩阵
cm=confusion_matrix(y_test,y_pred)
print(cm)
print("逻辑回归正确率：%.2f"%(100*((cm[0][0]+cm[1][1])/np.sum(cm)))+"%")

#测试预测
test_data=np.array([55,70,100,100,1,5,1,1,1,0]).reshape(1,-1)
print("测试数据：%s\n总分：%s\n预测结果：%s"%(test_data,test_data.sum(),regressor.predict(test_data)))












