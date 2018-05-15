FROM continuumio/miniconda:latest

# 1. update apt and install build tools
# 2. download and install vmatch and hmmer3
# 3. download and install [genome tools](http://genometools.org)
# 4. clone ltrsift
RUN apt-get -y update && \
    apt install -y build-essential && \
    rm -rf /var/lib/apt/lists/* && \
    wget http://www.vmatch.de/distributions/vmatch-2.3.0-Linux_x86_64-64bit.tar.gz && \
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
    rm -rf /hmmer* && \
    wget http://genometools.org/pub/genometools-1.5.10.tar.gz && \
    tar -xzvf genometools-1.5.10.tar.gz && \
    cd genometools-1.5.10 && \
    make 64bit=yes 32bit=no cairo=no opt=yes with-hmmer=yes && \
    make 64bit=yes 32bit=no cairo=no opt=yes with-hmmer=yes install && \
    cd .. && \
    rm -rf /genometools* && \
    git clone https://github.com/satta/ltrsift.git

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]


