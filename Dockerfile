# Usa la imagen oficial de PostgreSQL
FROM postgres:latest

# Establece variables de entorno necesarias
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=postgres_air

# Copia el archivo SQL
COPY postgres_air.sql /miauu/

# Los scripts en /docker-entrypoint-initdb.d/ se ejecutan al iniciar la base de datos
