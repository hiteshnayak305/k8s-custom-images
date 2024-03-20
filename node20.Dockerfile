FROM node:20-alpine

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized node agent Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
RUN apk --no-cache add ca-certificates
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
