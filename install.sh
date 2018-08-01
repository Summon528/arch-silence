#!/bin/bash

if [ "$UID" -eq "0" ]; then
	cp -TR ./theme /boot/grub/themes/arch-silence
	grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub
	echo "GRUB_THEME=\"/boot/grub/themes/arch-silence/theme.txt\"" >> /etc/default/grub
	grub-mkconfig -o /boot/grub/grub.cfg
	echo -e "\n Finished! Hooray!"
else
	echo -e "\n Please run the script as root."
fi
