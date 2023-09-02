-- docker run --name pg -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -p 5432:5432 -d postgres
-- docker ps (running) / docker ps -a (running or stopped)
-- docker image ls
-- docker stop name / docker start name
-- docker exec -it pg bash
-- psql -U root
-- \l (list databases)
-- \c mycontacts (connect database)
-- \dt (list database tables)

CREATE DATABASE mycontacts;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS categories (
  id UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS contacts (
  id UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  name VARCHAR NOT NULL,
  email VARCHAR UNIQUE,
  phone VARCHAR,
  category_id UUID,
  FOREIGN KEY(category_id) REFERENCES categories(id)
);
