FROM ubuntu:16.04

MAINTAINER Scott Coulton "https://github.com/scotty-c/docker-openvpn"

ENV VERSION=2.5.2

RUN apt-get update && apt-get install -y wget iptables net-tools  && \
    wget http://swupdate.openvpn.org/as/openvpn-as-$VERSION-Ubuntu16.amd_64.deb && \ 
    dpkg -i openvpn-as*.deb && \
    echo "openvpn:passw0rd" | chpasswd 

COPY build/entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 443/tcp 1194/udp 943/tcp

VOLUME ["/usr/local/openvpn_as"]

CMD ["/entrypoint.sh"]

