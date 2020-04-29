# -*- coding: utf-8 -*-

import configparser
cf = configparser.ConfigParser()

# 根据配置动态生成odoo的config文件
part1 = '''[supervisord]
nodaemon=true

# xmlrpc
[unix_http_server]
file=/tmp/supervisor.sock
username=funenc_odoo
password=funenc_odoo_socker

# web
[inet_http_server]                      ; inet (TCP) server disabled by default
port=*:9001                             ; (ip_address:port specifier, *:port for ;all iface)
username=funenc_odoo                    ; (default is no username (open server))
password=funenc_odoo_socker             ; (default is no password (open server))

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface



# project
[program:project]
username = root
command=python3  /mnt/postgraduate_prediction/manage.py runserver 8000 '''

part2 = '''
redirect_stderr=True
stdout_logfile=/var/log/supervisor/odoo.log'''



conf = '/etc/supervisor/conf.d/supervisord.conf'




with open(conf, 'w') as f:
    f.write(part1 + ' '  + ' ' + part2)
