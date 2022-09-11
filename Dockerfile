ARG CUDA_VERSION
FROM nvidia/cuda:${CUDA_VERSION}-cudnn8-devel-ubuntu20.04

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

ENV PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update
RUN apt-get install -y unzip sudo git

RUN apt-get update
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 

RUN apt-get update

RUN git clone https://github.com/princeton-vl/DPVO.git --recursive
COPY install_dpvo.sh /DPVO/install_dpvo.sh
WORKDIR /DPVO

RUN wget https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip
RUN unzip eigen-3.4.0.zip -d thirdparty

RUN conda init bash && . ~/.bashrc
RUN conda env create -f environment.yml

# This command runs your application, comment out this line to compile only
CMD ["bash"]
