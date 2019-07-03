#FROM ubuntu:18.04
FROM openjdk:11-jdk
FROM jenkins/ssh-slave:latest
#FROM menny/android:1.9.0
#LABEL MAINTAINER="Nicolas De Loof <nicolas.deloof@gmail.com>"

#RUN echo "deb http://mirrors.ustc.edu.cn/ubuntu-old-releases/ubuntu/ zesty-updates main universe" >> /etc/apt/sources.list \
#    && echo "deb http://mirrors.aliyun.com/ubuntu/ artful main restricted" >> /etc/apt/sources.list \
#    && echo "deb http://mirrors.aliyun.com/ubuntu/ artful-updates main restricted" >> /etc/apt/sources.list \
#    && echo "deb http://mirrors.aliyun.com/ubuntu/ artful universe" >> /etc/apt/sources.list \
#    && echo "deb http://mirrors.aliyun.com/ubuntu/ artful-updates universe" >> /etc/apt/sources.list \
#    && echo "deb http://mirrors.aliyun.com/ubuntu/ artful multiverse" >> /etc/apt/sources.list \
#    && echo "deb http://mirrors.aliyun.com/ubuntu/ artful-updates multiverse" >> /etc/apt/sources.list


#ARG user=jenkins
#ARG group=jenkins
#ARG uid=1000
#ARG gid=1000
#ARG JENKINS_AGENT_HOME=/home/${user}

#ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}

#RUN groupadd -g ${gid} ${group} \
 #   && useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"


# setup SSH server
#RUN apt-get update \
 #   && apt-get install --no-install-recommends -y openssh-server \
#   && apt-get install -y openssh-server \
  # && rm -rf /var/lib/apt/lists/*
#RUN sed -i /etc/ssh/sshd_config \
 #       -e 's/#PermitRootLogin.*/PermitRootLogin no/' \
  #      -e 's/#RSAAuthentication.*/RSAAuthentication yes/'  \
   #     -e 's/#PasswordAuthentication.*/PasswordAuthentication no/' \
    #    -e 's/#SyslogFacility.*/SyslogFacility AUTH/' \
     #   -e 's/#LogLevel.*/LogLevel INFO/' && \
    #mkdir /var/run/sshd

WORKDIR /opt
RUN wget --output-document=android-ndk.zip --quiet https://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip && unzip android-ndk.zip && rm -f android-ndk.zip && mv android-ndk-r10e android-ndk-linux
ENV ANDROID_NDK /opt/android-ndk-linux
ENV ANDROID_NDK_HOME /opt/android-ndk-linux


VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run"
VOLUME "/opt/android-ndk-linux"
WORKDIR "${JENKINS_AGENT_HOME}"
#RUN wget --output-document=android-ndk.zip --quiet https://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip && unzip android-ndk.zip && rm -f android-ndk.zip && mv android-ndk-r10e android-ndk-linux




#COPY setup-sshd /usr/local/bin/setup-sshd

#EXPOSE 22

#ENTRYPOINT ["setup-sshd"]

