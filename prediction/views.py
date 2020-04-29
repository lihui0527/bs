#-*- coding : utf-8 -*-
from django.shortcuts import render,redirect
from . import models
import datetime,time
from sklearn.externals import joblib
import  numpy as np
from sklearn.externals import joblib
from django.http import HttpResponseRedirect,HttpResponse
from django.db.models import Avg, Max, Min, Count, Sum
import socket
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind((host, port))
def index(req):
    if req.method == "GET":
        if req.session.get("user_id"):
            user_id = req.session.get("user_id")
            user_data = models.PostData.objects.filter(user_id=user_id)
            info = {
                "user_name": req.session.get("user_name"),
                "user_head_img": req.session.get("user_head_img"),
                "user_data": user_data,
            }
            return render(req, "prediction/index.html",info)
        else:
            return render(req, "prediction/index.html")

def register(req):
    return render(req, "prediction/register.html")

import hashlib


def do_register(req):
    info=""
    if req.method == "POST":
        user_name = req.POST.get("user_name")
        password = req.POST.get("password")
        md5 = hashlib.md5()  # 2,获取md5() 方法
        md5.update(password.encode())  # 3. 对字符串的字节类型加密
        password = md5.hexdigest()
        head_file=req.FILES["head_file"]
        head_file_save_path="static/images/user_head/"+str(user_name)+"-"+str(time.time())+".jpg"
        user={"name":user_name,"password":password,"head_img":head_file_save_path,"register_time":datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}
        with open(head_file_save_path, 'wb') as path:
            for c in head_file.chunks():
                path.write(c)
        if models.User.objects.create(**user):
            info={
                "mes":"注册成功！请登录~",
                "class":"alert alert-success alert-dismissable"
            }
            return render(req,"prediction/login.html",info)
        else:
            info={
                "mes":"注册失败！",
                "class":"alert alert-danger alert-dismissable"
            }
            return render(req, "prediction/register.html", info)
    elif req.method == "GET":
        return redirect("/prediction/index")
def verdict(req):
    name = req.session.get("user_name")
    user_id = req.session.get("user_id")
    id = req.session.get("data_id")

    info = ""
    if req.method == "POST":
        verdict = req.POST.get("verdict")
        info={
            "vrdict":verdict,
            "user_name":name
        }
        models.PostData.objects.filter(id=id).update(verdict=verdict)
        return render(req, "prediction/index.html",info)
    else :
        info = {
            "mes": "注册失败！",
            "class": "alert alert-danger alert-dismissable"
        }

        return render(req, "prediction/result.html",info)
def scn(req):
    name = req.GET['name']
    models.User.objects.filter(name=name).delete()
    return render(req, "prediction/administer.html")
#根据时间查询数据
def s(req):
    y = req.POST.get('year')
    m = req.POST.get('month')
    d = req.POST.get('day')
    y1 = req.POST.get('year1')
    m1 = req.POST.get('month1')
    d1 = req.POST.get('day1')
    date_from = datetime.datetime(int(y), int(m), int(d), 0, 0)
    date_to = datetime.datetime(int(y1), int(m1), int(d1), 0, 0)
    shuju = models.PostData.objects.filter(post_time__range=(date_from, date_to))

    shuju1 = models.PostData.objects.filter(post_time__range=(date_from, date_to),result__gte=0.80)
    user_name = req.session.get("user_name")
    #s=shuju1.User.all()
    #return HttpResponse(s)
    user1 = models.User.objects.all()
    user_name = req.session.get("user_name")
    if shuju1 and shuju:
        info1 = {
            "user_name": user_name,
            "user1": user1,
            "username":user_name,
            "shu": shuju,
            "len":len(shuju),
            "len1":len(user1),
            "len2": len(shuju1),
        }
        return render(req, "prediction/administer.html", info1)
    else:
        info1 = {
            "user_name": user_name,
            "user1": user1,
            "username": user_name,
            "shu": shuju,
            "len": len(shuju),
            "len1": len(user1),
            "len2": "未查询到数据",
        }
        return render(req, "prediction/administer.html", info1)



def xx(req):
    id = req.GET['id']
    user_name = req.session.get("user_name")
    user=models.PostData.objects.filter(user_id=id)
    k1=models.PostData.objects.filter(result__gte=0.80,user_id=id)
   # .annotate(num_books=Count('book'))
    m={}
    user2 = models.PostData.objects.values("verdict").filter(user_id=id)
    userresult = models.PostData.objects.values("result").filter(user_id=id)
    userresult_list=list(userresult)
    k=len(user2)
    k1=len(k1)
    info = {
        "user_data": user,
        "user_name": user_name,
        "k": k,
        "m": m,
        "k1": k1,
    }
    return render(req, "prediction/message.html",info)

def check_username(req):
    info=""
    if req.method == "POST":
        user_name = req.POST.get("user_name")
        password = req.POST.get("password")
        re_password = req.POST.get("re_password")

def login(req):
    return render(req,"prediction/login.html")

def do_login(req):
    if req.method=='POST':
        user_name = req.POST.get("user_name")
        password = req.POST.get("password")
        md5 = hashlib.md5()  # 2,获取md5() 方法
        md5.update(password.encode())  # 3. 对字符串的字节类型加密
        password = md5.hexdigest()
        if models.User.objects.filter(name=user_name,password=password):
            user=models.User.objects.get(name=user_name,password=password)
            info = {
                "user_name": user.name,
                "user_id": user.id,
                "user_head_img": user.head_img
            }
            req.session['user_id'] = user.id
            req.session['user_name'] = user.name
            req.session['password'] = user.password
            req.session['user_head_img'] = user.head_img
            req.session.set_expiry(60 * 10)
            return render(req,"prediction/index.html",info)
        elif  models.Administer.objects.filter(username=user_name,password=password):
            user = models.Administer.objects.get(username=user_name, password=password)
            info = {
                "user_name": user.username,
                "user_uid": user.uid,
            }
            req.session['administer_id'] = user.uid
            req.session['user_name'] = user.username
            req.session['password'] = user.password
            req.session.set_expiry(60 * 10)

            user1 = models.User.objects.all()
            req.session['user_head_img'] = user.head_img
            info1 = {
                #"user_name": user1.username,
                "user1": user1,
                "user_name": user.username,
                "len":len(user1),
                "user_head_img": user.head_img
            }
            return render(req, "prediction/administer.html", info1)


        else:
            info = {
                "mes": "账号或密码输入错误！",
                "class": "alert alert-danger alert-dismissable"
            }
            return render(req, "prediction/login.html",info)
    elif req.method=="GET":
        if req.session.get("user_name"):
            user_name = req.session.get("user_name")
            password = req.session.get("password")
            user = models.User.objects.get(name=user_name, password=password)
            info = {
                "user_name": user.name,
                "user_id": user.id,
                "user_head_img": user.head_img
            }
            return render(req, "prediction/login.html", info)
        else:
            info = {
                "mes": "请登录后再尝试操作！",
                "class": "alert alert-danger alert-dismissable"
            }
            return render(req, "prediction/login.html", info)
    else:
        return redirect("/prediction/login.html")

def prediction(req):
    name = req.session.get("user_name")
    user_id = req.session.get("user_id")
    data_id=0
    import time
    time.sleep(5)
    if req.method=="POST":
        if name:
            user_id= user_id
            computer_name= int(req.POST.get("computer_name"))
            computer_size= int(req.POST.get("computer_size"))
            computer_color= int(req.POST.get("computer_color"))
            order_channel= int(req.POST.get("order_channel"))
            customer_will= int(req.POST.get("customer_will"))
            computer_configuration= int(req.POST.get("computer_configuration"))
            order_factor= int(req.POST.get("order_factor"))
            customer_salary= int(req.POST.get("customer_salary"))
            customer_cost= int(req.POST.get("customer_cost"))
            urgent_need= int(req.POST.get("urgent_need"))
            post_data={
                "user_id" : user_id,
                "computer_name" : computer_name,
                "computer_size" : computer_size ,
                "computer_color" : computer_color ,
                "order_channel" :  order_channel,
                "customer_will" : customer_will,
                "computer_configuration" : computer_configuration ,
                "order_factor" :  order_factor,
                "customer_salary" :  customer_salary,
                "customer_cost" :  customer_cost,
                "urgent_need" :urgent_need ,
                "total_score":computer_name+computer_size+computer_color+order_channel,
                "post_time":datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            }
            data = models.PostData.objects.create(**post_data)


            data_id = data.id
            req.session['data_id'] = data_id            
            # os.chdir("D:\sparkstreaming\postgraduate_prediction\prediction")

            import os
            import numpy

            while True:
                user_data = models.PostData.objects.filter(id=data.id,user_id=user_id)
                mesg = [computer_name, computer_size, computer_color, order_channel, customer_will, computer_configuration,order_factor, customer_salary, customer_cost, urgent_need]
             
                mesg = [computer_name, computer_size, computer_color, order_channel, customer_will, computer_configuration,
                    order_factor, customer_salary, customer_cost, urgent_need]
                mesg = np.array(mesg).reshape(1, -1)
                from sklearn.externals import joblib
             
                log = joblib.load("logistic_regression1.m")
                result = log.predict(mesg)[0]
                models.PostData.objects.filter(id=data.id, user_id=user_id).update(result=result)
                break

                class_type="danger"
                title="  ╮(╯Д╰)╭  很遗憾~"
                mes = "他不会买~"

            if result>=0.8:
                class_type="success"
                title="↖(▔＾▔)↗ 恭喜！"
                mes="他可能会买！"
                info = {
                    "h3": "数据提交结果",
                    "title": title,
                    "mes": "你预测的结果为：%s"%(mes),
                    "class": "alert alert-%s alert-dismissable"%(class_type),
                    "user_name": req.session.get("user_name"),
                    "user_id": req.session.get("user_id"),
                    "user_head_img": req.session.get("user_head_img"),
                    "user_data": user_data,
                    }
                # ------------------------------------------------------------
                return render(req, "prediction/result.html", info)
            elif result<0.8:
                class_type="defeat"
                title="↖(▔＾▔)↗ 很遗憾！"
                mes="他不会买！"
                info = {
                    "h3": "数据提交结果",
                    "title": title,
                    "mes": "你预测的结果为：%s"%(mes),
                    "class": "alert alert-%s alert-dismissable"%(class_type),
                    "user_name": req.session.get("user_name"),
                    "user_id": req.session.get("user_id"),
                    "user_head_img": req.session.get("user_head_img"),
                    "user_data": user_data,
                }
                # ------------------------------------------------------------
                return render(req, "prediction/result.html", info)
            else:
                info = {
                    "h3": "数据提交结果",
                    "title":"错误！",
                    "mes": "数据提交失败！",
                    "class": "alert alert-denger alert-dismissable",
                    }
                return render(req, "prediction/result.html", info)
        else:
            info = {
                "mes": "请登录后再尝试操作！",
                "class": "alert alert-danger alert-dismissable"
            }
            return render(req, "prediction/login.html", info)
    elif req.method=="GET":
        if name:
            return redirect("/prediction/user")
        else:
            info = {
                "mes": "请登录后再尝试操作！",
                "class": "alert alert-danger alert-dismissable"
            }
            return render(req, "prediction/login.html", info)

from django.utils.safestring import mark_safe
def user(req):
    name = req.session.get("user_name")
    user_id = req.session.get("user_id")
    if req.method == "GET":
        if name:
            user_data = models.PostData.objects.order_by("-post_time").filter(user_id=user_id)
            from django.utils.safestring import mark_safe
            h3= mark_safe("用户-<span style='color:green;'>"+name+"</span>"+"-的个人主页")
            info = {
                "h3":h3,
                "title": "提交过的数据",
                "mes": "以下为你的历史数据",
                "class": "alert alert-success alert-dismissable",
                "user_name": req.session.get("user_name"),
                "user_id": req.session.get("user_id"),
                "user_head_img": req.session.get("user_head_img"),
                "user_data": user_data,
                "data_len":len(user_data),
                "update":"修改个人数据"
            }
            return render(req, "prediction/result1.html", info)
        else:
            info = {
                "mes": "请登录后再尝试操作！",
                "class": "alert alert-danger alert-dismissable"
            }
            return render(req, "prediction/login.html", info)
    else:
        return redirect("/prediction/index")

def update(req):
    user_id = req.session.get("user_id")
    user_head_img=req.session.get("user_head_img"),
    #user_id = req.POST.get("user_id")
    user_data = models.User.objects.get(id=user_id)
    info={
        "user_name": user_data.name,
        "update": "修改个人数据",
    }
    return render(req, "prediction/user_update.html", info)
def update_l(req):
    user_id = req.session.get("user_id")
    user_name = req.POST.get("user_name")
    password = req.POST.get("password")
    md5 = hashlib.md5()  # 2,获取md5() 方法
    md5.update(password.encode())  # 3. 对字符串的字节类型加密
    password = md5.hexdigest()
    user_data = models.User.objects.filter(id=user_id).update(name=user_name,password=password)
    user = models.User.objects.get(id=user_id)
    info = {
        "user_name": user.name,
        "user_id": user.id,
        "user_head_img": user.head_img
    }
    req.session['user_id'] = user.id
    req.session['password'] = user.password
    req.session['user_head_img'] = user.head_img
    req.session.set_expiry(60 * 10)
    user_data = models.PostData.objects.order_by("-post_time").filter(user_id=user_id)

    h3 = mark_safe("用户-<span style='color:green;'>" + user.name + "</span>" + "-的个人主页")
    info={
                "h3":h3,
                "title": "提交过的数据",
                "mes": "以下为你的历史数据",
                "class": "alert alert-success alert-dismissable",
                "user_id": req.session.get("user_id"),
                "user_head_img": req.session.get("user_head_img"),
                "user_data": user_data,
                "data_len":len(user_data),
                "update":"修改个人数据"
    }
    return render(req, "prediction/login.html", info)
def logout(req):
    req.session.flush()
    return redirect("/prediction/index")


