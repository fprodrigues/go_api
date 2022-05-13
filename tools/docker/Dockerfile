FROM postgres:14.2

ENV POSTGRES_PASSWORD="Password123#"
ENV POSTGRES_USER="go_api"
RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8

ADD import.sql /docker-entrypoint-initdb.d

EXPOSE 5432