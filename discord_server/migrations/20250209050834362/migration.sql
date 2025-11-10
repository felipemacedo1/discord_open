BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "discord_channel" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "discord_channel" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "icon" text NOT NULL,
    "groupId" bigint NOT NULL,
    "discordServerId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "discord_channel"
    ADD CONSTRAINT "discord_channel_fk_0"
    FOREIGN KEY("groupId")
    REFERENCES "group"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "discord_channel"
    ADD CONSTRAINT "discord_channel_fk_1"
    FOREIGN KEY("discordServerId")
    REFERENCES "discord_server"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250209050834362', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250209050834362', "timestamp" = now();

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
