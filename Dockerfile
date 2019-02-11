FROM jupyter/r-notebook

LABEL maintainer="Filip Krikava <krikava@gmail.com>"

USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get install -qy openjdk-8-jdk-headless

RUN curl -L -o /coursier https://git.io/coursier && \
    chmod +x /coursier

ENV SCALA_VERSION=2.12.8 ALMOND_VERSION=0.2.2

RUN /coursier bootstrap \
    -r jitpack \
    -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
    sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
    -o almond

RUN ./almond --install

RUN jupyter kernelspec list
