FROM amazonlinux:2

ARG UNAMEX
ARG INSTANCE_TYPE
ARG NCPUS_VAR
RUN echo "'UNAMEX=${UNAMEX}'"

RUN yum update -y
RUN yum install shadow-utils -y
# RUN yum install -y git
RUN yum install -y curl
RUN yum install -y vim
#RUN yum install -y aws-cli
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN . ~/.nvm/nvm.sh

# set up nodejs
# #RUN /bin/bash bash_scripts/install-simple-nodejs-app.sh
# expose port 3000 for API
EXPOSE 3000
RUN mkdir /var/www
RUN mkdir /var/www/simple-nodejs-app
ADD *.js /var/www/simple-nodejs-app/
ADD README.md /var/www/simple-nodejs-app/
ADD package.json /var/www/simple-nodejs-app/
RUN cd /var/www/simple-nodejs-app/
RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN curl -sL https://rpm.nodesource.com/setup_12.x |  bash -
RUN yum -y install yarn
RUN yum -y install nodejs
RUN npm install

# set up a script that run whenever the docker is started.
# it will run the forever service to start the nsfcareer-api-service
#RUN ["chmod", "+x", "/home/ec2-user/bash_scripts/start-nodejs.sh"]
##ENTRYPOINT ["/bin/bash", "-c", "/home/ec2-user/bash_scripts/start-nodejs.sh"]
##CMD ["/bin/bash", "-c", "/home/ec2-user/bash_scripts/start-nodejs.sh"]
##RUN /bin/bash bash_scripts/start-nodejs.sh
