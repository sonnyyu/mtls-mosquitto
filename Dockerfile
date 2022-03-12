FROM debian:bullseye
MAINTAINER Sonny Yu
RUN apt-get update && apt-get install -y wget  gnupg dirmngr && \
    wget -q -O - https://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | gpg --import && \
    gpg -a --export 8277CCB49EC5B595F2D2C71361611AE430993623 | apt-key add - && \
    wget -q -O /etc/apt/sources.list.d/mosquitto-bullseye.list  \
    https://repo.mosquitto.org/debian/mosquitto-bullseye.list && \
    apt-get install -y mosquitto mosquitto-clients
RUN mkdir -p /mqtt/config /mqtt/data /mqtt/log /mqtt/cert
#COPY config /mqtt/config
#COPY cert  /mqtt/cert
RUN chown -R mosquitto:mosquitto /mqtt
VOLUME ["/mqtt/data", "/mqtt/log"]
EXPOSE 8883
ADD docker-entrypoint.sh /usr/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mqtt/config/mosquitto.conf"]
