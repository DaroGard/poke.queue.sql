CREATE PROCEDURE pokequeue.create_poke_request(
    @type NVARCHAR(255)
)
AS

SET NOCOUNT ON;

INSERT INTO pokequeue.requests(
    [type]
    , [url]
    , id_status
) VALUES(
    @type
    , ''
    , ( SELECT id from pokequeue.status WHERE description = 'sent')
)

SELECT max(id) as id FROM pokequeue.requests;

CREATE PROCEDURE pokequeue.update_poke_request(
    @id int
    , @status NVARCHAR(255)
    , @url NVARCHAR(1000)
)
AS

SET NOCOUNT ON;

UPDATE pokequeue.requests
SET id_status = (SELECT id FROM  pokequeue.status where description = @status)
    ,url = @url
    ,updated = GETDATE()
WHERE id = @id

SELECT 1 as completed;

ALTER PROCEDURE pokequeue.create_poke_request(
    @type NVARCHAR(255),
    @sample_size INT = NULL  -- #tarea 3: Almacena este valor en una nueva columna en la tabla de reportes en Azure SQL DB (ej. SampleSize INT NULL ).
)
AS

SET NOCOUNT ON;

INSERT INTO pokequeue.requests(
    [type],
    [url],
    id_status,
    sample_size    -- #tarea 3: Almacena este valor en una nueva columna en la tabla de reportes en Azure SQL DB (ej. SampleSize INT NULL ).
) VALUES(
    @type,
    '',
    (SELECT id FROM pokequeue.status WHERE description = 'sent'),
    @sample_size
)

SELECT MAX(id) AS id FROM pokequeue.requests;