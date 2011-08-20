#!/bin/sh

echo "($0)"

#PRISM54_FIRMWARE_URL="http://jbnote.free.fr/prism54usb/data/firmwares/p54pci_1.0.4.3.arm"
#PRISM54_FIRMWARE_URL="http://prism54.org/~mcgrof/firmware/1.0.4.3.arm"
#PRISM54_FIRMWARE_URL="http://ruslug.rutgers.edu/~mcgrof/802.11g/firmware/1.0.4.3.arm"
PRISM54_FIRMWARE_URL="http://lekernel.net/prism54/firmware/1.0.4.3.arm"
P54PCI_FIRMWARE_URL=http://daemonizer.de/prism54/prism54-fw/fw-softmac/2.13.25.0.arm

echo -n "Downloading Firmware from Prism54.org ... "

if [ ! -d /usr/lib/hotplug/firmware ] ; then
	mkdir -p /usr/lib/hotplug/firmware
fi

wget "$PRISM54_FIRMWARE_URL" -O /usr/lib/hotplug/firmware/isl3890
wget "$P54PCI_FIRMWARE_URL" -O /lib/firmware/isl3886pci

# blacklist prism54 modules as we will use p54pci as default
echo "blacklist prism54" >> /etc/modprobe.d/blacklist.conf

echo "Done"