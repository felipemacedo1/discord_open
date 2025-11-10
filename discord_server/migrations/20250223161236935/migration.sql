BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "discord_server" ADD COLUMN "defaultChannelId" bigint;
ALTER TABLE ONLY "discord_server"
    ADD CONSTRAINT "discord_server_fk_0"
    FOREIGN KEY("defaultChannelId")
    REFERENCES "discord_channel"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250223161236935', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250223161236935', "timestamp" = now();

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
