## LAMP Stack with WordPress using Docker

This project is a simple demonstration of running a LAMP stack (Linux, Apache, MySQL, PHP) with WordPress using Docker and Docker Compose. The setup includes persistent storage for both WordPress files and MySQL data.

### Features
- **Apache** with **PHP 7.4**
- **MySQL 5.7** for the database
- WordPress installed and ready for setup
- Persistent volumes for WordPress files and database storage
- Easy-to-manage using Docker Compose

---

### Prerequisites

Make sure you have the following installed:
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

---

### Project Structure

```
.
├── Dockerfile               # Defines the WordPress + Apache + PHP environment
├── docker-compose.yml       # Orchestrates the services
└── html/                    # WordPress files and themes (will be populated)
```

---

### Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/lamp-wordpress-docker.git
   cd lamp-wordpress-docker
   ```

2. **Download WordPress** (if not already included in the repository):
   ```bash
   mkdir html
   curl -O https://wordpress.org/latest.tar.gz
   tar -xzf latest.tar.gz -C html --strip-components=1
   rm latest.tar.gz
   ```

3. **Build and start the containers**:
   ```bash
   docker-compose up --build
   ```

4. **Access WordPress**:
   Once the containers are running, you can access WordPress at:
   ```
   http://localhost:8080
   ```

5. **Stop the containers**:
   When you're done working, you can stop the containers by running:
   ```bash
   docker-compose down
   ```

---

### Volumes and Data Persistence

- **WordPress Files**: The `html/` directory on your local machine is mounted to the container’s `/var/www/html` folder. Any changes to themes, plugins, or uploads will persist in this folder.
- **MySQL Data**: The MySQL data is stored in a Docker volume (`db_data`), which ensures that your database content persists across container restarts.

---

### Environment Variables

These environment variables are set in the `docker-compose.yml` file for configuring the MySQL database and connecting WordPress:

| Variable                | Description                            |
|-------------------------|----------------------------------------|
| `WORDPRESS_DB_HOST`      | The database host (set to `db:3306`)   |
| `WORDPRESS_DB_USER`      | WordPress database user (default: `wordpress`) |
| `WORDPRESS_DB_PASSWORD`  | Password for the database user (default: `wordpress`) |
| `WORDPRESS_DB_NAME`      | Name of the WordPress database (default: `wordpress`) |
| `MYSQL_ROOT_PASSWORD`    | Root password for MySQL (default: `rootpassword`) |

---

### Customizing the Project

Feel free to modify the project as needed. Here are some common customizations:

1. **Change PHP Version**:
   You can modify the `FROM` line in the `Dockerfile` to use a different PHP version, e.g., `php:8.0-apache`.

2. **Install More PHP Extensions**:
   You can add more `docker-php-ext-install` commands in the `Dockerfile` to install additional PHP extensions.

3. **Custom WordPress Configuration**:
   If you need to make specific WordPress or Apache configuration changes, you can edit the files in the `html/` directory or add custom configuration files.

---

### Troubleshooting

- **Port Conflicts**: If port `8080` is already in use on your machine, you can change the port mapping in the `docker-compose.yml` file:
   ```yaml
   ports:
     - "8080:80"
   ```
   Change `8080` to an available port, like `8081`.

- **Database Connection Issues**: Ensure that the WordPress container is able to connect to the MySQL container by checking the environment variables and ensuring that the database service is running.
