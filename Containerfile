FROM scratch AS ctx
COPY build_files /build_files
COPY system_files /files

FROM ghcr.io/ublue-os/bazzite-nvidia:stable

RUN --mount=type=tmpfs,dst=/tmp \
    --mount=type=bind,from=ctx,source=/,target=/run/context \
    mkdir -p /var/roothome && \
    /run/context/build_files/build.sh

RUN bootc container lint
