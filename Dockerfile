FROM rust:1.85.0
# need to install package or sync server build fails
RUN apt-get update && apt-get install protobuf-compiler -y

RUN cargo install --git https://github.com/ankitects/anki.git --rev c06370ff4d87cb48d825f90cc83e02b9a4e84ecd anki-sync-server

ENV SYNC_PORT=27701
ENV SYNC_BASE=/sync

EXPOSE 27701
VOLUME [ "/sync" ]
CMD anki-sync-server