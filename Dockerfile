FROM public.ecr.aws/lambda/nodejs:12
# Define function directory
ARG FUNCTION_DIR="./"
ADD *.js README.md package*.json ${FUNCTION_DIR}
RUN npm install
CMD ["index.handler"]
#ENTRYPOINT ["/var/task"]

