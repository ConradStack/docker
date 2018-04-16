FROM debian:stretch

ARG git_commit=cb8e254feee3d1fb2ff37e9426ab86fa47cf9b40

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends\
      apt-transport-https \
      build-essential \
      curl \
      ca-certificates \
      git \
      lsb-release \
      rlwrap \
      autoconf \
      automake \
      zlib1g-dev \
      pkg-config && \
    rm -rf /var/lib/apt/lists/* && \
	git clone https://github.com/vcftools/vcftools.git && \
	cd vcftools && \
	git checkout $git_commit && \
	./autogen.sh && \
	./configure && \
	make && \
	make install && \
    cd ../ && \
    rm -rf vcftools && \
    apt-get -qqy autoremove --purge autoconf automake git ca-certificates curl build-essential && \
    apt-get -qqy clean

ENTRYPOINT ["vcftools"]
CMD ["-h"]



