# self-hosted Github Actions image for Python
# build: docker build -t kengz/github-actions:0.0.1 -t kengz/github-actions:latest .
# run: docker run --rm -it kengz/github-actions:latest

FROM ubuntu:18.04

RUN apt-get update
RUN apt install -y gcc git python3-dev curl

WORKDIR /actions-runner

RUN curl -s -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    echo '. ~/miniconda3/etc/profile.d/conda.sh' >> ~/.bashrc

RUN curl -s -O -L https://github.com/actions/runner/releases/download/v2.263.0/actions-runner-linux-x64-2.263.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.263.0.tar.gz && \
    ./bin/installdependencies.sh

USER 1001
