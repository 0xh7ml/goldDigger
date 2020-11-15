#!/bin/bash

t=$1
echo "start digging on $t ..."
mkdir $t
cd $t

#check ports\
echo "checking ports"
naabu -host $t -p 80,81,300,443,591,593,832,981,1010,1311,1099,2082,2095,2096,2480,3000,3128,3333,4243,4567,4711,4712,4993,5000,5104,5108,5280,5281,5800,6543,7000,7396,7474,8000,8001,8008,8014,8042,8069,8080,8081,8083,8088,8090,8091,8118,8123,8172,8222,8243,8280,8281,8333,8337,8443,8500,8834,8880,8888,8983,9000,9043,9060,9080,9090,9091,9200,9443,9800,9981,10000,11371,12443,16080,18091,18092,20720,55672 -o ports.txt
#subDomain Enumaretion
echo "./Start SubDomain Enumeration...... "
subfinder -d $t -o finder.txt
amass enum -passive -norecursive -noalts -d $t -o amass.txt
assetfinder --subs-only $t | tee asset.txt
cat finder.txt amass.txt asset.txt > allsub.txt
sort -u allsub.txt
rm finder.txt amass.txt asset.txt
cat allsub.txt | httpx | tee hosts.txt
cat hosts.txt | httpx -status-code | grep 200 | tee 200.txt
cat hosts.txt | httpx -status-code | grep 301 | tee 301.txt
cat hosts.txt | httpx -status-code | grep 403 | tee 403.txt
cat hosts.txt | httpx -status-code | grep 404 | tee 404.txt
rm allsub.txt
mkdir domains
mv 200.txt 403.txt 301.txt domains
#try to takeOver subDomains
echo "start subzy for subDomains TakeOver......"
subzy -targets 404.txt
rm 404.txt
#urls and parameter discover
echo "digging for parameter"
waybackurls $t | tee urls.txt

crlfuzz -u "http://$t" -o crlf.txt

#content discovery
echo "fucking endpoint *,*"
gobuster dir -u $t -w $HOME/goldDigger/wordlist.txt -s 200,201,202,203,401,402,403 -b 500,404,301 -o fuzz.txt
