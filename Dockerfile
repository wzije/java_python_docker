FROM openjdk:18-jdk-alpine3.13

ENV PYTHONUNBUFFERED=1
RUN apk add python3-dev=3.6.9-r3 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.9/main
RUN apk add --update --no-cache python3 py-pip python3-dev libffi-dev gcc g++ zeromq-dev && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip

COPY . /usr/src/myapp
RUN pip install --no-cache-dir -r /usr/src/myapp/requirement.txt --ignore-installed six

RUN wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip && \
  unzip ijava-1.3.0.zip -d ijava-kernel && \
  python ijava-kernel/install.py --sys-prefix

WORKDIR /usr/src/myapp
CMD ["sh","/usr/src/myapp/run.sh"]
