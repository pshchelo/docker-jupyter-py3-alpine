# Alpine-based single user minimal, ephemeral and unsecure
# Jupyter Notebook server, Python3
FROM alpine:latest
MAINTAINER Pavlo Shchelokovskyy (shchelokovskyy@gmail.com)

# Build scientific version via
# docker build --build-arg REQ_FILE=sci-requirements.txt .
ARG REQ_FILE='requirements.txt'
COPY ${REQ_FILE} /tmp/${REQ_FILE}
# - install Python3 and runtime dependencies,
# - install build dependencies
# - hack for compilation to succeed on Alpine
# - install Python packages
# - enable IPython Widgets for Notebooks
# - cleanup build dependencies
# - make directory for user notebooks
RUN apk update \
&& apk add \
    ca-certificates \
    libstdc++ \
    python3 \
&& apk add --virtual=build_dependencies \
    cmake \
    gcc \
    g++ \
    make \
    musl-dev \
    python3-dev \
&& ln -s /usr/include/locale.h /usr/include/xlocale.h \
&& python3 -m pip --no-cache-dir install -r /tmp/${REQ_FILE} \
&& jupyter nbextension enable --py widgetsnbextension \
&& apk del --purge -r build_dependencies \
&& rm -rf /var/cache/apk/* \
&& mkdir /notebooks

COPY jupyter_notebook_config.json /root/.jupyter/
VOLUME /notebooks
ENTRYPOINT /usr/bin/jupyter-notebook
EXPOSE 8888
