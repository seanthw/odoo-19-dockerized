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

## Adding Custom Modules

1. Place your module in the `custom-addons/` directory
2. Restart Odoo: `docker compose restart odoo-app`
3. Update apps list in Odoo interface and a bit more # 1. Go to your repo
cd ~/odoo-19-dockerized

# 2. Check what's here
ls -la

# You should see:
# - docker-compose.yml
# - custom-addons/  ← If it's missing, create it!

# 3. If missing, create it
mkdir -p custom-addons

# 4. Verify the path matches
realpath custom-addons
# Should show: /home/sean/odoo-19-dockerized/custom-addons
## Configuration

You can customize the environment by creating a `.env` file in the root of the project. Copy the `.env.example` file to get started:

```bash
cp .env.example .env
```

Then, modify the `.env` file with your desired credentials.

# Database Configuration
POSTGRES_DB=odoo_prod
POSTGRES_USER=odoo_admin
POSTGRES_PASSWORD=YourStrongPasswordHere

# Odoo Configuration
ODOO_VERSION=19.0
ODOO_PORT=8070
ODOO_ADMIN_PASSWORD=admin

# Paths
ADDONS_PATH=./custom-addons

## Directory Structure

- `custom-addons/` - Place your custom Odoo modules here
- `docker-compose.yml` - Main compose file with persistent volumes
- `.env` - Environment configuration

## Persistent Volumes

The setup creates three named volumes:

- `odoo-postgres-data` - PostgreSQL database files
- `odoo-app-data` - Odoo session and data files
- `odoo-app-config` - Odoo configuration files

