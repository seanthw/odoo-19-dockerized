# Odoo 19 Dockerized

A clean, isolated Odoo 19 Docker environment designed for rapid development and testing.

## Features

-   **Isolated Environment:** Runs Odoo 19 and PostgreSQL in separate Docker containers.
-   **Persistent Data:** Uses named volumes to persist your database, Odoo data, and configuration.
-   **Customizable:** Easily add your own modules and customize configurations.
-   **Raspberry Pi Ready:** Tested and compatible with Raspberry Pi 4.

## Prerequisites

Make sure you have the following installed on your system:

-   [Docker](https://docs.docker.com/get-docker/)
-   [Docker Compose](https://docs.docker.com/compose/install/)

## Quick Start

1.  Clone the repository:
    ```bash
    git clone https://github.com/seanthw/odoo-19-dockerized.git
    cd odoo-19-dockerized
    ```

2.  Start the services:
    ```bash
    docker compose up -d
    ```

Odoo will be available at `http://localhost:8070`.

## Usage

Here are the basic commands to manage your Docker environment:

-   **Start the services:**
    ```bash
    docker compose up -d
    ```

-   **Stop the services:**
    ```bash
    docker compose down
    ```

-   **Check container status:**
    ```bash
    docker compose ps
    ```

-   **View Odoo logs:**
    ```bash
    docker compose logs -f odoo-19
    ```

-   **Restart a service (e.g., Odoo):**
    ```bash
    docker compose restart odoo-app
    ```

## Adding Custom Modules

1.  Place your custom Odoo module(s) inside the `custom-addons/` directory. If the directory doesn't exist, create it:
    ```bash
    mkdir -p custom-addons
    ```

2.  Ensure your module is in the correct path, for example:
    `/home/sean/odoo-19-dockerized/custom-addons/your_module`

3.  Restart the Odoo container to mount the new module:
    ```bash
    docker compose restart odoo-app
    ```

4.  Log in to Odoo, go to **Apps**, and select **Update Apps List** from the menu (you may need to activate developer mode). Your new module should now be available for installation.

## Raspberry Pi Compatibility

This setup can run on a Raspberry Pi 3 to 4. It has been tested on a Raspberry Pi 4 with the following key specifications:

-   **Model:** Raspberry Pi 4B rev 1.2
-   **RAM:** 4GB
-   **SoC:** BCM2711

## Configuration

You can customize your setup by creating a `.env` file in the project root. This file will be automatically loaded by Docker Compose.

1.  Create a `.env` file in the root of your project:
    ```bash
    touch .env
    ```

2.  Edit the `.env` file and add your desired configurations. Here's an example:

    ```dotenv
    # Odoo Configuration
    ODOO_VERSION=19.0
    ODOO_PORT=8070
    ODOO_ADMIN_PASSWORD=admin

    # PostgreSQL Configuration (used by Odoo to connect to the database)
    POSTGRES_DB=odoo_prod
    POSTGRES_USER=odoo
    POSTGRES_PASSWORD=odoo
    ```

    **Note:** The `POSTGRES_USER` and `POSTGRES_PASSWORD` values in the `.env` file should match the `environment` variables set for the `postgres` service in `docker-compose.yml` if you intend to change them. The `HOST`, `USER`, and `PASSWORD` variables within the Odoo service in `docker-compose.yml` are currently hardcoded to `postgres` and `odoo` respectively.

## Data Persistence

The setup creates three named Docker volumes to ensure your data is not lost when containers are stopped or removed:

-   `odoo-postgres-data`: Stores PostgreSQL database files.
-   `odoo-app-data`: Stores Odoo session data and file storage.
-   `odoo-app-config`: Stores Odoo configuration files.
