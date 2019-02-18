#!/bin/bash
set -e
 
printf "\n\033[0;44m---> Creating SSH master user.\033[0m\n"
 
# useradd -m -d /home/root -G ssh root -s /bin/bash
echo -e 'nothingNewHere\nnothingNewHere' | passwd root
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' >> /root/.profile
echo 'cd /system/comma/home' >> /root/.profile
mkdir -p /root/.ssh/
mkdir -p /system/comma/home
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+iXXq30Tq+J5NKat3KWHCzcmwZ55nGh6WggAqECa5CasBlM9VeROpVu3beA+5h0MibRgbD4DMtVXBt6gEvZ8nd04E7eLA9LTZyFDZ7SkSOVj4oXOQsT0GnJmKrASW5KslTWqVzTfo2XCtZ+004ikLxmyFeBO8NOcErW1pa8gFdQDToH9FrA7kgysic/XVESTOoe7XlzRoe/eZacEQ+jtnmFd21A4aEADkk00Ahjr0uKaJiLUAPatxs2icIXWpgYtfqqtaKF23wSt61OTu6cAwXbOWr3m+IUSRUO0IRzEIQS3z1jfd1svgzSgSSwZ1Lhj4AoKxIEAIc8qJrO4uymCJ' >> /root/.ssh/authorized_keys
echo "root ALL=NOPASSWD:/bin/rm" >> /etc/sudoers
echo "root ALL=NOPASSWD:/bin/mkdir" >> /etc/sudoers
echo "root ALL=NOPASSWD:/bin/chown" >> /etc/sudoers
echo "root ALL=NOPASSWD:/usr/sbin/useradd" >> /etc/sudoers
echo "root ALL=NOPASSWD:/usr/sbin/deluser" >> /etc/sudoers
echo "root ALL=NOPASSWD:/usr/sbin/chpasswd" >> /etc/sudoers
 
exec "$@"