FROM ubuntu:latest

# update
RUN apt-get -y update && apt-get -y upgrade

# install basic packages
RUN apt-get install -y sudo wget bzip2
RUN apt-get install vim -y

###install anaconda3
WORKDIR /opt
# download anaconda package
# archive -> https://repo.continuum.io/archive/
RUN wget https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh

RUN /bin/bash /opt/Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3

RUN rm -f Anaconda3-2019.10-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH

# update pip and conda
RUN pip install --upgrade pip

# --- 追加箇所 -----------------
# install package
COPY requirements.txt /
# ----------------------------------

WORKDIR /
RUN mkdir /work
RUN pip install -r requirements.txt

# --- 一部変更箇所 -----------------
# jupyter labはデフォルトでport=8888を使用する。複数コンテナを立ち上げるときはportを指定した方がよい
# install jupyterlab
ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root", "--LabApp.token=''"]
