FROM continuumio/miniconda3:latest

RUN apt-get -qqy update && \
    apt install -qqy build-essential && \
    rm -rf /var/lib/apt/lists/* && \
    conda install -y -n base conda && \
    conda config --add channels defaults && \
    conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda install -y augustus blast && \
    wget http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2.tar.gz && \
    tar -xzvf hmmer-3.1b2.tar.gz && \
    cd hmmer-3.1b2 && \
    ./configure && \
    make && \
    make check && \
    make install && \
    cd .. && \
    rm -rf /hmmer* && \
    git clone https://gitlab.com/ezlab/busco.git && \
    cd busco && \
    python setup.py install

COPY config.ini.default /config.ini

ENV BUSCO_CONFIG_FILE=/config.ini
ENV AUGUSTUS_CONFIG_PATH=/opt/conda/config/

ADD resources/embryophyta_odb9.tar.gz /
ADD resources/eukaryota_odb9.tar.gz /

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]





