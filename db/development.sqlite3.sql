BEGIN TRANSACTION;
DROP TABLE IF EXISTS "schema_migrations";
CREATE TABLE IF NOT EXISTS "schema_migrations" (
	"version"	varchar NOT NULL,
	PRIMARY KEY("version")
);
DROP TABLE IF EXISTS "ar_internal_metadata";
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" (
	"key"	varchar NOT NULL,
	"value"	varchar,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	PRIMARY KEY("key")
);
DROP TABLE IF EXISTS "articles";
CREATE TABLE IF NOT EXISTS "articles" (
	"id"	integer NOT NULL,
	"title"	varchar,
	"description"	varchar,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	"user_id"	int,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "users";
CREATE TABLE IF NOT EXISTS "users" (
	"id"	integer NOT NULL,
	"username"	varchar,
	"email"	varchar,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	"password_digest"	varchar,
	"admin"	boolean DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "categories";
CREATE TABLE IF NOT EXISTS "categories" (
	"id"	INTEGER NOT NULL,
	"name"	varchar NOT NULL,
	"created_at"	datetime(6) NOT NULL,
	"updated_at"	datetime(6) NOT NULL,
	PRIMARY KEY("id")
);
INSERT INTO "schema_migrations" ("version") VALUES ('20230129160253'),
 ('20230205131427'),
 ('20230206112414'),
 ('20230206141208'),
 ('20230215135250'),
 ('20230220093534');
INSERT INTO "ar_internal_metadata" ("key","value","created_at","updated_at") VALUES ('environment','development','2023-02-20 09:51:36.284553','2023-02-20 09:51:36.284553');
INSERT INTO "users" ("id","username","email","created_at","updated_at","password_digest","admin") VALUES (1,'piers','piers@example.com','2023-02-20 12:50:59.790327','2023-02-20 12:50:59.790327','$2a$12$z4DO40V2yfMAw9KEXM/dn.HLHrtJhhaKxBIYdWEf8kMIzUyercWDS',0);
INSERT INTO "categories" ("id","name","created_at","updated_at") VALUES (1,'Travel','2023-02-20 12:47:07.569892','2023-02-20 12:47:07.569892'),
 (2,'Sports','2023-02-20 12:49:20.240830','2023-02-20 12:49:20.240830');
COMMIT;
