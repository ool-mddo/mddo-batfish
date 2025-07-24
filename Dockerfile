ARG TAG=2023.12.16.1270
FROM batfish/batfish:$TAG

#ARG ASSETS
#ARG PYBATFISH_VERSION

#COPY ${ASSETS} ./
#RUN chmod a+x wrapper.sh
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" keyboard-configuration \
    python3 \
    python3-venv \
    python3-pip \
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
    pynetbox==7.5.0
    #pynetbox==7.4.1
RUN pip3 install pandas setuptools
