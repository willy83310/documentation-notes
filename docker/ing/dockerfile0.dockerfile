# https://github.com/quozd/docker-centos7-python36/blob/master/Dockerfile
# 2018/05/29 - docker-centos7-python36 Dockerfile

# cd d:/illu/docker/ing/
# docker build docker/ing/.
# docker run -it 99a4 /bin/bash

# 分別安裝 Centos7
# 編譯 Python 3.edition
# 抓裝 pip3
# 全部自己來...

FROM centos:7

ENV PYTHON_VERSION "3.6.4"
RUN yum install -y \
    wget \
    gcc make \
    zlib-dev openssl-devel sqlite-devel bzip2-devel

RUN wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz \
    && tar xvf Python-${PYTHON_VERSION}.tgz \
    && cd Python-${PYTHON_VERSION} \
    && ./configure --prefix=/usr/local \
    && make \
    && make altinstall \
    && cd / \
    && rm -rf Python-${PYTHON_VERSION}*


RUN ln -s /usr/local/bin/python${PYTHON_VERSION:0:3} /usr/local/bin/python3
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python3 get-pip.py

WORKDIR /root

COPY app .

RUN pip3 install -r web/requirements.txt



EXPOSE 80


# CMD ["python3", "manage.py", "runserver", "--host", "0.0.0.0"]
# python manage.py runserver --host 0.0.0.0

# CMD ["python", "manage.py", "runserver"]

# docker build -t mt D:\illu\docker\ing\.
# docker build -t mt D:\mt\.

# docker run -it mt /bin/bash
# docker run -it --name mt --mount mt /bin/bash

# python docker\ing\app\manage.py