#FROM amazonlinux:2
FROM public.ecr.aws/lambda/nodejs:12
#RUN yum update -y
#RUN yum install shadow-utils -y
#RUN yum install -y curl
#RUN yum install -y vim
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
#RUN . ~/.nvm/nvm.sh

# set up nodejs
#EXPOSE 3000
# Include global arg in this stage of the build
#ARG FUNCTION_DIR
# Define function directory
ARG FUNCTION_DIR="function/"
# Create function directory
#WORKDIR ${FUNCTION_DIR}
#ARG FUNCTION_DIR="/function"
RUN mkdir -p ${FUNCTION_DIR}
ADD *.js  ${FUNCTION_DIR}
ADD README.md  ${FUNCTION_DIR}
ADD package*.json  ${FUNCTION_DIR}
# Set working directory to function root directory
#WORKDIR ${FUNCTION_DIR}
#RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
#RUN curl -sL https://rpm.nodesource.com/setup_12.x |  bash -
#RUN yum -y install yarn
#RUN yum -y install nodejs
RUN npm install
#CMD ["index.handler"]
#ENTRYPOINT ["/var/task"]
# set up a script that run whenever the docker is started.
# it will run the forever service to start the nsfcareer-api-service
#RUN ["chmod", "+x", "/home/ec2-user/bash_scripts/start-nodejs.sh"]

##CMD ["/bin/bash", "-c", "/home/ec2-user/bash_scripts/start-nodejs.sh"]
##RUN /bin/bash bash_scripts/start-nodejs.sh
