FROM armhf/alpine:3.4

ENV QEMU_EXECVE 1

COPY . /usr/bin

RUN [ "/usr/bin/qemu-arm-static", "/bin/sh", "-c", "ln -s resin-xbuild /usr/bin/cross-build-start; ln -s resin-xbuild /usr/bin/cross-build-end; ln /bin/sh /bin/sh.real" ]
