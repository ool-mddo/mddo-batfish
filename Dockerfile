ARG TAG=latest
FROM batfish/batfish:$TAG

#ARG ASSETS
#ARG PYBATFISH_VERSION

#COPY ${ASSETS} ./
#RUN chmod a+x wrapper.sh

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --upgrade pip

# Pybatfish + Pynetbox 
EXPOSE 8888
RUN pip3 install pybatfish \
    pynetbox 
