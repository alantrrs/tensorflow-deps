FROM amazonlinux:2

# install dependencies
RUN yum -y update
RUN yum -y upgrade
RUN yum -y install wget\
  gcc gcc-c++ python-pip python-devel atlas \
  atlas-devel gcc-gfortran openssl-devel libffi-devel
RUN pip install virtualenv -U

# package
COPY buildPack.sh /home/buildPack.sh
