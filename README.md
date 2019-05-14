# Openwrt-Neofetch

## Introduction
Running neofetch on Openwrt
Forked `https://github.com/dylanaraps/neofetch`

## Compile

First,you should have openwrt SDK.Dowload from `https://archive.openwrt.org/`
```
# add package 
git clone https://github.com/sjz123321/openwrt-neofetch.git ./package/
# Select Utilities -> neofetch
make menuconfig
# starting compile
make package/neofetch/compile V=99
```

## Install

Download from [Release][1] or compile by yourself

And you should install bash before this

```
# update sources
opkg update
# Install bash
opkg install bash
# Install neofetch
opkg install openwrt-neofetch-v1.0.ipk
```




[1]: https://github.com/sjz123321/openwrt-neofetch//releases/latest
