BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "server_membership" DROP CONSTRAINT "server_membership_fk_2";
ALTER TABLE "server_membership" DROP COLUMN "_discordUserServermembershipsDiscordUserId";
ALTER TABLE "server_membership" ADD COLUMN "_discordUserMembersDiscordUserId" bigint;
ALTER TABLE ONLY "server_membership"
    ADD CONSTRAINT "server_membership_fk_2"
    FOREIGN KEY("_discordUserMembersDiscordUserId")
    REFERENCES "discord_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250517170925720', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250517170925720', "timestamp" = now();

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
