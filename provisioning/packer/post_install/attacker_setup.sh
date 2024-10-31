#!/usr/bin/env bash

touch /tmp/runasroot.sh

# Set up DNS
# echo "apt-get purge resolvconf -y" >> /tmp/runasroot.sh
echo "echo 'nameserver 172.18.0.1' > /etc/resolv.conf" > /tmp/runasroot.sh

# Update certificates
echo "wget http://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2024.1_all.deb -O /tmp/kali-archive-keyring_2024.1_all.deb" >> /tmp/runasroot.sh
echo "dpkg -i /tmp/kali-archive-keyring_2024.1_all.deb" >> /tmp/runasroot.sh
echo "apt-get update" >> /tmp/runasroot.sh

# Enable root account, set password and reboot
echo "apt-get install -y kali-root-login" >> /tmp/runasroot.sh
echo "echo 'root:breach' | chpasswd" >> /tmp/runasroot.sh
echo "reboot" >> /tmp/runasroot.sh

echo breach | sudo -S chmod +x /tmp/runasroot.sh
echo breach | sudo -S /tmp/runasroot.sh
