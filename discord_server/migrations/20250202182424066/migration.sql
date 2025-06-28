BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "discord_channel" DROP COLUMN "messages";
ALTER TABLE "discord_channel" ADD COLUMN "_serverDataChannelServerDataId" bigint;
ALTER TABLE ONLY "discord_channel"
    ADD CONSTRAINT "discord_channel_fk_0"
    FOREIGN KEY("_serverDataChannelServerDataId")
    REFERENCES "server_data"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "discord_server" DROP COLUMN "groups";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "message" ADD COLUMN "_discordChannelMessagesDiscordChannelId" bigint;
ALTER TABLE ONLY "message"
    ADD CONSTRAINT "message_fk_0"
    FOREIGN KEY("_discordChannelMessagesDiscordChannelId")
    REFERENCES "discord_channel"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "server_data" DROP COLUMN "channel";
ALTER TABLE "server_data" ADD COLUMN "_discordServerGroupsDiscordServerId" bigint;
ALTER TABLE ONLY "server_data"
    ADD CONSTRAINT "server_data_fk_0"
    FOREIGN KEY("_discordServerGroupsDiscordServerId")
    REFERENCES "discord_server"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250202182424066', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250202182424066', "timestamp" = now();

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
