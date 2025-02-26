---
categories: ["linux"]
title: "Arch Linux Minimal Installation with KDE   Plasma"
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


Check if your device is connected to internet or not, if, on wifi, Make the Internet working by launching wifi-menu, and entering credentials

```
# ping google.com
# wifi-menu
# ping google.com
```

Either Pre Partition your disk with gparted or any similar utility or launch cfdisk from arch boot media. Make Partitions as suggested - sda1 as EFI Boot Partition, sda2 as Bios Boot Partition, sda3 as Linux Swap Partiion, and other partitions for OS root or as required. Here I've used my sda12 for Arch Linux.  
After Having partitions as suggested, mount all the required partitions on boot media, and enable swap.

```
# cfdisk
# mount /dev/sda12 /mnt
# mkdir /mnt/boot
# mount /dev/sda2 /mnt/boot
# mkdir /mnt/boot/efi
# mount /dev/sda1 /mnt/boot/efi
# mkswap /dev/sda3
# swapon /dev/sda3
```

Synchronize all the package repos, sort best mirrors for you, and enable to use mirror servers to make our installation faster. At last, again sync the package repos with updated settings.

```
# pacman -Syy
# pacman -S reflector
# reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist
# nano /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
# pacman -Syy
```

Install base and base-devel, the core of Arch Linux to /mnt, and generate fstab.

```
# pacstrap /mnt base base-devel
# genfstab -U -p /mnt >> /mnt/etc/fstab
```

Now arch-chroot into the newly installed system, and do some basic configurations to your sytem including - set  locales, set timezone, give hostname, enable mirrors and AUR, add a user, change root and user password, enable sudo functionality to user, and install grub Bootloader, and that's it your'e done setting your system.(still without GUI)

```
# arch-chroot /mnt
# nano /etc/locale.gen
# locale-gen
# echo LANG=en_US.UTF-8 > /etc/locale.conf
# export LANG=en_US.UTF-8
# ln -sf /usr/share/zoneinfo/ASIA/KOLKATA /etc/localtime
# hwclock --systohc --utc
# echo planetMilavArch > /etc/hostname
# nano /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch

# pacman -Sy
# passwd
# useradd -m -g users -G wheel,storage,power -s /bin/bash milav
# passwd milav
# pacman -S sudo
# nano /etc/sudoers
%wheel ALL=(ALL) ALL

# pacman -S grub
# grub-install --target=x86_64-efi --recheck
# grub-mkconfig -o /boot/grub/grub.cfg

# pacman -S wpa_supplicant dialog
# ping google.com
# wifi-menu
# ping google.com
```

Let's make our Arch GUI enable, Let's install KDE-Plasma Desktop enviornment with some common set of applications to make it a usable desktop computer. Follow the command given below for that.

```
$ sudo pacman -S xorg-apps
$ sudo pacman -S xorg-server xorg-xinit mesa xorg-twm xterm xorg-xclock-video
$ sudo pacman -S linux-headers
$ sudo pacman -S xorg-iceauth xorg-sessreg xorg-xcmsdb xorg-xbacklight xorg-xgamma xorg-$ xhost xorg-xinput xorg-xmodmap xorg-xrandr xorg-xrdb xorg-xrefresh xorg-xset xorg-xsetroot
$ startx
$ sudo pacman -S xf86-video-intel xf86-video-vesa
$ sudo pacman -S sddm
$ sudo pacman -S plasma kde-applications
$ sudo systemctl enable sddm
$ reboot


```

To solve the Discover Bug, enable touch-pad support and google chrome on your new Arch System, go with these commands.

```
$ sudo pacman -S bash-completion
$ sudo pacman -S xf86-input-synaptics
$ sudo pacman -S packagekit-qt5
$ sudo pacman -S git
$ git clone https://aur.archlinux.org/google-chrome.git
$ cd google-chrome/
$ makepkg -s
$ sudo pacman -U google-chrome-71.0.3578.98-1-x86_64.pkg.tar.xz 
$ sudo pacman -S ttf-dejavu 
```

That's it for this post, Hope it helps, Leave Comments if stuck anywhere.
