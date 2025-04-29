FROM alpine:3.21.3
# install chrony
RUN apk add --no-cache chrony gettext && \
    mkdir -p /run/chrony &&\
    chown -R chrony:chrony /etc/chrony /run/chrony &&\
    chmod 750 /run/chrony
# script to configure/startup chrony (ntp)
COPY /assets/entrypoint.sh entrypoint.sh
COPY /assets/chrony.conf /etc/chrony/chrony.conf 
# let docker know how to test container health
HEALTHCHECK CMD chronyc -n tracking || exit 1
USER chrony
# start chronyd in the foreground
ENTRYPOINT [ "sh", "/entrypoint.sh" ]