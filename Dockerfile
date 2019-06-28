FROM debian:9

RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y \
        bash \
        coreutils \
        findutils \
        curl \
        binfmt-support \
        cron \
    ;

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
    
ENV UBT_PACKAGE_NAME="exagear_3428-1_armhf.deb"
ENV GUEST_IMAGE_PACKAGE_NAME="exagear-guest-debian-9_3428_all.deb"
ENV GUEST_IMAGE_ROOT="/opt/exagear/images/debian-9"

COPY $UBT_PACKAGE_NAME /
COPY $GUEST_IMAGE_PACKAGE_NAME /

RUN dpkg -i $UBT_PACKAGE_NAME
RUN dpkg -i $GUEST_IMAGE_PACKAGE_NAME

RUN rm -rf \
        /var/lib/apt/lists/* \
        /$UBT_PACKAGE_NAME \
        /$GUEST_IMAGE_PACKAGE_NAME
