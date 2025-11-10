BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "discord_channel" DROP COLUMN "messages";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "discord_server" DROP COLUMN "groups";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "group" DROP COLUMN "channel";

--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250203085034734', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250203085034734', "timestamp" = now();

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
