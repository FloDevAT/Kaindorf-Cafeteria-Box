FROM debian:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y systemd python3 python3.11-venv git sudo iputils-ping vim kitty nano curl && \
    rm -rf /var/lib/apt/lists/* 

COPY config.sh /usr/local/bin/config.sh

RUN chmod +x /usr/local/bin/config.sh

ENTRYPOINT ["/usr/local/bin/config.sh"]