CREATE SCHEMA IF NOT EXISTS login
  AUTHORIZATION login;

CREATE TABLE IF NOT EXISTS login.flyway_schema_history
(
  installed_rank integer NOT NULL,
  version character varying(50) COLLATE pg_catalog."default",
  description character varying(200) COLLATE pg_catalog."default" NOT NULL,
  type character varying(20) COLLATE pg_catalog."default" NOT NULL,
  script character varying(1000) COLLATE pg_catalog."default" NOT NULL,
  checksum integer,
  installed_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
  installed_on timestamp without time zone NOT NULL DEFAULT now(),
  execution_time integer NOT NULL,
  success boolean NOT NULL,
  CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank)
);

ALTER TABLE IF EXISTS login.flyway_schema_history
  OWNER to login;

CREATE INDEX IF NOT EXISTS flyway_schema_history_s_idx
  ON login.flyway_schema_history USING btree
    (success ASC NULLS LAST)
  TABLESPACE pg_default;
