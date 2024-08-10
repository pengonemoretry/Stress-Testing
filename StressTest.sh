#!/bin/bash
# 进入合适的目录，比如 /usr/local/bin
cd /usr/local/bin

# 下载 node_exporter 的最新版本（假设为 1.6.1，实际情况请检查最新版本）
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz

# 解压下载的文件
tar -xzvf node_exporter-1.6.1.linux-amd64.tar.gz

# 进入解压后的目录
cd node_exporter-1.6.1.linux-amd64

# 将 node_exporter 移动到 /usr/local/bin
mv node_exporter /usr/local/bin/

#运行
/usr/local/bin/node_exporter &

firewall-cmd --zone=public --add-port=9100/tcp --permanent

systemctl restart firewalld.service


# 检查并安装 stress 工具
if ! command -v stress &> /dev/null; then
    echo "安装 stress 工具"
    sudo yum install -y stress
fi

# 进行压力测试
echo "开始压力测试"
stress --vm 10 --vm-bytes 37G --vm-keep --hdd 4 --hdd-bytes 800G
