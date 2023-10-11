FROM ubuntu:18.04

ARG USERNAME=developer
ARG USER_UID=15266
ARG USER_GID=110

ENV PATH="${PATH}:/home/${USERNAME}/.local/bin"

# Set timezone
ENV TZ=Canada/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME

# Create workspace directory
RUN mkdir -p /home/$USERNAME/workspace/

# Set the working directory
WORKDIR /home/$USERNAME/workspace/

# Install Python 3.7 and non-Python dependencies
RUN sudo apt-get install -y software-properties-common net-tools wget
RUN sudo add-apt-repository ppa:deadsnakes/ppa
RUN sudo apt-get install -y python3.7 python3.7-venv python3.7-dev python3.7-distutils binfmt-support python3-pip
RUN sudo apt-get install -y git

# Install virtualenv
RUN pip3 install virtualenv

# Install CUDA
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
RUN sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
RUN sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN sudo apt-get update
RUN sudo apt-get install -y cuda-libraries-10-0