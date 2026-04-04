# Odoo 19 Dockerized

A clean, isolated Odoo 19 Docker environment designed for rapid development and testing.

## Features

-   **Isolated Environment:** Runs Odoo 19 and PostgreSQL in separate Docker containers.
-   **Persistent Data:** Uses named volumes to persist your database and Odoo data.
-   **Customizable:** Easily add your own modules and customize configurations.
-   **Raspberry Pi Ready:** Tested and compatible with Raspberry Pi 4.

## Prerequisites

-   [Docker](https://docs.docker.com/get-docker/)
-   [Docker Compose](https://docs.docker.com/compose/install/)

## Quick Start

1.  Clone the repository:
    ```bash
    git clone https://github.com/seanthw/odoo-19-dockerized.git
    cd odoo-19-dockerized
    ```

2.  Copy the environment file:
    ```bash
    cp .env.example .env
    ```

3.  Start the services:
    ```bash
    docker compose up -d
    ```

Odoo will be available at `http://localhost:8069`.

## Usage

-   **Start:** `docker compose up -d`
-   **Stop:** `docker compose down`
-   **Check status:** `docker compose ps`
-   **View logs:** `docker compose logs -f odoo-19`
-   **Rebuild after Dockerfile changes:** `docker compose up -d --build`

## Adding Custom Modules

Place your custom Odoo module(s) inside the `extra-addons/` directory.

Restart the Odoo container:
```bash
docker compose restart odoo-19
```

Log in to Odoo, go to **Apps**, and select **Update Apps List** from the menu (enable developer mode first). Your new module should now be available.

## Configuration

Edit the `.env` file to configure PostgreSQL credentials:

```dotenv
POSTGRES_USER=odoo
POSTGRES_PASSWORD=your_secure_password
```

## Raspberry Pi Compatibility

This setup can run on a Raspberry Pi 3 to 4. It has been tested on a Raspberry Pi 4 with the following key specifications:

-   **Model:** Raspberry Pi 4B rev 1.2
-   **RAM:** 4GB
-   **SoC:** BCM2711

## Data Persistence

Docker volumes persist your data:
-   `postgres-odoo-19-data`: PostgreSQL database files
-   `odoo-19-data`: Odoo session data and file storage
