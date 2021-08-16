CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "roles" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "assignments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "role_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_aa6b76dac2"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_0028583927"
FOREIGN KEY ("role_id")
  REFERENCES "roles" ("id")
);
CREATE INDEX "index_assignments_on_user_id" ON "assignments" ("user_id");
CREATE INDEX "index_assignments_on_role_id" ON "assignments" ("role_id");
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "is_admin" boolean DEFAULT 0, "full_name" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE IF NOT EXISTS "categories" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "articles" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" varchar, "author" varchar, "is_hidden" boolean, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "category_id" integer);
CREATE INDEX "index_articles_on_category_id" ON "articles" ("category_id");
CREATE TABLE IF NOT EXISTS "active_storage_blobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "service_name" varchar NOT NULL, "byte_size" bigint NOT NULL, "checksum" varchar NOT NULL, "created_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key");
CREATE TABLE IF NOT EXISTS "active_storage_attachments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" integer NOT NULL, "blob_id" integer NOT NULL, "created_at" datetime NOT NULL, CONSTRAINT "fk_rails_c3b3935057"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id");
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id");
CREATE TABLE IF NOT EXISTS "active_storage_variant_records" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "blob_id" integer NOT NULL, "variation_digest" varchar NOT NULL, CONSTRAINT "fk_rails_993965df05"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE UNIQUE INDEX "index_active_storage_variant_records_uniqueness" ON "active_storage_variant_records" ("blob_id", "variation_digest");
CREATE TABLE IF NOT EXISTS "comments" ("id" integer NOT NULL PRIMARY KEY, "comment" varchar DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "article_id" integer DEFAULT NULL, "user_id" integer DEFAULT NULL, "cached_votes_total" integer DEFAULT 0, "cached_votes_score" integer DEFAULT 0, "cached_votes_up" integer DEFAULT 0, "cached_votes_down" integer DEFAULT 0, "cached_weighted_score" integer DEFAULT 0, "cached_weighted_total" integer DEFAULT 0, "cached_weighted_average" float DEFAULT 0.0, CONSTRAINT "fk_rails_3bf61a60d3"
FOREIGN KEY ("article_id")
  REFERENCES "articles" ("id")
, CONSTRAINT "fk_rails_03de2dc08c"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_comments_on_article_id" ON "comments" ("article_id");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
CREATE TABLE IF NOT EXISTS "votes" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "votable_type" varchar, "votable_id" bigint, "voter_type" varchar, "voter_id" bigint, "vote_flag" boolean, "vote_scope" varchar, "vote_weight" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE INDEX "index_votes_on_votable_type_and_votable_id" ON "votes" ("votable_type", "votable_id");
CREATE INDEX "index_votes_on_voter_type_and_voter_id" ON "votes" ("voter_type", "voter_id");
CREATE INDEX "index_votes_on_voter_id_and_voter_type_and_vote_scope" ON "votes" ("voter_id", "voter_type", "vote_scope");
CREATE INDEX "index_votes_on_votable_id_and_votable_type_and_vote_scope" ON "votes" ("votable_id", "votable_type", "vote_scope");
CREATE TABLE IF NOT EXISTS "action_text_rich_texts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "body" text, "record_type" varchar NOT NULL, "record_id" bigint NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE UNIQUE INDEX "index_action_text_rich_texts_uniqueness" ON "action_text_rich_texts" ("record_type", "record_id", "name");
CREATE TABLE IF NOT EXISTS "messages" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO "schema_migrations" (version) VALUES
('20210721152656'),
('20210722114011'),
('20210722152334'),
('20210722152442'),
('20210722153932'),
('20210727113800'),
('20210727114233'),
('20210727123142'),
('20210729093334'),
('20210802103551'),
('20210802103818'),
('20210802104254'),
('20210802104809'),
('20210802114930'),
('20210803135625'),
('20210803145636'),
('20210803165350'),
('20210812102454'),
('20210812151607');


