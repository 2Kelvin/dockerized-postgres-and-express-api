# Dockerized Postgres and Express API
Running multicontainers running a `postgres` database and an `expressjs` api using `docker compose` 

Added app's environment variables in compose. I use map keys instead of lists here for the environmental variables.
```bash
 express_api:
    depends_on:
      - postgres_db
    build: ./
    ports:
      - "3000:3000"
    environment:
      DB_HOST: postgres_db
      DB_USER: user1
      DB_NAME: time_connected
      DB_PORT: 5432
      DB_PASSWORD: /run/secrets/postgres_db_password
    secrets:
      - postgres_db_password
```

And also added the database password safely into the container using secrets.
```bash
  postgres_db:
    image: postgres:18.3
    environment:
      POSTGRES_USER: user1
      POSTGRES_DB: time_connected
      POSTGRES_PASSWORD: /run/secrets/postgres_db_password
    secrets:
      - postgres_db_password
```