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

El mensaje indica que el script se ejecutó correctamente, pero no se pueden encontrar relaciones (tablas). Esto puede deberse a que las tablas se crearon en un esquema diferente al que estás consultando. Por defecto, `psql` busca tablas en el esquema `public`, pero el script puede haberlas creado en el esquema `postgres_air`.

### 1. **Verificar los esquemas disponibles**

Lista todos los esquemas en la base de datos:

```sql
\dn
```

Esto mostrará si existe un esquema llamado `postgres_air`.

---

### 2. **Verificar las tablas en el esquema correcto**

Si el esquema `postgres_air` aparece en la lista, consulta sus tablas especificando el esquema:

```sql
\dt postgres_air.*
```

---

### 3. **Configurar el esquema de búsqueda**

Si las tablas están en el esquema `postgres_air`, puedes configurarlo como el esquema de búsqueda para evitar especificarlo manualmente cada vez:

```sql
SET search_path TO postgres_air;
```

Después de esto, usa:

```sql
\dt
```
