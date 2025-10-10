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
