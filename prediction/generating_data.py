#-*- coding : utf-8 -*-
# @--time--:2019/4/11-22:42
# @--file_name--:generating_data.py
# @--IED--:PyCharm      
# @--login_user--:hxp                    
# @--author--:HXP
# @--describe--:
# @--note--:注意在一行中的for循环可以使用嵌套
import random
import csv
import pandas as pd

#随机生成考研数据
def generating_random_postgraduate_data(data_num=100000,save_path="F:\class\spark\sparkSteaming\postgraduate_prediction\prediction\data.csv"):
	data=[]
	data.append(["english","political","mathematics","profession","to_school_rank","day_hour_study","bachelor_rank","is_tuition_class","is_CET_4_6","is_SCI","result"])
	english=[]#英语成绩
	political=[]#政治成绩
	mathematics=[]#数学成绩
	profession=[]#专业成绩
	to_school_rank=[]#报考学校等级
	day_hour_study=[]#每天学习小时数
	bachelor_rank=[]#本科成绩
	is_tuition_class=[]#是否参加补习班
	is_CET_4_6=[]#是否通过四六级
	is_SCI=[]#是否发表过SCI
	result=[]#考研是否成功

	for i in range(data_num):
		# #英语，政治，数学，专业课分值权重
		# relative_odds=[[1,10,10,20,33,17,5,2,1,1],[5,25,35,24,10,1],[45,30,15,3,3,2,1,1],[45, 30, 15, 3, 3, 2, 1, 1]]
		# for odd in relative_odds:

		#英语和四六级
		eglish_relative_odds_100=[1,10,10,20,33,17,6,5,1,1]#100分各分数段权重
		random_score_100=[random.randint(0,9),random.randint(10,19),random.randint(20,29),random.randint(30,39),random.randint(40,49),random.randint(50,59),random.randint(60,69),random.randint(70,79),random.randint(80,89),random.randint(90,100)]#各分段随机成绩
		random_score_100_all=[z for x,y in zip(random_score_100,eglish_relative_odds_100) for z in [x]*y]#各分段随机成绩按权重生成数组
		english.append(random.choice(random_score_100_all))
		
		#政治
		political_relative_odds_100=[5,25,35,24,10,1]
		random_score_100=[random.randint(30,39),random.randint(40,49),random.randint(50,59),random.randint(60,69),random.randint(70,79),random.randint(80,89),random.randint(90,100)]
		random_score_100_all=[z for x,y in zip(random_score_100,political_relative_odds_100) for z in [x]*y]#各分段随机成绩按权重生成数组
		political.append(random.choice(random_score_100_all))# 政治成绩生成

		#数学
		relative_odds_150 = [45,30,15,3,3,2,1,1]
		random_score_150 = [random.randint(20, 49), random.randint(50, 69), random.randint(70, 89),random.randint(90, 109), random.randint(110,119), random.randint(120, 129),random.randint(130, 139),random.randint(140, 150)]
		random_score_150_all = [z for x, y in zip(random_score_150, relative_odds_150) for z in [x] * y]
		mathematics.append(random.choice(random_score_150_all))# 数学成绩

		#专业课
		relative_odds_150 = [5, 20, 25, 25, 17, 5, 2, 1]
		random_score_150 = [random.randint(30, 49), random.randint(50, 69), random.randint(70, 89), random.randint(90, 109),random.randint(110, 119), random.randint(120, 129), random.randint(130, 139),random.randint(140, 150)]
		random_score_150_all = [z for x, y in zip(random_score_150, relative_odds_150) for z in [x] * y]
		profession.append(random.choice(random_score_150_all))  # 专业课成绩

		#报考学校等级
		to_school_rank.append(random.randint(0,1))

		#每天学习小时数
		sum_score=english[i]+political[i]+mathematics[i]+profession[i]
		if sum_score<300:
			day_hour_study.append(random.choice([3,3,4,4,4,4,5,5,5,5,6,6,7,8,9]))
			bachelor_rank.append(random.choice([1,1,2,2,2,3,3]))
		elif sum_score>=300 and  sum_score<350:
			day_hour_study.append(random.choice([3,4,4,4,4,5,5,5,5,6,6,6,7,7,8,9]))
			bachelor_rank.append(random.choice([1,1,1,1,1,2,2,2]))
		elif sum_score >= 350 and sum_score<400:
			day_hour_study.append(random.choice([4,4,5,5,5,5,6,6,6,6,7,7,7,8,8,9]))
			bachelor_rank.append(random.choice([1,1,1,1,1,1,2,2]))
		else:
			day_hour_study.append(random.choice([5,5,6,6,6,7,7,7,7,8,8,8,9,9]))
			bachelor_rank.append(1)

		#是否过四级
		if bachelor_rank==1:
			is_CET_4_6.append(random.choice([1,1,1,1,1,1,1,1,0,0]))
		elif bachelor_rank==2:
			is_CET_4_6.append(random.choice([1,1,1,1,1,1,1,0,0,0]))
		else:
			is_CET_4_6.append(random.choice([1,1,1,1,1,0,0,0,0,0]))

		#是否参加补习班
		if day_hour_study[i]>=4 and sum_score>=300:
			is_tuition_class.append(random.choice([1,1,1,1,1,1,1,0,0,0]))
		else:
			is_tuition_class.append(random.choice([1,1,1,1,1,0,0,0,0,0]))

		#是否发表过SCI
		if day_hour_study[i]>=6 and bachelor_rank[i]==1 and is_CET_4_6[i]==1 and english[i]>30 and political[i]>40 and mathematics[i]>100 and profession[i]>100 and sum_score>300:
			if random.randint(1,20)==1:
				is_SCI.append(1)
			else:
				is_SCI.append(0)
		else:
			is_SCI.append(0)

		#结果
		if is_SCI[i]==1:
			result.append(1)
		elif sum_score>370 and english[i]>30 and political[i]>40 and mathematics[i]>50 and profession[i]>60:
				result.append(1)
		elif sum_score<=370 and sum_score>350 and english[i]>30 and political[i]>40 and mathematics[i]>50 and profession[i]>60:
			if to_school_rank[i]==1:
				result.append(random.choice([1,1,1,1,1,1,1,1,1,1,0]))
			else:
				result.append(1)
		elif sum_score<=350 and sum_score>300 and english[i]>30 and political[i]>40 and mathematics[i]>50 and profession[i]>60:
			if to_school_rank[i]==1:
				result.append(random.choice([1, 1, 1, 1, 1, 1, 1, 1, 1, 0,0]))
			else:
				result.append(1)
		elif sum_score<=300 and sum_score>250 and english[i]>30 and political[i]>40 and mathematics[i]>50 and profession[i]>60:
			if to_school_rank[i]==1:
				result.append(0)
			else:
				result.append(random.choice([1,1,1,1,1,1,1,1,1,0]))
		elif sum_score<=250 and sum_score>200 and english[i]>30 and political[i]>40 and mathematics[i]>50 and profession[i]>60:
			if to_school_rank[i] == 1:
				result.append(0)
			else:
				result.append(random.choice([1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0]))
		else:
			result.append(0)

		print("生成第%d条数据：英语：%s，政治：%s，数学：%s，专业：%s，总分：%s，报考学校等级：%s，每天学习小时数：%s，本科成绩：%s，是否参加补习班：%s，是否过四六级：%s，是否发表过SCI：%s，是否考上：%s，"%(i,english[i],political[i],mathematics[i],profession[i],sum_score,to_school_rank[i],day_hour_study[i],bachelor_rank[i],is_tuition_class[i],is_CET_4_6[i],is_SCI[i],result[i]))
		data.append([english[i],political[i],mathematics[i],profession[i],to_school_rank[i],day_hour_study[i],bachelor_rank[i],is_tuition_class[i],is_CET_4_6[i],is_SCI[i],result[i]])

	#写入数据
	with open(save_path,"w",newline="") as file:
		csv_write=csv.writer(file)
		csv_write.writerows(data)
	print("数据生成完毕！")

generating_random_postgraduate_data()