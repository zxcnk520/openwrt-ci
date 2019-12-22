#!/bin/bash
cd /home/runner/openwrt

echo 'Update luci-app-passwall...'
rm -rf /home/runner/openwrt/package/lienol/luci-app-passwall/
cp -R /home/runner/openwrt-package/lienol/luci-app-passwall/ /home/runner/openwrt/package/lienol/
sed -i "s/LuCI for Lienol/LuCI/g" /home/runner/openwrt/package/lienol/luci-app-passwall/Makefile
sed -i "s/ChinaDNS:ChinaDNS/ChinaDNS:openwrt_chinadns/g" /home/runner/openwrt/package/lienol/luci-app-passwall/Makefile

echo 'Fix serverchan temperature bug...'
sed -i "s?cut -c1-2 /sys/class/thermal/thermal_zone0/temp?cut -c1-2 /sys/class/hwmon/hwmon0/temp1_input?g" /home/runner/openwrt/package/ctcgfw/luci-app-serverchan/root/usr/bin/serverchan/serverchan

echo 'Modify default theme...'
sed -i "s/luci-theme-bootstrap/luci-theme-argon-mc/g" /home/runner/openwrt/feeds/luci/collections/luci/Makefile

echo 'Fix verysync version'
sed -i 's/v1.3.0/v1.3.1/g' /home/runner/openwrt/package/zxlhhyccc/verysync/Makefile

# echo "Start build!"
make defconfig
