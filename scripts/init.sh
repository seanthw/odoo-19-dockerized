#!/bin/bash

echo "Setting up Odoo 19 Test Environment"
echo "Pulling latest images..."
docker compose pull

echo "Starting services..."
docker compose up -d

echo "Waiting for Odoo to start..."
sleep 10

echo "Odoo 19 is running at: http://localhost:8070"
echo "Check status: docker compose ps"
echo "View logs: docker compose logs -f odoo-19"
