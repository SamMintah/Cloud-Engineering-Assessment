---
### Setup Instructions

Follow these steps to build, run, and stop the containers.

#### Prerequisites
Ensure you have Docker and Docker Compose installed:

- **[Docker](https://docs.docker.com/get-docker/)**
- **[Docker Compose](https://docs.docker.com/compose/install/)**

Clone the repository:

```bash
git clone <repository-url>
cd <repository-directory>
```

Create a `.env` file in the root directory with the following content:

```env
DB_URI=mongodb://admin:secret@db:27017/Main?authSource=admin
MONGO_INITDB_ROOT_USERNAME=admin
MONGO_INITDB_ROOT_PASSWORD=secret
```

Ensure that network ports (8080, 3000, and 27017) are available on your local machine.

---

#### Build and Run the Containers
Navigate to the root directory (where `docker-compose.yml` is located).

To build and run the containers, execute:

```bash
docker-compose up --build
```

This command will:

- Build and run the frontend, backend, and database services.
- Automatically create a network for communication between the services.

##### Access the Application:

- **Frontend**: [http://localhost:3001](http://localhost:3001)
- **Backend**: [http://localhost:3000](http://localhost:3000)

---

#### Stop the Containers
To stop the containers, run:

```bash
docker-compose down
```

This stops and removes all containers, networks, and volumes.

---

### Network and Security Configurations

#### Network Configuration
- A custom bridge network named `app-network` is used for container communication.
- **Frontend and Backend Communication**: Containers share the same network, allowing backend API calls from the frontend using `http://backend:3000`.
- **Database Communication**: The backend connects to the database using `db` as the hostname.

#### Exposed Ports

| Service   | Internal Port | External Port | Purpose                          |
|-----------|---------------|---------------|----------------------------------|
| Frontend  | 80            | 3001          | Access the frontend UI          |
| Backend   | 3000          | 3000          | Access the backend APIs         |
| Database  | 27017         | 27017         | For local MongoDB inspection    |

#### Security Settings
- **Database Credentials**: Stored in `.env` and injected as environment variables.
  - `MONGO_INITDB_ROOT_USERNAME`: Admin username for MongoDB.
  - `MONGO_INITDB_ROOT_PASSWORD`: Admin password for MongoDB.
- **Database URI**: Uses `db` as the hostname, ensuring it’s only accessible within the Docker network.

---

### Troubleshooting Guide

#### Issue 1: MongoDB Fails with Exit Code 62
**Solution**:
- Ensure the `MONGO_INITDB_ROOT_USERNAME` and `MONGO_INITDB_ROOT_PASSWORD` are correctly set in the `.env` file.
- Restart the containers:
  ```bash
  docker-compose down
  docker-compose up --build
  ```

#### Issue 2: Backend Fails to Connect to MongoDB
**Solution**:
- Ensure `DB_URI` in `.env` points to `db` (not `localhost`) as the database hostname:
  ```env
  DB_URI=mongodb://admin:secret@db:27017/Main?authSource=admin
  ```

#### Issue 3: Frontend Shows “Service Unavailable”
**Solution**:
- Confirm the backend is running at [http://localhost:3000](http://localhost:3000).
- Check logs for errors:
  ```bash
  docker-compose logs backend
  ```

---
