# Base image
FROM node:alpine

# Image labels
LABEL maintainer="Captain KoLiBer koliberr136a1@gmail.com"
LABEL description="LibreOffice $VERSION Docker Image."

# Install dependencies
RUN apk add libreoffice ttf-freefont