# -*- coding: utf-8 -*-
"""
Created on Thu Mar 28 19:14:08 2019

@author: 王月
卖电脑数据分析--多元线性回归算法20190330
"""
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
# Importing the dataset导入数据集
dataset = pd.read_csv('computer.csv')
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
#2、利用回归器预测测试集的样本情况
y_pred=regressor.predict(X_test)#创建一个预测结果向量
#3、选择显著性标准
#增加常数列
import statsmodels.formula.api as sm
X_train=np.append(arr=np.ones((160,1)),values=X_train,axis=1)
X_test=np.append(arr=np.ones((40,1)),values=X_test,axis=1)

#选泽显著性标准
X_opt=X_train[:,[0,1,2,3,4,5,6,7,8,10]]
regressor_OLS=sm.OLS(endog=y_train,exog=X_opt).fit()
regressor_OLS.summary()
#再次预测
regressor1=LinearRegression()
regressor1.fit(X_opt,y_train)
y_pred1=regressor1.predict(X_test[:,[0,1,2,3,4,5,6,7,8,10]])
