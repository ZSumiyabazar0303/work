-- Table: base.place

-- DROP TABLE IF EXISTS base.place;

CREATE TABLE IF NOT EXISTS base.place
(
    id serial,
    name text,
    ad_lvl_1 character varying(250),
	ad_lvl_2 character varying(250),
	ad_lvl_3 character varying(250),
	street_number character varying(250),
	street_name character varying(250),
	building character varying(250),
	floor character varying(250),
	door character varying(250),
	postal_code integer,
	neighborhood text,
	summary text,
	full_address text,
	phone character varying(250),
	place_id text,
	rate float,
	reference text,
	total_rates integer,
	wheelchair_accessible_entrance boolean,
	website text,
    CONSTRAINT place_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS base.place
    OWNER to postgres;






-- Table: base.documents
DROP TABLE IF EXISTS base.documents;

CREATE TABLE IF NOT EXISTS base.documents
(
    id serial,
    type_id integer NOT NULL,
    file_url text COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone DEFAULT now(),
    updated_at timestamp(0) without time zone DEFAULT now(),
    created_by integer,
    CONSTRAINT documents_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS base.documents
    OWNER to postgres;


-- Table: reference.document_type

-- DROP TABLE IF EXISTS reference.document_type;

CREATE TABLE IF NOT EXISTS reference.document_type
(
    id integer NOT NULL DEFAULT nextval('reference.document_type_id_seq'::regclass),
    name character varying(250) COLLATE pg_catalog."default",
    CONSTRAINT document_type_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS reference.document_type
    OWNER to postgres;



-- Table: base.place_document

-- DROP TABLE IF EXISTS base.place_document;

CREATE TABLE IF NOT EXISTS base.place_document
(
    place_id integer NOT NULL,
    document_id integer NOT NULL,
    CONSTRAINT place_document_pkey PRIMARY KEY (place_id, document_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS base.place_document
    OWNER to postgres;


-- Table: base.data_team_members

-- DROP TABLE IF EXISTS base.data_team_members;

CREATE TABLE IF NOT EXISTS base.data_team_members
(
    id serial,
    firstname text COLLATE pg_catalog."default",
    lastname text COLLATE pg_catalog."default",
	register character varying(10),
    email character varying(250) COLLATE pg_catalog."default",
    phone character varying(250) COLLATE pg_catalog."default",
    created_at timestamp(0) without time zone DEFAULT now(),
    updated_at timestamp(0) without time zone DEFAULT now(),
    created_by integer,
	team_id integer,
    CONSTRAINT data_team_members_pkey PRIMARY KEY (id),
	CONSTRAINT data_team_members_team_id_fkey FOREIGN KEY (team_id)
        REFERENCES base.data_team (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS base.data_team_members
    OWNER to postgres;