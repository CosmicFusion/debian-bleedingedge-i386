#! /bin/bash
set -e
# Run at 07/08/2023 19:40 UTC 3
DIST=sid ARCH=i386 debootstrap --arch=i386 sid base_chroot || true
rm -rf base_chroot/debootstrap
apt install wget -y
wget https://github.com/CosmicFusion/debian-bleedingedge/raw/main/setup.sh -O base_chroot/setup.sh
chmod +x base_chroot/setup.sh
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get install wget -y"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive /setup.sh"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get -y update"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt --fix-broken install -y"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get -y install sudo git bc gpg gpg-agent wget -y"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt full-upgrade -y"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive dpkg --add-architecture amd64"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt update"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get -y install sudo git bc gpg gpg-agent bison build-essential ccache cpio fakeroot flex git kmod libelf-dev libncurses5-dev libssl-dev dialog apt-utils lz4 qtbase5-dev rsync schedtool wget zstd tar aptly devscripts dh-make libc6:amd64 -y"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get install nodejs:amd64 -y"
chroot ./base_chroot /bin/bash -c "DEBIAN_FRONTEND=noninteractive apt-get clean"
rm -rf base_chroot/setup.sh
cd  ./base_chroot
sudo tar -czvf ../base_chroot.tgz ./*


