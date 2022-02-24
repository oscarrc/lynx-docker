FROM ubuntu:latest
ARG TARGETARCH
RUN apt update && \
    apt install wget tar libssl-dev ca-certificates cron libpopt0 logrotate --no-install-recommends -y && \
    apt clean && \
    useradd -m lynx && \
    usermod -aG sudo lynx && \
    rm -rf /var/lib/apt/lists/*
RUN su lynx && \
    if [ "$TARGETARCH" = "amd64" ]; then \
        arch="linux64"; \
    elif [[ "$TARGETARCH" =~ "arm" ]]; then \
        arch="arm32"; \
    else \
        echo "Not compatible" && exit 1; \
    fi && \
    wget https://github.com/getlynx/Lynx/releases/download/v0.16.3.12/lynx-$arch-wallet-0.16.3.12.tar.gz -P /tmp && \
    tar -zxvf "/tmp/lynx-${arch}-wallet-0.16.3.12.tar.gz" -C /tmp && \
    mv /tmp/lynx-$arch-wallet-0.16.3.12/* /usr/local/bin && \
    mkdir /etc/lynx/ /lynx && \
    rm -rf /tmp/*
ADD --chown=lynx:lynx lynx-start /usr/local/bin/lynx-start 
ADD --chown=lynx:lynx lynx*.conf /etc/lynx
ADD logrotate /etc/logrotate.d/lynx
RUN chown lynx:lynx /usr/local/bin/lynx* && \
    chmod 700 /usr/local/bin/lynx* && \
    chmod 644 /etc/logrotate.d/lynx
VOLUME /lynx
EXPOSE 22566
EXPOSE 44566
EXPOSE 9332
EXPOSE 19332
ENV release=v7.0-mainnet
ENV testrelease=v4.0-testnet
USER lynx
ENTRYPOINT [ "bash" ]
CMD [ "lynx-start" ]