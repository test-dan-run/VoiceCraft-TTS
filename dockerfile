# docker build -t voicecraft:1.0.0-dev .
ARG BASE_REGISTRY=docker.io
ARG BASE_IMAGE=pytorch/pytorch
ARG BASE_TAG=2.0.1-cuda11.7-cudnn8-runtime
ARG APP_BASE_IMAGE=build

FROM $BASE_REGISTRY/$BASE_IMAGE:$BASE_TAG

# This prevents Python from writing out pyc files and from buffering stdin/stdout
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONFAULTHANDLER 1

ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get -y update && \
    apt-get install --no-install-recommends -y gcc libsndfile1 ffmpeg sox espeak-ng git && \
    apt-get clean && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* && apt-get -y autoremove && \
    rm -rf /var/cache/apt/archives/

# # Installing conda packages
# RUN conda update -y -n base -c defaults conda && \
#     conda install -y -c conda-forge montreal-forced-aligner=2.2.17 openfst=1.8.2 kaldi=5.5.1068 && \
#     conda clean -y --all

# Installing python packages
COPY requirements.txt .
RUN python3 -m pip install --upgrade --no-cache-dir pip
RUN python3 -m pip install --no-cache-dir -r requirements.txt

WORKDIR /audiocraft
RUN python3 -m pip install --no-deps --no-cache-dir -e git+https://github.com/facebookresearch/audiocraft.git@c5157b5bf14bf83449c17ea1eeb66c19fb4bc7f0#egg=audiocraft

ENV USER root
WORKDIR /workspace
