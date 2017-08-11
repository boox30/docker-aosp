#
# Minimum Docker image to build Android AOSP
# Ubuntu 16.04 for Nougat build
#
FROM shugaoye/docker-aosp:ubuntu16.04-JDK8

MAINTAINER Roger Ye <shugaoye@yahoo.com>

# The persistent data will be in these two directories, everything else is
# considered to be ephemeral
VOLUME ["/tmp/ccache", "/home/aosp"]

# Improve rebuild performance by enabling compiler cache
ENV USE_CCACHE 1
ENV CCACHE_DIR /tmp/ccache

# Work in the build directory, repo is expected to be init'd here
WORKDIR /home/aosp

COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
ENTRYPOINT ["/root/docker_entrypoint.sh"]
