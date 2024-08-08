#!/bin/bash

# 检查并安装 stress 工具
if ! command -v stress &> /dev/null; then
    echo "安装 stress 工具"
    yum install -y epel-release
    yum install -y stress
fi

# 检查并安装 memtester 工具
if ! command -v memtester &> /dev/null; then
    echo "安装 memtester 工具"
    yum install -y gcc make
    wget --limit-rate=1M http://op.aliyun.tuyoo.com/sre/memtester-4.3.0.tar.gz -O /usr/local/memtester-4.3.0.tar.gz
    cd /usr/local/ && tar -xzvf /usr/local/memtester-4.3.0.tar.gz
    cd /usr/local/memtester-4.3.0
    make && make install
    ln -s /usr/local/memtester-4.3.0/memtester /sbin/memtester
fi

# 检查并安装 fio 工具
if ! command -v fio &> /dev/null; then
    echo "安装 fio 工具"
    yum install fio -y
fi

# 循环压测磁盘
    fio -filename=/home/aaa -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -bs=16k -size=5G -numjobs=100 -runtime=60 -group_reporting -name=mytest >> /root/fio_output.log
    rm -f /home/aaa

# 进行压测
echo "开始 CPU 压测"
nohup stress -c 128 &> cpu_stress.log &

echo "开始内存压测"
nohup memtester 460G 3000 &> memtest.log &

echo "开始磁盘压测"


echo "压测已在后台运行"
