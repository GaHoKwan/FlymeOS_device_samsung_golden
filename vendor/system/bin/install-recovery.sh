#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7940096 80f2ffd7a8ba2bcb38a0ecfac9abc91a4bef4280 5486592 42843cce2ec4b4969cef3d9348fc00f50ef547e8
fi

if ! applypatch -c EMMC:/dev/block/mmcblk0p21:7940096:80f2ffd7a8ba2bcb38a0ecfac9abc91a4bef4280; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p20:5486592:42843cce2ec4b4969cef3d9348fc00f50ef547e8 EMMC:/dev/block/mmcblk0p21 80f2ffd7a8ba2bcb38a0ecfac9abc91a4bef4280 7940096 42843cce2ec4b4969cef3d9348fc00f50ef547e8:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
