# Base image
FROM node:alpine

# Image labels
LABEL maintainer="Captain KoLiBer koliberr136a1@gmail.com"
LABEL description="LibreOffice $VERSION Docker Image."

# Install LibreOffice & Common Fonts
RUN apk add bash libreoffice util-linux \
    ttf-droid-nonlatin ttf-droid ttf-dejavu ttf-freefont ttf-liberation \
    rm -rf /var/cache/apk/*

# Fix LibreOffice & Python integration
COPY python /usr/lib/libreoffice/program
RUN ln -sf /usr/bin/python3 /usr/lib/libreoffice/program/python.bin
RUN	ln -sf $(dirname $(find /usr/lib/python* -type d -name 'encodings')) /usr/lib/libreoffice/program/python-core
RUN chmod a+rx /usr/lib/libreoffice/program/python