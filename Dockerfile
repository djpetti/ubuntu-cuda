FROM ubuntu:14.04
MAINTAINER Daniel Petti

RUN apt-get update && apt-get install -y build-essential kmod
RUN apt-get --purge remove -y nvidia*

ADD http://us.download.nvidia.com/XFree86/Linux-x86_64/361.42/NVIDIA-Linux-x86_64-361.42.run /tmp/nvidia/
RUN chmod +x /tmp/nvidia/NVIDIA-Linux-x86_64-361.42.run
# Install the driver.
RUN /tmp/nvidia/NVIDIA-Linux-x86_64-361.42.run -s -N --no-kernel-module
ADD http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run /tmp/nvidia/
RUN chmod +x /tmp/nvidia/cuda_7.5.18_linux.run
# Install CUDA toolkit.
RUN /tmp/nvidia/cuda_7.5.18_linux.run --silent --toolkit --samples --override

# Update system to find CUDA.
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
RUN touch /etc/ld.so.conf.d/cuda.conf

# Cleanup installer files.
RUN rm -rf /temp/*
