# Debian Sid with expermintal, pika and dmo repos
# Bump for rebuild on 07/01/2024 18:17 UTC +3
FROM debian-bleeding-edge-i386
RUN dpkg --add-architecture amd64
RUN apt update
RUN apt-get -y install sudo git bc gpg gpg-agent bison build-essential ccache cpio fakeroot flex git kmod libelf-dev libncurses5-dev libssl-dev lz4 qtbase5-dev rsync schedtool wget zstd tar aptly devscripts dh-make -y
RUN apt curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
RUN apt install nodejs:amd64 -y
RUN mkdir -p /__e/node16/bin/
RUN ln -sfv /usr/bin/node /__e/node16/bin/
