FROM rust:1.85.0
# need to install package or sync server build fails
RUN apt-get update && apt-get install protobuf-compiler -y

RUN cargo install --git https://github.com/ankitects/anki.git --rev d52ca669f6deac5966b1c5035bc2dc77c78d3260 anki-sync-server

ENV SYNC_PORT=27701
ENV SYNC_BASE=/sync

EXPOSE 27701
VOLUME [ "/sync" ]
CMD anki-sync-server