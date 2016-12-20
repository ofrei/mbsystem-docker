FROM ubuntu
MAINTAINER Oleksandr Frei <oleksandr.frei@gmail.com>

RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install -y wget
RUN apt-get install -y xorg-dev 
RUN apt-get install -y libxm4:i386 libuil4:i386 libmrm4:i386 libxm4 libuil4 libmrm4 
RUN apt-get install -y libmotif-common libmotif-dev libgl1-mesa-dev libglu1-mesa-dev 
RUN apt-get install -y mesa-common-dev libfftw3-3 gfortran libfftw3-dev 
RUN apt-get install -y libnetcdf-dev netcdf-bin libproj9 libproj-dev gdal-bin libgdal-dev 

# RUN apt-get install -y gmt gmt-dcw gmt-gshhg                          # this doesn't work for mbsystem; it fails with to find gmt.h
# Follow http://gmt.soest.hawaii.edu/projects/gmt/wiki/BuildingGMT
RUN apt-get install -y subversion cmake
RUN mkdir /gmt && cd /gmt && wget ftp://ftp.soest.hawaii.edu/gshhg/gshhg-gmt-2.3.6.tar.gz && tar xvzf gshhg-gmt-2.3.6.tar.gz && rm gshhg-gmt-2.3.6.tar.gz
RUN               cd /gmt && wget ftp://ftp.soest.hawaii.edu/dcw/dcw-gmt-1.1.2.tar.gz && tar xvzf dcw-gmt-1.1.2.tar.gz && rm dcw-gmt-1.1.2.tar.gz
RUN cd /gmt && svn checkout svn://gmtserver.soest.hawaii.edu/gmt5/trunk gmt5-dev && cd /gmt/gmt5-dev && export CMAKE_INSTALL_PREFIX=/opt/gmt && export GSHHG_ROOT=/gmt/gshhg-gmt-2.3.6 && export DCW_ROOT=/gmt/dcw-gmt-1.1.2 && mkdir build && cd build && cmake .. && make && make install

# RUN wget ftp://ftp.ldeo.columbia.edu/pub/MB-System/MB-System.tar.gz && tar xvzf MB-System.tar.gz && rm MB-System.tar.gz
RUN apt-get install -y git
RUN git clone https://github.com/ofrei/mbsystem.git && cd /mbsystem && chmod 777 ./configure && ./configure && make && make install






# docker-machine -s G:\docker create --driver hyperv --hyperv-disk-size 100000 --hyperv-memory 4096 --hyperv-virtual-switch "New Virtual Switch" vm5
# docker-machine -s G:\docker env vm5
# @FOR /f "tokens=*" %i IN ('docker-machine -s G:\docker env vm5') DO @%i
#RUN wget https://s3-eu-west-1.amazonaws.com/artmdev/parallel_studio_xe_2016.tgz


