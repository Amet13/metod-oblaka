FROM ubuntu:18.04
LABEL maintainer="Amet13 <admin@amet13.name>"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV DIR /metod-oblaka

RUN mkdir $DIR
RUN apt update && \
    apt install -y wget \
        git \
        make \
        apt-transport-https \
        unzip && \
    apt install -y texlive-base \
        texlive-latex-extra \
        texlive-xetex \
        texlive-lang-cyrillic \
        texlive-fonts-extra \
        texlive-science \
        texlive-latex-recommended \
        latexmk

RUN wget https://people.debian.org/~sgolovan/debian/pool/main/tex/tex-pscyr/tex-pscyr_0.4d~beta9-1_all.deb && \
    dpkg -i *.deb && \
    rm -f *.deb

VOLUME $DIR
WORKDIR $DIR
