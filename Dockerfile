FROM rust:1.80
# need to install package or sync server build fails
RUN apt-get update && apt-get install protobuf-compiler -y

# https://github.com/ankitects/anki/releases/tag/24.11
RUN cargo install --git https://github.com/ankitects/anki.git --rev 87ccd24 anki-sync-server

ENV SYNC_PORT=27701
ENV SYNC_BASE=/sync

EXPOSE 27701
VOLUME [ "/sync" ]
CMD anki-sync-server