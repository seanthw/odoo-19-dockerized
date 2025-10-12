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

## How to Add Custom Modules

Follow these steps to add any custom module to this Odoo environment.

1.  **Copy the Module:**
    Place your custom module's folder into the `test-addons` directory.
    ```bash
    # Example:
    cp -r /path/to/your/odoo-module ./test-addons/
    ```

2.  **Restart the Odoo Container:**
    This is a critical step. Restarting the container will make Odoo aware of the new module and, more importantly, it will automatically set the correct file ownership and permissions inside the container.
    ```bash
    docker compose restart odoo-19
    ```

3.  **Update the Apps List:**
    Once the container has restarted, log into your Odoo instance.
    - Go to the **Settings** menu and click **Activate the developer mode**.
    - Go to the **Apps** menu.
    - Click the **Update Apps List** button in the top menu.
    - Confirm the update in the dialog box.

4.  **Install the Module:**
    Your module will now be visible. You can search for it by name and click **Install**. (Remember to remove the default "Apps" filter in the search bar to see all available modules).

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
