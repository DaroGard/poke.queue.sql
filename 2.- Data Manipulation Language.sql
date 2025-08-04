INSERT INTO pokequeue.MESSAGES ([message]) 
VALUES ('POKE QUEUE REQUEST');

INSERT INTO pokequeue.[status] ([description])
VALUES ('sent'), ('inprogress'), ('completed'), ('failed');