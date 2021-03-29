# self-hosted Github Actions image for Python
# build: docker build -t kengz/github-actions:0.0.3 -t kengz/github-actions:latest .
# push: docker push kengz/github-actions:0.0.3; docker push kengz/github-actions:latest
# run: docker run --rm -it kengz/github-actions:latest

FROM ubuntu:20.04

RUN apt-get update
RUN apt install -y gcc git python3-dev curl

# github actions needs a non-root to run
RUN useradd -m ga
WORKDIR /home/ga/actions-runner

# install Docker for some Github Actions to run
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y apt-transport-https ca-certificates software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt update && \
    apt-cache policy docker-ce && \
    apt install -y docker-ce
RUN usermod -aG docker ga 

# Install Github Actions runner
RUN curl -s -O -L https://github.com/actions/runner/releases/download/v2.277.1/actions-runner-linux-x64-2.277.1.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.277.1.tar.gz && \
    ./bin/installdependencies.sh

# set permission and user to ga
RUN chown -R ga /home/ga
USER ga

RUN curl -s -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    echo '. ~/miniconda3/etc/profile.d/conda.sh' >> ~/.bashrc
