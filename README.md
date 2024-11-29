## Instrucciones

### 3. **Construir la imagen**

```bash
docker build -t postgres_air_image .
```

### 4. **Correr el contenedor**

```bash
docker run --name postgres_air_container -p 5432:5432 -d postgres_air_image
```

### 5. **Conectarte a la base de datos**

```bash
psql -h localhost -p 5432 -U postgres -d postgres_air
```

La contraseña será `postgres` (o la que definiste en el Dockerfile).

### 6. **Ejecutar .sql**

```bash
\i postgres_air.sql
```

La contraseña será `postgres` (o la que definiste en el Dockerfile).

---

El mensaje indica que el script se ejecutó correctamente, pero no se pueden encontrar relaciones (tablas). Esto puede deberse a que las tablas se crearon en un esquema diferente al que estás consultando. Por defecto, `psql` busca tablas en el esquema `public`, pero el script puede haberlas creado en el esquema `postgres_air`.

### 1. **Verificar los esquemas disponibles**

Lista todos los esquemas en la base de datos:

```sql
\dn
```

Esto mostrará si existe un esquema llamado `postgres_air`.

### 2. **Verificar las tablas en el esquema correcto**

Si el esquema `postgres_air` aparece en la lista, consulta sus tablas especificando el esquema:

```sql
\dt postgres_air.*
```

### 3. **Configurar el esquema de búsqueda**

Si las tablas están en el esquema `postgres_air`, puedes configurarlo como el esquema de búsqueda para evitar especificarlo manualmente cada vez:

```sql
SET search_path TO postgres_air;
```

Después de esto, usa:

```sql
\dt
```

---

### **1. Verifica el nombre del contenedor PostgreSQL existente**

Ejecuta:

```bash
docker ps
```

Identifica el contenedor PostgreSQL ya en ejecución y toma nota del **NOMBRE DEL CONTENEDOR**.

### **2. Asegúrate de que los contenedores están en la misma red**

Cuando levantas el contenedor `pgadmin` desde `docker-compose`, se crea una red específica para los servicios definidos en ese archivo. Sin embargo, el contenedor PostgreSQL existente puede no estar en esa red.

#### **Solución: Conecta el contenedor PostgreSQL existente a la red de `pgadmin`:**

1. Identifica la red creada por Docker Compose para `pgadmin`. Ejecuta:

   ```bash
   docker network ls
   ```

   Busca una red con un nombre similar a `directorio_del_compose_default`.

2. Conecta el contenedor PostgreSQL a esa red:
   ```bash
   docker network connect <nombre_de_la_red> <nombre_del_contenedor_postgres>
   ```
   Reemplaza `<nombre_de_la_red>` y `<nombre_del_contenedor_postgres>` con los valores que obtuviste en los pasos anteriores.

### **3. Configura la conexión en pgAdmin**

1. **Host/Address:** Usa el **nombre del contenedor PostgreSQL** (esto funciona porque están en la misma red de Docker).
2. **Port:** 5432 (por defecto).
3. **Username:** `postgres`.
4. **Password:** `postgres`.
