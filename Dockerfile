# Base image
FROM node:latest

# Declare ENV variables
# Declare ARGS and ENV Variables
ARG URL
ENV VERSION 6.4.5.2

# Image labels
LABEL version=$VERSION
LABEL maintainer="Captain KoLiBer koliberr136a1@gmail.com"
LABEL description="LibreOffice $VERSION Docker Image."

# Install dependencies
RUN apt update
RUN apt install -y libxinerama1 libfontconfig1 libdbus-glib-1-2 libcairo2 libcups2 libglu1-mesa libsm6 unzip ttf-mscorefonts-installer

# Install libreoffice
RUN wget https://downloadarchive.documentfoundation.org/libreoffice/old/$VERSION/deb/x86_64/LibreOffice_${VERSION}_Linux_x86-64_deb.tar.gz -O /tmp/libre.tar.gz
RUN tar -C /opt/libreoffice -zxvf /tmp/libre.tar.gz
RUN dpkg -i /opt/libreoffice/DEBS/*.deb
RUN rm -Rf /tmp/libre.tar.gz