FROM ubuntu:16.04
FROM openjdk:8u212-jdk
#FROM ubuntu:16.04
#FROM openjdk:11-jdk
#FROM jenkins/ssh-slave:latest
#FROM menny/android_ndk:latest
#FROM menny/android:1.9.0
#LABEL MAINTAINER="Nicolas De Loof <nicolas.deloof@gmail.com>"

#RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu-old-releases/ubuntu/ zesty-updates main universe" >> /etc/apt/sources.list \
 #   && echo "deb http://mirrors.aliyun.com/ubuntu/ artful main restricted" >> /etc/apt/sources.list \
  #  && echo "deb http://mirrors.aliyun.com/ubuntu/ artful-updates main restricted" >> /etc/apt/sources.list \
   # && echo "deb http://mirrors.aliyun.com/ubuntu/ artful universe" >> /etc/apt/sources.list \
    #&& echo "deb http://mirrors.aliyun.com/ubuntu/ artful-updates universe" >> /etc/apt/sources.list \
   # && echo "deb http://mirrors.aliyun.com/ubuntu/ artful multiverse" >> /etc/apt/sources.list \
   # && echo "deb http://mirrors.aliyun.com/ubuntu/ artful-updates multiverse" >> /etc/apt/sources.list
#RUN mkdir /home/jenkins/workspace \
 #   && mkdir /home/jenkins/workspace/Testagent/
#RUN mkdir -p /home/jenkins/workspace
RUN mkdir -p /home/jenkins/workspace/Testagent
#ENV WORKSPACE /home/jenkins/workspace/Testagent
#VOLUME "/home/jenkins/workspace/Testagent" "/home/jenkins/android-ndk-r10e"
#RUN chattr -i /home/jenkins

WORKDIR /home/jenkins/
#RUN wget --output-document=android-ndk.zip --quiet https://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip &&\
    # unzip android-ndk.zip -d /home/jenkins/

#ENV ANDROID_NDK /home/jenkins/android-ndk-linux
#RUN echo "export ANDROID_NDK=/home/jenkins/android-ndk-linux" >> /etc/profile
#ENV PATH /home/jenkins/android-ndk-r10e
RUN echo "export ANDROID_NDK=/home/jenkins/android-ndk-r10e" >> ~/.bashrc && \
    echo "export PATH=$ADNROID_NDK" >> ~/.bashrc && \
    echo "export ANDROID_SDK=/home/jenkins/android-sdk-linux" >> ~/.bashrc && \
    echo "export PATH=$PATH:$ANDROID_SDK/platforms:$ANDROID_SDK/tools" >> ~/.bashrc && \
    echo "export GRADLE_HOME=/home/jenkins/gradle-2.6" >> ~/.bashrc && \
    echo "export PATH=$PATH:$GRADLE_HOME/bin" >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"
RUN echo "192.168.0.204 svn-server" >> /etc/hosts
RUN env
RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list;
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y software-properties-common devscripts equivs dpkg-dev
#RUN add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
RUN apt-get install -y subversion

#RUN wget --output-document=android-sdk.zip --quiet https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && \
#       mkdir /opt/android-sdk-linux && \
#       unzip android-sdk.zip -d /opt/android-sdk-linux && \
#       rm -f android-sdk.zip

#RUN mkdir ~/.android && touch ~/.android/repositories.cfg
#accepting licenses
#RUN yes | sdkmanager --license
WORKDIR /home/jenkins/workspace

