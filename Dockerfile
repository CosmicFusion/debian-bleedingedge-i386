# Debian Sid with expermintal, pika and dmo repos
# Bump for rebuild on 13/01/2024 12:56 UTC +3
FROM debian-bleedingedge-i386
RUN mkdir -p /__e/node16/bin/
RUN ln -sfv /usr/bin/node /__e/node16/bin/
