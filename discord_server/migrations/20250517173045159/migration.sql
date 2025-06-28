BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "server_membership" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "server_membership" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "serverId" bigint NOT NULL,
    "discordUserId" bigint NOT NULL,
    "_discordUserMembersDiscordUserId" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "server_membership"
    ADD CONSTRAINT "server_membership_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "discord_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "server_membership"
    ADD CONSTRAINT "server_membership_fk_1"
    FOREIGN KEY("serverId")
    REFERENCES "discord_server"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "server_membership"
    ADD CONSTRAINT "server_membership_fk_2"
    FOREIGN KEY("discordUserId")
    REFERENCES "discord_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "server_membership"
    ADD CONSTRAINT "server_membership_fk_3"
    FOREIGN KEY("_discordUserMembersDiscordUserId")
    REFERENCES "discord_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250517173045159', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250517173045159', "timestamp" = now();

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
