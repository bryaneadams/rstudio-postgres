library(DBI)
library(dplyr)

"
con is your connection to a postgres DB
you do not need to adjust this.
"

conn = DBI::dbConnect(
  drv = RPostgres::Postgres(),
  dbname = Sys.getenv('POSTGRES_DB'),
  host = Sys.getenv('POSTGRES_HOST'),
  user = Sys.getenv('POSTGRES_USER'),
  password = Sys.getenv('POSTGRES_PASSWORD'),
  port = Sys.getenv('DB_PORT')
)

"
List your tables in your DB
"

conn %>% 
  dbListTables()

"
Create a table in your DB
dbWriteTable('<table_name>', <df_name>)
"

conn %>%
  dbWriteTable("mtcars", mtcars)  

"
You can now see your table was created
"

conn %>% 
  dbListTables()

"
query your DB
"

conn %>%
  dbGetQuery("SELECT * FROM mtcars WHERE cyl = $1", 
             params = list(4:8))
