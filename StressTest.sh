{\rtf1\ansi\ansicpg936\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset134 PingFangSC-Regular;}
{\colortbl;\red255\green255\blue255;\red19\green19\blue19;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c9412\c9412\c9412;\cssrgb\c100000\c100000\c100000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww20280\viewh14820\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
# 
\f1 \'bd\'f8\'c8\'eb\'ba\'cf\'ca\'ca\'b5\'c4\'c4\'bf\'c2\'bc\'a3\'ac\'b1\'c8\'c8\'e7
\f0  /usr/local/bin\
cd /usr/local/bin\
\
# 
\f1 \'cf\'c2\'d4\'d8
\f0  node_exporter 
\f1 \'b5\'c4\'d7\'ee\'d0\'c2\'b0\'e6\'b1\'be\'a3\'a8\'bc\'d9\'c9\'e8\'ce\'aa
\f0  1.6.1
\f1 \'a3\'ac\'ca\'b5\'bc\'ca\'c7\'e9\'bf\'f6\'c7\'eb\'bc\'ec\'b2\'e9\'d7\'ee\'d0\'c2\'b0\'e6\'b1\'be\'a3\'a9
\f0 \
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz\
\
# 
\f1 \'bd\'e2\'d1\'b9\'cf\'c2\'d4\'d8\'b5\'c4\'ce\'c4\'bc\'fe
\f0 \
tar -xzvf node_exporter-1.6.1.linux-amd64.tar.gz\
\
# 
\f1 \'bd\'f8\'c8\'eb\'bd\'e2\'d1\'b9\'ba\'f3\'b5\'c4\'c4\'bf\'c2\'bc
\f0 \
cd node_exporter-1.6.1.linux-amd64\
\
# 
\f1 \'bd\'ab
\f0  node_exporter 
\f1 \'d2\'c6\'b6\'af\'b5\'bd
\f0  /usr/local/bin\
mv node_exporter /usr/local/bin/\
\
#
\f1 \'d4\'cb\'d0\'d0
\f0 \
/usr/local/bin/node_exporter &\
\
\pard\pardeftab720\partightenfactor0

\f1\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
firewall-cmd --zone=public --add-port=9100/tcp --permanent\
\
systemctl restart firewalld.service\
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf0 \cb1 \kerning1\expnd0\expndtw0 \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 \
# 
\f1 \'bc\'ec\'b2\'e9\'b2\'a2\'b0\'b2\'d7\'b0
\f0  stress 
\f1 \'b9\'a4\'be\'df
\f0 \
if ! command -v stress &> /dev/null; then\
    echo "
\f1 \'b0\'b2\'d7\'b0
\f0  stress 
\f1 \'b9\'a4\'be\'df
\f0 "\
    sudo yum install -y stress\
fi\
\
# 
\f1 \'bd\'f8\'d0\'d0\'d1\'b9\'c1\'a6\'b2\'e2\'ca\'d4
\f0 \
echo "
\f1 \'bf\'aa\'ca\'bc\'d1\'b9\'c1\'a6\'b2\'e2\'ca\'d4
\f0 "\
stress --vm 10 --vm-bytes 37G --vm-keep --hdd 4 --hdd-bytes 800G}