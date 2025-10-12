# Odoo 19 Dockerized

Isolated Odoo 19 Docker environment for testing and development.

## Quick Start

```bash
git clone git@github.com:seanthw/odoo-19-dockerized.git
cd odoo-19-dockerized
docker compose up -d
```

## Management

**After that, use:**
# Stop
docker compose down

# Start again  
docker compose up -d

# Check status
docker compose ps

# View logs
docker compose logs -f odoo-19

## Custom Addons

The Odoo container runs as a specific user (`odoo`, UID `100`) which needs read permission for your custom addon files. If the permissions are incorrect, Odoo will silently fail to load the module, and it will not appear in the Apps List.

There are two methods to add your modules:

### Method 1: Symbolic Link (Recommended for Development)

This method is ideal for development as it allows you to edit your module in its own directory, and the changes are immediately available to Odoo upon restarting the container.

1.  **Create a Symbolic Link:**
    Link your module's source directory into the `test-addons` folder.
    ```bash
    ln -s /path/to/your/odoo-module ./test-addons/
    ```

2.  **Fix Permissions:**
    Change the ownership of your **original** module directory to match the Odoo user.
    ```bash
    sudo chown -R 100:100 /path/to/your/odoo-module
    ```

### Method 2: Copying Files

Use this method if you prefer to keep a separate copy of the module for this specific Odoo instance.

1.  **Copy the Directory:**
    Copy your module directory into the `test-addons` folder.
    ```bash
    cp -r /path/to/your/odoo-module ./test-addons/
    ```

2.  **Fix Permissions:**
    Change the ownership of the **copied** module directory.
    ```bash
    sudo chown -R 100:100 ./test-addons/your-odoo-module
    ```

### Final Steps (For Both Methods)

After adding your module using either method, you must restart the containers and update the apps list.

1.  **Restart the environment:**
    ```bash
    docker compose restart
    ```

2.  **Update Apps List in Odoo:**
    In the Odoo UI, go to **Apps**, click on **Update Apps List**, remove the default "Apps" filter, and search for your module.

## Configuration

You can customize the environment by creating a `.env` file in the root of the project. Copy the `.env.example` file to get started:

```bash
cp .env.example .env
```

Then, modify the `.env` file with your desired credentials.

### PostgreSQL

*   `image`: You can change the PostgreSQL version by modifying the `image` tag in `docker-compose.yml` (e.g., `postgres:15`).
*   `ports`: The host port mapped to the container's port 5432. By default, it is `5433:5432`.

### Odoo

*   `image`: You can change the Odoo version by modifying the `image` tag in `docker-compose.yml` (e.g., `odoo:18.0`).
*   `ports`: The host port mapped to the container's port 8069. By default, it is `8070:8069`.
