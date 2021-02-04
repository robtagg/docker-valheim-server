FROM steamcmd/steamcmd:latest

RUN apt-get update && \
	apt-get -y install --no-install-recommends libsdl2-2.0-0:i386 && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /valheim/ && mkdir -p /valheim/data/ && mkdir -p /valheim/scripts/ && ulimit -n 2048

COPY  ./scripts /valheim/scripts

RUN chmod +x /valheim/scripts/entrypoint.sh && chmod +x /valheim/scripts/startserver.sh

ENTRYPOINT  ["/valheim/scripts/entrypoint.sh"]

CMD ["/valheim/scripts/startserver.sh"]
