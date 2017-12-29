FROM illallangi/ansible:latest
ENV WEBTREES_COMMIT=267093f1513da34a3fb85686f217f599effbb05c
ENV WEBTREES_SHA256=1f99617842282d59ec302c4d5b965e9dc33b7dc57a83d779a4fb8babc239c5e6
COPY image/* /etc/ansible.d/image/
RUN /usr/local/bin/ansible-runner.sh image

ENV USER=webtrees
ENV UID=1024
ENV WEBTREES_SERVERPORT=8100
ENV WEBTREES_DB_PORT=3306
ENV WEBTREES_DB_PREFIX=wt_
ENV WEBTREES_LANG=en-US
ENV WEBTREES_PATH=/var/lib/webtrees/data
COPY container/* /etc/ansible.d/container/
CMD ["/usr/local/bin/webtrees-entrypoint.sh"]
