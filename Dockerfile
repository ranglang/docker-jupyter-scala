FROM jupyter/r-notebook

LABEL maintainer="Filip Krikava <krikava@gmail.com>"

USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get install -qy openjdk-8-jdk-headless

USER $NB_UID

RUN cd / && curl https://raw.githubusercontent.com/alexarchambault/jupyter-scala/master/jupyter-scala | bash -x
RUN jupyter kernelspec list
