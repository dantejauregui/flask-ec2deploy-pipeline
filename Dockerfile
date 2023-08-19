#syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt /app

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 3000

CMD [ "python", "app.py" ]


# to docker build: docker build --tag dantej/flask-ec2deploy . 
# to docker run: docker run -d -p 3000:3000 python-docker

# to run JenkinsServer Image using Docker: docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11