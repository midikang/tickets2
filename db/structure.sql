CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "flights" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "departure" datetime, "arrival" datetime, "destination" varchar, "baggage_allowance" decimal, "capacity" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "seats" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "flight_id" integer, "name" varchar, "baggage" decimal, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "menus" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "capacity" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "menu_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "menu_id" integer, "name" varchar, "url" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "blogs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "view_count" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "blog_contents" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "blog_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "blog_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "blog_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "people" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "addresses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "kind" varchar, "street" varchar, "person_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20160701032201');

INSERT INTO schema_migrations (version) VALUES ('20160701032223');

INSERT INTO schema_migrations (version) VALUES ('20160701083334');

INSERT INTO schema_migrations (version) VALUES ('20160701083344');

INSERT INTO schema_migrations (version) VALUES ('20160702151317');

INSERT INTO schema_migrations (version) VALUES ('20160702151505');

INSERT INTO schema_migrations (version) VALUES ('20160702151509');

INSERT INTO schema_migrations (version) VALUES ('20160708032244');

INSERT INTO schema_migrations (version) VALUES ('20160708032357');

