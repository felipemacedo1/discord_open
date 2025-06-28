BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "discord_server" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "discord_server" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "newMessagesCount" bigint NOT NULL,
    "newMessagesChats" bigint NOT NULL,
    "serverBackground" text NOT NULL,
    "serverDataId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "discord_server"
    ADD CONSTRAINT "discord_server_fk_0"
    FOREIGN KEY("serverDataId")
    REFERENCES "server_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250202185319733', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250202185319733', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
