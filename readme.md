# Anki Sync Server

This repository provides a Docker image for a self-hosted Anki synchronization server. The image is automatically built and kept up-to-date with the latest releases from the official [ankitects/anki](https://github.com/ankitects/anki) repository.

---

### **Usage with Docker Compose**

1.  **Create a `docker-compose.yml` file**
    Copy the content below into a file named `docker-compose.yml` in your project directory. Remember to replace `USER` and `PASSWORD` with your desired login credentials.

    ```yaml
    services:
      anki-server:
        image: allmwh/anki-sync-server:latest
        container_name: anki-server
        restart: always
        environment:
          - SYNC_USER1: USER:PASSWORD
        volumes:
          - ./anki_sync:/sync
          - /etc/timezone:/etc/timezone:ro
          - /etc/localtime:/etc/localtime:ro
        ports:
          - "27701:27701"
    ```

2.  **Run the Server**
    First, create a local directory to store your Anki data. Then, start the service using Docker Compose.

    ```bash
    mkdir anki_sync
    docker-compose up -d
    ```

3.  **Configure Your Anki Client**
    In your Anki desktop client, navigate to **Preferences > Network** and enter your server's address (e.g., `http://localhost:277001`) in the "Sync server" field. Finally, click the sync button and use the credentials you set up to begin synchronizing your data.