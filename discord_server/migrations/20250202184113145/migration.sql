BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "server_data" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "server_data" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "discordServerId" bigint NOT NULL,
    "_discordServerGroupsDiscordServerId" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "server_data"
    ADD CONSTRAINT "server_data_fk_0"
    FOREIGN KEY("discordServerId")
    REFERENCES "discord_server"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "server_data"
    ADD CONSTRAINT "server_data_fk_1"
    FOREIGN KEY("_discordServerGroupsDiscordServerId")
    REFERENCES "discord_server"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250202184113145', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250202184113145', "timestamp" = now();

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
