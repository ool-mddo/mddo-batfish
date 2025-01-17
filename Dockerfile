ARG TAG=2023.12.16.1270
FROM batfish/batfish:$TAG

#ARG ASSETS
#ARG PYBATFISH_VERSION

#COPY ${ASSETS} ./
#RUN chmod a+x wrapper.sh

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-pip \
    python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

# 仮想環境の作成
RUN python3 -m venv .venv

# 仮想環境をアクティベートするための設定
ENV PATH=".venv/bin:$PATH"

# pynetboxのインストール
RUN pip install --upgrade pip


# Pybatfish + Pynetbox 
EXPOSE 8888
RUN pip3 install pybatfish==2023.12.16.1270 \
    pynetbox
