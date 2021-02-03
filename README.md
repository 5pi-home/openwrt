# OpenWrt Setup
Sources for my OpenWrt based core router.


## Deploy
- Change stuff
- Push to master
- Get openwrt-x86-64-combined-squashfs.img.gz
- Cross fingers and run `sysupgrade openwrt-x86-64-combined-squashfs.img.gz`

## Customization
*to be included in image. PRs welcome!*

```
tar -C files/ -czv . | ssh root@192.168.1.1 tar -C / -xzvf -
```

```
opkg install \
  minidlna \
  luci-app-minidlna \
  mwan3 \
  ntfs-3g \
  block-mount \
  luci \
  libustream-openssl \
  samba36-server \
  luci-app-samba \
  dnsmasq-full


L="user:x:1000:100:users:/hdd:/bin/false"
grep "$L" /etc/passwd || echo "$L" >> /etc/passwd
```

