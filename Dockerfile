FROM ubuntu:latest
RUN apt update && \
    apt upgrade -y && \
    apt install wget tar cron -y && \
    apt clean && \
    useradd lynx && \
    usermod -aG sudo lynx && \
    su lynx && \
    wget https://github.com/getlynx/Lynx/releases/download/v0.16.3.11/lynx-linux64-wallet-0.16.3.11.tar.gz -P /tmp && \
    tar -zxvf /tmp/lynx-linux64-wallet-0.16.3.11.tar.gz -C /tmp && \
    mv /tmp/lynx-linux64-wallet-0.16.3.11/* /usr/local/bin && \
    chmod 700 /usr/local/bin/lynx* && \
    mkdir /lynx && \
    (crontab -l 2>/dev/null; echo "*/5 * * * * truncate -s 0 /lynx/data/debug.log") | crontab - && \
    service cron start
ADD lynx.conf /lynx/lynx.conf
ADD start /lynx/start
RUN chmod +x /lynx/start
VOLUME /lynx/data
ENV tipsyid=""
EXPOSE 22566
EXPOSE 9332
ENTRYPOINT [ "bash" ]
CMD [ "/lynx/start" ]