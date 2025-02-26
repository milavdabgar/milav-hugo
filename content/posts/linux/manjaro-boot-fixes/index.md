---
categories: ["linux"]
title: "Fixing Manjaro Boot Proulems"
date: "2018-12-19"
ShowReadingTime: true
ShowWordCount: true
hidemeta: false
hideSummary: false
ShowBreadCrumbs: false
ShowPostNavLinks: true
ShowCodeCopyButtons: true
ShowShareButtons: false
disableShare: true
searchHidden: false
UseHugoToc: true
comments: true
---


To Fix a non booting manjaro system, Boot from manjaro sytem from usb and run the below mentioned CLI Linux commands in terminal to solve manjaro boot problems encountered after recent update. 

```
su
mount /dev/sda10 /mnt
cd /mnt/
mount -t proc proc proc/
mount --rbind /sys sys/
mount --rbind /dev dev/
mount --rbind /run run/
chroot /mnt
sudo pacman -Syyu
reboot
```

Don't forget to Replace /dev/sda10 with partition number on which your manjaro system is installed, if you're not sure about partition number, run 'os-prober' command.

Hope it helps, and leave comments if still facing any issues after this steps.
