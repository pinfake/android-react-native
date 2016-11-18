FROM openjdk:8-jdk
MAINTAINER Pin <pinfake@hotmail.com>
ENV ANDROID_HOME="/opt/android-sdk-linux"
ENV ANDROID_SDK_HOME="${ANDROID_HOME}"
ENV PATH="${PATH}:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOME}/platform-tools"
ENV TERM=xterm
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN dpkg --add-architecture i386 && \
    curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y nodejs libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 build-essential python-dev autoconf && \
    apt-get clean
RUN npm install -g react-native-cli
RUN cd /tmp && git clone https://github.com/facebook/watchman.git && cd watchman && \
    ./autogen.sh && ./configure && make && make install
RUN mkdir /root/.gradle && touch /root/.gradle/gradle.properties && echo "org.gradle.daemon=true" >> /root/.gradle/gradle.properties
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
