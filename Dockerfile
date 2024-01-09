FROM oraclelinux:8
RUN yum install -y gcc libnsl pkg-config && \
    curl -sOL https://go.dev/dl/go1.21.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz && \
    rm -f go1.21.5.linux-amd64.tar.gz
