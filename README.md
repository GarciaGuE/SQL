# SQL
## Requirements
- sqlite3
```bash
sudo apt install sqlite3
```

## Usage
It is not necessary to install any software to run the queries. You can use the sqlite3 command line tool to run the queries. Create a database with the extension .sqlite and with VSCode you can open it and see the tables and the data.

```bash
sqlite3 database.sqlite
```

You can run the queries from sqlite3 command line tool or you can run them from a file. To run them from a file you can use the following command:

```bash
sqlite3 database.sqlite < query.sql
```

or you can run them from the command line tool, you can ommit the .mode column and .headers on commands, but you will not see the results in a table format:

```bash
sqlite3 database.sqlite
.mode column
.headers on
.read query.sql
```

Also, you can save the results of a query in a file:

```bash
.output query_result.txt
.read query.sql
```

**Important**: Some queries use OracleSQL syntax, so they will not work with sqlite3 (Like Date format, which should be changed to 'YYYY-MM-DD'). Instead, use the queries commented with sqlite3 syntax.
