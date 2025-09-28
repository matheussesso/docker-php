# Docker PHP Stack

A lightweight Docker Compose setup for PHP development with Nginx, MariaDB (MySQL) and Redis.

## Stack Components

- **PHP 8.4-FPM** with essential extensions
- **Nginx** web server  
- **MariaDB** (MySQL compatible)
- **Redis** for caching

## Quick Start

```bash
git clone <repository-url>
cd docker-php
docker-compose up -d
```

Access your application at `http://localhost`

## Services

| Service | Container | Port | 
|---------|-----------|------|
| Nginx | `nginx` | 80 |
| PHP-FPM | `phpfpm` | - |
| MariaDB | `mariadb` | 3306 |
| Redis | `redis` | 6379 |

## Database Credentials

- **Database:** `database`
- **User:** `user` / `user-pass`
- **Root:** `root` / `root-pass`

## Directory Structure

- `src/` - Application code
- `config/` - Service configurations
- `logs/` - Service logs
- `database/` - MariaDB data
- `dataredis/` - Redis data

## PHP Extensions

GD, MySQLi, PDO MySQL, XML, cURL, mbstring, ZIP, Intl, BCMath, SOAP, OPcache, Redis

## Commands

```bash
# Start/stop services
docker-compose up -d
docker-compose down

# View containers
docker-compose ps

# View logs
docker-compose logs [service]

# Access containers
docker exec -it phpfpm bash
docker exec -it mariadb mysql -u root -p
```
