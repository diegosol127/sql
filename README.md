Learn SQL through practical examples.

Following [this video](https://www.youtube.com/watch?v=7mz73uXD9DA).

### Databases:
- jobs: lukeb.co/sql_jobs_db
- invoices: lukeb.co/sql_invoices_db

# Basic Commands

When using a pre-existing database, these commands can help acquaint the user to the data at-a-glance.

Open a database.

```bash
sqlite3 <path/to/db>
```

Additional options provide a more clear CLI ouput

```bash
sqlite -header -box -nullvalue NULL -version <path/to/db>
```

Once inside the SQLite shell, you can use the following commands to preview important aspects of the data.

Output the path of connected databases.

```sqlite
.databases
```

List the names of tables in the database.

```sqlite
.tables
```

Get column information for a desired table

```sqlite
PRAGMA table_info(<tablename>);
```

Run a `sql` script from the CLI

```sqlite
.read <path/to/sql/script>
```
