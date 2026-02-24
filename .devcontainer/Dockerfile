FROM ghcr.io/openvadl/ppc64-toolchain:latest AS ppc64

FROM ubuntu:26.04

COPY --from=ppc64 /opt/ppc64 /opt/ppc64
ENV PATH=/opt/ppc64/bin:$PATH

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update &&  \
    apt install -y \
    curl \
    git \
    python3 \
    python3-venv  \
    python3-pip \
    build-essential  \
    libglib2.0-dev  \
    libfdt-dev  \
    libpixman-1-dev  \
    zlib1g-dev  \
    ninja-build \
    ccache

ENV PATH=/workspaces/ppc64-iss-dev/tools:$PATH

WORKDIR /root
RUN curl https://download.oracle.com/graalvm/25/latest/graalvm-jdk-25_linux-aarch64_bin.tar.gz --output graal-25.tar.gz && \
    mkdir -p ~/.local/graal-jdk-25 && \
    tar -xzf graal-25.tar.gz -C ~/.local/graal-jdk-25 --strip-components=1 && \
    rm graal-25.tar.gz

ENV JAVA_HOME=/root/.local/graal-jdk-25
ENV PATH=/root/.local/graal-jdk-25/bin:$PATH