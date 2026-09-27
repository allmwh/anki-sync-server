FROM rust:1.85.0
# need to install package or sync server build fails
RUN apt-get update && apt-get install protobuf-compiler -y

RUN cargo install --git https://github.com/ankitects/anki.git --rev 29bb700b951e3f0c0cb69b77c0180fc1fe33e6ba anki-sync-server

ENV SYNC_PORT=27701
ENV SYNC_BASE=/sync

EXPOSE 27701
VOLUME [ "/sync" ]
CMD anki-sync-server