INSERT INTO pokequeue.MESSAGES ([message]) 
VALUES ('POKE QUEUE REQUEST');

INSERT INTO pokequeue.[status] ([description])
VALUES ('sent'), ('inprogress'), ('completed'), ('failed');

ALTER TABLE pokequeue.requests
ADD sample_size INT NULL; -- #tarea 3: Almacena este valor en una nueva columna en la tabla de reportes en Azure SQL DB (ej. SampleSize INT NULL ).