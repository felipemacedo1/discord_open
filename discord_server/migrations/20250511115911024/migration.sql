BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "discord_user" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "discord_user" (
    "id" bigserial PRIMARY KEY,
    "servers" json NOT NULL,
    "userInfoId" bigint NOT NULL,
    "status" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "discord_user"
    ADD CONSTRAINT "discord_user_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR discord
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('discord', '20250511115911024', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250511115911024', "timestamp" = now();

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
