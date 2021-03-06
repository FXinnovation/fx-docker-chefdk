FROM ubuntu:xenial

VOLUME /data

ENV CHEFDK_VERSION=3.8.14 \
    STOVE_VERSION=6.0.0 \
    NET_SSH_VERSION=5.1.0 \
    RBNACL_VERSION=4.0.2 \
    RBNACL_LIBSODIUM_VERSION=1.0.16 \
    GIT_VERSION=1:2.7.4-0ubuntu1.9 \
    BCRYPT_PBKDF_VERSION=1.0.0 \
    KITCHEN_ANSIBLE_VERSION=0.54.0

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

WORKDIR /data

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="chefdk" \
      "org.label-schema.base-image.name"="docker.io/library/ubuntu" \
      "org.label-schema.base-image.version"="xenial" \
      "org.label-schema.description"="Chefdk in a container" \
      "org.label-schema.url"="https://www.chef.io" \
      "org.label-schema.vcs-url"="https://bitbucket.org/fxadmin/public-common-docker-chefdk" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.chefdk.version"=$CHEFDK_VERSION \
      "org.label-schema.applications.stove.version"=$STOVE_VERSION \
      "org.label-schema.applications.net-ssh.version"=$NET_SSH_VERSION \
      "org.label-schema.applications.rbnacl.version"=$RBNACL_VERSION \
      "org.label-schema.applications.rbnacl-libsodium.version"=$RBNACL_LIBSODIUM_VERSION \
      "org.label-schema.applications.git.version"=$GIT_VERSION \
      "org.label-schema.applications.bcrypt_pbkdf.version"=$BCRYPT_PBKDF_VERSION \
      "org.label-schema.applications.kitchen-ansible.version"=$KITCHEN_ANSIBLE_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run --rm -v $(pwd):/data fxinnovation/chefdk [CHEFDK_COMPONANT] [COMMAND_OPTIONS]"
