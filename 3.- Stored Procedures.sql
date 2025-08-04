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