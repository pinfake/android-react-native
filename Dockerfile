FROM openjdk:8-jdk
MAINTAINER Pin <pinfake@hotmail.com>
VOLUME /opt/android-sdk-linux
VOLUME /root/devel
ENV ANDROID_HOME="/opt/android-sdk-linux"
ENV ANDROID_SDK_HOME="${ANDROID_HOME}"
ENV PATH="${PATH}:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOME}/platform-tools"
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update && \
    apt-get install -y nodejs
RUN npm install -g react-native-cli
ENTRYPOINT ["/bin/bash"]
