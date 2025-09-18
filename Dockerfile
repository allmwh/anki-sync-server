FROM rust:1.85.0
# need to install package or sync server build fails
RUN apt-get update && apt-get install protobuf-compiler -y

# https://github.com/ankitects/anki/releases/tag/25.07.5
RUN cargo install --git https://github.com/ankitects/anki.git --rev 47a2f07621bceb86f83821fc7d60b504cf636114 anki-sync-server

ENV SYNC_PORT=27701
ENV SYNC_BASE=/sync

EXPOSE 27701
VOLUME [ "/sync" ]
CMD anki-sync-server