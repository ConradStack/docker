FROM continuumio/miniconda:latest

RUN apt-get -y update && \
    apt install -y build-essential

# install vmatch and hmmer3
RUN wget http://www.vmatch.de/distributions/vmatch-2.3.0-Linux_x86_64-64bit.tar.gz && \
    tar -xzvf vmatch-2.3.0-Linux_x86_64-64bit.tar.gz && \
    find ./vmatch* -type f -executable -exec cp {} /usr/local/bin \; && \
    rm -rf vmatch* && \
    wget http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2.tar.gz && \
    tar -xzvf hmmer-3.1b2.tar.gz && \
    cd hmmer-3.1b2 && \
    ./configure && \
    make && \
    make check && \
    make install && \
    cd .. && \
    rm -rf /hmmer*

# download and install [genome tools](http://genometools.org)
RUN wget http://genometools.org/pub/genometools-1.5.10.tar.gz && \
    tar -xzvf genometools-1.5.10.tar.gz && \
    cd genometools-1.5.10 && \
    make 64bit=yes 32bit=no cairo=no opt=yes with-hmmer=yes && \
    make 64bit=yes 32bit=no cairo=no opt=yes with-hmmer=yes install && \
    cd .. && \
    rm -rf /genometools*

RUN git clone https://github.com/satta/ltrsift.git

# ENV PATH /opt/conda/bin:$PATH

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]


