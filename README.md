# ARM image for alpine linux

Alpine base image for arm that can builds on docker hub and other x86 platforms. This is based on resin's debian project

## What is Alpine Linux

Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with Docker images.

## How to use this image

Use like you would any other base image except for one caveat, you need to enclose your __RUN __portion with:

        FROM foo/bar
        RUN [ "cross-build-start" ]
        ....
        RUN [ "cross-build-end" ]
        ENTRYPOINT ["./foo"]
        CMD ["./bar"]

Like below:

        FROM cmosh/alpine-arm:3.3
        RUN [ "cross-build-start" ]
        RUN apk add --no-cache mysql-client
        RUN [ "cross-build-end" ]

        ENTRYPOINT ["mysql"]

This will allow your image to safely build on docker hub.

## Note

This is experimental and was mainly built for my own personal needs. Kudos to the resin io team, this is based on their hard work, I needed a an alpine based image instead of a debian one, checkout [https://github.com/resin-io-projects/armv7hf-debian-qemu](https://github.com/resin-io-projects/armv7hf-debian-qemu) and the corresponding docker image