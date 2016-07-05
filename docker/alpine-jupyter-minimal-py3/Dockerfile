# Alpine-based single user minimal, ephemeral and unsecure
# Jupyter Notebook server, Python3
FROM alpine:latest
MAINTAINER Pavlo Shchelokovskyy (shchelokovskyy@gmail.com)

# install package dependencies for building Python packages
RUN apk add --update --no-cache --virtual=build_dependencies \
    musl-dev \
    gcc \
    g++ \
    make \
    cmake \
    python3-dev
# hack for building to succeed on Alpine
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
# install Python dependencies
RUN python3 -m pip --no-cache-dir install \
    notebook
# FIXME: clean-up unneeded packages - currently removes Python as well!
#RUN apk del build_dependencies
# cleanup package cache
RUN rm -rf /var/cache/apk/*

RUN mkdir /notebooks
WORKDIR /notebooks
ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/jupyter-notebook --no-browser --ip=0.0.0.0 --notebook-dir=/notebooks"]
EXPOSE 8888
