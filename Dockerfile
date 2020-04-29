#用Supervisor管理的进程，
#当一个进程意外被杀死，supervisort监听到进程死后，会自动将它重新拉起，
#很方便的做到进程自动恢复的功能，不再需要自己写shell脚本来控制。
FROM ubuntu

# 设置编码
ENV LANG C.UTF-8

# 设置源
COPY source.list /etc/apt/sources.list


RUN apt-get update \
    && apt-get install  -y --no-install-recommends \
    supervisor \
    python3.5 \
    python3-pip \
    python-pip \
    python3-setuptools

COPY . /mnt/postgraduate_prediction

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8000 9999



COPY ./entrypoint.py /etc
RUN python3 ./etc/entrypoint.py


CMD ["/usr/bin/supervisord"]
