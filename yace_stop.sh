#!/bin/bash

# 停止 stress 工具的 CPU 压测
pkill -f "stress -c 128"

# 停止 memtester 工具的内存压测
pkill -f "memtester 460G 3000"

# 停止 fio 工具的磁盘压测
pkill -f "fio -filename=/home/aaa"

echo "已停止所有压测"
