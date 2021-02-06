FROM steamcmd/steamcmd:latest
LABEL maintainer="Rob Tagg <robtagg@outlook.com>"

RUN apt-get update && \
	apt-get -y install --no-install-recommends libsdl2-2.0-0:i386 && \
	rm -rf /var/lib/apt/lists/*


RUN mkdir -p /root/valheim/data/ && mkdir -p /root/valheim/scripts/ && ulimit -n 2048

COPY  ./scripts /root/valheim/scripts

RUN chmod +x /root/valheim/scripts/entrypoint.sh && chmod +x /root/valheim/scripts/startserver.sh

ENTRYPOINT  ["/root/valheim/scripts/entrypoint.sh"]

CMD ["/root/valheim/scripts/startserver.sh"]
