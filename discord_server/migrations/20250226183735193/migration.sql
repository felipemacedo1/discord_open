BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "message" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "message" (
    "id" bigserial PRIMARY KEY,
    "senderInfoId" bigint NOT NULL,
    "content" text NOT NULL,
    "contentType" text NOT NULL,
    "timeStamp" timestamp without time zone NOT NULL,
    "channelId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "message"
    ADD CONSTRAINT "message_fk_0"
    FOREIGN KEY("senderInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "message"
    ADD CONSTRAINT "message_fk_1"
    FOREIGN KEY("channelId")
    REFERENCES "discord_channel"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250226183735193', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250226183735193', "timestamp" = now();

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
