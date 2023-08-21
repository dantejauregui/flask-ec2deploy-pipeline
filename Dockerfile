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

# to run JenkinsServer Image using Docker: docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock joseberrocal/jenkins_docker_debian:v2
# AND IMPORTANT: luego para resolver el problema del root "CANNOT CONNECT TO THE DOCKER DAEMON AT UNIX:/VAR/RUN/DOCKER.SOCK":  chown 1000:1000 /var/run/docker.sock

# para lo anterior, se debe entrar dentro del Jenkins Server he instalar docker como SUPER USUARIO/ROOT:     docker exec -u 0 -it (CONTAINER-ID) bash 