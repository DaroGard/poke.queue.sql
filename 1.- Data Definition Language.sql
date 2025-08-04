--En Master:
CREATE SCHEMA pokequeue;

CREATE LOGIN PokeQueueApp WITH PASSWORD = '456123sQl@dmin';

--En esquema pokequeue:

CREATE USER PokeQueueAppUser FOR LOGIN PokeQueueApp;

GRANT SELECT ON SCHEMA :: pokequeue to PokeQueueAppUser;
GRANT INSERT ON SCHEMA :: pokequeue to PokeQueueAppUser;
GRANT UPDATE ON SCHEMA :: pokequeue to PokeQueueAppUser;
GRANT DELETE ON SCHEMA :: pokequeue to PokeQueueAppUser;
GRANT EXECUTE ON SCHEMA :: pokequeue to PokeQueueAppUser;

CREATE TABLE pokequeue.MESSAGES(
    id int IDENTITY(1,1) PRIMARY KEY,
    [message] VARCHAR(255) NOT NULL
)

CREATE TABLE pokequeue.[status](
    id int IDENTITY(1,1) PRIMARY KEY,
    [description] VARCHAR(255) NOT NULL
)

CREATE TABLE pokequeue.[requests](
    id int IDENTITY(1,1) PRIMARY KEY,
    [type] NVARCHAR(255) NOT NULL,
    id_status int NOT NULL,
    [url] NVARCHAR(1000) NOT NULL,
    created DATETIME DEFAULT GETDATE(),
    updated DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_status) REFERENCES pokequeue.[status](id)
)