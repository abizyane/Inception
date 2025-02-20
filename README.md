# Inception 🐳

Welcome to the **Inception**! This project is a Docker-based infrastructure that sets up a small web environment with NGINX, WordPress, MariaDB, and additional bonus services like Redis, FTP, Adminer, and Portainer. It was developed as part of the 42 School curriculum.

---

## 📋 Table of Contents
1. [Project Overview](#-project-overview)
2. [Services](#-services)
3. [Directory Structure](#-directory-structure)
4. [Setup Instructions](#-setup-instructions)
5. [Accessing Services](#-accessing-services)
6. [Environment Variables](#-environment-variables)
7. [Technical Details](#-technical-details)
8. [Bonus Features](#-bonus-features)
9. [Contributing](#-contributing)
10. [License](#-license)

---

## 🚀 Project Overview

The Inception Project is a Docker-based infrastructure that sets up the following services:
- **NGINX** with TLS encryption (TLSv1.2/TLSv1.3).
- **WordPress** with PHP-FPM.
- **MariaDB** for database management.
- **Redis** for caching.
- **FTP Server** for file transfers.
- **Adminer** for database management.
- **Portainer** for Docker container management.
- A **static website** showcasing a resume.

The project is designed to run on a virtual machine and uses Docker Compose to manage the containers.

---

## 🛠 Services

### Mandatory Services
1. **NGINX**:
   - Acts as a reverse proxy.
   - Serves WordPress and other services.
   - Configured with TLS encryption.

2. **WordPress**:
   - A fully functional WordPress site.
   - Connects to MariaDB for data storage.
   - Automatically sets up an admin user and a test post.

3. **MariaDB**:
   - Hosts the WordPress database.
   - Configures users and permissions on startup.

### Bonus Services
1. **Redis**:
   - Used for caching in WordPress to improve performance.

2. **FTP Server**:
   - Allows file transfers to the WordPress volume.

3. **Adminer**:
   - A web-based database management tool for MariaDB.

4. **Portainer**:
   - A web-based Docker management tool.

5. **Static Website**:
   - A simple static website showcasing a resume.

---

## 📂 Directory Structure

```
inception/
├── LICENSE
├── Makefile
└── srcs/
    ├── docker-compose.yml
    ├── env_example
    └── requirements/
        ├── bonus/
        │   ├── adminer/
        │   ├── ftp/
        │   ├── portainer/
        │   ├── redis/
        │   └── website/
        ├── mariadb/
        ├── nginx/
        └── wordpress/
```

---

## 🛠 Setup Instructions

### Prerequisites
- Docker and Docker Compose installed.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/abizyane/Inception.git
   cd inception
   ```

2. Copy the `env_example` file to `.env` and configure it:
   ```bash
   cp srcs/env_example srcs/.env
   nano srcs/.env
   ```
   Replace the placeholder values in `.env` with your own configuration.

3. Build and start the containers:
   ```bash
   make
   ```

4. Access the services using the URLs provided in the [Accessing Services](#-accessing-services) section.

---

## 🌐 Accessing Services

Once the containers are running, you can access the services as follows:

| Service       | URL                                |
|---------------|------------------------------------|
| WordPress     | `https://localhost`               |
| Adminer       | `https://localhost/adminer`       |
| Static Website| `https://localhost/website`       |
| Portainer     | `https://localhost/portainer`     |

---

## 🔧 Environment Variables

The `env_example` file contains the following environment variables. Copy it to `.env` and replace the placeholders with your own values:


---

## 🛠 Technical Details

### Automation and Startup Scripts
The project uses **startup scripts** to automate the setup and configuration of each service. These scripts are executed when the containers start, ensuring that everything is configured correctly.

#### Key Scripts:
1. **WordPress Setup**:
   - The `setup.sh` script in the `wordpress` directory:
     - Downloads and installs WordPress using `wp-cli`.
     - Configures the `wp-config.php` file with database credentials.
     - Sets up an admin user and a test post.
     - Installs and activates the Redis cache plugin, and website theme.

2. **MariaDB Setup**:
   - The `setup.sh` script in the `mariadb` directory:
     - Creates the WordPress database.
     - Configures user permissions.
     - Ensures the database is ready for WordPress.

3. **NGINX Setup**:
   - The `Dockerfile` in the `nginx` directory:
     - Generates a self-signed SSL certificate for TLS encryption.
     - Configures the NGINX server block to serve WordPress and other services.

4. **Redis Setup**:
   - The `Dockerfile` in the `redis` directory:
     - Configures Redis for caching.
     - Links Redis to WordPress for improved performance.

5. **FTP Setup**:
   - The `setup.sh` script in the `ftp` directory:
     - Configures the FTP server to allow file transfers to the WordPress volume.

6. **Portainer Setup**:
   - The `setup.sh` script in the `portainer` directory:
     - Initializes Portainer with an admin user.
     - Connects Portainer to the Docker daemon for container management.

### Docker Compose Integration
The `docker-compose.yml` file orchestrates all the services:
- Defines the containers, networks, and volumes.
- Links services together (e.g., WordPress to MariaDB, NGINX to WordPress).
- Ensures containers restart automatically in case of failure.

### Docker Daemon Interaction
Some services, like **Portainer**, interact directly with the Docker daemon:
- Portainer mounts the Docker socket (`/var/run/docker.sock`) to manage containers.
- This allows Portainer to provide a web-based interface for Docker management.

### Makefile Automation
The `Makefile` simplifies the build and management process:
- **`make`**: Builds and starts all containers.
- **`make down`**: Stops and removes all containers.
- **`make clean`**: Cleans up Docker resources (containers, images, volumes).
- **`make re`**: Rebuilds the entire project from scratch.

---

## 🎁 Bonus Features

The following bonus features are included:
- **Redis Caching**: Improves WordPress performance.
- **FTP Server**: Allows file transfers to the WordPress volume.
- **Adminer**: A lightweight database management tool.
- **Portainer**: A Docker management tool.
- **Static Website**: A simple static website showcasing a resume.

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
