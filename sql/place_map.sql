-- Table: base.place_types

-- DROP TABLE IF EXISTS base.place_types;

CREATE TABLE IF NOT EXISTS base.place_types
(
    place_id integer,
	type_code character varying(250)

    CONSTRAINT place_types_pkey PRIMARY KEY (place_id,type_code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS base.place_types
    OWNER to postgres;
	
	
	
-- Table: base.place_review

-- DROP TABLE IF EXISTS base.place_review;

CREATE TABLE IF NOT EXISTS base.place_review
(
	id serial,
    place_id integer,
	rate float,
	summary text,
	user_id integer,
	date date,
    CONSTRAINT place_review_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS base.place_review
    OWNER to postgres;
	
-- Table: base.place_serves

-- DROP TABLE IF EXISTS base.place_serves;

CREATE TABLE IF NOT EXISTS base.place_serves
(
    place_id integer,
	serve_id integer,
    CONSTRAINT place_types_pkey PRIMARY KEY (place_id,serve_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS base.place_serves
    OWNER to postgres;
	
	
-- Table: reference.serve_type

-- DROP TABLE IF EXISTS reference.serve_type;

CREATE TABLE IF NOT EXISTS reference.serve_type
(
    id serial,
    code character varying(250) COLLATE pg_catalog."default",
    name character varying(250) COLLATE pg_catalog."default",
    name_en character varying(250) COLLATE pg_catalog."default",
    CONSTRAINT serve_type_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS reference.serve_type
    OWNER to postgres;
	
-- Table: reference.place_time

-- DROP TABLE IF EXISTS reference.place_time;

CREATE TABLE IF NOT EXISTS reference.place_time
(
    place_id integer,
    time_text character varying(250) COLLATE pg_catalog."default",
    CONSTRAINT place_time_pkey PRIMARY KEY (place_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS reference.serve_type
    OWNER to postgres;