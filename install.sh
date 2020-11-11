#!/bin/bash
echo "you should die now :3 it'll be take some time"

#@Tomnomnom
go get -u -v github.com/tomnomnom/anew
go get -u -v github.com/tomnomnom/httprobe
go get -u -v github.com/tomnomnom/assetfinder
go get -u -v github.com/tomnomnom/waybackurls
go get -u -v github.com/tomnomnom/fff
go get -u -v github.com/tomnomnom/qsreplace
go get -u -v github.com/tomnomnom/unfurl

#@ProjectDiscovery
go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
go get -u -v github.com/projectdiscovery/naabu/v2/cmd/naabu
go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
go get -u -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
#owasp
go get -v github.com/OWASP/Amass/v3/...

#URL and Parameter Discovery:
go get -u -v github.com/hakluke/hakrawler
go get -u -v github.com/jaeles-project/gospider
#paramspider
git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
pip3 install -r requirements.txt
cd ..
go get -u -v github.com/lc/gau
#fuzzing Endpoint
go get -u -v github.com/OJ/gobuster
go get -u -v github.com/ffuf/ffuf
#dirseaech
git clone https://github.com/maurosoria/dirsearch.git
cd dirsearch
chmod +x dirsearch.py
cd ..
#subDomain Takeover
go get -u -v github.com/lukasikic/subzy

#automated scanner
go get -u -v github.com/noobexploiter/xssXD
go get -u -v github.com/noobexploiter/headerssrfXD
go get -u -v github.com/noobexploiter/gofinder
go get -u -v github.com/noobexploiter/ssrfXD
go get -u -v github.com/noobexploiter/openredirectXD
go get -u -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz
