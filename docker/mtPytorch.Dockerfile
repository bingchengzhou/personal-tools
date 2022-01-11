FROM nvidia/cuda:11.4.2-devel-ubuntu20.04
# COPY ./apt-source/server-207-sources.list /etc/apt/sources.list
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    wget openssh-server git curl libglib2.0-0 libsm6 libxrender1 libxext6\
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
ENV TZ Asia/Shanghai

WORKDIR /home/workspace/
ENV WORKDIR /home/workspace
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \ 
    &&  bash Miniconda3-latest-Linux-x86_64.sh -b && rm -rf Miniconda3-latest-Linux-x86_64.sh
ENV PATH /root/miniconda3/bin:$PATH

RUN conda install python=3.8.5 && \ 
    conda install astunparse numpy ninja pyyaml mkl mkl-include setuptools \
    cmake cffi typing_extensions future six requests dataclasses && \
    conda clean -y -a 
RUN pip install --no-cache-dir opencv-python==4.1.2.30 

COPY ./docker/.ssh /root/.ssh

RUN chmod -R 700 /root/.ssh

CMD [ "/usr/sbin/sshd", "-D"]

