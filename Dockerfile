FROM ubuntu:16.04

RUN apt-get update

WORKDIR /home/app/
ENV FLASK_APP 'main.py'
ENV FLASK_ENV 'production'

COPY . .

RUN apt-get install -y build-essential python3 curl python3-dev libmysqlclient-dev python-greenlet python-eventlet
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
RUN pip3 install -r requirements.txt

EXPOSE 8080

CMD ["python3","main.py"]
