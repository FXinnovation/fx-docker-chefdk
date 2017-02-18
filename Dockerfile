FROM ubuntu:14.04.5

VOLUME /data

ENV CHEFDK_VERSION=1.2.22

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

WORKDIR /data

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="chefdk" \
      "org.label-schema.base-image.name"="docker.io/library/ubuntu" \
      "org.label-schema.base-image.version"="14.04.5" \
      "org.label-schema.description"="Chefdk in a container" \
      "org.label-schema.url"="https://www.chef.io" \
      "org.label-schema.vcs-url"="https://bitbucket.org/fxadmin/public-common-docker-chefdk" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.chefdk.version"=$CHEFDK_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run --rm -v $(pwd):/data fxinnovation/chefdk [CHEFDK_COMPONANT] [COMMAND_OPTIONS]"
