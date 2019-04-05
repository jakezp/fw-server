FROM ubuntu:18.04

LABEL maintainer="Jakezp <jakezp@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

# Update and install packages
RUN apt-get update \
    && apt-get install python3-pip tzdata -yq \
    && rm -rf /var/lib/apt/lists/*

# Install and configure webnut
RUN pip3 install netifaces flask && mkdir /fw

# Add run and set permissions
ADD  fw-server.py /fw-server.py
RUN chmod +x /fw-server.py

WORKDIR /

VOLUME ["/fw"]

EXPOSE 5000

CMD /usr/bin/python3 /fw-server.py -f /fw
