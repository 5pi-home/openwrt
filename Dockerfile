FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y sudo time git-core subversion build-essential gcc-multilib \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python && \
    apt-get clean

RUN useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt

ENV OPENWRT_VERSION=18.06.2
RUN wget -O - https://github.com/openwrt/openwrt/archive/v${OPENWRT_VERSION}.tar.gz | \
  tar --strip=1 -xzvf - && \
  scripts/feeds update -a


COPY --chown=openwrt:openwrt config .config
RUN make defconfig

ENV PACKAGES="samba4-server minidlna luci-app-minidlna mwan3 ntfs-3g \
  prometheus-node-exporter-lua-nat_traffic \
  prometheus-node-exporter-lua-netstat \
  prometheus-node-exporter-lua-openwrt \
  prometheus-node-exporter-lua-textfile"
