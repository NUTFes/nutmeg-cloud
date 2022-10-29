FROM ubuntu:20.04

WORKDIR /k3d
COPY . /k3d

RUN apt update && apt install -y wget curl git make gcc g++ python3 python3-pip
RUN wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
RUN k3d cluster create mycluster