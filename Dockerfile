FROM ubuntu:latest
RUN \
  apt-get update && \
  apt-get -y install libcurl4-gnutls-dev && \
  apt-get -y install tor && \
  apt-get -y install proxychains && \
  apt-get -y install wget && \
  apt-get -y install git && \
  apt-get -y install nmap
  #apt-get -y upgrade && \

RUN pwd

RUN cd /usr/bin && git clone https://github.com/4383/dirb
RUN ls /usr/bin | grep dirb
RUN apt-get -y install gcc && apt-get -y install make

RUN cd /usr/bin/dirb && ./configure && make && chmod 777 -R .
RUN mkdir -p /usr/share/dirb/wordlists && cp -R /usr/bin/dirb/wordlists/* /usr/share/dirb/wordlists
RUN apt-get -y install polipo

ENV TARGET=127.0.0.1
#ENV DIRB=`. /usr/bin/dirb/dirb -p 127.0.0.1:8118`

CMD \
    service tor start && \
    service polipo start && \
    proxychains /usr/bin/dirb/dirb http://$TARGET /usr/bin/dirb/wordlists/common.txt #-p http://127.0.0.1:8118
    #ls -la /usr/bin/dirb/dirb
    #$DIRB $TARGET > dirb.log
    #proxychains nmap -T4 -O -sV $TARGET && \
    #proxychains wget http://whatsmyip.net/ && cat index.html | grep "h1" && \
