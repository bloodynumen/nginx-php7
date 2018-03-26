#!/bin/sh
#########################################################################
# START
# File Name: start.sh
# Author: Skiychan
# Email:  dev@skiy.net
# Version:
# Created Time: 2015/12/13
#########################################################################

# Add PHP Extension
if [ -f "/data/phpextfile/extension.sh" ]; then
    #Add support
    yum install -y gcc \
        gcc-c++ \
        autoconf \
        automake \
        libtool \
        make \
        cmake && \

        mkdir -p /home/extension && \

    sh /data/phpextfile/extension.sh

    mv -rf /data/phpextfile/extension.sh /data/phpextfile/extension_back.sh

    #Clean OS
    yum remove -y gcc \
        gcc-c++ \
        autoconf \
        automake \
        libtool \
        make \
        cmake && \
        yum clean all && \
        rm -rf /tmp/* /var/cache/{yum,ldconfig} /etc/my.cnf{,.d} && \
        mkdir -p --mode=0755 /var/cache/{yum,ldconfig} && \
        find /var/log -type f -delete && \
        rm -rf /home/extension/*
fi

Nginx_Install_Dir=/usr/local/nginx
DATA_DIR=/data/www

/usr/bin/supervisord -n -c /etc/supervisord.conf
