#Change this base image acccording to your convenience
# for tensorflow  v1.X
FROM python:3.8

#for tensorflow v2.X
#FROM nvcr.io/nvidia/tensorflow:20.09-tf2-py3

#for pytorch 
#FROM nvcr.io/nvidia/pytorch:20.09-py3

ARG u_id
ARG g_id
ARG username


ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -x && \
    apt update && \
    apt install -y --no-install-recommends \
        git\
        wget\
        build-essential \
        apt-utils \
        ca-certificates \
        curl \
        software-properties-common \
        libopencv-dev \ 
        python3-dev \
        python3-pip \ 
        python3-setuptools \
        cmake \
        swig \
        wget \
        unzip \
        vim 

 
COPY misc/requirements.txt /tmp/
RUN pip3 install pip --upgrade
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*



RUN groupadd --gid ${g_id} ${username}
RUN useradd --uid ${u_id} --gid ${g_id} --shell /bin/bash --create-home ${username}
USER ${username}
RUN chown -R ${u_id}:${g_id} /home/${username}
RUN chmod -R  755 /home/${username}



# Add these commands if you work with conda
# If conda is selected, previous python/pip commands should be removed

# ENV SHELL=/bin/bash
# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# RUN bash Miniconda3-latest-Linux-x86_64.sh -b
# RUN rm -f Miniconda3-latest-Linux-x86_64.sh
# ENV PATH="/home/${username}/miniconda3/bin:${PATH}"
# ARG PATH="/home/${username}/miniconda3/bin:${PATH}"
# RUN conda init bash

# RUN conda create -n env  -y
# SHELL ["conda", "run", "-n", "env", "/bin/bash", "-c"]
# RUN conda install -n env -c pytorch pytorch=1.8.0 

WORKDIR /home/${username}



# publish port
#EXPOSE 5656

# Example Entry point
#ENTRYPOINT ["/bin/bash","-c", "/usr/bin/python3 -m server.py"]

