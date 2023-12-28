FROM oraclelinux:8
RUN yum-config-manager --enable ol8_codeready_builder && \
    yum install -y gcc libnsl pkg-config libnsl2-devel && \
    curl -sOL https://go.dev/dl/go1.21.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz && \
    rm -f go1.21.5.linux-amd64.tar.gz
