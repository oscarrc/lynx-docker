FROM ubuntu:latest
RUN apt update && \
    apt install wget tar libssl-dev ca-certificates cron libpopt0 logrotate --no-install-recommends -y && \
    apt clean && \
    useradd -m lynx && \
    usermod -aG sudo lynx && \
    rm -rf /var/lib/apt/lists/*
RUN su lynx && \
    wget https://github.com/getlynx/Lynx/releases/download/v0.16.3.11/lynx-linux64-wallet-0.16.3.11.tar.gz -P /tmp && \
    tar -zxvf /tmp/lynx-linux64-wallet-0.16.3.11.tar.gz -C /tmp && \
    mv /tmp/lynx-linux64-wallet-0.16.3.11/* /usr/local/bin && \
    rm -rf /tmp/*
ADD lynx-start /usr/local/bin/lynx-start 
ADD lynx.conf /etc/lynx/lynx.conf
ADD logrotate /etc/logrotate.d/lynx
RUN chown lynx:lynx /usr/local/bin/lynx* && \
    chmod 700 /usr/local/bin/lynx* && \
    chmod 644 /etc/logrotate.d/lynx
VOLUME /lynx
EXPOSE 22566
EXPOSE 44566
EXPOSE 9332
EXPOSE 19332
USER lynx
ENTRYPOINT [ "bash" ]
CMD [ "lynx-start" ]