FROM ubuntu:16.04

MAINTAINER <christoph.hahn@uni-graz.at>

RUN apt-get update && apt-get -y upgrade && \
        apt-get install -y build-essential vim git wget zip 

WORKDIR /usr/src
RUN wget http://software.zfmk.de/ALISCORE_v2.0.zip && \
	unzip ALISCORE_v2.0.zip && \
	cd ALISCORE_v2.0 && \
	unzip Aliscore_v.2.0.zip && \
	cd Aliscore_v.2.0 && \
	chmod a+x Aliscore.02.2.pl && \
	ln -s $(pwd)/Aliscore.02.2.pl /usr/bin/Aliscore.pl && \
	cd ../../

ENV PERL5LIB=/usr/src/ALISCORE_v2.0/Aliscore_v.2.0

RUN git clone --recursive https://github.com/PatrickKueck/AliCUT.git && \
	cd AliCUT && git reset --soft d3a2b81743a4e7068f69df4c24953fa6a21b3ca4 && \
	chmod a+x ALICUT_V2.31.pl && \
	ln -s $(pwd)/ALICUT_V2.31.pl /usr/bin/ALICUT.pl
#	chmod a+x clustalo-1.2.4-Ubuntu-x86_64 && \
#	ln -s $(pwd)/clustalo-1.2.4-Ubuntu-x86_64 /usr/bin/clustalo

#create working directory and move to entrypoint
VOLUME /home/data
WORKDIR /home/data

