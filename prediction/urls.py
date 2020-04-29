#-*- coding : utf-8 -*-

"""django_online_exam_test URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from . import views
from django.contrib.staticfiles.urls import  staticfiles_urlpatterns
from django.conf.urls import url
urlpatterns = [
    path('index',views.index),
    path('register',views.register),
    path('do_register',views.do_register),
    path('login',views.login),
    path('do_login',views.do_login),
    path('logout', views.logout),
    path('prediction', views.prediction),
    path('verdict', views.verdict),
    path('s', views.s),
    path('user', views.user),
    url(r'^scn/$',views.scn,name='scn'),
    url(r'^xx/$',views.xx,name='xx'),
    url(r'^update/$',views.update,name='update'),
    #url(r'^s/$',views.s,name='s'),
    url(r'^update_l/$',views.update_l,name='update_l'),
]
urlpatterns+=staticfiles_urlpatterns()
