FROM centos:7

ARG KUDU_VERSION=1.12.0
ARG PARALLEL=4
ARG APACHE_MIRROR="http://mirror.netcologne.de/apache.org"

RUN yum -y install autoconf automake cyrus-sasl-devel cyrus-sasl-gssapi \
  cyrus-sasl-plain flex gcc gcc-c++ gdb git java-1.8.0-openjdk-devel \
  krb5-server krb5-workstation libtool make openssl-devel patch pkgconfig \
  redhat-lsb-core rsync unzip vim-common which

ENV KUDU=apache-kudu-${KUDU_VERSION}
ENV KUDU_URL="${APACHE_MIRROR}/kudu/${KUDU_VERSION}/${KUDU}.tar.gz"

# https://kudu.apache.org/docs/installation.html#build_from_source
RUN cd /tmp &&\
  curl $KUDU_URL | tar -xz &&\
  cd ${KUDU} &&\
  build-support/enable_devtoolset.sh thirdparty/build-if-necessary.sh &&\
  mkdir -p build/release &&\
  cd build/release &&\
  ../../build-support/enable_devtoolset.sh \
    ../../thirdparty/installed/common/bin/cmake \
    -DCMAKE_BUILD_TYPE=release \
    ../.. &&\
  make -j${PARALLEL} &&\
  mkdir -p /opt/kudu &&\
  make DESTDIR=/opt/kudu install &&\
  cp bin/kudu /opt/kudu/ &&\
  cp bin/kudu-tserver /opt/kudu/ &&\
  cp bin/kudu-master /opt/kudu/ &&\
  cp -r ../../www /opt/kudu/ &&\
  rm -rf /tmp/${KUDU}

WORKDIR /opt/kudu

COPY ./entrypoint /opt/kudu

ENTRYPOINT ["/opt/kudu/entrypoint"]

