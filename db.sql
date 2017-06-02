--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE doctrine_migration_versions (
    version character varying(255) NOT NULL
);


ALTER TABLE public.doctrine_migration_versions OWNER TO ubuntu;

--
-- Name: dtb_authority_role; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_authority_role (
    authority_role_id integer NOT NULL,
    authority_id smallint NOT NULL,
    creator_id integer NOT NULL,
    deny_url text NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_authority_role OWNER TO ubuntu;

--
-- Name: dtb_authority_role_authority_role_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_authority_role_authority_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_authority_role_authority_role_id_seq OWNER TO ubuntu;

--
-- Name: dtb_base_info; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_base_info (
    id integer NOT NULL,
    country_id smallint,
    pref smallint,
    company_name text,
    company_kana text,
    zip01 text,
    zip02 text,
    zipcode text,
    addr01 text,
    addr02 text,
    tel01 text,
    tel02 text,
    tel03 text,
    fax01 text,
    fax02 text,
    fax03 text,
    business_hour text,
    email01 text,
    email02 text,
    email03 text,
    email04 text,
    shop_name text,
    shop_kana text,
    shop_name_eng text,
    update_date timestamp(0) without time zone NOT NULL,
    good_traded text,
    message text,
    latitude text,
    longitude text,
    delivery_free_amount numeric(10,0) DEFAULT NULL::numeric,
    delivery_free_quantity integer,
    option_multiple_shipping smallint DEFAULT 0,
    option_mypage_order_status_display smallint DEFAULT 1,
    nostock_hidden smallint DEFAULT 0,
    option_favorite_product smallint DEFAULT 1,
    option_product_delivery_fee smallint DEFAULT 0,
    option_product_tax_rule smallint DEFAULT 0,
    option_customer_activate smallint DEFAULT 1,
    option_remember_me smallint DEFAULT 0,
    authentication_key text
);


ALTER TABLE public.dtb_base_info OWNER TO ubuntu;

--
-- Name: dtb_base_info_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_base_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_base_info_id_seq OWNER TO ubuntu;

--
-- Name: dtb_block; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_block (
    block_id integer NOT NULL,
    device_type_id smallint,
    block_name text,
    file_name character varying(200) NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    logic_flg smallint DEFAULT 1 NOT NULL,
    deletable_flg smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.dtb_block OWNER TO ubuntu;

--
-- Name: dtb_block_block_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_block_block_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_block_block_id_seq OWNER TO ubuntu;

--
-- Name: dtb_block_position; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_block_position (
    page_id integer NOT NULL,
    target_id integer NOT NULL,
    block_id integer NOT NULL,
    block_row integer,
    anywhere smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.dtb_block_position OWNER TO ubuntu;

--
-- Name: dtb_category; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_category (
    category_id integer NOT NULL,
    parent_category_id integer,
    creator_id integer,
    category_name text NOT NULL,
    level integer NOT NULL,
    rank integer NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL,
    eng_name text
);


ALTER TABLE public.dtb_category OWNER TO ubuntu;

--
-- Name: dtb_category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_category_category_id_seq OWNER TO ubuntu;

--
-- Name: dtb_category_count; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_category_count (
    category_id integer NOT NULL,
    product_count integer NOT NULL,
    create_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_category_count OWNER TO ubuntu;

--
-- Name: dtb_category_count_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_category_count_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_category_count_category_id_seq OWNER TO ubuntu;

--
-- Name: dtb_category_total_count; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_category_total_count (
    category_id integer NOT NULL,
    product_count integer,
    create_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_category_total_count OWNER TO ubuntu;

--
-- Name: dtb_category_total_count_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_category_total_count_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_category_total_count_category_id_seq OWNER TO ubuntu;

--
-- Name: dtb_class_category; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_class_category (
    class_category_id integer NOT NULL,
    class_name_id integer NOT NULL,
    creator_id integer NOT NULL,
    name text NOT NULL,
    rank integer NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.dtb_class_category OWNER TO ubuntu;

--
-- Name: dtb_class_category_class_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_class_category_class_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_class_category_class_category_id_seq OWNER TO ubuntu;

--
-- Name: dtb_class_name; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_class_name (
    class_name_id integer NOT NULL,
    creator_id integer NOT NULL,
    name text NOT NULL,
    rank integer NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.dtb_class_name OWNER TO ubuntu;

--
-- Name: dtb_class_name_class_name_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_class_name_class_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_class_name_class_name_id_seq OWNER TO ubuntu;

--
-- Name: dtb_csv; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_csv (
    csv_id integer NOT NULL,
    csv_type smallint NOT NULL,
    creator_id integer NOT NULL,
    entity_name text NOT NULL,
    field_name text NOT NULL,
    reference_field_name text,
    disp_name text NOT NULL,
    rank smallint NOT NULL,
    enable_flg smallint NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_csv OWNER TO ubuntu;

--
-- Name: dtb_csv_csv_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_csv_csv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_csv_csv_id_seq OWNER TO ubuntu;

--
-- Name: dtb_customer; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_customer (
    customer_id integer NOT NULL,
    status smallint,
    sex smallint,
    job smallint,
    country_id smallint,
    pref smallint,
    name01 text NOT NULL,
    name02 text NOT NULL,
    kana01 text,
    kana02 text,
    company_name text,
    zip01 text,
    zip02 text,
    zipcode text,
    addr01 text,
    addr02 text,
    email text NOT NULL,
    tel01 text,
    tel02 text,
    tel03 text,
    fax01 text,
    fax02 text,
    fax03 text,
    birth timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    password text,
    salt text,
    secret_key character varying(200) NOT NULL,
    first_buy_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    last_buy_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    buy_times numeric(10,0) DEFAULT 0::numeric,
    buy_total numeric(10,0) DEFAULT 0::numeric,
    note text,
    reset_key text,
    reset_expire timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.dtb_customer OWNER TO ubuntu;

--
-- Name: dtb_customer_address; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_customer_address (
    customer_address_id integer NOT NULL,
    customer_id integer NOT NULL,
    country_id smallint,
    pref smallint,
    name01 text,
    name02 text,
    kana01 text,
    kana02 text,
    company_name text,
    zip01 text,
    zip02 text,
    zipcode text,
    addr01 text,
    addr02 text,
    tel01 text,
    tel02 text,
    tel03 text,
    fax01 text,
    fax02 text,
    fax03 text,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.dtb_customer_address OWNER TO ubuntu;

--
-- Name: dtb_customer_address_customer_address_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_customer_address_customer_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_customer_address_customer_address_id_seq OWNER TO ubuntu;

--
-- Name: dtb_customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_customer_customer_id_seq OWNER TO ubuntu;

--
-- Name: dtb_customer_favorite_product; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_customer_favorite_product (
    favorite_id integer NOT NULL,
    customer_id integer,
    product_id integer,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL,
    flag smallint DEFAULT 0
);


ALTER TABLE public.dtb_customer_favorite_product OWNER TO ubuntu;

--
-- Name: dtb_customer_favorite_product_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_customer_favorite_product_favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_customer_favorite_product_favorite_id_seq OWNER TO ubuntu;

--
-- Name: dtb_delivery; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_delivery (
    delivery_id integer NOT NULL,
    creator_id integer NOT NULL,
    product_type_id smallint NOT NULL,
    name text,
    service_name text,
    description text,
    confirm_url text,
    rank integer,
    del_flg smallint DEFAULT 0 NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_delivery OWNER TO ubuntu;

--
-- Name: dtb_delivery_date; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_delivery_date (
    date_id integer NOT NULL,
    name text,
    value smallint DEFAULT 0 NOT NULL,
    rank smallint NOT NULL
);


ALTER TABLE public.dtb_delivery_date OWNER TO ubuntu;

--
-- Name: dtb_delivery_date_date_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_delivery_date_date_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_delivery_date_date_id_seq OWNER TO ubuntu;

--
-- Name: dtb_delivery_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_delivery_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_delivery_delivery_id_seq OWNER TO ubuntu;

--
-- Name: dtb_delivery_fee; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_delivery_fee (
    fee_id integer NOT NULL,
    delivery_id integer,
    pref smallint NOT NULL,
    fee numeric(10,0) NOT NULL
);


ALTER TABLE public.dtb_delivery_fee OWNER TO ubuntu;

--
-- Name: dtb_delivery_fee_fee_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_delivery_fee_fee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_delivery_fee_fee_id_seq OWNER TO ubuntu;

--
-- Name: dtb_delivery_time; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_delivery_time (
    time_id integer NOT NULL,
    delivery_id integer,
    delivery_time text NOT NULL
);


ALTER TABLE public.dtb_delivery_time OWNER TO ubuntu;

--
-- Name: dtb_delivery_time_time_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_delivery_time_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_delivery_time_time_id_seq OWNER TO ubuntu;

--
-- Name: dtb_help; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_help (
    id integer NOT NULL,
    law_country_id smallint,
    law_pref smallint,
    customer_agreement text,
    law_company text,
    law_manager text,
    law_zip01 text,
    law_zip02 text,
    law_zipcode text,
    law_addr01 text,
    law_addr02 text,
    law_tel01 text,
    law_tel02 text,
    law_tel03 text,
    law_fax01 text,
    law_fax02 text,
    law_fax03 text,
    law_email text,
    law_url text,
    law_term01 text,
    law_term02 text,
    law_term03 text,
    law_term04 text,
    law_term05 text,
    law_term06 text,
    law_term07 text,
    law_term08 text,
    law_term09 text,
    law_term10 text,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_help OWNER TO ubuntu;

--
-- Name: dtb_help_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_help_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_help_id_seq OWNER TO ubuntu;

--
-- Name: dtb_mail_history; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_mail_history (
    send_id integer NOT NULL,
    order_id integer NOT NULL,
    template_id integer,
    creator_id integer,
    send_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    subject text,
    mail_body text
);


ALTER TABLE public.dtb_mail_history OWNER TO ubuntu;

--
-- Name: dtb_mail_history_send_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_mail_history_send_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_mail_history_send_id_seq OWNER TO ubuntu;

--
-- Name: dtb_mail_template; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_mail_template (
    template_id integer NOT NULL,
    creator_id integer NOT NULL,
    name text,
    file_name text,
    subject text,
    header text,
    footer text,
    del_flg smallint DEFAULT 0 NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_mail_template OWNER TO ubuntu;

--
-- Name: dtb_mail_template_template_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_mail_template_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_mail_template_template_id_seq OWNER TO ubuntu;

--
-- Name: dtb_member; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_member (
    member_id integer NOT NULL,
    work smallint,
    authority smallint,
    creator_id integer,
    name text,
    department text,
    login_id text NOT NULL,
    password text NOT NULL,
    salt text NOT NULL,
    rank integer NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    login_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.dtb_member OWNER TO ubuntu;

--
-- Name: dtb_member_member_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_member_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_member_member_id_seq OWNER TO ubuntu;

--
-- Name: dtb_news; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_news (
    news_id integer NOT NULL,
    creator_id integer NOT NULL,
    news_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    rank integer,
    news_title text NOT NULL,
    news_comment text,
    news_url text,
    news_select smallint DEFAULT 0 NOT NULL,
    link_method smallint DEFAULT 0 NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.dtb_news OWNER TO ubuntu;

--
-- Name: dtb_news_news_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_news_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_news_news_id_seq OWNER TO ubuntu;

--
-- Name: dtb_order; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_order (
    order_id integer NOT NULL,
    customer_id integer,
    order_country_id smallint,
    order_pref smallint,
    order_sex smallint,
    order_job smallint,
    payment_id integer,
    device_type_id smallint,
    pre_order_id text,
    message text,
    order_name01 text,
    order_name02 text,
    order_kana01 text,
    order_kana02 text,
    order_company_name text,
    order_email text,
    order_tel01 text,
    order_tel02 text,
    order_tel03 text,
    order_fax01 text,
    order_fax02 text,
    order_fax03 text,
    order_zip01 text,
    order_zip02 text,
    order_zipcode text,
    order_addr01 text,
    order_addr02 text,
    order_birth timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    subtotal numeric(10,0) DEFAULT NULL::numeric,
    discount numeric(10,0) DEFAULT 0::numeric NOT NULL,
    delivery_fee_total numeric(10,0) DEFAULT NULL::numeric,
    charge numeric(10,0) DEFAULT NULL::numeric,
    tax numeric(10,0) DEFAULT NULL::numeric,
    total numeric(10,0) DEFAULT NULL::numeric,
    payment_total numeric(10,0) DEFAULT NULL::numeric,
    payment_method text,
    note text,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    order_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    commit_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    payment_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    del_flg smallint DEFAULT 0 NOT NULL,
    status smallint
);


ALTER TABLE public.dtb_order OWNER TO ubuntu;

--
-- Name: dtb_order_detail; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_order_detail (
    order_detail_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    product_class_id integer NOT NULL,
    product_name text NOT NULL,
    product_code text,
    class_name1 text,
    class_name2 text,
    class_category_name1 text,
    class_category_name2 text,
    price numeric(10,0) DEFAULT NULL::numeric,
    quantity numeric(10,0) DEFAULT NULL::numeric,
    tax_rate numeric(10,0) DEFAULT NULL::numeric,
    tax_rule smallint
);


ALTER TABLE public.dtb_order_detail OWNER TO ubuntu;

--
-- Name: dtb_order_detail_order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_order_detail_order_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_order_detail_order_detail_id_seq OWNER TO ubuntu;

--
-- Name: dtb_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_order_order_id_seq OWNER TO ubuntu;

--
-- Name: dtb_page_layout; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_page_layout (
    page_id integer NOT NULL,
    device_type_id smallint,
    page_name text,
    url text NOT NULL,
    file_name text,
    edit_flg smallint DEFAULT 1,
    author text,
    description text,
    keyword text,
    update_url text,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    meta_robots text
);


ALTER TABLE public.dtb_page_layout OWNER TO ubuntu;

--
-- Name: dtb_page_layout_page_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_page_layout_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_page_layout_page_id_seq OWNER TO ubuntu;

--
-- Name: dtb_payment; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_payment (
    payment_id integer NOT NULL,
    creator_id integer NOT NULL,
    payment_method text,
    charge numeric(10,0) DEFAULT NULL::numeric,
    rule_max numeric(10,0) DEFAULT NULL::numeric,
    rank integer,
    fix_flg smallint DEFAULT 1,
    del_flg smallint DEFAULT 0 NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    payment_image text,
    charge_flg smallint DEFAULT 1,
    rule_min numeric(10,0) DEFAULT NULL::numeric
);


ALTER TABLE public.dtb_payment OWNER TO ubuntu;

--
-- Name: dtb_payment_option; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_payment_option (
    delivery_id integer NOT NULL,
    payment_id integer NOT NULL
);


ALTER TABLE public.dtb_payment_option OWNER TO ubuntu;

--
-- Name: dtb_payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_payment_payment_id_seq OWNER TO ubuntu;

--
-- Name: dtb_plugin; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_plugin (
    plugin_id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    class_name text NOT NULL,
    plugin_enable smallint DEFAULT 0 NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL,
    version character varying(255) NOT NULL,
    source text NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_plugin OWNER TO ubuntu;

--
-- Name: dtb_plugin_event_handler; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_plugin_event_handler (
    id integer NOT NULL,
    plugin_id integer NOT NULL,
    event character varying(255) NOT NULL,
    priority integer NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL,
    handler character varying(255) NOT NULL,
    handler_type character varying(255) NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_plugin_event_handler OWNER TO ubuntu;

--
-- Name: dtb_plugin_event_handler_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_plugin_event_handler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_plugin_event_handler_id_seq OWNER TO ubuntu;

--
-- Name: dtb_plugin_event_handler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE dtb_plugin_event_handler_id_seq OWNED BY dtb_plugin_event_handler.id;


--
-- Name: dtb_plugin_plugin_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_plugin_plugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_plugin_plugin_id_seq OWNER TO ubuntu;

--
-- Name: dtb_product; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_product (
    product_id integer NOT NULL,
    creator_id integer NOT NULL,
    status smallint,
    name text NOT NULL,
    note text,
    description_list text,
    description_detail text,
    search_word text,
    free_area text,
    del_flg smallint DEFAULT 0 NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    sell_date timestamp without time zone,
    hd_link text,
    sd_link text,
    trailer_link text,
    poster text
);


ALTER TABLE public.dtb_product OWNER TO ubuntu;

--
-- Name: dtb_product_category; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_product_category (
    product_id integer NOT NULL,
    category_id integer NOT NULL,
    rank integer NOT NULL
);


ALTER TABLE public.dtb_product_category OWNER TO ubuntu;

--
-- Name: dtb_product_class; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_product_class (
    product_class_id integer NOT NULL,
    product_id integer NOT NULL,
    product_type_id smallint NOT NULL,
    class_category_id1 integer,
    class_category_id2 integer,
    delivery_date_id integer,
    creator_id integer NOT NULL,
    product_code text,
    stock numeric(10,0) DEFAULT NULL::numeric,
    stock_unlimited smallint NOT NULL,
    sale_limit numeric(10,0) DEFAULT NULL::numeric,
    price01 numeric(10,0) DEFAULT NULL::numeric,
    price02 numeric(10,0) NOT NULL,
    delivery_fee numeric(10,0) DEFAULT NULL::numeric,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.dtb_product_class OWNER TO ubuntu;

--
-- Name: dtb_product_class_product_class_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_product_class_product_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_product_class_product_class_id_seq OWNER TO ubuntu;

--
-- Name: dtb_product_image; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_product_image (
    product_image_id integer NOT NULL,
    product_id integer NOT NULL,
    creator_id integer NOT NULL,
    file_name text NOT NULL,
    rank integer NOT NULL,
    create_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_product_image OWNER TO ubuntu;

--
-- Name: dtb_product_image_product_image_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_product_image_product_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_product_image_product_image_id_seq OWNER TO ubuntu;

--
-- Name: dtb_product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_product_product_id_seq OWNER TO ubuntu;

--
-- Name: dtb_product_stock; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_product_stock (
    product_stock_id integer NOT NULL,
    product_class_id integer,
    creator_id integer NOT NULL,
    stock numeric(10,0) DEFAULT NULL::numeric,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_product_stock OWNER TO ubuntu;

--
-- Name: dtb_product_stock_product_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_product_stock_product_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_product_stock_product_stock_id_seq OWNER TO ubuntu;

--
-- Name: dtb_product_tag; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_product_tag (
    product_tag_id integer NOT NULL,
    product_id integer NOT NULL,
    tag smallint NOT NULL,
    creator_id integer NOT NULL,
    create_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_product_tag OWNER TO ubuntu;

--
-- Name: dtb_product_tag_product_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_product_tag_product_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_product_tag_product_tag_id_seq OWNER TO ubuntu;

--
-- Name: dtb_shipment_item; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_shipment_item (
    item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    product_class_id integer NOT NULL,
    shipping_id integer NOT NULL,
    product_name text NOT NULL,
    product_code text,
    class_name1 text,
    class_name2 text,
    class_category_name1 text,
    class_category_name2 text,
    price numeric(10,0) DEFAULT NULL::numeric,
    quantity numeric(10,0) DEFAULT NULL::numeric
);


ALTER TABLE public.dtb_shipment_item OWNER TO ubuntu;

--
-- Name: dtb_shipment_item_item_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_shipment_item_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_shipment_item_item_id_seq OWNER TO ubuntu;

--
-- Name: dtb_shipping; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_shipping (
    shipping_id integer NOT NULL,
    shipping_country_id smallint,
    shipping_pref smallint,
    order_id integer,
    delivery_id integer,
    time_id integer,
    fee_id integer,
    shipping_name01 text,
    shipping_name02 text,
    shipping_kana01 text,
    shipping_kana02 text,
    shipping_company_name text,
    shipping_tel01 text,
    shipping_tel02 text,
    shipping_tel03 text,
    shipping_fax01 text,
    shipping_fax02 text,
    shipping_fax03 text,
    shipping_zip01 text,
    shipping_zip02 text,
    shipping_zipcode text,
    shipping_addr01 text,
    shipping_addr02 text,
    shipping_delivery_name text,
    shipping_delivery_time text,
    shipping_delivery_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    shipping_delivery_fee numeric(10,0) DEFAULT NULL::numeric,
    shipping_commit_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    rank integer,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.dtb_shipping OWNER TO ubuntu;

--
-- Name: dtb_shipping_shipping_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_shipping_shipping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_shipping_shipping_id_seq OWNER TO ubuntu;

--
-- Name: dtb_tax_rule; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_tax_rule (
    tax_rule_id integer NOT NULL,
    product_class_id integer,
    creator_id integer NOT NULL,
    country_id smallint,
    pref_id smallint,
    product_id integer,
    calc_rule smallint,
    tax_rate numeric(10,0) DEFAULT 8::numeric NOT NULL,
    tax_adjust numeric(10,0) DEFAULT 0::numeric NOT NULL,
    apply_date timestamp(0) without time zone NOT NULL,
    del_flg smallint DEFAULT 0 NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_tax_rule OWNER TO ubuntu;

--
-- Name: dtb_tax_rule_tax_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_tax_rule_tax_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_tax_rule_tax_rule_id_seq OWNER TO ubuntu;

--
-- Name: dtb_template; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE dtb_template (
    template_id integer NOT NULL,
    device_type_id smallint,
    template_code text NOT NULL,
    template_name text NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.dtb_template OWNER TO ubuntu;

--
-- Name: dtb_template_template_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE dtb_template_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtb_template_template_id_seq OWNER TO ubuntu;

--
-- Name: mtb_authority; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_authority (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_authority OWNER TO ubuntu;

--
-- Name: mtb_country; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_country (
    id smallint NOT NULL,
    name text,
    rank integer NOT NULL
);


ALTER TABLE public.mtb_country OWNER TO ubuntu;

--
-- Name: mtb_csv_type; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_csv_type (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_csv_type OWNER TO ubuntu;

--
-- Name: mtb_customer_order_status; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_customer_order_status (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_customer_order_status OWNER TO ubuntu;

--
-- Name: mtb_customer_status; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_customer_status (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_customer_status OWNER TO ubuntu;

--
-- Name: mtb_db; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_db (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_db OWNER TO ubuntu;

--
-- Name: mtb_device_type; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_device_type (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_device_type OWNER TO ubuntu;

--
-- Name: mtb_disp; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_disp (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_disp OWNER TO ubuntu;

--
-- Name: mtb_job; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_job (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_job OWNER TO ubuntu;

--
-- Name: mtb_order_status; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_order_status (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_order_status OWNER TO ubuntu;

--
-- Name: mtb_order_status_color; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_order_status_color (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_order_status_color OWNER TO ubuntu;

--
-- Name: mtb_page_max; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_page_max (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_page_max OWNER TO ubuntu;

--
-- Name: mtb_pref; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_pref (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_pref OWNER TO ubuntu;

--
-- Name: mtb_product_list_max; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_product_list_max (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_product_list_max OWNER TO ubuntu;

--
-- Name: mtb_product_list_order_by; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_product_list_order_by (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_product_list_order_by OWNER TO ubuntu;

--
-- Name: mtb_product_type; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_product_type (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_product_type OWNER TO ubuntu;

--
-- Name: mtb_sex; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_sex (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_sex OWNER TO ubuntu;

--
-- Name: mtb_tag; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_tag (
    id smallint NOT NULL,
    name text NOT NULL,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_tag OWNER TO ubuntu;

--
-- Name: mtb_taxrule; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_taxrule (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_taxrule OWNER TO ubuntu;

--
-- Name: mtb_work; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_work (
    id smallint NOT NULL,
    name text,
    rank smallint NOT NULL
);


ALTER TABLE public.mtb_work OWNER TO ubuntu;

--
-- Name: mtb_zip; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE mtb_zip (
    zip_id integer NOT NULL,
    zipcode text,
    state text,
    city text,
    town text
);


ALTER TABLE public.mtb_zip OWNER TO ubuntu;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_plugin_event_handler ALTER COLUMN id SET DEFAULT nextval('dtb_plugin_event_handler_id_seq'::regclass);


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY doctrine_migration_versions (version) FROM stdin;
20150602223925
20150612152108
20150613000000
20150716105942
20150716110252
20150716110827
20150716110834
20150722170707
20150728172928
20150731154721
20150804132137
20150805105421
20150806184533
20150806220909
20150806222639
20150812132454
20150821134922
20151016145841
20151022094610
20151023102323
20151110174227
20151113150301
20151116142354
20151124184644
20160114093442
20160114142234
20160216215635
20160413151321
20160823140932
20160823172700
20160908161616
20161014100031
20161108095350
20161219135621
20161219143135
20170217184500
20170421000000
201704210222
20170426000000
20170517000000
20170522000000
20170526000000
20170529000000
20170530005244
\.


--
-- Data for Name: dtb_authority_role; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_authority_role (authority_role_id, authority_id, creator_id, deny_url, create_date, update_date) FROM stdin;
\.


--
-- Name: dtb_authority_role_authority_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_authority_role_authority_role_id_seq', 1, false);


--
-- Data for Name: dtb_base_info; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_base_info (id, country_id, pref, company_name, company_kana, zip01, zip02, zipcode, addr01, addr02, tel01, tel02, tel03, fax01, fax02, fax03, business_hour, email01, email02, email03, email04, shop_name, shop_kana, shop_name_eng, update_date, good_traded, message, latitude, longitude, delivery_free_amount, delivery_free_quantity, option_multiple_shipping, option_mypage_order_status_display, nostock_hidden, option_favorite_product, option_product_delivery_fee, option_product_tax_rule, option_customer_activate, option_remember_me, authentication_key) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	lammn90@gmail.com	lammn90@gmail.com	lammn90@gmail.com	lammn90@gmail.com	Amazone	\N	\N	2017-05-17 09:39:36	\N	\N	\N	\N	\N	\N	0	1	0	1	0	0	1	0	\N
\.


--
-- Name: dtb_base_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_base_info_id_seq', 2, true);


--
-- Data for Name: dtb_block; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_block (block_id, device_type_id, block_name, file_name, create_date, update_date, logic_flg, deletable_flg) FROM stdin;
1	10	カテゴリ	category	2017-04-11 02:04:39	2017-04-11 02:04:39	1	0
2	10	カゴの中	cart	2017-04-11 02:04:39	2017-04-11 02:04:39	1	0
3	10	商品検索	search_product	2017-04-11 02:04:39	2017-04-11 02:04:39	1	0
5	10	ログイン	login	2017-04-11 02:04:39	2017-04-11 02:04:39	1	0
6	10	ロゴ	logo	2017-04-11 02:04:39	2017-04-11 02:04:39	0	0
7	10	フッター	footer	2017-04-11 02:04:39	2017-04-11 02:04:39	0	0
8	10	新着商品	new_product	2017-04-11 02:04:39	2017-04-11 02:04:39	0	0
9	10	フリーエリア	free	2017-04-11 02:04:39	2017-04-11 02:04:39	0	0
10	10	ギャラリー	garally	2017-04-11 02:04:39	2017-04-11 02:04:39	0	0
4	10	新着情報	news	2017-04-11 02:04:39	2017-05-26 23:04:53	1	0
11	10	Wordpress news	wp_news	2017-05-26 15:48:51	2017-05-26 15:48:51	1	0
\.


--
-- Name: dtb_block_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_block_block_id_seq', 11, true);


--
-- Data for Name: dtb_block_position; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_block_position (page_id, target_id, block_id, block_row, anywhere) FROM stdin;
1	2	6	1	1
1	2	2	2	1
1	2	3	3	1
1	2	5	4	1
1	2	1	5	1
1	8	8	1	0
1	8	9	3	0
1	8	10	4	0
1	9	7	1	1
1	8	11	2	0
\.


--
-- Data for Name: dtb_category; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_category (category_id, parent_category_id, creator_id, category_name, level, rank, create_date, update_date, del_flg, eng_name) FROM stdin;
10	\N	2	お買い得品	1	76	2017-04-24 15:43:26	2017-05-08 15:34:21	1	\N
9	\N	2	雑貨・小物	1	75	2017-04-24 15:43:26	2017-05-08 15:36:12	1	\N
8	\N	2	照明	1	74	2017-04-24 15:43:26	2017-05-08 15:36:36	1	\N
2	\N	1	インテリア	1	73	2017-04-11 02:04:39	2017-05-08 15:36:40	1	\N
6	\N	1	通販	1	38	2017-04-11 02:04:39	2017-05-17 23:37:12	0	tsuhan
4	1	1	アニメ1	2	61	2017-04-11 02:04:39	2017-05-18 23:46:40	0	anime
3	1	1	アイドル	2	49	2017-04-11 02:04:39	2017-05-18 23:46:48	0	idol
13	7	2	出演者	3	69	2017-05-08 10:49:11	2017-05-18 23:47:59	0	actor
15	11	2	高身長	4	71	2017-05-08 10:52:49	2017-05-18 23:48:46	0	tall
14	11	2	美少女	4	70	2017-05-08 10:50:45	2017-05-18 23:49:14	0	beautiful
27	25	2	高身長	4	51	2017-05-08 11:01:33	2017-05-18 23:50:19	0	tall
5	3	1	出版社	3	41	2017-04-11 02:04:39	2017-05-18 23:51:08	0	pulisher
36	3	2	出演者	3	44	2017-05-08 11:08:44	2017-05-18 23:51:18	0	actor
45	6	2	アニメ	2	14	2017-05-08 11:23:08	2017-05-18 23:52:33	0	anime
49	47	2	出演者	3	28	2017-05-08 11:24:25	2017-05-18 23:52:58	0	actor
51	48	2	美少女	4	33	2017-05-08 11:28:26	2017-05-18 23:53:20	0	beautiful
60	46	2	出演者	3	20	2017-05-08 11:31:49	2017-05-18 23:56:19	0	actor
61	46	2	出版社	3	17	2017-05-08 11:32:03	2017-05-18 23:56:27	0	pulisher
62	59	2	美少女	4	21	2017-05-08 11:32:24	2017-05-18 23:56:58	0	beautiful
68	61	2	Japan AV	4	16	2017-05-08 11:39:58	2017-05-18 23:57:33	0	japanav
67	61	2	Tokyo Hot	4	15	2017-05-08 11:39:50	2017-05-18 23:57:42	0	tokyohot
81	45	2	声優	3	13	2017-05-08 22:35:45	2017-05-18 23:58:10	0	voice
76	71	2	Japan AV	4	1	2017-05-08 11:42:52	2017-05-19 00:00:05	0	japanav
84	11	2	ジャンル	4	73	2017-05-26 23:50:55	2017-05-26 23:51:02	1	genre
38	37	2	学園	4	45	2017-05-08 11:19:11	2017-05-27 13:35:22	0	gakuen
43	5	2	サンライズ	4	39	2017-05-08 11:20:18	2017-05-27 13:36:02	0	sunlight
23	4	2	美少女	3	6	2017-05-08 10:59:54	2017-05-08 11:00:53	1	\N
26	25	2	美少女	4	52	2017-05-08 11:01:24	2017-05-18 23:50:12	0	beautiful
28	25	2	美尻	4	50	2017-05-08 11:01:40	2017-05-18 23:50:28	0	ass
37	3	2	ジャンル	3	48	2017-05-08 11:09:04	2017-05-18 23:50:42	0	genre
47	6	2	アイドル	2	37	2017-05-08 11:23:34	2017-05-18 23:52:18	0	idol
48	47	2	ジャンル	3	36	2017-05-08 11:24:16	2017-05-18 23:52:42	0	genre
50	47	2	出版社	3	32	2017-05-08 11:24:47	2017-05-18 23:52:52	0	pulisher
53	48	2	美尻	4	35	2017-05-08 11:28:41	2017-05-18 23:53:06	0	ass
52	48	2	高身長	4	34	2017-05-08 11:28:34	2017-05-18 23:53:12	0	tall
56	50	2	Japan AV	4	31	2017-05-08 11:29:18	2017-05-18 23:53:39	0	japanav
55	50	2	Dream Plex	4	30	2017-05-08 11:29:10	2017-05-18 23:53:48	0	dreamplex
54	50	2	Tokyo Hot	4	29	2017-05-08 11:29:00	2017-05-18 23:53:56	0	tokyohot
20	12	2	Air Control	4	62	2017-05-08 10:57:51	2017-05-18 23:55:50	0	aircontrol
63	59	2	高身長	4	22	2017-05-08 11:38:17	2017-05-18 23:56:49	0	tall
65	60	2	JULIA直美	4	18	2017-05-08 11:39:04	2017-05-18 23:57:19	0	julia
82	81	2	声優A	4	11	2017-05-08 22:35:57	2017-05-18 23:58:36	0	voicea
74	70	2	JULIA直美	4	5	2017-05-08 11:42:31	2017-05-18 23:59:37	0	julia
77	71	2	USA	4	2	2017-05-08 11:42:59	2017-05-18 23:59:57	0	usa
31	29	2	マリア小沢	4	56	2017-05-08 11:02:37	2017-05-27 13:32:30	0	maria_ozawa
35	30	2	Dream Room	4	54	2017-05-08 11:03:59	2017-05-27 13:32:53	0	dream_room
34	30	2	TokyoHot	4	53	2017-05-08 11:03:47	2017-05-27 13:33:04	0	tokyo_hot
40	37	2	感動	4	47	2017-05-08 11:19:28	2017-05-27 13:35:09	0	doukan
39	37	2	ファンタジー	4	46	2017-05-08 11:19:21	2017-05-27 13:35:15	0	fantasi
42	36	2	空青い	4	43	2017-05-08 11:20:04	2017-05-27 13:35:33	0	aoi
41	36	2	川村JULIA	4	42	2017-05-08 11:19:53	2017-05-27 13:35:40	0	kawamura
44	5	2	Tokyo Hot	4	40	2017-05-08 11:20:37	2017-05-27 13:35:50	0	hothot
80	79	2	声優A	4	34	2017-05-08 22:35:16	2017-05-08 22:35:25	1	\N
24	4	2	高身長	3	5	2017-05-08 11:00:04	2017-05-08 11:01:00	1	\N
71	45	2	出版社	3	4	2017-05-08 11:40:29	2017-05-08 11:40:41	0	\N
12	7	2	出版社	3	65	2017-05-08 10:47:34	2017-05-18 23:48:08	0	pulisher
16	11	2	美尻	4	72	2017-05-08 10:53:49	2017-05-18 23:48:37	0	ass
25	4	2	ジャンル	3	60	2017-05-08 11:00:25	2017-05-18 23:49:31	0	genre
29	4	2	出演者	3	59	2017-05-08 11:02:09	2017-05-18 23:49:49	0	actor
30	4	2	出版社	3	55	2017-05-08 11:02:18	2017-05-18 23:49:58	0	pulisher
19	13	2	川崎あや	4	68	2017-05-08 10:55:26	2017-05-18 23:54:59	0	kawasaki
18	13	2	足立由美	4	67	2017-05-08 10:55:15	2017-05-18 23:55:07	0	adachi
17	13	2	マリア小沢	4	66	2017-05-08 10:55:00	2017-05-18 23:55:15	0	ozawa
22	12	2	DreamHouse	4	64	2017-05-08 10:58:21	2017-05-18 23:55:29	0	dreamhouse
21	12	2	リバプール	4	63	2017-05-08 10:58:08	2017-05-18 23:55:40	0	riba
59	46	2	ジャンル	3	24	2017-05-08 11:31:33	2017-05-18 23:56:10	0	genre
66	60	2	マリア小沢	4	19	2017-05-08 11:39:10	2017-05-18 23:57:11	0	ozawa
83	81	2	声優B	4	12	2017-05-08 22:36:02	2017-05-18 23:58:28	0	voiceb
73	69	2	高身長	4	9	2017-05-08 11:41:03	2017-05-18 23:59:04	0	tall
72	69	2	美少女	4	8	2017-05-08 11:40:55	2017-05-18 23:59:15	0	beautiful
1	\N	1	ストリーミング動画	1	75	2017-04-11 02:04:39	2017-05-17 23:36:23	0	streaming
7	1	2	グラビア	2	74	2017-04-24 15:43:26	2017-05-18 23:46:29	0	gravia
11	7	2	ジャンル	3	73	2017-05-08 10:47:17	2017-05-18 23:47:50	0	genre
33	29	2	JULIA直美	4	58	2017-05-08 11:03:20	2017-05-27 13:31:27	0	julia
32	29	2	田中由美	4	57	2017-05-08 11:03:04	2017-05-27 13:32:08	0	tanaka
79	47	2	声優	3	34	2017-05-08 22:35:00	2017-05-08 22:35:34	1	\N
70	45	2	出演者	3	7	2017-05-08 11:40:21	2017-05-08 11:40:41	0	\N
46	6	2	グラビア	2	25	2017-05-08 11:23:08	2017-05-18 23:52:27	0	gravia
58	49	2	小沢マリア	4	27	2017-05-08 11:29:57	2017-05-18 23:54:10	0	ozawa
57	49	2	JULIA直美	4	26	2017-05-08 11:29:37	2017-05-18 23:54:19	0	julia
64	59	2	美尻	4	23	2017-05-08 11:38:28	2017-05-18 23:56:40	0	ass
69	45	2	ジャンル	3	10	2017-05-08 11:40:11	2017-05-18 23:58:56	0	genre
75	70	2	田中由美	4	6	2017-05-08 11:42:38	2017-05-18 23:59:28	0	tanaka
78	71	2	Korean	4	3	2017-05-08 11:43:05	2017-05-18 23:59:51	0	korea
\.


--
-- Name: dtb_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_category_category_id_seq', 84, true);


--
-- Data for Name: dtb_category_count; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_category_count (category_id, product_count, create_date) FROM stdin;
1	1	2017-04-11 02:04:39
4	1	2017-04-11 02:04:39
5	1	2017-04-11 02:04:39
6	2	2017-04-11 02:04:39
\.


--
-- Name: dtb_category_count_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_category_count_category_id_seq', 1, false);


--
-- Data for Name: dtb_category_total_count; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_category_total_count (category_id, product_count, create_date) FROM stdin;
1	2	2017-04-11 02:04:39
3	2	2017-04-11 02:04:39
4	1	2017-04-11 02:04:39
5	1	2017-04-11 02:04:39
6	2	2017-04-11 02:04:39
\.


--
-- Name: dtb_category_total_count_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_category_total_count_category_id_seq', 1, false);


--
-- Data for Name: dtb_class_category; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_class_category (class_category_id, class_name_id, creator_id, name, rank, create_date, update_date, del_flg) FROM stdin;
1	1	1	金	1	2017-04-11 02:04:39	2017-04-11 02:04:39	0
2	1	1	銀	2	2017-04-11 02:04:39	2017-04-11 02:04:39	0
3	1	1	プラチナ	3	2017-04-11 02:04:39	2017-04-11 02:04:39	0
4	2	1	120mm	1	2017-04-11 02:04:39	2017-04-11 02:04:39	0
5	2	1	170mm	2	2017-04-11 02:04:39	2017-04-11 02:04:39	0
6	2	1	150cm	3	2017-04-11 02:04:39	2017-04-11 02:04:39	0
\.


--
-- Name: dtb_class_category_class_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_class_category_class_category_id_seq', 6, true);


--
-- Data for Name: dtb_class_name; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_class_name (class_name_id, creator_id, name, rank, create_date, update_date, del_flg) FROM stdin;
1	1	材質	1	2017-04-11 02:04:39	2017-04-11 02:04:39	0
2	1	サイズ	2	2017-04-11 02:04:39	2017-04-11 02:04:39	0
\.


--
-- Name: dtb_class_name_class_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_class_name_class_name_id_seq', 2, true);


--
-- Data for Name: dtb_csv; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_csv (csv_id, csv_type, creator_id, entity_name, field_name, reference_field_name, disp_name, rank, enable_flg, create_date, update_date) FROM stdin;
1	1	1	Eccube\\\\Entity\\\\Product	id	\N	商品ID	1	1	2017-04-11 02:04:48	2017-04-11 02:04:48
2	1	1	Eccube\\\\Entity\\\\Product	Status	id	公開ステータス(ID)	2	1	2017-04-11 02:04:48	2017-04-11 02:04:48
3	1	1	Eccube\\\\Entity\\\\Product	Status	name	公開ステータス(名称)	3	1	2017-04-11 02:04:48	2017-04-11 02:04:48
4	1	1	Eccube\\\\Entity\\\\Product	name	\N	商品名	4	1	2017-04-11 02:04:48	2017-04-11 02:04:48
5	1	1	Eccube\\\\Entity\\\\Product	note	\N	ショップ用メモ欄	5	1	2017-04-11 02:04:48	2017-04-11 02:04:48
6	1	1	Eccube\\\\Entity\\\\Product	description_list	\N	商品説明(一覧)	6	1	2017-04-11 02:04:48	2017-04-11 02:04:48
7	1	1	Eccube\\\\Entity\\\\Product	description_detail	\N	商品説明(詳細)	7	1	2017-04-11 02:04:48	2017-04-11 02:04:48
8	1	1	Eccube\\\\Entity\\\\Product	search_word	\N	検索ワード	8	1	2017-04-11 02:04:48	2017-04-11 02:04:48
9	1	1	Eccube\\\\Entity\\\\Product	free_area	\N	フリーエリア	9	1	2017-04-11 02:04:48	2017-04-11 02:04:48
10	1	1	Eccube\\\\Entity\\\\ProductClass	id	\N	商品規格ID	10	1	2017-04-11 02:04:48	2017-04-11 02:04:48
11	1	1	Eccube\\\\Entity\\\\ProductClass	ProductType	id	商品種別(ID)	11	1	2017-04-11 02:04:48	2017-04-11 02:04:48
12	1	1	Eccube\\\\Entity\\\\ProductClass	ProductType	name	商品種別(名称)	12	1	2017-04-11 02:04:48	2017-04-11 02:04:48
13	1	1	Eccube\\\\Entity\\\\ProductClass	ClassCategory1	id	規格分類1(ID)	13	1	2017-04-11 02:04:48	2017-04-11 02:04:48
14	1	1	Eccube\\\\Entity\\\\ProductClass	ClassCategory1	name	規格分類1(名称)	14	1	2017-04-11 02:04:48	2017-04-11 02:04:48
15	1	1	Eccube\\\\Entity\\\\ProductClass	ClassCategory2	id	規格分類2(ID)	15	1	2017-04-11 02:04:48	2017-04-11 02:04:48
16	1	1	Eccube\\\\Entity\\\\ProductClass	ClassCategory2	name	規格分類2(名称)	16	1	2017-04-11 02:04:48	2017-04-11 02:04:48
17	1	1	Eccube\\\\Entity\\\\ProductClass	DeliveryDate	id	発送日目安(ID)	17	1	2017-04-11 02:04:48	2017-04-11 02:04:48
18	1	1	Eccube\\\\Entity\\\\ProductClass	DeliveryDate	name	発送日目安(名称)	18	1	2017-04-11 02:04:48	2017-04-11 02:04:48
19	1	1	Eccube\\\\Entity\\\\ProductClass	code	\N	商品コード	19	1	2017-04-11 02:04:48	2017-04-11 02:04:48
20	1	1	Eccube\\\\Entity\\\\ProductClass	stock	\N	在庫数	20	1	2017-04-11 02:04:48	2017-04-11 02:04:48
21	1	1	Eccube\\\\Entity\\\\ProductClass	stock_unlimited	\N	在庫数無制限フラグ	21	1	2017-04-11 02:04:48	2017-04-11 02:04:48
22	1	1	Eccube\\\\Entity\\\\ProductClass	sale_limit	\N	販売制限数	22	1	2017-04-11 02:04:48	2017-04-11 02:04:48
23	1	1	Eccube\\\\Entity\\\\ProductClass	price01	\N	通常価格	23	1	2017-04-11 02:04:48	2017-04-11 02:04:48
24	1	1	Eccube\\\\Entity\\\\ProductClass	price02	\N	販売価格	24	1	2017-04-11 02:04:48	2017-04-11 02:04:48
25	1	1	Eccube\\\\Entity\\\\ProductClass	delivery_fee	\N	送料	25	0	2017-04-11 02:04:48	2017-04-11 02:04:48
26	1	1	Eccube\\\\Entity\\\\Product	ProductImage	file_name	商品画像	26	1	2017-04-11 02:04:48	2017-04-11 02:04:48
27	1	1	Eccube\\\\Entity\\\\Product	ProductCategories	category_id	商品カテゴリ(ID)	27	1	2017-04-11 02:04:48	2017-04-11 02:04:48
28	1	1	Eccube\\\\Entity\\\\Product	ProductCategories	Category	商品カテゴリ(名称)	28	1	2017-04-11 02:04:48	2017-04-11 02:04:48
29	2	1	Eccube\\\\Entity\\\\Customer	id	\N	会員ID	1	1	2017-04-11 02:04:48	2017-04-11 02:04:48
30	2	1	Eccube\\\\Entity\\\\Customer	name01	\N	お名前(姓)	2	1	2017-04-11 02:04:48	2017-04-11 02:04:48
31	2	1	Eccube\\\\Entity\\\\Customer	name02	\N	お名前(名)	3	1	2017-04-11 02:04:48	2017-04-11 02:04:48
32	2	1	Eccube\\\\Entity\\\\Customer	kana01	\N	お名前(セイ)	4	1	2017-04-11 02:04:48	2017-04-11 02:04:48
33	2	1	Eccube\\\\Entity\\\\Customer	kana02	\N	お名前(メイ)	5	1	2017-04-11 02:04:48	2017-04-11 02:04:48
34	2	1	Eccube\\\\Entity\\\\Customer	company_name	\N	会社名	6	1	2017-04-11 02:04:48	2017-04-11 02:04:48
35	2	1	Eccube\\\\Entity\\\\Customer	zip01	\N	郵便番号1	7	1	2017-04-11 02:04:48	2017-04-11 02:04:48
36	2	1	Eccube\\\\Entity\\\\Customer	zip02	\N	郵便番号2	8	1	2017-04-11 02:04:48	2017-04-11 02:04:48
37	2	1	Eccube\\\\Entity\\\\Customer	Pref	id	都道府県(ID)	9	1	2017-04-11 02:04:48	2017-04-11 02:04:48
38	2	1	Eccube\\\\Entity\\\\Customer	Pref	name	都道府県(名称)	10	1	2017-04-11 02:04:48	2017-04-11 02:04:48
39	2	1	Eccube\\\\Entity\\\\Customer	addr01	\N	住所1	11	1	2017-04-11 02:04:48	2017-04-11 02:04:48
40	2	1	Eccube\\\\Entity\\\\Customer	addr02	\N	住所2	12	1	2017-04-11 02:04:48	2017-04-11 02:04:48
41	2	1	Eccube\\\\Entity\\\\Customer	email	\N	メールアドレス	13	1	2017-04-11 02:04:48	2017-04-11 02:04:48
42	2	1	Eccube\\\\Entity\\\\Customer	tel01	\N	TEL1	14	1	2017-04-11 02:04:48	2017-04-11 02:04:48
43	2	1	Eccube\\\\Entity\\\\Customer	tel02	\N	TEL2	15	1	2017-04-11 02:04:48	2017-04-11 02:04:48
44	2	1	Eccube\\\\Entity\\\\Customer	tel03	\N	TEL3	16	1	2017-04-11 02:04:48	2017-04-11 02:04:48
45	2	1	Eccube\\\\Entity\\\\Customer	fax01	\N	FAX1	17	1	2017-04-11 02:04:48	2017-04-11 02:04:48
46	2	1	Eccube\\\\Entity\\\\Customer	fax02	\N	FAX2	18	1	2017-04-11 02:04:48	2017-04-11 02:04:48
47	2	1	Eccube\\\\Entity\\\\Customer	fax03	\N	FAX3	19	1	2017-04-11 02:04:48	2017-04-11 02:04:48
48	2	1	Eccube\\\\Entity\\\\Customer	Sex	id	性別(ID)	20	1	2017-04-11 02:04:48	2017-04-11 02:04:48
49	2	1	Eccube\\\\Entity\\\\Customer	Sex	name	性別(名称)	21	1	2017-04-11 02:04:48	2017-04-11 02:04:48
50	2	1	Eccube\\\\Entity\\\\Customer	Job	id	職業(ID)	22	1	2017-04-11 02:04:48	2017-04-11 02:04:48
51	2	1	Eccube\\\\Entity\\\\Customer	Job	name	職業(名称)	23	1	2017-04-11 02:04:48	2017-04-11 02:04:48
52	2	1	Eccube\\\\Entity\\\\Customer	birth	\N	誕生日	24	1	2017-04-11 02:04:48	2017-04-11 02:04:48
53	2	1	Eccube\\\\Entity\\\\Customer	first_buy_date	\N	初回購入日	25	1	2017-04-11 02:04:48	2017-04-11 02:04:48
54	2	1	Eccube\\\\Entity\\\\Customer	last_buy_date	\N	最終購入日	26	1	2017-04-11 02:04:48	2017-04-11 02:04:48
55	2	1	Eccube\\\\Entity\\\\Customer	buy_times	\N	購入回数	27	1	2017-04-11 02:04:48	2017-04-11 02:04:48
56	2	1	Eccube\\\\Entity\\\\Customer	note	\N	ショップ用メモ欄	28	1	2017-04-11 02:04:48	2017-04-11 02:04:48
57	2	1	Eccube\\\\Entity\\\\Customer	Status	id	会員ステータス(ID)	29	1	2017-04-11 02:04:48	2017-04-11 02:04:48
58	2	1	Eccube\\\\Entity\\\\Customer	Status	name	会員ステータス(名称)	30	1	2017-04-11 02:04:48	2017-04-11 02:04:48
59	2	1	Eccube\\\\Entity\\\\Customer	create_date	\N	登録日	31	1	2017-04-11 02:04:48	2017-04-11 02:04:48
60	2	1	Eccube\\\\Entity\\\\Customer	update_date	\N	更新日	32	1	2017-04-11 02:04:48	2017-04-11 02:04:48
61	3	1	Eccube\\\\Entity\\\\Order	id	\N	注文ID	1	1	2017-04-11 02:04:48	2017-04-11 02:04:48
62	3	1	Eccube\\\\Entity\\\\Order	Customer	id	会員ID	2	1	2017-04-11 02:04:48	2017-04-11 02:04:48
63	3	1	Eccube\\\\Entity\\\\Order	name01	\N	お名前(姓)	3	1	2017-04-11 02:04:48	2017-04-11 02:04:48
64	3	1	Eccube\\\\Entity\\\\Order	name02	\N	お名前(名)	4	1	2017-04-11 02:04:48	2017-04-11 02:04:48
65	3	1	Eccube\\\\Entity\\\\Order	kana01	\N	お名前(セイ)	5	1	2017-04-11 02:04:48	2017-04-11 02:04:48
66	3	1	Eccube\\\\Entity\\\\Order	kana02	\N	お名前(メイ)	6	1	2017-04-11 02:04:48	2017-04-11 02:04:48
67	3	1	Eccube\\\\Entity\\\\Order	company_name	\N	会社名	7	1	2017-04-11 02:04:48	2017-04-11 02:04:48
68	3	1	Eccube\\\\Entity\\\\Order	zip01	\N	郵便番号1	8	1	2017-04-11 02:04:48	2017-04-11 02:04:48
69	3	1	Eccube\\\\Entity\\\\Order	zip02	\N	郵便番号2	9	1	2017-04-11 02:04:48	2017-04-11 02:04:48
70	3	1	Eccube\\\\Entity\\\\Order	Pref	id	都道府県(ID)	10	1	2017-04-11 02:04:48	2017-04-11 02:04:48
71	3	1	Eccube\\\\Entity\\\\Order	Pref	name	都道府県(名称)	11	1	2017-04-11 02:04:48	2017-04-11 02:04:48
72	3	1	Eccube\\\\Entity\\\\Order	addr01	\N	住所1	12	1	2017-04-11 02:04:48	2017-04-11 02:04:48
73	3	1	Eccube\\\\Entity\\\\Order	addr02	\N	住所2	13	1	2017-04-11 02:04:48	2017-04-11 02:04:48
74	3	1	Eccube\\\\Entity\\\\Order	email	\N	メールアドレス	14	1	2017-04-11 02:04:48	2017-04-11 02:04:48
75	3	1	Eccube\\\\Entity\\\\Order	tel01	\N	TEL1	15	1	2017-04-11 02:04:48	2017-04-11 02:04:48
76	3	1	Eccube\\\\Entity\\\\Order	tel02	\N	TEL2	16	1	2017-04-11 02:04:48	2017-04-11 02:04:48
77	3	1	Eccube\\\\Entity\\\\Order	tel03	\N	TEL3	17	1	2017-04-11 02:04:48	2017-04-11 02:04:48
78	3	1	Eccube\\\\Entity\\\\Order	fax01	\N	FAX1	18	1	2017-04-11 02:04:48	2017-04-11 02:04:48
79	3	1	Eccube\\\\Entity\\\\Order	fax02	\N	FAX2	19	1	2017-04-11 02:04:48	2017-04-11 02:04:48
80	3	1	Eccube\\\\Entity\\\\Order	fax03	\N	FAX3	20	1	2017-04-11 02:04:48	2017-04-11 02:04:48
81	3	1	Eccube\\\\Entity\\\\Order	Sex	id	性別(ID)	21	1	2017-04-11 02:04:48	2017-04-11 02:04:48
82	3	1	Eccube\\\\Entity\\\\Order	Sex	name	性別(名称)	22	1	2017-04-11 02:04:48	2017-04-11 02:04:48
83	3	1	Eccube\\\\Entity\\\\Order	Job	id	職業(ID)	23	1	2017-04-11 02:04:48	2017-04-11 02:04:48
84	3	1	Eccube\\\\Entity\\\\Order	Job	name	職業(名称)	24	1	2017-04-11 02:04:48	2017-04-11 02:04:48
85	3	1	Eccube\\\\Entity\\\\Order	birth	\N	誕生日	25	1	2017-04-11 02:04:48	2017-04-11 02:04:48
86	3	1	Eccube\\\\Entity\\\\Order	note	\N	ショップ用メモ欄	26	1	2017-04-11 02:04:48	2017-04-11 02:04:48
87	3	1	Eccube\\\\Entity\\\\Order	subtotal	\N	小計	27	1	2017-04-11 02:04:48	2017-04-11 02:04:48
88	3	1	Eccube\\\\Entity\\\\Order	discount	\N	値引き	28	1	2017-04-11 02:04:48	2017-04-11 02:04:48
89	3	1	Eccube\\\\Entity\\\\Order	delivery_fee_total	\N	送料	29	1	2017-04-11 02:04:48	2017-04-11 02:04:48
90	3	1	Eccube\\\\Entity\\\\Order	tax	\N	税金	30	1	2017-04-11 02:04:48	2017-04-11 02:04:48
91	3	1	Eccube\\\\Entity\\\\Order	total	\N	合計	31	1	2017-04-11 02:04:48	2017-04-11 02:04:48
92	3	1	Eccube\\\\Entity\\\\Order	payment_total	\N	支払合計	32	1	2017-04-11 02:04:48	2017-04-11 02:04:48
93	3	1	Eccube\\\\Entity\\\\Order	OrderStatus	id	対応状況(ID)	33	1	2017-04-11 02:04:48	2017-04-11 02:04:48
94	3	1	Eccube\\\\Entity\\\\Order	OrderStatus	name	対応状況(名称)	34	1	2017-04-11 02:04:48	2017-04-11 02:04:48
95	3	1	Eccube\\\\Entity\\\\Order	Payment	id	支払方法(ID)	35	1	2017-04-11 02:04:48	2017-04-11 02:04:48
96	3	1	Eccube\\\\Entity\\\\Order	payment_method	\N	支払方法(名称)	36	1	2017-04-11 02:04:48	2017-04-11 02:04:48
97	3	1	Eccube\\\\Entity\\\\Order	order_date	\N	受注日	37	1	2017-04-11 02:04:48	2017-04-11 02:04:48
98	3	1	Eccube\\\\Entity\\\\Order	payment_date	\N	入金日	38	1	2017-04-11 02:04:48	2017-04-11 02:04:48
99	3	1	Eccube\\\\Entity\\\\Order	commit_date	\N	発送日	39	1	2017-04-11 02:04:48	2017-04-11 02:04:48
100	3	1	Eccube\\\\Entity\\\\OrderDetail	id	\N	注文詳細ID	40	1	2017-04-11 02:04:48	2017-04-11 02:04:48
101	3	1	Eccube\\\\Entity\\\\OrderDetail	Product	id	商品ID	41	1	2017-04-11 02:04:48	2017-04-11 02:04:48
102	3	1	Eccube\\\\Entity\\\\OrderDetail	ProductClass	id	商品規格ID	42	1	2017-04-11 02:04:48	2017-04-11 02:04:48
103	3	1	Eccube\\\\Entity\\\\OrderDetail	product_name	\N	商品名	43	1	2017-04-11 02:04:48	2017-04-11 02:04:48
104	3	1	Eccube\\\\Entity\\\\OrderDetail	product_code	\N	商品コード	44	1	2017-04-11 02:04:48	2017-04-11 02:04:48
105	3	1	Eccube\\\\Entity\\\\OrderDetail	class_name1	\N	規格名1	45	1	2017-04-11 02:04:48	2017-04-11 02:04:48
106	3	1	Eccube\\\\Entity\\\\OrderDetail	class_name2	\N	規格名2	46	1	2017-04-11 02:04:48	2017-04-11 02:04:48
107	3	1	Eccube\\\\Entity\\\\OrderDetail	class_category_name1	\N	規格分類名1	47	1	2017-04-11 02:04:48	2017-04-11 02:04:48
108	3	1	Eccube\\\\Entity\\\\OrderDetail	class_category_name2	\N	規格分類名2	48	1	2017-04-11 02:04:48	2017-04-11 02:04:48
109	3	1	Eccube\\\\Entity\\\\OrderDetail	price	\N	価格	49	1	2017-04-11 02:04:48	2017-04-11 02:04:48
110	3	1	Eccube\\\\Entity\\\\OrderDetail	quantity	\N	個数	50	1	2017-04-11 02:04:48	2017-04-11 02:04:48
111	3	1	Eccube\\\\Entity\\\\OrderDetail	tax_rate	\N	税率	51	1	2017-04-11 02:04:48	2017-04-11 02:04:48
112	3	1	Eccube\\\\Entity\\\\OrderDetail	tax_rule	\N	税率ルール(ID)	52	1	2017-04-11 02:04:48	2017-04-11 02:04:48
113	4	1	Eccube\\\\Entity\\\\Order	id	\N	注文ID	1	1	2017-04-11 02:04:48	2017-04-11 02:04:48
114	4	1	Eccube\\\\Entity\\\\Order	Customer	id	会員ID	2	1	2017-04-11 02:04:48	2017-04-11 02:04:48
115	4	1	Eccube\\\\Entity\\\\Order	name01	\N	お名前(姓)	3	1	2017-04-11 02:04:48	2017-04-11 02:04:48
116	4	1	Eccube\\\\Entity\\\\Order	name02	\N	お名前(名)	4	1	2017-04-11 02:04:48	2017-04-11 02:04:48
117	4	1	Eccube\\\\Entity\\\\Order	kana01	\N	お名前(セイ)	5	1	2017-04-11 02:04:48	2017-04-11 02:04:48
118	4	1	Eccube\\\\Entity\\\\Order	kana02	\N	お名前(メイ)	6	1	2017-04-11 02:04:48	2017-04-11 02:04:48
119	4	1	Eccube\\\\Entity\\\\Order	company_name	\N	会社名	7	1	2017-04-11 02:04:48	2017-04-11 02:04:48
120	4	1	Eccube\\\\Entity\\\\Order	zip01	\N	郵便番号1	8	1	2017-04-11 02:04:48	2017-04-11 02:04:48
121	4	1	Eccube\\\\Entity\\\\Order	zip02	\N	郵便番号2	9	1	2017-04-11 02:04:48	2017-04-11 02:04:48
122	4	1	Eccube\\\\Entity\\\\Order	Pref	id	都道府県(ID)	10	1	2017-04-11 02:04:48	2017-04-11 02:04:48
123	4	1	Eccube\\\\Entity\\\\Order	Pref	name	都道府県(名称)	11	1	2017-04-11 02:04:48	2017-04-11 02:04:48
124	4	1	Eccube\\\\Entity\\\\Order	addr01	\N	住所1	12	1	2017-04-11 02:04:48	2017-04-11 02:04:48
125	4	1	Eccube\\\\Entity\\\\Order	addr02	\N	住所2	13	1	2017-04-11 02:04:48	2017-04-11 02:04:48
126	4	1	Eccube\\\\Entity\\\\Order	email	\N	メールアドレス	14	1	2017-04-11 02:04:48	2017-04-11 02:04:48
127	4	1	Eccube\\\\Entity\\\\Order	tel01	\N	TEL1	15	1	2017-04-11 02:04:48	2017-04-11 02:04:48
128	4	1	Eccube\\\\Entity\\\\Order	tel02	\N	TEL2	16	1	2017-04-11 02:04:48	2017-04-11 02:04:48
129	4	1	Eccube\\\\Entity\\\\Order	tel03	\N	TEL3	17	1	2017-04-11 02:04:48	2017-04-11 02:04:48
130	4	1	Eccube\\\\Entity\\\\Order	fax01	\N	FAX1	18	1	2017-04-11 02:04:48	2017-04-11 02:04:48
131	4	1	Eccube\\\\Entity\\\\Order	fax02	\N	FAX2	19	1	2017-04-11 02:04:48	2017-04-11 02:04:48
132	4	1	Eccube\\\\Entity\\\\Order	fax03	\N	FAX3	20	1	2017-04-11 02:04:48	2017-04-11 02:04:48
133	4	1	Eccube\\\\Entity\\\\Order	Sex	id	性別(ID)	21	1	2017-04-11 02:04:48	2017-04-11 02:04:48
134	4	1	Eccube\\\\Entity\\\\Order	Sex	name	性別(名称)	22	1	2017-04-11 02:04:48	2017-04-11 02:04:48
135	4	1	Eccube\\\\Entity\\\\Order	Job	id	職業(ID)	23	1	2017-04-11 02:04:48	2017-04-11 02:04:48
136	4	1	Eccube\\\\Entity\\\\Order	Job	name	職業(名称)	24	1	2017-04-11 02:04:48	2017-04-11 02:04:48
137	4	1	Eccube\\\\Entity\\\\Order	birth	\N	誕生日	25	1	2017-04-11 02:04:48	2017-04-11 02:04:48
138	4	1	Eccube\\\\Entity\\\\Order	note	\N	ショップ用メモ欄	26	1	2017-04-11 02:04:48	2017-04-11 02:04:48
139	4	1	Eccube\\\\Entity\\\\Order	subtotal	\N	小計	27	1	2017-04-11 02:04:48	2017-04-11 02:04:48
140	4	1	Eccube\\\\Entity\\\\Order	discount	\N	値引き	28	1	2017-04-11 02:04:48	2017-04-11 02:04:48
141	4	1	Eccube\\\\Entity\\\\Order	delivery_fee_total	\N	送料	29	1	2017-04-11 02:04:48	2017-04-11 02:04:48
142	4	1	Eccube\\\\Entity\\\\Order	tax	\N	税金	30	1	2017-04-11 02:04:48	2017-04-11 02:04:48
143	4	1	Eccube\\\\Entity\\\\Order	total	\N	合計	31	1	2017-04-11 02:04:48	2017-04-11 02:04:48
144	4	1	Eccube\\\\Entity\\\\Order	payment_total	\N	支払合計	32	1	2017-04-11 02:04:48	2017-04-11 02:04:48
145	4	1	Eccube\\\\Entity\\\\Order	OrderStatus	id	対応状況(ID)	33	1	2017-04-11 02:04:48	2017-04-11 02:04:48
146	4	1	Eccube\\\\Entity\\\\Order	OrderStatus	name	対応状況(名称)	34	1	2017-04-11 02:04:48	2017-04-11 02:04:48
147	4	1	Eccube\\\\Entity\\\\Order	Payment	id	支払方法(ID)	35	1	2017-04-11 02:04:48	2017-04-11 02:04:48
148	4	1	Eccube\\\\Entity\\\\Order	payment_method	\N	支払方法(名称)	36	1	2017-04-11 02:04:48	2017-04-11 02:04:48
149	4	1	Eccube\\\\Entity\\\\Order	order_date	\N	受注日	37	1	2017-04-11 02:04:48	2017-04-11 02:04:48
150	4	1	Eccube\\\\Entity\\\\Order	payment_date	\N	入金日	38	1	2017-04-11 02:04:48	2017-04-11 02:04:48
151	4	1	Eccube\\\\Entity\\\\Order	commit_date	\N	発送日	39	1	2017-04-11 02:04:48	2017-04-11 02:04:48
152	4	1	Eccube\\\\Entity\\\\Shipping	id	\N	配送ID	40	1	2017-04-11 02:04:48	2017-04-11 02:04:48
153	4	1	Eccube\\\\Entity\\\\Shipping	name01	\N	配送先_お名前(姓)	41	1	2017-04-11 02:04:48	2017-04-11 02:04:48
154	4	1	Eccube\\\\Entity\\\\Shipping	name02	\N	配送先_お名前(名)	42	1	2017-04-11 02:04:48	2017-04-11 02:04:48
155	4	1	Eccube\\\\Entity\\\\Shipping	kana01	\N	配送先_お名前(セイ)	43	1	2017-04-11 02:04:48	2017-04-11 02:04:48
156	4	1	Eccube\\\\Entity\\\\Shipping	kana02	\N	配送先_お名前(メイ)	44	1	2017-04-11 02:04:48	2017-04-11 02:04:48
157	4	1	Eccube\\\\Entity\\\\Shipping	company_name	\N	配送先_会社名	45	1	2017-04-11 02:04:48	2017-04-11 02:04:48
158	4	1	Eccube\\\\Entity\\\\Shipping	zip01	\N	配送先_郵便番号1	46	1	2017-04-11 02:04:48	2017-04-11 02:04:48
159	4	1	Eccube\\\\Entity\\\\Shipping	zip02	\N	配送先_郵便番号2	47	1	2017-04-11 02:04:48	2017-04-11 02:04:48
160	4	1	Eccube\\\\Entity\\\\Shipping	Pref	id	配送先_都道府県(ID)	48	1	2017-04-11 02:04:48	2017-04-11 02:04:48
161	4	1	Eccube\\\\Entity\\\\Shipping	Pref	name	配送先_都道府県(名称)	49	1	2017-04-11 02:04:48	2017-04-11 02:04:48
162	4	1	Eccube\\\\Entity\\\\Shipping	addr01	\N	配送先_住所1	50	1	2017-04-11 02:04:48	2017-04-11 02:04:48
163	4	1	Eccube\\\\Entity\\\\Shipping	addr02	\N	配送先_住所2	51	1	2017-04-11 02:04:48	2017-04-11 02:04:48
164	4	1	Eccube\\\\Entity\\\\Shipping	tel01	\N	配送先_TEL1	52	1	2017-04-11 02:04:48	2017-04-11 02:04:48
165	4	1	Eccube\\\\Entity\\\\Shipping	tel02	\N	配送先_TEL2	53	1	2017-04-11 02:04:48	2017-04-11 02:04:48
166	4	1	Eccube\\\\Entity\\\\Shipping	tel03	\N	配送先_TEL3	54	1	2017-04-11 02:04:48	2017-04-11 02:04:48
167	4	1	Eccube\\\\Entity\\\\Shipping	fax01	\N	配送先_FAX1	55	1	2017-04-11 02:04:48	2017-04-11 02:04:48
168	4	1	Eccube\\\\Entity\\\\Shipping	fax02	\N	配送先_FAX2	56	1	2017-04-11 02:04:48	2017-04-11 02:04:48
169	4	1	Eccube\\\\Entity\\\\Shipping	fax03	\N	配送先_FAX3	57	1	2017-04-11 02:04:48	2017-04-11 02:04:48
170	4	1	Eccube\\\\Entity\\\\Shipping	Delivery	id	配送業者(ID)	58	1	2017-04-11 02:04:48	2017-04-11 02:04:48
171	4	1	Eccube\\\\Entity\\\\Shipping	shipping_delivery_name	\N	配送業者(名称)	59	1	2017-04-11 02:04:48	2017-04-11 02:04:48
172	4	1	Eccube\\\\Entity\\\\Shipping	DeliveryTime	id	お届け時間ID	60	1	2017-04-11 02:04:48	2017-04-11 02:04:48
173	4	1	Eccube\\\\Entity\\\\Shipping	shipping_delivery_time	\N	お届け時間(名称)	61	1	2017-04-11 02:04:48	2017-04-11 02:04:48
174	4	1	Eccube\\\\Entity\\\\Shipping	shipping_delivery_date	\N	お届け希望日	62	1	2017-04-11 02:04:48	2017-04-11 02:04:48
175	4	1	Eccube\\\\Entity\\\\Shipping	DeliveryFee	id	送料ID	63	1	2017-04-11 02:04:48	2017-04-11 02:04:48
176	4	1	Eccube\\\\Entity\\\\Shipping	shipping_delivery_fee	\N	送料	64	1	2017-04-11 02:04:48	2017-04-11 02:04:48
177	4	1	Eccube\\\\Entity\\\\Shipping	shipping_commit_date	\N	発送日	65	1	2017-04-11 02:04:48	2017-04-11 02:04:48
178	4	1	Eccube\\\\Entity\\\\ShipmentItem	id	\N	配送商品ID	66	1	2017-04-11 02:04:48	2017-04-11 02:04:48
179	4	1	Eccube\\\\Entity\\\\ShipmentItem	Product	id	商品ID	67	1	2017-04-11 02:04:48	2017-04-11 02:04:48
180	4	1	Eccube\\\\Entity\\\\ShipmentItem	ProductClass	id	商品規格ID	68	1	2017-04-11 02:04:48	2017-04-11 02:04:48
181	4	1	Eccube\\\\Entity\\\\ShipmentItem	product_name	\N	商品名	69	1	2017-04-11 02:04:48	2017-04-11 02:04:48
182	4	1	Eccube\\\\Entity\\\\ShipmentItem	product_code	\N	商品コード	70	1	2017-04-11 02:04:48	2017-04-11 02:04:48
183	4	1	Eccube\\\\Entity\\\\ShipmentItem	class_name1	\N	規格名1	71	1	2017-04-11 02:04:48	2017-04-11 02:04:48
184	4	1	Eccube\\\\Entity\\\\ShipmentItem	class_name2	\N	規格名2	72	1	2017-04-11 02:04:48	2017-04-11 02:04:48
185	4	1	Eccube\\\\Entity\\\\ShipmentItem	class_category_name1	\N	規格分類名1	73	1	2017-04-11 02:04:48	2017-04-11 02:04:48
186	4	1	Eccube\\\\Entity\\\\ShipmentItem	class_category_name2	\N	規格分類名2	74	1	2017-04-11 02:04:48	2017-04-11 02:04:48
187	4	1	Eccube\\\\Entity\\\\ShipmentItem	price	\N	価格	75	1	2017-04-11 02:04:48	2017-04-11 02:04:48
188	4	1	Eccube\\\\Entity\\\\ShipmentItem	quantity	\N	個数	76	1	2017-04-11 02:04:48	2017-04-11 02:04:48
189	5	1	Eccube\\\\Entity\\\\Category	id	\N	カテゴリID	1	1	2017-04-11 02:04:48	2017-04-11 02:04:48
190	5	1	Eccube\\\\Entity\\\\Category	rank	\N	表示ランク	2	1	2017-04-11 02:04:48	2017-04-11 02:04:48
191	5	1	Eccube\\\\Entity\\\\Category	name	\N	カテゴリ名	3	1	2017-04-11 02:04:48	2017-04-11 02:04:48
192	5	1	Eccube\\\\Entity\\\\Category	Parent	id	親カテゴリID	4	1	2017-04-11 02:04:48	2017-04-11 02:04:48
193	5	1	Eccube\\\\Entity\\\\Category	level	\N	階層	5	1	2017-04-11 02:04:48	2017-04-11 02:04:48
194	1	1	Eccube\\\\Entity\\\\Product	ProductTag	tag_id	タグ(ID)	29	1	2017-04-11 11:05:35	2017-04-11 11:05:35
195	1	1	Eccube\\\\Entity\\\\Product	ProductTag	Tag	タグ(名称)	30	1	2017-04-11 11:05:35	2017-04-11 11:05:35
\.


--
-- Name: dtb_csv_csv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_csv_csv_id_seq', 195, true);


--
-- Data for Name: dtb_customer; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_customer (customer_id, status, sex, job, country_id, pref, name01, name02, kana01, kana02, company_name, zip01, zip02, zipcode, addr01, addr02, email, tel01, tel02, tel03, fax01, fax02, fax03, birth, password, salt, secret_key, first_buy_date, last_buy_date, buy_times, buy_total, note, reset_key, reset_expire, create_date, update_date, del_flg) FROM stdin;
1	1	\N	\N	\N	\N	未記入	未記入	\N	\N	\N	\N	\N	\N	\N	\N	lam123@mailinator.com	\N	\N	\N	\N	\N	\N	\N	260e5887a0484b24124825be964e76dc5418f6af4f5cdd9c7b1fb3838f5b4535	8c7be38143	e2QoPuf91Rppw6XB8bfvQoFRKjdtFjJR	\N	\N	0	0	\N	\N	\N	2017-04-11 11:08:24	2017-04-11 11:09:24	1
3	2	\N	\N	\N	\N	未記入	未記入	\N	\N	\N	\N	\N	\N	\N	\N	lammn90@gmail.com	\N	\N	\N	\N	\N	\N	\N	45a8cfb18623d4ef2bb5647755d5797e5a0397694bcd4ab5c32ebecd9e931de5	3802f02605	iwdJOtdg1vSN6inF5s0opERoAP1uVAf4	\N	\N	0	0	\N	\N	\N	2017-04-11 11:15:28	2017-04-11 12:36:00	0
5	2	\N	\N	\N	13	鈴木	太郎	スズキ	タロウ	\N	150	0044	1500044	渋谷区円山町	111	yoshihira.s+lammn90@gmail.com	111	1111	1111	\N	\N	\N	\N	07994efc722c3ef72d787547aadba1ce66f25b6b0def15085dcc5132f8ab7507	00f34bf31e	g4izW0J0nLhpgxHTqSIpEZTq24pgO3CC	2017-04-24 16:51:25	2017-04-24 17:14:26	4	14824	\N	\N	\N	2017-04-24 16:49:58	2017-04-24 17:14:26	0
4	2	\N	\N	\N	13	鈴木	太郎	サトウ	タロウ	\N	150	0011	1500011	渋谷区東	1-2-3	yoshihira.s@gmail.com	080	1111	1111	\N	\N	\N	\N	b335194df3d9e8a2c9471280efafa50a23b37958fb8966e1044b84d62aaf2050	365c3bd7bb	tNIp61OazyGdPIYYUJyiE2O2sfO9YcjN	2017-04-27 16:01:16	2017-05-09 12:56:23	2	2160	\N	k8h7JTL3yacbYlhxwjsha0Ayb6ji0sDd	2017-04-24 16:58:27	2017-04-19 11:26:09	2017-05-09 12:56:23	0
2	2	\N	\N	\N	12	Lam	lam	フ	フ	\N	274	0824	2740824	船橋市前原東	11	lam123@mailinator.com	1	1	1	\N	\N	\N	\N	139395bd19cf79af3e5816054d42c8552f206ba152e69127caa19707ff536454	c34eef61f7	LJBeAFSar1vALDBrrd3LCbDUWCzVllFd	2017-04-11 11:51:36	2017-04-24 16:25:07	8	78304	\N	\N	\N	2017-04-11 11:10:25	2017-05-26 18:09:36	0
\.


--
-- Data for Name: dtb_customer_address; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_customer_address (customer_address_id, customer_id, country_id, pref, name01, name02, kana01, kana02, company_name, zip01, zip02, zipcode, addr01, addr02, tel01, tel02, tel03, fax01, fax02, fax03, create_date, update_date, del_flg) FROM stdin;
1	1	\N	\N	未記入	未記入	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	2017-04-11 11:08:24	2017-04-11 11:08:24	0
3	3	\N	\N	未記入	未記入	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	2017-04-11 11:15:28	2017-04-11 11:15:28	0
2	2	\N	12	Lam	lam	フ	フ	\N	274	0824	2740824	船橋市前原東	11	1	1	1	\N	\N	\N	2017-04-11 11:10:25	2017-04-11 11:51:31	0
4	4	\N	13	鈴木	太郎	サトウ	タロウ	\N	150	0011	1500011	渋谷区東	1-2-3	080	1111	1111	\N	\N	\N	2017-04-19 11:26:09	2017-04-19 12:16:19	0
5	5	\N	13	鈴木	太郎	スズキ	タロウ	\N	150	0044	1500044	渋谷区円山町	111	111	1111	1111	\N	\N	\N	2017-04-24 16:49:58	2017-04-24 16:51:11	0
\.


--
-- Name: dtb_customer_address_customer_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_customer_address_customer_address_id_seq', 5, true);


--
-- Name: dtb_customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_customer_customer_id_seq', 5, true);


--
-- Data for Name: dtb_customer_favorite_product; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_customer_favorite_product (favorite_id, customer_id, product_id, create_date, update_date, del_flg, flag) FROM stdin;
1	2	32	2017-04-24 16:01:06	2017-04-24 16:01:06	0	\N
8	2	33	2017-04-27 12:58:46	2017-04-27 12:58:46	0	2
9	2	18	2017-04-27 12:59:17	2017-04-27 12:59:17	0	1
12	4	30	2017-04-27 16:04:48	2017-04-27 16:04:48	0	2
\.


--
-- Name: dtb_customer_favorite_product_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_customer_favorite_product_favorite_id_seq', 12, true);


--
-- Data for Name: dtb_delivery; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_delivery (delivery_id, creator_id, product_type_id, name, service_name, description, confirm_url, rank, del_flg, create_date, update_date) FROM stdin;
1	1	1	サンプル業者	サンプル業者	\N	\N	1	0	2017-04-11 02:04:39	2017-04-11 02:04:39
2	1	2	サンプル宅配	サンプル宅配	\N	\N	2	0	2017-04-11 02:04:39	2017-04-11 02:04:39
\.


--
-- Data for Name: dtb_delivery_date; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_delivery_date (date_id, name, value, rank) FROM stdin;
1	即日	0	0
2	1～2日後	1	1
3	3～4日後	3	2
4	1週間以降	7	3
5	2週間以降	14	4
6	3週間以降	21	5
7	1ヶ月以降	30	6
8	2ヶ月以降	60	7
9	お取り寄せ(商品入荷後)	-1	8
\.


--
-- Name: dtb_delivery_date_date_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_delivery_date_date_id_seq', 9, true);


--
-- Name: dtb_delivery_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_delivery_delivery_id_seq', 2, true);


--
-- Data for Name: dtb_delivery_fee; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_delivery_fee (fee_id, delivery_id, pref, fee) FROM stdin;
1	1	1	1000
2	1	2	1000
3	1	3	1000
4	1	4	1000
5	1	5	1000
6	1	6	1000
7	1	7	1000
8	1	8	1000
9	1	9	1000
10	1	10	1000
11	1	11	1000
12	1	12	1000
13	1	13	1000
14	1	14	1000
15	1	15	1000
16	1	16	1000
17	1	17	1000
18	1	18	1000
19	1	19	1000
20	1	20	1000
21	1	21	1000
22	1	22	1000
23	1	23	1000
24	1	24	1000
25	1	25	1000
26	1	26	1000
27	1	27	1000
28	1	28	1000
29	1	29	1000
30	1	30	1000
31	1	31	1000
32	1	32	1000
33	1	33	1000
34	1	34	1000
35	1	35	1000
36	1	36	1000
37	1	37	1000
38	1	38	1000
39	1	39	1000
40	1	40	1000
41	1	41	1000
42	1	42	1000
43	1	43	1000
44	1	44	1000
45	1	45	1000
46	1	46	1000
47	1	47	1000
48	2	1	0
49	2	2	0
50	2	3	0
51	2	4	0
52	2	5	0
53	2	6	0
54	2	7	0
55	2	8	0
56	2	9	0
57	2	10	0
58	2	11	0
59	2	12	0
60	2	13	0
61	2	14	0
62	2	15	0
63	2	16	0
64	2	17	0
65	2	18	0
66	2	19	0
67	2	20	0
68	2	21	0
69	2	22	0
70	2	23	0
71	2	24	0
72	2	25	0
73	2	26	0
74	2	27	0
75	2	28	0
76	2	29	0
77	2	30	0
78	2	31	0
79	2	32	0
80	2	33	0
81	2	34	0
82	2	35	0
83	2	36	0
84	2	37	0
85	2	38	0
86	2	39	0
87	2	40	0
88	2	41	0
89	2	42	0
90	2	43	0
91	2	44	0
92	2	45	0
93	2	46	0
94	2	47	0
\.


--
-- Name: dtb_delivery_fee_fee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_delivery_fee_fee_id_seq', 94, true);


--
-- Data for Name: dtb_delivery_time; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_delivery_time (time_id, delivery_id, delivery_time) FROM stdin;
1	1	午前
2	1	午後
\.


--
-- Name: dtb_delivery_time_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_delivery_time_time_id_seq', 3, true);


--
-- Data for Name: dtb_help; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_help (id, law_country_id, law_pref, customer_agreement, law_company, law_manager, law_zip01, law_zip02, law_zipcode, law_addr01, law_addr02, law_tel01, law_tel02, law_tel03, law_fax01, law_fax02, law_fax03, law_email, law_url, law_term01, law_term02, law_term03, law_term04, law_term05, law_term06, law_term07, law_term08, law_term09, law_term10, create_date, update_date) FROM stdin;
1	\N	\N	第1条 (会員)\n\n1. 「会員」とは、当社が定める手続に従い本規約に同意の上、入会の申し込みを行う個人をいいます。\n2. 「会員情報」とは、会員が当社に開示した会員の属性に関する情報および会員の取引に関する履歴等の情報をいいます。\n3. 本規約は、全ての会員に適用され、登録手続時および登録後にお守りいただく規約です。\n\n第2条 (登録)\n\n1. 会員資格\n本規約に同意の上、所定の入会申込みをされたお客様は、所定の登録手続完了後に会員としての資格を有します。会員登録手続は、会員となるご本人が行ってください。代理による登録は一切認められません。なお、過去に会員資格が取り消された方やその他当社が相応しくないと判断した方からの会員申込はお断りする場合があります。\n\n2. 会員情報の入力\n会員登録手続の際には、入力上の注意をよく読み、所定の入力フォームに必要事項を正確に入力してください。会員情報の登録において、特殊記号・旧漢字・ローマ数字などはご使用になれません。これらの文字が登録された場合は当社にて変更致します。\n\n3. パスワードの管理\n(1)パスワードは会員本人のみが利用できるものとし、第三者に譲渡・貸与できないものとします。\n(2)パスワードは、他人に知られることがないよう定期的に変更する等、会員本人が責任をもって管理してください。\n(3)パスワードを用いて当社に対して行われた意思表示は、会員本人の意思表示とみなし、そのために生じる支払等は全て会員の責任となります。\n\n第3条 (変更)\n\n1. 会員は、氏名、住所など当社に届け出た事項に変更があった場合には、速やかに当社に連絡するものとします。\n2. 変更登録がなされなかったことにより生じた損害について、当社は一切責任を負いません。また、変更登録がなされた場合でも、変更登録前にすでに手続がなされた取引は、変更登録前の情報に基づいて行われますのでご注意ください。\n\n第4条 (退会)\n\n会員が退会を希望する場合には、会員本人が退会手続きを行ってください。所定の退会手続の終了後に、退会となります。\n\n第5条 (会員資格の喪失及び賠償義務)\n\n1. 会員が、会員資格取得申込の際に虚偽の申告をしたとき、通信販売による代金支払債務を怠ったとき、その他当社が会員として不適当と認める事由があるときは、当社は、会員資格を取り消すことができることとします。\n\n2. 会員が、以下の各号に定める行為をしたときは、これにより当社が被った損害を賠償する責任を負います。\n(1)会員番号、パスワードを不正に使用すること\n(2)当ホームページにアクセスして情報を改ざんしたり、当ホームページに有害なコンピュータープログラムを送信するなどして、当社の営業を妨害すること\n(3)当社が扱う商品の知的所有権を侵害する行為をすること\n(4)その他、この利用規約に反する行為をすること\n\n第6条 (会員情報の取扱い)\n1. 当社は、原則として会員情報を会員の事前の同意なく第三者に対して開示することはありません。ただし、次の各号の場合には、会員の事前の同意なく、当社は会員情報その他のお客様情報を開示できるものとします。\n(1)法令に基づき開示を求められた場合\n(2)当社の権利、利益、名誉等を保護するために必要であると当社が判断した場合\n\n2. 会員情報につきましては、当社の「個人情報保護への取組み」に従い、当社が管理します。当社は、会員情報を、会員へのサービス提供、サービス内容の向上、サービスの利用促進、およびサービスの健全かつ円滑な運営の確保を図る目的のために、当社おいて利用することができるものとします。\n\n3. 当社は、会員に対して、メールマガジンその他の方法による情報提供(広告を含みます)を行うことができるものとします。会員が情報提供を希望しない場合は、当社所定の方法に従い、その旨を通知して頂ければ、情報提供を停止します。ただし、本サービス運営に必要な情報提供につきましては、会員の希望により停止をすることはできません。\n\n第7条 (禁止事項)\n\n本サービスの利用に際して、会員に対し次の各号の行為を行うことを禁止します。\n\n1. 法令または本規約、本サービスご利用上のご注意、本サービスでのお買い物上のご注意その他の本規約等に違反すること\n2. 当社、およびその他の第三者の権利、利益、名誉等を損ねること\n3. 青少年の心身に悪影響を及ぼす恐れがある行為、その他公序良俗に反する行為を行うこと\n4. 他の利用者その他の第三者に迷惑となる行為や不快感を抱かせる行為を行うこと\n5. 虚偽の情報を入力すること\n6. 有害なコンピュータープログラム、メール等を送信または書き込むこと\n7. 当社のサーバーその他のコンピューターに不正にアクセスすること\n8. パスワードを第三者に貸与・譲渡すること、または第三者と共用すること\n9. その他当社が不適切と判断すること\n\n第8条 (サービスの中断・停止等)\n\n1. 当社は、本サービスの稼動状態を良好に保つために、次の各号の一に該当する場合、予告なしに、本サービスの提供全てあるいは一部を停止することがあります。\n(1)システムの定期保守および緊急保守のために必要な場合\n(2)システムに負荷が集中した場合\n(3)火災、停電、第三者による妨害行為などによりシステムの運用が困難になった場合\n(4)その他、止むを得ずシステムの停止が必要と当社が判断した場合\n\n第9条 (サービスの変更・廃止)\n\n当社は、その判断によりサービスの全部または一部を事前の通知なく、適宜変更・廃止できるものとします。\n\n第10条 (免責)\n\n1. 通信回線やコンピューターなどの障害によるシステムの中断・遅滞・中止・データの消失、データへの不正アクセスにより生じた損害、その他当社のサービスに関して会員に生じた損害について、当社は一切責任を負わないものとします。\n2. 当社は、当社のウェブページ・サーバー・ドメインなどから送られるメール・コンテンツに、コンピューター・ウィルスなどの有害なものが含まれていないことを保証いたしません。\n3. 会員が本規約等に違反したことによって生じた損害については、当社は一切責任を負いません。\n\n第11条 (本規約の改定)\n\n当社は、本規約を任意に改定できるものとし、また、当社において本規約を補充する規約(以下「補充規約」といいます)を定めることができます。本規約の改定または補充は、改定後の本規約または補充規約を当社所定のサイトに掲示したときにその効力を生じるものとします。この場合、会員は、改定後の規約および補充規約に従うものと致します。\n\n第12条 (準拠法、管轄裁判所)\n\n本規約に関して紛争が生じた場合、当社本店所在地を管轄する地方裁判所を第一審の専属的合意管轄裁判所とします。 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
\.


--
-- Name: dtb_help_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_help_id_seq', 2, true);


--
-- Data for Name: dtb_mail_history; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_mail_history (send_id, order_id, template_id, creator_id, send_date, subject, mail_body) FROM stdin;
1	1	1	\N	2017-04-11 11:51:36	[Amazone] ご注文ありがとうございます	Lam lam 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：1\nお支払い合計：¥ 4,024\nお支払い方法：郵便振替\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: cafe-01\n商品名: パーコレーター    \n単価： ¥ 3,024\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 3,024(うち消費税 ¥ 224)\n手数料 ¥ 0\n送　料 ¥ 1,000\n============================================\n合　計 ¥ 4,024\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nメールアドレス：lam123@mailinator.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: cafe-01\n商品名: パーコレーター    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
2	2	1	\N	2017-04-11 11:53:54	[Amazone] ご注文ありがとうございます	Lam lam 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：2\nお支払い合計：¥ 4,024\nお支払い方法：郵便振替\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: cafe-01\n商品名: パーコレーター    \n単価： ¥ 3,024\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 3,024(うち消費税 ¥ 224)\n手数料 ¥ 0\n送　料 ¥ 1,000\n============================================\n合　計 ¥ 4,024\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nメールアドレス：lam123@mailinator.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: cafe-01\n商品名: パーコレーター    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
3	3	1	\N	2017-04-11 11:57:29	[Amazone] ご注文ありがとうございます	Lam lam 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：3\nお支払い合計：¥ 4,024\nお支払い方法：郵便振替\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: cafe-01\n商品名: パーコレーター    \n単価： ¥ 3,024\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 3,024(うち消費税 ¥ 224)\n手数料 ¥ 0\n送　料 ¥ 1,000\n============================================\n合　計 ¥ 4,024\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nメールアドレス：lam123@mailinator.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: cafe-01\n商品名: パーコレーター    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
4	4	1	\N	2017-04-11 12:37:31	[Amazone] ご注文ありがとうございます	Lam lam 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：4\nお支払い合計：¥ 4,024\nお支払い方法：郵便振替\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: cafe-01\n商品名: パーコレーター    \n単価： ¥ 3,024\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 3,024(うち消費税 ¥ 224)\n手数料 ¥ 0\n送　料 ¥ 1,000\n============================================\n合　計 ¥ 4,024\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nメールアドレス：lam123@mailinator.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: cafe-01\n商品名: パーコレーター    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
5	8	1	\N	2017-04-24 16:00:53	[Amazone] ご注文ありがとうございます	Lam lam 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：8\nお支払い合計：¥ 1,944\nお支払い方法：銀行振込\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: p_0001\n商品名: ラベンダーのドライフラワー    \n単価： ¥ 1,944\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 1,944(うち消費税 ¥ 144)\n手数料 ¥ 0\n送　料 ¥ 0\n============================================\n合　計 ¥ 1,944\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nメールアドレス：lam123@mailinator.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: p_0001\n商品名: ラベンダーのドライフラワー    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
6	9	1	\N	2017-04-24 16:02:17	[Amazone] ご注文ありがとうございます	Lam lam 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：9\nお支払い合計：¥ 1,296\nお支払い方法：銀行振込\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: o_00061\n商品名: クラフトノート    \n単価： ¥ 1,296\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 1,296(うち消費税 ¥ 96)\n手数料 ¥ 0\n送　料 ¥ 0\n============================================\n合　計 ¥ 1,296\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nメールアドレス：lam123@mailinator.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: o_00061\n商品名: クラフトノート    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
7	10	1	\N	2017-04-24 16:03:15	[Amazone] ご注文ありがとうございます	Lam lam 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：10\nお支払い合計：¥ 1,944\nお支払い方法：銀行振込\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: p_0003\n商品名: ローズマリー    \n単価： ¥ 1,944\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 1,944(うち消費税 ¥ 144)\n手数料 ¥ 0\n送　料 ¥ 0\n============================================\n合　計 ¥ 1,944\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nメールアドレス：lam123@mailinator.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: p_0003\n商品名: ローズマリー    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
8	11	1	\N	2017-04-24 16:25:07	[Amazone] ご注文ありがとうございます	Lam lam 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：11\nお支払い合計：¥ 57,024\nお支払い方法：銀行振込\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: p_0002\n商品名: ミニサボテン    \n単価： ¥ 864\n数量： 1\n\n商品コード: i_0003\n商品名: ガラステーブル    \n単価： ¥ 21,600\n数量： 1\n\n商品コード: i_0007\n商品名: ガーデン用テーブルセット（スチール）    \n単価： ¥ 34,560\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 57,024(うち消費税 ¥ 4,224)\n手数料 ¥ 0\n送　料 ¥ 0\n============================================\n合　計 ¥ 57,024\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nメールアドレス：lam123@mailinator.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：Lam lam 様\nフリガナ：フ フ 様\n郵便番号：〒274-0824\n住所　　：千葉県船橋市前原東11\n電話番号：1-1-1\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: i_0007\n商品名: ガーデン用テーブルセット（スチール）    \n数量：1\n\n商品コード: i_0003\n商品名: ガラステーブル    \n数量：1\n\n商品コード: p_0002\n商品名: ミニサボテン    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
9	12	1	\N	2017-04-24 16:51:25	[Amazone] ご注文ありがとうございます	鈴木 太郎 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：12\nお支払い合計：¥ 864\nお支払い方法：銀行振込\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: p_0002\n商品名: ミニサボテン    \n単価： ¥ 864\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 864(うち消費税 ¥ 64)\n手数料 ¥ 0\n送　料 ¥ 0\n============================================\n合　計 ¥ 864\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：鈴木 太郎 様\nフリガナ：スズキ タロウ 様\n郵便番号：〒150-0044\n住所　　：東京都渋谷区円山町111\n電話番号：111-1111-1111\nFAX番号 ：--\n\nメールアドレス：yoshihira.s+lammn90@gmail.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：鈴木 太郎 様\nフリガナ：スズキ タロウ 様\n郵便番号：〒150-0044\n住所　　：東京都渋谷区円山町111\n電話番号：111-1111-1111\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: p_0002\n商品名: ミニサボテン    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
10	13	1	\N	2017-04-24 16:52:30	[Amazone] ご注文ありがとうございます	鈴木 太郎 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：13\nお支払い合計：¥ 1,296\nお支払い方法：銀行振込\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: o_00061\n商品名: クラフトノート    \n単価： ¥ 1,296\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 1,296(うち消費税 ¥ 96)\n手数料 ¥ 0\n送　料 ¥ 0\n============================================\n合　計 ¥ 1,296\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：鈴木 太郎 様\nフリガナ：スズキ タロウ 様\n郵便番号：〒150-0044\n住所　　：東京都渋谷区円山町111\n電話番号：111-1111-1111\nFAX番号 ：--\n\nメールアドレス：yoshihira.s+lammn90@gmail.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：鈴木 太郎 様\nフリガナ：スズキ タロウ 様\n郵便番号：〒150-0044\n住所　　：東京都渋谷区円山町111\n電話番号：111-1111-1111\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: o_00061\n商品名: クラフトノート    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
11	14	1	\N	2017-04-24 17:12:42	[Amazone] ご注文ありがとうございます	鈴木 太郎 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：14\nお支払い合計：¥ 864\nお支払い方法：銀行振込\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: p_0002\n商品名: ミニサボテン    \n単価： ¥ 864\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 864(うち消費税 ¥ 64)\n手数料 ¥ 0\n送　料 ¥ 0\n============================================\n合　計 ¥ 864\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：鈴木 太郎 様\nフリガナ：スズキ タロウ 様\n郵便番号：〒150-0044\n住所　　：東京都渋谷区円山町111\n電話番号：111-1111-1111\nFAX番号 ：--\n\nメールアドレス：yoshihira.s+lammn90@gmail.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：鈴木 太郎 様\nフリガナ：スズキ タロウ 様\n郵便番号：〒150-0044\n住所　　：東京都渋谷区円山町111\n電話番号：111-1111-1111\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: p_0002\n商品名: ミニサボテン    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
12	16	1	\N	2017-04-24 17:14:26	[Amazone] ご注文ありがとうございます	鈴木 太郎 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：16\nお支払い合計：¥ 11,800\nお支払い方法：代金引換\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: i_0002\n商品名: ミニスツール    \n単価： ¥ 10,800\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 10,800(うち消費税 ¥ 800)\n手数料 ¥ 0\n送　料 ¥ 1,000\n============================================\n合　計 ¥ 11,800\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：鈴木 太郎 様\nフリガナ：スズキ タロウ 様\n郵便番号：〒150-0044\n住所　　：東京都渋谷区円山町111\n電話番号：111-1111-1111\nFAX番号 ：--\n\nメールアドレス：yoshihira.s+lammn90@gmail.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：鈴木 太郎 様\nフリガナ：スズキ タロウ 様\n郵便番号：〒150-0044\n住所　　：東京都渋谷区円山町111\n電話番号：111-1111-1111\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: i_0002\n商品名: ミニスツール    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
13	18	1	\N	2017-04-27 16:01:16	[Amazone] ご注文ありがとうございます	鈴木 太郎 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：18\nお支払い合計：¥ 1,296\nお支払い方法：銀行振込\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: video02\n商品名: クラフトノート    \n単価： ¥ 1,296\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 1,296(うち消費税 ¥ 96)\n手数料 ¥ 0\n送　料 ¥ 0\n============================================\n合　計 ¥ 1,296\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：鈴木 太郎 様\nフリガナ：サトウ タロウ 様\n郵便番号：〒150-0011\n住所　　：東京都渋谷区東1-2-3\n電話番号：080-1111-1111\nFAX番号 ：--\n\nメールアドレス：yoshihira.s@gmail.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：鈴木 太郎 様\nフリガナ：サトウ タロウ 様\n郵便番号：〒150-0011\n住所　　：東京都渋谷区東1-2-3\n電話番号：080-1111-1111\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: video02\n商品名: クラフトノート    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
14	19	1	\N	2017-05-09 12:56:23	[Amazone] ご注文ありがとうございます	鈴木 太郎 様\n\nこの度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n\n\n************************************************\n　ご請求金額\n************************************************\n\nご注文番号：19\nお支払い合計：¥ 864\nお支払い方法：銀行振込\nメッセージ：\n\n\n************************************************\n　ご注文商品明細\n************************************************\n\n商品コード: p_0002\n商品名: ミニサボテン    \n単価： ¥ 864\n数量： 1\n\n\n-------------------------------------------------\n小　計 ¥ 864(うち消費税 ¥ 64)\n手数料 ¥ 0\n送　料 ¥ 0\n============================================\n合　計 ¥ 864\n\n************************************************\n　ご注文者情報\n************************************************\nお名前　：鈴木 太郎 様\nフリガナ：サトウ タロウ 様\n郵便番号：〒150-0011\n住所　　：東京都渋谷区東1-2-3\n電話番号：080-1111-1111\nFAX番号 ：--\n\nメールアドレス：yoshihira.s@gmail.com\n\n************************************************\n　配送情報\n************************************************\n\n◎お届け先\nお名前　：鈴木 太郎 様\nフリガナ：サトウ タロウ 様\n郵便番号：〒150-0011\n住所　　：東京都渋谷区東1-2-3\n電話番号：080-1111-1111\nFAX番号 ：--\n\nお届け日：指定なし\nお届け時間：指定なし\n\n商品コード: p_0002\n商品名: ミニサボテン    \n数量：1\n\n\n\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n
\.


--
-- Name: dtb_mail_history_send_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_mail_history_send_id_seq', 14, true);


--
-- Data for Name: dtb_mail_template; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_mail_template (template_id, creator_id, name, file_name, subject, header, footer, del_flg, create_date, update_date) FROM stdin;
1	1	注文受付メール	Mail/order.twig	ご注文ありがとうございます	この度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n	\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n	0	2017-04-11 02:04:39	2017-04-11 02:04:39
5	1	問合受付メール	Mail/contact.twig	お問い合わせを受け付けました	\N	\N	0	2017-04-11 02:04:39	2017-04-11 02:04:39
\.


--
-- Name: dtb_mail_template_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_mail_template_template_id_seq', 5, true);


--
-- Data for Name: dtb_member; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_member (member_id, work, authority, creator_id, name, department, login_id, password, salt, rank, del_flg, create_date, update_date, login_date) FROM stdin;
1	1	0	1	dummy	\N	dummy	dummy	dummy	0	1	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
2	1	0	1	管理者	EC-CUBE SHOP	admin	17d6ca86d2d83e4a87c9cbd0f01e7402248703e5c28d132c1c489b4cef324dc9	EZEPsCwqScdXrOtew2wtcPBEDg4lOjK3	1	0	2017-04-11 02:06:00	2017-05-29 16:28:12	2017-05-29 16:28:11
\.


--
-- Name: dtb_member_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_member_member_id_seq', 2, true);


--
-- Data for Name: dtb_news; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_news (news_id, creator_id, news_date, rank, news_title, news_comment, news_url, news_select, link_method, create_date, update_date, del_flg) FROM stdin;
1	1	2017-04-11 02:04:39	1	サイトオープンいたしました!	一人暮らしからオフィスなどさまざまなシーンで あなたの生活をサポートするグッズをご家庭へお届けします！	\N	0	1	2017-04-11 02:04:39	2017-04-11 02:04:39	0
\.


--
-- Name: dtb_news_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_news_news_id_seq', 1, true);


--
-- Data for Name: dtb_order; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_order (order_id, customer_id, order_country_id, order_pref, order_sex, order_job, payment_id, device_type_id, pre_order_id, message, order_name01, order_name02, order_kana01, order_kana02, order_company_name, order_email, order_tel01, order_tel02, order_tel03, order_fax01, order_fax02, order_fax03, order_zip01, order_zip02, order_zipcode, order_addr01, order_addr02, order_birth, subtotal, discount, delivery_fee_total, charge, tax, total, payment_total, payment_method, note, create_date, update_date, order_date, commit_date, payment_date, del_flg, status) FROM stdin;
1	2	\N	12	\N	\N	1	10	c3d1748575f481a982110f14c7512a84ede0d584	\N	Lam	lam	フ	フ	\N	lam123@mailinator.com	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	\N	3024	0	1000	0	224	4024	4024	郵便振替	\N	2017-04-11 11:51:31	2017-04-11 11:51:36	2017-04-11 11:51:36	\N	\N	0	1
2	2	\N	12	\N	\N	1	10	9b6faa5e508a12813a74a1e6392a032cb4999149	\N	Lam	lam	フ	フ	\N	lam123@mailinator.com	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	\N	3024	0	1000	0	224	4024	4024	郵便振替	\N	2017-04-11 11:53:52	2017-04-11 11:53:54	2017-04-11 11:53:54	\N	\N	0	1
3	2	\N	12	\N	\N	1	10	aaa3f0f4abe3e44b7477029382acefb4038007d0	\N	Lam	lam	フ	フ	\N	lam123@mailinator.com	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	\N	3024	0	1000	0	224	4024	4024	郵便振替	\N	2017-04-11 11:57:26	2017-04-11 11:57:29	2017-04-11 11:57:29	\N	\N	0	1
4	2	\N	12	\N	\N	1	10	bca405068eb43650f145d085928215152b970910	\N	Lam	lam	フ	フ	\N	lam123@mailinator.com	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	\N	3024	0	1000	0	224	4024	4024	郵便振替	\N	2017-04-11 12:37:25	2017-04-11 12:37:31	2017-04-11 12:37:31	\N	\N	0	1
5	4	\N	13	\N	\N	1	10	9732629d239ffe52912412bd99157459ddbcb76d	\N	鈴木	太郎	スズキ	タロウ	\N	yoshihira.s@gmail.com	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	\N	3024	0	1000	0	224	4024	4024	郵便振替	\N	2017-04-19 11:45:40	2017-04-19 11:45:40	\N	\N	\N	0	8
6	4	\N	13	\N	\N	1	10	4bd5793ce3920b0e5cb724ff731d79fad519ed0d	\N	鈴木	太郎	スズキ	タロウ	\N	yoshihira.s@gmail.com	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	\N	3024	0	1000	0	224	4024	4024	郵便振替	\N	2017-04-19 11:47:32	2017-04-19 11:47:32	\N	\N	\N	0	8
7	4	\N	13	\N	\N	1	10	3ef582477213788ff3e6c06f4c9e985fa90b5aa0	\N	鈴木	太郎	サトウ	タロウ	\N	yoshihira.s@gmail.com	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	\N	3024	0	1000	0	224	4024	4024	郵便振替	\N	2017-04-19 13:26:57	2017-04-19 13:26:57	\N	\N	\N	0	8
8	2	\N	12	\N	\N	3	10	8ab47d0bc033427d803095cb526d4804e0f5b35f	\N	Lam	lam	フ	フ	\N	lam123@mailinator.com	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	\N	1944	0	0	0	144	1944	1944	銀行振込	\N	2017-04-24 16:00:49	2017-04-24 16:00:52	2017-04-24 16:00:52	\N	\N	0	1
9	2	\N	12	\N	\N	3	10	a7461174c816a083875fe72b29d28fa35a21270e	\N	Lam	lam	フ	フ	\N	lam123@mailinator.com	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	\N	1296	0	0	0	96	1296	1296	銀行振込	\N	2017-04-24 16:02:15	2017-04-24 16:02:17	2017-04-24 16:02:16	\N	\N	0	1
10	2	\N	12	\N	\N	3	10	5c7865c3d4802ef63fa02d0f7ef370e530a7d4e0	\N	Lam	lam	フ	フ	\N	lam123@mailinator.com	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	\N	1944	0	0	0	144	1944	1944	銀行振込	\N	2017-04-24 16:03:12	2017-04-24 16:03:15	2017-04-24 16:03:15	\N	\N	0	1
11	2	\N	12	\N	\N	3	10	278cf4d45dbd92e7ebcf878aa722b034393916bb	\N	Lam	lam	フ	フ	\N	lam123@mailinator.com	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	\N	57024	0	0	0	4224	57024	57024	銀行振込	\N	2017-04-24 16:25:05	2017-04-24 16:25:07	2017-04-24 16:25:07	\N	\N	0	1
12	5	\N	13	\N	\N	3	10	f63b06a25e6ad06fe46f531eaa67563263b096d9	\N	鈴木	太郎	スズキ	タロウ	\N	yoshihira.s+lammn90@gmail.com	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	\N	864	0	0	0	64	864	864	銀行振込	\N	2017-04-24 16:51:11	2017-04-24 16:51:25	2017-04-24 16:51:25	\N	\N	0	1
13	5	\N	13	\N	\N	3	10	53b0805aad69b7a3761724c33411cd01ce8677d0	\N	鈴木	太郎	スズキ	タロウ	\N	yoshihira.s+lammn90@gmail.com	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	\N	1296	0	0	0	96	1296	1296	銀行振込	\N	2017-04-24 16:52:27	2017-04-24 16:52:30	2017-04-24 16:52:30	\N	\N	0	1
14	5	\N	13	\N	\N	3	10	ccd4a7622c5cf7d7ac352324851bd55ddf9f277a	\N	鈴木	太郎	スズキ	タロウ	\N	yoshihira.s+lammn90@gmail.com	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	\N	864	0	0	0	64	864	864	銀行振込	\N	2017-04-24 17:12:38	2017-04-24 17:12:42	2017-04-24 17:12:42	\N	\N	0	1
15	5	\N	13	\N	\N	1	10	17596c5216a16b5ab3db7d3fac3e4fe8b4ecf43f	\N	鈴木	太郎	スズキ	タロウ	\N	yoshihira.s+lammn90@gmail.com	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	\N	10800	0	1000	0	800	11800	11800	郵便振替	\N	2017-04-24 17:13:15	2017-04-24 17:13:15	\N	\N	\N	0	8
16	5	\N	13	\N	\N	4	10	264cd459cba509db9adbbf284d832d7ed028f6f3	\N	鈴木	太郎	スズキ	タロウ	\N	yoshihira.s+lammn90@gmail.com	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	\N	10800	0	1000	0	800	11800	11800	代金引換	\N	2017-04-24 17:14:03	2017-04-24 17:14:26	2017-04-24 17:14:26	\N	\N	0	1
17	2	\N	12	\N	\N	3	10	0a446e06261d957a9261cd2a84fa9974b8f51f1a	\N	Lam	lam	フ	フ	\N	lam123@mailinator.com	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	\N	864	0	0	0	64	864	864	銀行振込	\N	2017-04-24 18:09:53	2017-04-24 18:09:53	\N	\N	\N	0	8
18	4	\N	13	\N	\N	3	10	f96cc840bf5efc4c8017932162d94ad00b519021	\N	鈴木	太郎	サトウ	タロウ	\N	yoshihira.s@gmail.com	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	\N	1296	0	0	0	96	1296	1296	銀行振込	\N	2017-04-27 16:01:11	2017-04-27 16:01:16	2017-04-27 16:01:16	\N	\N	0	1
19	4	\N	13	\N	\N	3	10	1a8b86587d26500ed0fb34c6384b379df3d32e7b	\N	鈴木	太郎	サトウ	タロウ	\N	yoshihira.s@gmail.com	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	\N	864	0	0	0	64	864	864	銀行振込	\N	2017-05-09 12:56:16	2017-05-09 12:56:23	2017-05-09 12:56:23	\N	\N	0	1
\.


--
-- Data for Name: dtb_order_detail; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_order_detail (order_detail_id, order_id, product_id, product_class_id, product_name, product_code, class_name1, class_name2, class_category_name1, class_category_name2, price, quantity, tax_rate, tax_rule) FROM stdin;
1	1	2	10	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1	8	1
2	2	2	10	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1	8	1
3	3	2	10	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1	8	1
4	4	2	10	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1	8	1
5	5	2	10	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1	8	1
6	6	2	10	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1	8	1
7	7	2	10	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1	8	1
8	8	32	40	ラベンダーのドライフラワー	p_0001	\N	\N	\N	\N	1800	1	8	1
9	9	30	38	クラフトノート	o_00061	\N	\N	\N	\N	1200	1	8	1
10	10	34	42	ローズマリー	p_0003	\N	\N	\N	\N	1800	1	8	1
11	11	33	41	ミニサボテン	p_0002	\N	\N	\N	\N	800	1	8	1
12	11	5	13	ガラステーブル	i_0003	\N	\N	\N	\N	20000	1	8	1
13	11	9	17	ガーデン用テーブルセット（スチール）	i_0007	\N	\N	\N	\N	32000	1	8	1
14	12	33	41	ミニサボテン	p_0002	\N	\N	\N	\N	800	1	8	1
15	13	30	38	クラフトノート	o_00061	\N	\N	\N	\N	1200	1	8	1
16	14	33	41	ミニサボテン	p_0002	\N	\N	\N	\N	800	1	8	1
17	15	4	12	ミニスツール	i_0002	\N	\N	\N	\N	10000	1	8	1
18	16	4	12	ミニスツール	i_0002	\N	\N	\N	\N	10000	1	8	1
19	17	33	41	ミニサボテン	p_0002	\N	\N	\N	\N	800	1	8	1
20	18	30	38	クラフトノート	video02	\N	\N	\N	\N	1200	1	8	1
21	19	33	41	ミニサボテン	p_0002	\N	\N	\N	\N	800	1	8	1
\.


--
-- Name: dtb_order_detail_order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_order_detail_order_detail_id_seq', 21, true);


--
-- Name: dtb_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_order_order_id_seq', 19, true);


--
-- Data for Name: dtb_page_layout; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_page_layout (page_id, device_type_id, page_name, url, file_name, edit_flg, author, description, keyword, update_url, create_date, update_date, meta_robots) FROM stdin;
0	10	プレビューデータ	preview	\N	1	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
1	10	TOPページ	homepage	index	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
2	10	商品一覧ページ	product_list	Product/list	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
3	10	商品詳細ページ	product_detail	Product/detail	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
4	10	MYページ	mypage	Mypage/index	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
5	10	MYページ/会員登録内容変更(入力ページ)	mypage_change	Mypage/change	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
6	10	MYページ/会員登録内容変更(完了ページ)	mypage_change_complete	Mypage/change_complete	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
9	10	MYページ/お気に入り一覧	mypage_favorite	Mypage/favorite	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
10	10	MYページ/購入履歴詳細	mypage_history	Mypage/history	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
11	10	MYページ/ログイン	mypage_login	Mypage/login	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
12	10	MYページ/退会手続き(入力ページ)	mypage_withdraw	Mypage/withdraw	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
13	10	MYページ/退会手続き(完了ページ)	mypage_withdraw_complete	Mypage/withdraw_complete	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
14	10	当サイトについて	help_about	Help/about	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
15	10	現在のカゴの中	cart	Cart/index	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
16	10	お問い合わせ(入力ページ)	contact	Contact/index	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
17	10	お問い合わせ(完了ページ)	contact_complete	Contact/complete	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
18	10	会員登録(入力ページ)	entry	Entry/index	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
20	10	会員登録(完了ページ)	entry_complete	Entry/complete	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
21	10	特定商取引に関する法律に基づく表記	help_tradelaw	Help/tradelaw	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
22	10	本会員登録(完了ページ)	entry_activate	Entry/activate	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
24	10	商品購入/お届け先の指定	shopping_shipping	Shopping/shipping	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
28	10	商品購入/ご注文完了	shopping_complete	Shopping/complete	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
29	10	プライバシーポリシー	help_privacy	Help/privacy	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
30	10	商品購入ログイン	shopping_login	Shopping/login	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
31	10	非会員購入情報入力	shopping_nonmember	Shopping/nonmember	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
32	10	商品購入/お届け先の追加	shopping_shipping_edit	Shopping/shipping_edit	2	\N	\N	\N	\N	2017-04-11 11:05:19	2017-04-11 11:05:19	noindex
33	10	商品購入/お届け先の複数指定(お届け先の追加)	shopping_shipping_multiple_edit	Shopping/shipping_multiple_edit	2	\N	\N	\N	\N	2017-04-11 11:05:19	2017-04-11 11:05:19	noindex
34	10	商品購入/購入エラー	shopping_error	Shopping/shopping_error	2	\N	\N	\N	\N	2017-04-11 11:05:19	2017-04-11 11:05:19	noindex
35	10	ご利用ガイド	help_guide	Help/guide	2	\N	\N	\N	\N	2017-04-11 11:05:19	2017-04-11 11:05:19	\N
36	10	パスワード再発行(入力ページ)	forgot	Forgot/index	2	\N	\N	\N	\N	2017-04-11 11:05:19	2017-04-11 11:05:19	\N
37	10	パスワード再発行(完了ページ)	forgot_complete	Forgot/complete	2	\N	\N	\N	\N	2017-04-11 11:05:19	2017-04-11 11:05:19	noindex
19	10	ご利用規約	help_agreement	Help/agreement	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	\N
25	10	商品購入/お届け先の複数指定	shopping_shipping_multiple	Shopping/shipping_multiple	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
23	10	商品購入	shopping	Shopping/index	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
7	10	MYページ/お届け先一覧	mypage_delivery	Mypage/delivery	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
8	10	MYページ/お届け先追加	mypage_delivery_new	Mypage/delivery_edit	2	\N	\N	\N	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	noindex
39	10	商品購入/配送方法選択	shopping_delivery	Shopping/index	2	\N	\N	\N	\N	2017-04-11 11:05:26	2017-04-11 11:05:26	noindex
40	10	商品購入/支払方法選択	shopping_payment	Shopping/index	2	\N	\N	\N	\N	2017-04-11 11:05:26	2017-04-11 11:05:26	noindex
41	10	商品購入/お届け先変更	shopping_shipping_change	Shopping/index	2	\N	\N	\N	\N	2017-04-11 11:05:26	2017-04-11 11:05:26	noindex
42	10	商品購入/お届け先変更	shopping_shipping_edit_change	Shopping/index	2	\N	\N	\N	\N	2017-04-11 11:05:26	2017-04-11 11:05:26	noindex
43	10	商品購入/お届け先の複数指定	shopping_shipping_multiple_change	Shopping/index	2	\N	\N	\N	\N	2017-04-11 11:05:26	2017-04-11 11:05:26	noindex
38	10	パスワード変更(完了ページ)	forgot_reset	Forgot/reset	2	\N	\N	\N	\N	2017-04-11 11:05:19	2017-04-11 11:05:38	noindex
44	10	MYページ/お届け先編集	mypage_delivery_edit	Mypage/delivery_edit	2	\N	\N	\N	\N	2017-04-11 11:05:46	2017-04-11 11:05:46	noindex
45	10	ストリーミング動画	mypage_streaming	Mypage/streaming	2	\N	\N	\N	\N	2017-04-24 06:52:03	2017-04-24 06:52:03	\N
46	10	マインカテゴリ	category_main	Product/list	2	\N	\N	\N	\N	2017-05-22 14:15:24	2017-05-22 14:15:24	\N
47	10	サブカテゴリ	category_sub	Product/list	2	\N	\N	\N	\N	2017-05-22 14:15:24	2017-05-22 14:15:24	\N
48	10	商品一覧	product_realtime	Product/list_realtime	2	\N	\N	\N	\N	2017-05-29 02:53:27	2017-05-29 02:53:27	\N
\.


--
-- Name: dtb_page_layout_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_page_layout_page_id_seq', 44, true);


--
-- Data for Name: dtb_payment; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_payment (payment_id, creator_id, payment_method, charge, rule_max, rank, fix_flg, del_flg, create_date, update_date, payment_image, charge_flg, rule_min) FROM stdin;
1	1	郵便振替	0	\N	4	1	0	2017-04-11 02:04:39	2017-04-11 02:04:39	\N	1	0
2	1	現金書留	0	\N	3	1	0	2017-04-11 02:04:39	2017-04-11 02:04:39	\N	1	0
3	1	銀行振込	0	\N	2	1	0	2017-04-11 02:04:39	2017-04-11 02:04:39	\N	1	0
4	1	代金引換	0	\N	1	1	0	2017-04-11 02:04:39	2017-04-11 02:04:39	\N	1	0
\.


--
-- Data for Name: dtb_payment_option; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_payment_option (delivery_id, payment_id) FROM stdin;
1	1
1	2
1	3
1	4
2	3
\.


--
-- Name: dtb_payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_payment_payment_id_seq', 4, true);


--
-- Data for Name: dtb_plugin; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_plugin (plugin_id, name, code, class_name, plugin_enable, del_flg, version, source, create_date, update_date) FROM stdin;
1	InfoTownLinkWp	InfoTownLinkWp	Event	0	1	2.0.0	0	2017-05-26 00:54:58	2017-05-27 01:23:37
\.


--
-- Data for Name: dtb_plugin_event_handler; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_plugin_event_handler (id, plugin_id, event, priority, del_flg, handler, handler_type, create_date, update_date) FROM stdin;
1	1	eccube.event.render.product_detail.before	400	1	onRenderProductDetailBefore	NORMAL	2017-05-26 00:54:58	2017-05-27 01:23:37
\.


--
-- Name: dtb_plugin_event_handler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_plugin_event_handler_id_seq', 1, true);


--
-- Name: dtb_plugin_plugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_plugin_plugin_id_seq', 1, true);


--
-- Data for Name: dtb_product; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_product (product_id, creator_id, status, name, note, description_list, description_detail, search_word, free_area, del_flg, create_date, update_date, sell_date, hd_link, sd_link, trailer_link, poster) FROM stdin;
2	1	1	パーコレーター	\N	\N	パーコレーターはコーヒーの粉をセットして直火にかけて抽出する器具です。\r\nアウトドアでも淹れたてのコーヒーをお楽しみいただけます。\r\nいまだけ、おいしい淹れ方の冊子つきです。	\N	\N	0	2017-04-11 02:04:39	2017-05-08 13:23:11	2017-05-12 00:00:00	video01_hd.mp4	video01_sd.mp4	\N	\N
29	2	1	モバイルバッテリー	\N	\N	ブラックのケースがおしゃれなモバイルバッテリー。コンパクトなサイズで鞄のなかでもかさばりません。	モバイル、バッテリー、コンパクト、日用品、プレゼント、携帯、スマフォ、スマートフォン	\N	0	2017-04-24 15:43:34	2017-05-08 15:35:22	2017-05-21 00:00:00	o_0006_hd.mp4	o_0006_sd.mp4	\N	\N
25	2	1	オブジェ（ペリカン）	\N	\N	木彫りのぬくもりがあたたかいアニマルオブジェ。	オブジェ、アニマル、動物、ペリカン、置物、木彫り	\N	0	2017-04-24 15:43:34	2017-05-08 13:53:23	2017-05-19 00:00:00	o_0002_hd.mp4	o_0002_sd.mp4	\N	\N
30	2	1	クラフトノート	\N	\N	紐で綴じて仕上げた、クラフト素材のシンプルなノートです。	ノート、クラフト、手作り、日用品、文房具	\N	0	2017-04-24 15:43:34	2017-05-08 13:17:11	2017-04-28 00:00:00	video02_hd.mp4	video02_sd.mp4	\N	\N
17	2	1	洋風土鍋	\N	\N	ヨーロッパの職人がつくった洋風土鍋。	土鍋、職人、ヨーロッパ	\N	0	2017-04-24 15:43:34	2017-05-08 13:52:54	2017-04-29 00:00:00	s_0008_hd.mp4	s_0008_sd.mp4	\N	\N
18	2	1	カッティングボード	\N	\N	匂いにも菌にも強い、天然の木を使ったカッティングボード。	カッティングボード、まな板	\N	0	2017-04-24 15:43:34	2017-05-08 13:50:53	2017-04-29 00:00:00	s_0009_hd.mp4	s_0009_sd.mp4	\N	\N
5	2	1	ガラステーブル	\N	\N	涼しげなガラスの天板を使ったテーブル。傷がつきにくい強化ガラスを使っています。	ガラステーブル、ガラス、テーブル、机、硝子	\N	0	2017-04-24 15:43:33	2017-05-08 13:33:50	2017-04-29 00:00:00	i_0003_hd.mp4	i_0003_sd.mp4	\N	\N
9	2	1	ガーデン用テーブルセット（スチール）	\N	\N	雨風に強いスチール製のガーデン用テーブルセット。	アウトドア、ガーデニング、机、テーブル、チェア、椅子、セット	\N	0	2017-04-24 15:43:33	2017-05-08 13:30:35	2017-04-30 00:00:00	i_0007_hd.mp4	i_0007_sd.mp4	\N	\N
26	2	1	オランダ木靴の置物	\N	\N	オランダの伝統的な靴「木靴」をそのままミニチュアにしました。ひとひとつ丁寧に彩色しています。	木彫り、木靴、オランダ、伝統、職人、ミニチュア	\N	0	2017-04-24 15:43:34	2017-05-08 13:53:51	2017-05-27 00:00:00	o_0003_hd.mp4	o_0003_sd.mp4	\N	\N
22	2	1	フロアライト	\N	\N	ヨーロッパの雰囲気がただよう黒のフロアライト。お部屋を明るく照らします。	ライト、フロアライト、明かり	\N	0	2017-04-24 15:43:34	2017-05-08 13:54:29	2017-05-19 00:00:00	l_00046_hd.mp4	l_00046_sd.mp4	\N	\N
28	2	1	本革ブックカバー	\N	\N	使い込むほどに手になじみ表情を変える本革のブックカバーです。	ブックカバー、革、本革、皮、プレゼント、職人	\N	0	2017-04-24 15:43:34	2017-05-08 13:54:58	2017-05-26 00:00:00	o_0005_hd.mp4	o_0005_sd.mp4	\N	\N
27	2	1	マトリョーシカ	\N	\N	ロシアの民芸品「マトリョーシカ」を、日本人作家が彩色しました。	マトリョーシカ、アート、作家、民芸品、ロシア	\N	0	2017-04-24 15:43:34	2017-05-08 13:55:26	2017-05-19 00:00:00	o_0004_hd.mp4	o_0004_sd.mp4	\N	\N
23	2	1	フォトクッションカバー	\N	\N	こだわりのシルクスクリーンのプリントが、お部屋のアクセントに。	クッション、アニマル、動物、シルクスクリーン、アート	\N	0	2017-04-24 15:43:34	2017-05-08 13:55:51	2017-05-28 00:00:00	i_0008_hd.mp4	i_0008_sd.mp4	\N	\N
24	2	1	オブジェ（ふくろう）	\N	\N	木彫りのぬくもりがあたたかいアニマルオブジェ。	オブジェ、アニマル、動物、ふくろう、木彫り、置物	\N	0	2017-04-24 15:43:34	2017-05-08 15:35:55	2017-06-03 00:00:00	o_0001_hd.mp4	o_0001_sd.mp4	\N	\N
19	2	1	ペンダントライト スチール	\N	\N	黒いスチールのペンダントライト。ダクトレールにワンタッチで取り付けることができます。	ライト、ペンダントライト、明かり	\N	0	2017-04-24 15:43:34	2017-05-08 13:57:01	2017-05-21 00:00:00	l_0001_hd.mp4	l_0001_sd.mp4	\N	\N
31	2	1	アンティーク時計	\N	\N	フランス製の60年代ごろにつくられたアンティークの時計です。ベルが鳴るアラーム機能付き。	アンティーク、時計、アラーム、フランス、骨董	\N	0	2017-04-24 15:43:34	2017-05-08 15:35:38	2017-05-27 00:00:00	o_0007_hd.mp4	o_0007_sd.mp4	\N	\N
12	2	1	ガラス製ドリンクサーバー	\N	\N	ガラス製のドリンクサーバー。オリジナルドリンクのほかに、果実酒などにも。	ドリンクサーバー、ガラス、果実酒、ドリンク、サーバー、瓶、ボトル	\N	0	2017-04-24 15:43:34	2017-05-08 13:58:21	2017-05-21 00:00:00	s_00026_hd.mp4	s_00026_sd.mp4	\N	\N
13	2	1	ガラス瓶	\N	\N	青色が美しい職人が仕上げた吹きガラスのガラス瓶。	ポット、アンティーク、瓶、ボトル	\N	0	2017-04-24 15:43:34	2017-05-08 13:58:49	2017-05-21 00:00:00	s_00057_hd.mp4	s_00057_sd.mp4	\N	\N
14	2	1	キャニスター	\N	\N	ガラス製の大容量キャニスターセット。	キャニスター、ガラス、瓶	\N	0	2017-04-24 15:43:34	2017-05-08 13:59:22	2017-06-03 00:00:00	s_0004_hd.mp4	s_0004_sd.mp4	\N	\N
10	2	1	スクエアプレート	\N	\N	シンプルななかにも、やわらかな曲線が特徴です。	皿、プレート、スクエア、白	\N	0	2017-04-24 15:43:33	2017-05-08 14:00:34	2017-06-04 00:00:00	s_0002_hd.mp4	s_0002_sd.mp4	\N	\N
11	2	1	ホーローマグ	\N	\N	使いこむほどに味がでる、ホーロー製のマグカップ。	ホーロー、琺瑯、マグカップ、コップ、マグ	\N	0	2017-04-24 15:43:33	2017-05-08 14:01:06	2017-06-09 00:00:00	s_00035_hd.mp4	s_00035_sd.mp4	\N	\N
8	2	1	ガーデン用テーブルセット	\N	\N	ステインでしあげたガーデン用のテーブルセット。	ガーデニング、テーブル、チェア、机、椅子、セット、アウトドア	\N	0	2017-04-24 15:43:33	2017-05-08 14:01:31	2017-06-16 00:00:00	i_0006_hd.mp4	i_0006_sd.mp4	\N	\N
3	2	1	ミニテーブル	\N	\N	足の透かし模様が美しいミニテーブル。	テーブル、ミニテーブル、机	\N	0	2017-04-24 15:43:33	2017-05-08 14:01:53	2017-05-27 00:00:00	i_0001_hd.mp4	i_0001_sd.mp4	\N	\N
4	2	1	ミニスツール	\N	\N	ナチュラル素材を使ったオリジナルのミニスツール。自然の風合いをお楽しみください。	スツール、椅子	\N	0	2017-04-24 15:43:33	2017-05-08 14:02:16	2017-05-26 00:00:00	i_0002_hd.mp4	i_0002_sd.mp4	\N	\N
7	2	1	デザインフォトフレーム	\N	\N	アンティーク加工を施したフォトフレーム。個性的な絵が引き立ちます。	額縁、フォトフレーム、アート	\N	0	2017-04-24 15:43:33	2017-05-08 14:02:47	2017-05-26 00:00:00	i_0005_hd.mp4	i_0005_sd.mp4	\N	\N
20	2	1	ペンダントライト	\N	\N	電球一体型のペンダントライト。ワット数は少し暗めのものをお選びいただくのがおすすめです。	ライト、ペンダントライト、電球、明かり	\N	0	2017-04-24 15:43:34	2017-05-08 13:50:21	2017-05-26 00:00:00	l_0002_hd.mp4	l_0002_sd.mp4	\N	\N
15	2	1	アンティークポット	\N	\N	アンティークの味わい深いポットです。	ポット、アンティーク	\N	0	2017-04-24 15:43:34	2017-05-08 13:51:52	2017-04-27 00:00:00	s_0006_hd.mp4	s_0006_sd.mp4	\N	\N
16	2	1	真鍮シュガーポット	\N	\N	少しオリエンタルな雰囲気もある真鍮製のシュガーポットです。	シュガーポット、真鍮	\N	0	2017-04-24 15:43:34	2017-05-08 13:52:30	2017-04-29 00:00:00	s_0007_hd.mp4	s_0007_sd.mp4	\N	\N
21	2	1	ウッドペンダントランプ	\N	\N	明るい木目と丸みのある形がかわいいシーリングライト。ペンダントの内側のイエローがポップな印象。	ライト、明かり、シーリングライト	\N	0	2017-04-24 15:43:34	2017-05-08 13:57:24	2017-05-07 00:00:00	l_0003_hd.mp4	l_0003_sd.mp4	\N	\N
33	2	1	ミニサボテン	\N	\N	お部屋に観葉植物はいかがですか？育てやすくてインテリアにもなり、再び注目を集めているサボテン。	サボテン、観葉植物、グリーン、植物	\N	0	2017-04-24 15:43:34	2017-05-08 15:33:47	2017-05-19 00:00:00	p_0002_hd.mp4	p_0002_sd.mp4	\N	\N
6	2	1	フォトフレーム（A4）	\N	\N	シンプルなフォトフレーム。壁掛けのほかにスタンドでもお使いいただけます。	額縁、フォトフレーム、ガラス	\N	0	2017-04-24 15:43:33	2017-05-08 15:35:02	2017-05-27 00:00:00	i_0004_hd.mp4	i_0004_sd.mp4	\N	\N
1	1	1	ディナーフォーク	\N	\N	セットで揃えたいディナー用のカトラリー。\r\n定番の銀製は、シルバー特有の美しい輝きと柔らかな曲線が特徴です。適度な重みと日本人の手に合いやすいサイズ感で長く愛用いただけます。\r\n最高級プラチナフォークは、贈り物としても人気です。	\N	\N	0	2017-04-11 02:04:39	2017-05-08 13:25:26	2017-04-28 00:00:00	\N	\N	\N	\N
34	2	1	ローズマリー	\N	\N	育てやすいローズマリー。料理や芳香剤としてなど、幅広くお使いいただけます。	ローズマリー、ハーブ、植物	\N	0	2017-04-24 15:43:34	2017-05-08 13:49:26	2017-06-03 00:00:00	p_0003_hd.mp4	p_0003_sd.mp4	\N	\N
32	2	1	ラベンダーのドライフラワー	\N	\N	ボリュームたっぷりラベンダーのドライ。バケツとセットです。	ラベンダー、観葉植物、グリーン、植物、ハーブ	\N	0	2017-04-24 15:43:34	2017-05-08 13:49:59	2017-04-28 00:00:00	p_0001_hd.mp4	p_0001_sd.mp4	\N	\N
35	2	1	りんご	\N	\N	\N	\N	<!-- linkwp format="contents" -->	0	2017-05-08 22:38:56	2017-05-26 23:25:42	2017-12-30 00:00:00	apple_hd.mp4	apple_sd.mp4	\N	\N
\.


--
-- Data for Name: dtb_product_category; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_product_category (product_id, category_id, rank) FROM stdin;
31	1	1
35	6	1
35	45	2
35	71	3
35	77	4
35	81	5
35	83	6
30	1	1
30	7	2
30	11	3
30	16	4
30	15	5
30	14	6
2	1	1
2	7	2
2	11	3
2	16	4
2	14	5
2	15	6
1	1	1
1	7	2
1	11	3
1	16	4
1	15	5
1	14	6
1	13	7
1	18	8
1	12	9
1	21	10
1	4	11
1	25	12
1	26	13
1	27	14
1	28	15
1	29	16
1	33	17
1	32	18
1	30	19
1	35	20
1	3	21
1	37	22
1	40	23
1	39	24
1	36	25
1	42	26
1	5	27
1	44	28
1	6	29
1	47	30
1	48	31
1	52	32
1	51	33
1	50	34
1	56	35
1	55	36
1	54	37
1	49	38
1	58	39
1	57	40
1	46	41
1	59	42
1	63	43
1	62	44
1	60	45
1	65	46
1	61	47
1	68	48
1	45	49
1	69	50
1	73	51
1	70	52
1	75	53
1	71	54
1	78	55
9	1	1
9	7	2
9	11	3
9	16	4
9	15	5
9	13	6
9	19	7
9	18	8
9	12	9
9	22	10
9	20	11
9	4	12
9	25	13
9	27	14
9	29	15
9	32	16
9	30	17
9	35	18
9	3	19
9	37	20
9	40	21
9	39	22
9	36	23
9	41	24
9	5	25
9	43	26
9	6	27
9	47	28
9	48	29
9	52	30
9	50	31
9	56	32
9	55	33
9	49	34
9	57	35
9	46	36
9	59	37
9	63	38
9	60	39
9	65	40
9	61	41
9	67	42
9	45	43
9	69	44
9	72	45
9	70	46
9	75	47
9	71	48
9	77	49
5	1	1
5	7	2
5	11	3
5	16	4
5	14	5
5	13	6
5	18	7
5	12	8
5	21	9
5	4	10
5	25	11
5	26	12
5	27	13
5	29	14
5	32	15
5	30	16
5	34	17
5	3	18
5	37	19
5	39	20
5	36	21
5	41	22
5	5	23
5	44	24
5	6	25
5	47	26
5	48	27
5	52	28
5	50	29
5	55	30
5	46	31
5	60	32
5	65	33
24	1	1
24	7	2
24	11	3
24	16	4
24	15	5
24	14	6
34	1	1
34	7	2
34	11	3
34	14	4
34	13	5
34	17	6
34	12	7
34	20	8
34	4	9
34	25	10
34	28	11
34	29	12
34	32	13
34	30	14
34	34	15
34	3	16
34	37	17
34	40	18
34	39	19
34	36	20
34	42	21
34	5	22
34	44	23
34	6	24
34	47	25
34	48	26
34	52	27
34	50	28
34	56	29
34	49	30
34	57	31
34	46	32
34	59	33
34	63	34
34	60	35
34	65	36
34	61	37
34	67	38
34	45	39
34	69	40
34	73	41
34	70	42
34	75	43
34	71	44
34	78	45
34	76	46
32	1	1
32	7	2
32	13	3
32	19	4
32	18	5
32	17	6
20	1	1
20	7	2
20	12	3
20	22	4
20	21	5
20	20	6
20	4	7
20	25	8
20	26	9
20	29	10
20	33	11
18	1	1
18	7	2
18	12	3
18	22	4
18	21	5
18	4	6
18	25	7
18	26	8
18	27	9
18	28	10
15	1	1
15	4	2
15	29	3
15	33	4
15	32	5
15	31	6
15	30	7
15	35	8
15	3	9
15	37	10
15	40	11
15	39	12
15	38	13
16	1	1
16	3	2
16	37	3
16	39	4
16	38	5
16	36	6
16	41	7
16	5	8
16	44	9
17	1	1
17	4	2
17	25	3
17	26	4
17	29	5
17	33	6
17	30	7
17	35	8
17	3	9
17	37	10
17	39	11
17	36	12
17	41	13
17	5	14
17	44	15
25	6	1
25	47	2
25	48	3
25	53	4
25	52	5
25	51	6
26	6	1
26	47	2
26	48	3
26	53	4
26	51	5
26	50	6
26	56	7
26	55	8
26	54	9
22	6	1
22	47	2
22	49	3
22	58	4
22	57	5
22	46	6
22	59	7
22	64	8
22	62	9
28	6	1
28	47	2
28	50	3
28	56	4
28	55	5
28	54	6
28	49	7
28	58	8
28	57	9
27	6	1
27	46	2
27	59	3
27	64	4
27	63	5
27	62	6
23	6	1
23	46	2
23	60	3
23	66	4
23	65	5
23	61	6
23	68	7
23	67	8
19	6	1
19	45	2
19	71	3
19	78	4
19	77	5
19	76	6
21	6	1
21	46	2
21	60	3
21	66	4
21	61	5
21	68	6
21	45	7
21	69	8
21	73	9
21	70	10
21	75	11
21	71	12
21	78	13
12	1	1
12	7	2
12	13	3
12	19	4
12	18	5
12	12	6
12	21	7
12	6	8
12	47	9
12	48	10
12	51	11
12	50	12
12	56	13
12	46	14
12	59	15
12	62	16
12	60	17
12	65	18
12	61	19
12	45	20
12	69	21
12	73	22
13	1	1
13	7	2
13	13	3
13	18	4
13	17	5
13	4	6
13	29	7
13	32	8
13	6	9
13	47	10
13	48	11
13	53	12
13	52	13
13	51	14
13	50	15
13	55	16
14	1	1
14	7	2
14	11	3
14	15	4
14	13	5
14	17	6
14	6	7
14	47	8
14	48	9
14	51	10
14	50	11
14	54	12
14	49	13
14	57	14
14	46	15
14	59	16
14	63	17
14	60	18
14	65	19
14	61	20
14	67	21
14	45	22
14	69	23
14	73	24
14	70	25
14	75	26
14	71	27
14	77	28
14	76	29
10	6	1
10	47	2
10	48	3
10	52	4
10	50	5
10	56	6
10	55	7
10	54	8
11	1	1
11	7	2
11	13	3
11	19	4
11	18	5
11	17	6
11	12	7
11	22	8
11	21	9
11	20	10
11	3	11
11	5	12
11	44	13
11	43	14
8	1	1
8	7	2
8	11	3
8	16	4
8	15	5
8	14	6
3	1	1
3	4	2
3	29	3
3	33	4
3	32	5
3	31	6
4	1	1
4	4	2
4	25	3
4	26	4
4	27	5
4	28	6
4	29	7
4	33	8
4	32	9
4	31	10
7	1	1
7	7	2
7	13	3
7	19	4
7	18	5
7	17	6
33	6	1
33	1	2
33	7	3
33	11	4
33	14	5
33	13	6
33	18	7
33	12	8
33	21	9
33	4	10
33	25	11
33	27	12
33	29	13
33	32	14
33	30	15
33	34	16
33	3	17
33	37	18
33	39	19
33	36	20
33	41	21
33	5	22
33	43	23
6	1	1
6	7	2
6	11	3
6	16	4
6	15	5
6	14	6
29	1	1
29	7	2
29	13	3
29	19	4
29	18	5
29	17	6
29	12	7
29	22	8
29	21	9
29	20	10
\.


--
-- Data for Name: dtb_product_class; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_product_class (product_class_id, product_id, product_type_id, class_category_id1, class_category_id2, delivery_date_id, creator_id, product_code, stock, stock_unlimited, sale_limit, price01, price02, delivery_fee, create_date, update_date, del_flg) FROM stdin;
0	1	1	\N	\N	\N	1	fork-01	\N	1	\N	115000	110000	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	1
1	1	1	3	6	\N	1	fork-01	\N	1	\N	115000	110000	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	0
2	1	1	3	5	\N	1	fork-02	\N	1	\N	95000	93000	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	0
3	1	1	3	4	\N	1	fork-03	\N	1	\N	75000	74000	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	0
4	1	1	2	6	\N	1	fork-04	\N	1	\N	95000	93000	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	0
5	1	1	2	5	\N	1	fork-05	\N	1	\N	50000	49000	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	0
6	1	1	2	4	\N	1	fork-06	\N	1	\N	35000	34500	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	0
7	1	1	1	6	\N	1	fork-07	\N	1	\N	\N	18000	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	0
8	1	1	1	5	\N	1	fork-08	\N	1	\N	\N	13000	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	0
9	1	1	1	4	\N	1	fork-09	\N	1	\N	\N	5000	\N	2017-04-11 02:04:39	2017-04-11 02:04:39	0
28	20	2	\N	\N	\N	2	l_0002	\N	1	\N	\N	8000	\N	2017-04-24 15:43:34	2017-05-08 13:50:21	0
26	18	2	\N	\N	\N	2	s_0009	\N	1	\N	\N	4500	\N	2017-04-24 15:43:34	2017-05-08 13:50:53	0
23	15	2	\N	\N	\N	2	s_0006	\N	1	\N	\N	4000	\N	2017-04-24 15:43:34	2017-05-08 13:51:52	0
24	16	2	\N	\N	\N	2	s_0007	\N	1	\N	\N	4500	\N	2017-04-24 15:43:34	2017-05-08 13:52:30	0
25	17	2	\N	\N	\N	2	s_0008	\N	1	\N	\N	8500	\N	2017-04-24 15:43:34	2017-05-08 13:52:54	0
33	25	1	\N	\N	\N	2	o_0002	\N	1	\N	\N	4000	\N	2017-04-24 15:43:34	2017-05-08 13:53:23	0
34	26	1	\N	\N	\N	2	o_0003	\N	1	\N	\N	2500	\N	2017-04-24 15:43:34	2017-05-08 13:53:51	0
38	30	2	\N	\N	\N	2	video02	\N	1	\N	\N	1200	\N	2017-04-24 15:43:34	2017-05-08 13:17:11	0
30	22	1	\N	\N	\N	2	l_00046	\N	1	\N	\N	15000	\N	2017-04-24 15:43:34	2017-05-08 13:54:29	0
36	28	1	\N	\N	\N	2	o_0005	\N	1	\N	\N	8000	\N	2017-04-24 15:43:34	2017-05-08 13:54:58	0
10	2	2	\N	\N	\N	1	video01	96	0	5	3000	2800	\N	2017-04-11 02:04:39	2017-05-08 13:23:10	0
17	9	2	\N	\N	\N	2	i_0007	\N	1	\N	\N	32000	\N	2017-04-24 15:43:33	2017-05-08 13:30:35	0
13	5	2	\N	\N	\N	2	i_0003	\N	1	\N	25000	20000	\N	2017-04-24 15:43:33	2017-05-08 13:33:50	0
42	34	2	\N	\N	\N	2	p_0003	\N	1	\N	2600	1800	\N	2017-04-24 15:43:34	2017-05-08 13:49:26	0
40	32	2	\N	\N	\N	2	p_0001	\N	1	\N	2600	1800	\N	2017-04-24 15:43:34	2017-05-08 13:49:59	0
35	27	1	\N	\N	\N	2	o_0004	\N	1	\N	\N	4400	\N	2017-04-24 15:43:34	2017-05-08 13:55:26	0
31	23	1	\N	\N	\N	2	i_0008	\N	1	\N	\N	10000	\N	2017-04-24 15:43:34	2017-05-08 13:55:51	0
43	35	1	\N	\N	\N	2	apple	\N	1	\N	\N	100	\N	2017-05-08 22:38:56	2017-05-26 23:25:42	0
27	19	1	\N	\N	\N	2	l_0001	\N	1	\N	\N	9000	\N	2017-04-24 15:43:34	2017-05-08 13:57:01	0
29	21	1	\N	\N	\N	2	l_0003	\N	1	\N	\N	15000	\N	2017-04-24 15:43:34	2017-05-08 13:57:24	0
20	12	1	\N	\N	\N	2	s_00026	\N	1	\N	\N	3500	\N	2017-04-24 15:43:34	2017-05-08 13:58:20	0
21	13	1	\N	\N	\N	2	s_00057	\N	1	\N	\N	4000	\N	2017-04-24 15:43:34	2017-05-08 13:58:49	0
22	14	1	\N	\N	\N	2	s_0004	\N	1	\N	\N	1800	\N	2017-04-24 15:43:34	2017-05-08 13:59:22	0
18	10	1	\N	\N	\N	2	s_0002	\N	1	\N	\N	1500	\N	2017-04-24 15:43:33	2017-05-08 14:00:33	0
19	11	1	\N	\N	\N	2	s_00035	\N	1	\N	\N	1600	\N	2017-04-24 15:43:34	2017-05-08 14:01:05	0
16	8	1	\N	\N	\N	2	i_0006	\N	1	\N	\N	28000	\N	2017-04-24 15:43:33	2017-05-08 14:01:31	0
11	3	1	\N	\N	\N	2	i_0001	\N	1	2	18000	12000	\N	2017-04-24 15:43:33	2017-05-08 14:01:53	0
12	4	1	\N	\N	\N	2	i_0002	\N	1	2	15000	10000	\N	2017-04-24 15:43:33	2017-05-08 14:02:15	0
15	7	1	\N	\N	\N	2	i_0005	\N	1	\N	\N	4000	\N	2017-04-24 15:43:33	2017-05-08 14:02:47	0
41	33	2	\N	\N	\N	2	p_0002	\N	1	\N	1500	800	\N	2017-04-24 15:43:34	2017-05-08 15:33:47	0
14	6	1	\N	\N	\N	2	i_0004	\N	1	\N	\N	2500	\N	2017-04-24 15:43:33	2017-05-08 15:35:02	0
37	29	1	\N	\N	\N	2	o_0006	\N	1	\N	\N	3000	\N	2017-04-24 15:43:34	2017-05-08 15:35:22	0
39	31	1	\N	\N	\N	2	o_0007	\N	1	\N	\N	12000	\N	2017-04-24 15:43:34	2017-05-08 15:35:38	0
32	24	1	\N	\N	\N	2	o_0001	\N	1	\N	\N	3800	\N	2017-04-24 15:43:34	2017-05-08 15:35:55	0
\.


--
-- Name: dtb_product_class_product_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_product_class_product_class_id_seq', 43, true);


--
-- Data for Name: dtb_product_image; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_product_image (product_image_id, product_id, creator_id, file_name, rank, create_date) FROM stdin;
31	27	2	0701121534_55935b560d338.jpeg	1	2017-04-24 15:43:34
27	23	2	0701121020_55935a1c77a34.jpeg	1	2017-04-24 15:43:34
23	19	2	0701120624_55935930c5386.jpeg	1	2017-04-24 15:43:34
25	21	2	0701120808_559359985e7a1.jpeg	1	2017-04-24 15:43:34
16	12	2	0701113711_5593525783914.jpeg	1	2017-04-24 15:43:34
17	13	2	0701114710_559354aef0aea.jpeg	1	2017-04-24 15:43:34
18	14	2	0701115420_5593565cc5a8a.jpeg	1	2017-04-24 15:43:34
14	10	2	0701113429_559351b5399d9.jpeg	1	2017-04-24 15:43:33
15	11	2	0701113537_559351f959620.jpeg	1	2017-04-24 15:43:33
12	8	2	0701111340_55934cd4cc779.jpeg	1	2017-04-24 15:43:33
7	3	2	0701104933_5593472d8d179.jpeg	1	2017-04-24 15:43:33
8	4	2	0701105242_559347ea26642.jpeg	1	2017-04-24 15:43:33
11	7	2	0701111215_55934c7f8bb8e.jpeg	1	2017-04-24 15:43:33
37	33	2	0701122303_55935d17278d6.jpeg	1	2017-04-24 15:43:34
10	6	2	0701110837_55934ba552732.jpeg	1	2017-04-24 15:43:33
33	29	2	0701121744_55935bd8de37e.jpeg	1	2017-04-24 15:43:34
35	31	2	0701121929_55935c4100727.jpeg	1	2017-04-24 15:43:34
28	24	2	0701121210_55935a8a45163.jpeg	1	2017-04-24 15:43:34
34	30	2	0701121841_55935c114e715.jpeg	1	2017-04-24 15:43:34
39	35	2	0508223741_591074a584236.jpg	1	2017-05-08 22:38:56
4	2	1	cafe-1.jpg	1	2017-04-11 02:04:39
5	2	1	cafe-2.jpg	2	2017-04-11 02:04:39
6	2	1	cafe-3.jpg	3	2017-04-11 02:04:39
1	1	1	fork-1.jpg	1	2017-04-11 02:04:39
2	1	1	fork-2.jpg	2	2017-04-11 02:04:39
3	1	1	fork-3.jpg	3	2017-04-11 02:04:39
13	9	2	0701111516_55934d3477763.jpeg	1	2017-04-24 15:43:33
9	5	2	0701110627_55934b2349e4f.jpeg	1	2017-04-24 15:43:33
38	34	2	0701122441_55935d79740c1.jpeg	1	2017-04-24 15:43:34
36	32	2	0701122030_55935c7ef1d94.jpeg	1	2017-04-24 15:43:34
24	20	2	0701120729_55935971e068c.jpeg	1	2017-04-24 15:43:34
22	18	2	0701115935_5593579758957.jpeg	1	2017-04-24 15:43:34
19	15	2	0701115551_559356b78ba67.jpeg	1	2017-04-24 15:43:34
20	16	2	0701115703_559356ffe14f8.jpeg	1	2017-04-24 15:43:34
21	17	2	0701115837_5593575dd1890.jpeg	1	2017-04-24 15:43:34
29	25	2	0701121324_55935ad47d66e.jpeg	1	2017-04-24 15:43:34
30	26	2	0701121449_55935b2959277.jpeg	1	2017-04-24 15:43:34
26	22	2	0701120921_559359e185a11.jpeg	1	2017-04-24 15:43:34
32	28	2	0701121636_55935b94c4fab.jpeg	1	2017-04-24 15:43:34
\.


--
-- Name: dtb_product_image_product_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_product_image_product_image_id_seq', 39, true);


--
-- Name: dtb_product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_product_product_id_seq', 35, true);


--
-- Data for Name: dtb_product_stock; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_product_stock (product_stock_id, product_class_id, creator_id, stock, create_date, update_date) FROM stdin;
1	0	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
2	1	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
3	2	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
4	3	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
5	4	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
6	5	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
7	6	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
8	7	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
9	8	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
10	9	1	\N	2017-04-11 02:04:39	2017-04-11 02:04:39
12	11	2	\N	2017-04-24 15:43:33	2017-04-24 15:43:33
13	12	2	\N	2017-04-24 15:43:33	2017-04-24 15:43:33
14	13	2	\N	2017-04-24 15:43:33	2017-04-24 15:43:33
15	14	2	\N	2017-04-24 15:43:33	2017-04-24 15:43:33
16	15	2	\N	2017-04-24 15:43:33	2017-04-24 15:43:33
17	16	2	\N	2017-04-24 15:43:33	2017-04-24 15:43:33
18	17	2	\N	2017-04-24 15:43:33	2017-04-24 15:43:33
19	18	2	\N	2017-04-24 15:43:33	2017-04-24 15:43:33
20	19	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
21	20	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
22	21	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
23	22	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
24	23	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
25	24	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
26	25	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
27	26	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
28	27	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
29	28	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
30	29	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
31	30	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
32	31	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
33	32	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
34	33	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
35	34	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
36	35	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
37	36	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
38	37	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
39	38	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
40	39	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
41	40	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
42	41	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
43	42	2	\N	2017-04-24 15:43:34	2017-04-24 15:43:34
11	10	1	96	2017-04-11 02:04:39	2017-05-08 13:23:10
44	43	2	\N	2017-05-08 22:38:56	2017-05-08 22:38:56
\.


--
-- Name: dtb_product_stock_product_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_product_stock_product_stock_id_seq', 44, true);


--
-- Data for Name: dtb_product_tag; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_product_tag (product_tag_id, product_id, tag, creator_id, create_date) FROM stdin;
\.


--
-- Name: dtb_product_tag_product_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_product_tag_product_tag_id_seq', 1, false);


--
-- Data for Name: dtb_shipment_item; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_shipment_item (item_id, order_id, product_id, product_class_id, shipping_id, product_name, product_code, class_name1, class_name2, class_category_name1, class_category_name2, price, quantity) FROM stdin;
1	1	2	10	1	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1
2	2	2	10	2	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1
3	3	2	10	3	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1
4	4	2	10	4	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1
5	5	2	10	5	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1
6	6	2	10	6	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1
7	7	2	10	7	パーコレーター	cafe-01	\N	\N	\N	\N	2800	1
8	8	32	40	8	ラベンダーのドライフラワー	p_0001	\N	\N	\N	\N	1800	1
9	9	30	38	9	クラフトノート	o_00061	\N	\N	\N	\N	1200	1
10	10	34	42	10	ローズマリー	p_0003	\N	\N	\N	\N	1800	1
11	11	33	41	11	ミニサボテン	p_0002	\N	\N	\N	\N	800	1
12	11	5	13	11	ガラステーブル	i_0003	\N	\N	\N	\N	20000	1
13	11	9	17	11	ガーデン用テーブルセット（スチール）	i_0007	\N	\N	\N	\N	32000	1
14	12	33	41	12	ミニサボテン	p_0002	\N	\N	\N	\N	800	1
15	13	30	38	13	クラフトノート	o_00061	\N	\N	\N	\N	1200	1
16	14	33	41	14	ミニサボテン	p_0002	\N	\N	\N	\N	800	1
17	15	4	12	15	ミニスツール	i_0002	\N	\N	\N	\N	10000	1
18	16	4	12	16	ミニスツール	i_0002	\N	\N	\N	\N	10000	1
19	17	33	41	17	ミニサボテン	p_0002	\N	\N	\N	\N	800	1
20	18	30	38	18	クラフトノート	video02	\N	\N	\N	\N	1200	1
21	19	33	41	19	ミニサボテン	p_0002	\N	\N	\N	\N	800	1
\.


--
-- Name: dtb_shipment_item_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_shipment_item_item_id_seq', 21, true);


--
-- Data for Name: dtb_shipping; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_shipping (shipping_id, shipping_country_id, shipping_pref, order_id, delivery_id, time_id, fee_id, shipping_name01, shipping_name02, shipping_kana01, shipping_kana02, shipping_company_name, shipping_tel01, shipping_tel02, shipping_tel03, shipping_fax01, shipping_fax02, shipping_fax03, shipping_zip01, shipping_zip02, shipping_zipcode, shipping_addr01, shipping_addr02, shipping_delivery_name, shipping_delivery_time, shipping_delivery_date, shipping_delivery_fee, shipping_commit_date, rank, create_date, update_date, del_flg) FROM stdin;
1	\N	12	1	1	\N	12	Lam	lam	フ	フ	\N	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	サンプル業者	\N	\N	1000	\N	\N	2017-04-11 11:51:31	2017-04-11 11:51:31	0
2	\N	12	2	1	\N	12	Lam	lam	フ	フ	\N	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	サンプル業者	\N	\N	1000	\N	\N	2017-04-11 11:53:52	2017-04-11 11:53:52	0
3	\N	12	3	1	\N	12	Lam	lam	フ	フ	\N	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	サンプル業者	\N	\N	1000	\N	\N	2017-04-11 11:57:26	2017-04-11 11:57:26	0
4	\N	12	4	1	\N	12	Lam	lam	フ	フ	\N	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	サンプル業者	\N	\N	1000	\N	\N	2017-04-11 12:37:25	2017-04-11 12:37:25	0
5	\N	13	5	1	\N	13	鈴木	太郎	スズキ	タロウ	\N	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	サンプル業者	\N	\N	1000	\N	\N	2017-04-19 11:45:40	2017-04-19 11:45:40	0
6	\N	13	6	1	\N	13	鈴木	太郎	スズキ	タロウ	\N	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	サンプル業者	\N	\N	1000	\N	\N	2017-04-19 11:47:32	2017-04-19 11:47:32	0
7	\N	13	7	1	\N	13	鈴木	太郎	サトウ	タロウ	\N	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	サンプル業者	\N	\N	1000	\N	\N	2017-04-19 13:26:57	2017-04-19 13:26:57	0
8	\N	12	8	2	\N	59	Lam	lam	フ	フ	\N	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	サンプル宅配	\N	\N	0	\N	\N	2017-04-24 16:00:49	2017-04-24 16:00:49	0
9	\N	12	9	2	\N	59	Lam	lam	フ	フ	\N	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	サンプル宅配	\N	\N	0	\N	\N	2017-04-24 16:02:15	2017-04-24 16:02:15	0
10	\N	12	10	2	\N	59	Lam	lam	フ	フ	\N	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	サンプル宅配	\N	\N	0	\N	\N	2017-04-24 16:03:12	2017-04-24 16:03:12	0
11	\N	12	11	2	\N	59	Lam	lam	フ	フ	\N	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	サンプル宅配	\N	\N	0	\N	\N	2017-04-24 16:25:05	2017-04-24 16:25:05	0
12	\N	13	12	2	\N	60	鈴木	太郎	スズキ	タロウ	\N	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	サンプル宅配	\N	\N	0	\N	\N	2017-04-24 16:51:11	2017-04-24 16:51:11	0
13	\N	13	13	2	\N	60	鈴木	太郎	スズキ	タロウ	\N	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	サンプル宅配	\N	\N	0	\N	\N	2017-04-24 16:52:27	2017-04-24 16:52:27	0
14	\N	13	14	2	\N	60	鈴木	太郎	スズキ	タロウ	\N	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	サンプル宅配	\N	\N	0	\N	\N	2017-04-24 17:12:38	2017-04-24 17:12:38	0
15	\N	13	15	1	\N	13	鈴木	太郎	スズキ	タロウ	\N	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	サンプル業者	\N	\N	1000	\N	\N	2017-04-24 17:13:15	2017-04-24 17:13:15	0
16	\N	13	16	1	\N	13	鈴木	太郎	スズキ	タロウ	\N	111	1111	1111	\N	\N	\N	150	0044	1500044	渋谷区円山町	111	サンプル業者	\N	\N	1000	\N	\N	2017-04-24 17:14:03	2017-04-24 17:14:03	0
17	\N	12	17	2	\N	59	Lam	lam	フ	フ	\N	1	1	1	\N	\N	\N	274	0824	2740824	船橋市前原東	11	サンプル宅配	\N	\N	0	\N	\N	2017-04-24 18:09:53	2017-04-24 18:09:53	0
18	\N	13	18	2	\N	60	鈴木	太郎	サトウ	タロウ	\N	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	サンプル宅配	\N	\N	0	\N	\N	2017-04-27 16:01:11	2017-04-27 16:01:11	0
19	\N	13	19	2	\N	60	鈴木	太郎	サトウ	タロウ	\N	080	1111	1111	\N	\N	\N	150	0011	1500011	渋谷区東	1-2-3	サンプル宅配	\N	\N	0	\N	\N	2017-05-09 12:56:16	2017-05-09 12:56:16	0
\.


--
-- Name: dtb_shipping_shipping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_shipping_shipping_id_seq', 19, true);


--
-- Data for Name: dtb_tax_rule; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_tax_rule (tax_rule_id, product_class_id, creator_id, country_id, pref_id, product_id, calc_rule, tax_rate, tax_adjust, apply_date, del_flg, create_date, update_date) FROM stdin;
1	\N	1	\N	\N	\N	1	8	0	2017-04-11 02:04:39	0	2017-04-11 02:04:39	2017-04-11 02:04:39
\.


--
-- Name: dtb_tax_rule_tax_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_tax_rule_tax_rule_id_seq', 1, true);


--
-- Data for Name: dtb_template; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY dtb_template (template_id, device_type_id, template_code, template_name, create_date, update_date) FROM stdin;
1	10	default	デフォルト	2017-04-11 02:04:39	2017-04-11 02:04:39
2	1	mobile	モバイル	2017-04-11 02:04:39	2017-04-11 02:04:39
4	2	sphone	スマートフォン	2017-04-11 02:04:39	2017-04-11 02:04:39
9	10	001	001	2017-05-03 16:26:35	2017-05-03 16:26:35
\.


--
-- Name: dtb_template_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('dtb_template_template_id_seq', 9, true);


--
-- Data for Name: mtb_authority; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_authority (id, name, rank) FROM stdin;
0	システム管理者	0
1	店舗オーナー	1
\.


--
-- Data for Name: mtb_country; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_country (id, name, rank) FROM stdin;
352	アイスランド	1
372	アイルランド	2
31	アゼルバイジャン	3
4	アフガニスタン	4
840	アメリカ合衆国	5
850	アメリカ領ヴァージン諸島	6
16	アメリカ領サモア	7
784	アラブ首長国連邦	8
12	アルジェリア	9
32	アルゼンチン	10
533	アルバ	11
8	アルバニア	12
51	アルメニア	13
660	アンギラ	14
24	アンゴラ	15
28	アンティグア・バーブーダ	16
20	アンドラ	17
887	イエメン	18
826	イギリス	19
86	イギリス領インド洋地域	20
92	イギリス領ヴァージン諸島	21
376	イスラエル	22
380	イタリア	23
368	イラク	24
364	イラン|イラン・イスラム共和国	25
356	インド	26
360	インドネシア	27
876	ウォリス・フツナ	28
800	ウガンダ	29
804	ウクライナ	30
860	ウズベキスタン	31
858	ウルグアイ	32
218	エクアドル	33
818	エジプト	34
233	エストニア	35
231	エチオピア	36
232	エリトリア	37
222	エルサルバドル	38
36	オーストラリア	39
40	オーストリア	40
248	オーランド諸島	41
512	オマーン	42
528	オランダ	43
288	ガーナ	44
132	カーボベルデ	45
831	ガーンジー	46
328	ガイアナ	47
398	カザフスタン	48
634	カタール	49
581	合衆国領有小離島	50
124	カナダ	51
266	ガボン	52
120	カメルーン	53
270	ガンビア	54
116	カンボジア	55
580	北マリアナ諸島	56
324	ギニア	57
624	ギニアビサウ	58
196	キプロス	59
192	キューバ	60
531	キュラソー島|キュラソー	61
300	ギリシャ	62
296	キリバス	63
417	キルギス	64
320	グアテマラ	65
312	グアドループ	66
316	グアム	67
414	クウェート	68
184	クック諸島	69
304	グリーンランド	70
162	クリスマス島 (オーストラリア)|クリスマス島	71
268	グルジア	72
308	グレナダ	73
191	クロアチア	74
136	ケイマン諸島	75
404	ケニア	76
384	コートジボワール	77
166	ココス諸島|ココス（キーリング）諸島	78
188	コスタリカ	79
174	コモロ	80
170	コロンビア	81
178	コンゴ共和国	82
180	コンゴ民主共和国	83
682	サウジアラビア	84
239	サウスジョージア・サウスサンドウィッチ諸島	85
882	サモア	86
678	サントメ・プリンシペ	87
652	サン・バルテルミー島|サン・バルテルミー	88
894	ザンビア	89
666	サンピエール島・ミクロン島	90
674	サンマリノ	91
663	サン・マルタン (西インド諸島)|サン・マルタン（フランス領）	92
694	シエラレオネ	93
262	ジブチ	94
292	ジブラルタル	95
832	ジャージー	96
388	ジャマイカ	97
760	シリア|シリア・アラブ共和国	98
702	シンガポール	99
534	シント・マールテン|シント・マールテン（オランダ領）	100
716	ジンバブエ	101
756	スイス	102
752	スウェーデン	103
729	スーダン	104
744	スヴァールバル諸島およびヤンマイエン島	105
724	スペイン	106
740	スリナム	107
144	スリランカ	108
703	スロバキア	109
705	スロベニア	110
748	スワジランド	111
690	セーシェル	112
226	赤道ギニア	113
686	セネガル	114
688	セルビア	115
659	セントクリストファー・ネイビス	116
670	セントビンセント・グレナディーン|セントビンセントおよびグレナディーン諸島	117
654	セントヘレナ・アセンションおよびトリスタンダクーニャ	118
662	セントルシア	119
706	ソマリア	120
90	ソロモン諸島	121
796	タークス・カイコス諸島	122
764	タイ王国|タイ	123
410	大韓民国	124
158	台湾	125
762	タジキスタン	126
834	タンザニア	127
203	チェコ	128
148	チャド	129
140	中央アフリカ共和国	130
156	中華人民共和国|中国	131
788	チュニジア	132
408	朝鮮民主主義人民共和国	133
152	チリ	134
798	ツバル	135
208	デンマーク	136
276	ドイツ	137
768	トーゴ	138
772	トケラウ	139
214	ドミニカ共和国	140
212	ドミニカ国	141
780	トリニダード・トバゴ	142
795	トルクメニスタン	143
792	トルコ	144
776	トンガ	145
566	ナイジェリア	146
520	ナウル	147
516	ナミビア	148
10	南極	149
570	ニウエ	150
558	ニカラグア	151
562	ニジェール	152
392	日本	153
732	西サハラ	154
540	ニューカレドニア	155
554	ニュージーランド	156
524	ネパール	157
574	ノーフォーク島	158
578	ノルウェー	159
334	ハード島とマクドナルド諸島	160
48	バーレーン	161
332	ハイチ	162
586	パキスタン	163
336	バチカン|バチカン市国	164
591	パナマ	165
548	バヌアツ	166
44	バハマ	167
598	パプアニューギニア	168
60	バミューダ諸島|バミューダ	169
585	パラオ	170
600	パラグアイ	171
52	バルバドス	172
275	パレスチナ	173
348	ハンガリー	174
50	バングラデシュ	175
626	東ティモール	176
612	ピトケアン諸島|ピトケアン	177
242	フィジー	178
608	フィリピン	179
246	フィンランド	180
64	ブータン	181
74	ブーベ島	182
630	プエルトリコ	183
234	フェロー諸島	184
238	フォークランド諸島|フォークランド（マルビナス）諸島	185
76	ブラジル	186
250	フランス	187
254	フランス領ギアナ	188
258	フランス領ポリネシア	189
260	フランス領南方・南極地域	190
100	ブルガリア	191
854	ブルキナファソ	192
96	ブルネイ|ブルネイ・ダルサラーム	193
108	ブルンジ	194
704	ベトナム	195
204	ベナン	196
862	ベネズエラ|ベネズエラ・ボリバル共和国	197
112	ベラルーシ	198
84	ベリーズ	199
604	ペルー	200
56	ベルギー	201
616	ポーランド	202
70	ボスニア・ヘルツェゴビナ	203
72	ボツワナ	204
535	BES諸島|ボネール、シント・ユースタティウスおよびサバ	205
68	ボリビア|ボリビア多民族国	206
620	ポルトガル	207
344	香港	208
340	ホンジュラス	209
584	マーシャル諸島	210
446	マカオ	211
807	マケドニア共和国|マケドニア旧ユーゴスラビア共和国	212
450	マダガスカル	213
175	マヨット	214
454	マラウイ	215
466	マリ共和国|マリ	216
470	マルタ	217
474	マルティニーク	218
458	マレーシア	219
833	マン島	220
583	ミクロネシア連邦	221
710	南アフリカ共和国|南アフリカ	222
728	南スーダン	223
104	ミャンマー	224
484	メキシコ	225
480	モーリシャス	226
478	モーリタニア	227
508	モザンビーク	228
492	モナコ	229
462	モルディブ	230
498	モルドバ|モルドバ共和国	231
504	モロッコ	232
496	モンゴル国|モンゴル	233
499	モンテネグロ	234
500	モントセラト	235
400	ヨルダン	236
418	ラオス|ラオス人民民主共和国	237
428	ラトビア	238
440	リトアニア	239
434	リビア	240
438	リヒテンシュタイン	241
430	リベリア	242
642	ルーマニア	243
442	ルクセンブルク	244
646	ルワンダ	245
426	レソト	246
422	レバノン	247
638	レユニオン	248
643	ロシア|ロシア連邦	249
\.


--
-- Data for Name: mtb_csv_type; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_csv_type (id, name, rank) FROM stdin;
1	商品CSV	3
2	会員CSV	4
3	受注CSV	1
4	配送CSV	2
5	カテゴリCSV	5
\.


--
-- Data for Name: mtb_customer_order_status; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_customer_order_status (id, name, rank) FROM stdin;
7	注文未完了	0
1	注文受付	1
2	入金待ち	2
6	注文受付	3
3	キャンセル	4
4	注文受付	5
5	発送済み	6
8	注文未完了	7
\.


--
-- Data for Name: mtb_customer_status; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_customer_status (id, name, rank) FROM stdin;
1	仮会員	0
2	本会員	1
\.


--
-- Data for Name: mtb_db; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_db (id, name, rank) FROM stdin;
1	PostgreSQL	0
2	MySQL	1
\.


--
-- Data for Name: mtb_device_type; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_device_type (id, name, rank) FROM stdin;
1	モバイル	0
2	スマートフォン	1
10	PC	2
99	管理画面	3
\.


--
-- Data for Name: mtb_disp; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_disp (id, name, rank) FROM stdin;
1	公開	0
2	非公開	1
\.


--
-- Data for Name: mtb_job; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_job (id, name, rank) FROM stdin;
1	公務員	0
2	コンサルタント	1
3	コンピューター関連技術職	2
4	コンピューター関連以外の技術職	3
5	金融関係	4
6	医師	5
7	弁護士	6
8	総務・人事・事務	7
9	営業・販売	8
10	研究・開発	9
11	広報・宣伝	10
12	企画・マーケティング	11
13	デザイン関係	12
14	会社経営・役員	13
15	出版・マスコミ関係	14
16	学生・フリーター	15
17	主婦	16
18	その他	17
\.


--
-- Data for Name: mtb_order_status; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_order_status (id, name, rank) FROM stdin;
7	決済処理中	0
1	新規受付	1
2	入金待ち	2
6	入金済み	3
3	キャンセル	4
4	取り寄せ中	5
5	発送済み	6
8	購入処理中	7
\.


--
-- Data for Name: mtb_order_status_color; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_order_status_color (id, name, rank) FROM stdin;
1	#FFFFFF	0
2	#FFDE9B	1
3	#C9C9C9	2
4	#FFD9D9	3
5	#BFDFFF	4
6	#FFFFAB	5
7	#FFCCCC	6
\.


--
-- Data for Name: mtb_page_max; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_page_max (id, name, rank) FROM stdin;
10	10	0
20	20	1
30	30	2
40	40	3
50	50	4
60	60	5
70	70	6
80	80	7
90	90	8
100	100	9
\.


--
-- Data for Name: mtb_pref; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_pref (id, name, rank) FROM stdin;
1	北海道	1
2	青森県	2
3	岩手県	3
4	宮城県	4
5	秋田県	5
6	山形県	6
7	福島県	7
8	茨城県	8
9	栃木県	9
10	群馬県	10
11	埼玉県	11
12	千葉県	12
13	東京都	13
14	神奈川県	14
15	新潟県	15
16	富山県	16
17	石川県	17
18	福井県	18
19	山梨県	19
20	長野県	20
21	岐阜県	21
22	静岡県	22
23	愛知県	23
24	三重県	24
25	滋賀県	25
26	京都府	26
27	大阪府	27
28	兵庫県	28
29	奈良県	29
30	和歌山県	30
31	鳥取県	31
32	島根県	32
33	岡山県	33
34	広島県	34
35	山口県	35
36	徳島県	36
37	香川県	37
38	愛媛県	38
39	高知県	39
40	福岡県	40
41	佐賀県	41
42	長崎県	42
43	熊本県	43
44	大分県	44
45	宮崎県	45
46	鹿児島県	46
47	沖縄県	47
\.


--
-- Data for Name: mtb_product_list_max; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_product_list_max (id, name, rank) FROM stdin;
15	15件	0
30	30件	1
50	50件	2
2	2件	3
\.


--
-- Data for Name: mtb_product_list_order_by; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_product_list_order_by (id, name, rank) FROM stdin;
1	価格が低い順	0
3	価格が高い順	1
2	新着順	2
\.


--
-- Data for Name: mtb_product_type; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_product_type (id, name, rank) FROM stdin;
1	通販	0
2	ストリーミング動画	1
\.


--
-- Data for Name: mtb_sex; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_sex (id, name, rank) FROM stdin;
1	男性	0
2	女性	1
\.


--
-- Data for Name: mtb_tag; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_tag (id, name, rank) FROM stdin;
1	新商品	1
2	おすすめ商品	2
3	限定品	3
\.


--
-- Data for Name: mtb_taxrule; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_taxrule (id, name, rank) FROM stdin;
1	四捨五入	0
2	切り捨て	1
3	切り上げ	2
\.


--
-- Data for Name: mtb_work; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_work (id, name, rank) FROM stdin;
0	非稼働	0
1	稼働	1
\.


--
-- Data for Name: mtb_zip; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY mtb_zip (zip_id, zipcode, state, city, town) FROM stdin;
\.


--
-- Name: doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: dtb_authority_role_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_authority_role
    ADD CONSTRAINT dtb_authority_role_pkey PRIMARY KEY (authority_role_id);


--
-- Name: dtb_base_info_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_base_info
    ADD CONSTRAINT dtb_base_info_pkey PRIMARY KEY (id);


--
-- Name: dtb_block_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_block
    ADD CONSTRAINT dtb_block_pkey PRIMARY KEY (block_id);


--
-- Name: dtb_block_position_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_block_position
    ADD CONSTRAINT dtb_block_position_pkey PRIMARY KEY (page_id, target_id, block_id);


--
-- Name: dtb_category_count_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_category_count
    ADD CONSTRAINT dtb_category_count_pkey PRIMARY KEY (category_id);


--
-- Name: dtb_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_category
    ADD CONSTRAINT dtb_category_pkey PRIMARY KEY (category_id);


--
-- Name: dtb_category_total_count_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_category_total_count
    ADD CONSTRAINT dtb_category_total_count_pkey PRIMARY KEY (category_id);


--
-- Name: dtb_class_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_class_category
    ADD CONSTRAINT dtb_class_category_pkey PRIMARY KEY (class_category_id);


--
-- Name: dtb_class_name_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_class_name
    ADD CONSTRAINT dtb_class_name_pkey PRIMARY KEY (class_name_id);


--
-- Name: dtb_csv_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_csv
    ADD CONSTRAINT dtb_csv_pkey PRIMARY KEY (csv_id);


--
-- Name: dtb_customer_address_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_customer_address
    ADD CONSTRAINT dtb_customer_address_pkey PRIMARY KEY (customer_address_id);


--
-- Name: dtb_customer_favorite_product_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_customer_favorite_product
    ADD CONSTRAINT dtb_customer_favorite_product_pkey PRIMARY KEY (favorite_id);


--
-- Name: dtb_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_customer
    ADD CONSTRAINT dtb_customer_pkey PRIMARY KEY (customer_id);


--
-- Name: dtb_delivery_date_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_delivery_date
    ADD CONSTRAINT dtb_delivery_date_pkey PRIMARY KEY (date_id);


--
-- Name: dtb_delivery_fee_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_delivery_fee
    ADD CONSTRAINT dtb_delivery_fee_pkey PRIMARY KEY (fee_id);


--
-- Name: dtb_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_delivery
    ADD CONSTRAINT dtb_delivery_pkey PRIMARY KEY (delivery_id);


--
-- Name: dtb_delivery_time_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_delivery_time
    ADD CONSTRAINT dtb_delivery_time_pkey PRIMARY KEY (time_id);


--
-- Name: dtb_help_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_help
    ADD CONSTRAINT dtb_help_pkey PRIMARY KEY (id);


--
-- Name: dtb_mail_history_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_mail_history
    ADD CONSTRAINT dtb_mail_history_pkey PRIMARY KEY (send_id);


--
-- Name: dtb_mail_template_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_mail_template
    ADD CONSTRAINT dtb_mail_template_pkey PRIMARY KEY (template_id);


--
-- Name: dtb_member_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_member
    ADD CONSTRAINT dtb_member_pkey PRIMARY KEY (member_id);


--
-- Name: dtb_news_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_news
    ADD CONSTRAINT dtb_news_pkey PRIMARY KEY (news_id);


--
-- Name: dtb_order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_order_detail
    ADD CONSTRAINT dtb_order_detail_pkey PRIMARY KEY (order_detail_id);


--
-- Name: dtb_order_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_order
    ADD CONSTRAINT dtb_order_pkey PRIMARY KEY (order_id);


--
-- Name: dtb_page_layout_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_page_layout
    ADD CONSTRAINT dtb_page_layout_pkey PRIMARY KEY (page_id);


--
-- Name: dtb_payment_option_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_payment_option
    ADD CONSTRAINT dtb_payment_option_pkey PRIMARY KEY (delivery_id, payment_id);


--
-- Name: dtb_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_payment
    ADD CONSTRAINT dtb_payment_pkey PRIMARY KEY (payment_id);


--
-- Name: dtb_plugin_event_handler_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_plugin_event_handler
    ADD CONSTRAINT dtb_plugin_event_handler_pkey PRIMARY KEY (id);


--
-- Name: dtb_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_plugin
    ADD CONSTRAINT dtb_plugin_pkey PRIMARY KEY (plugin_id);


--
-- Name: dtb_product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_product_category
    ADD CONSTRAINT dtb_product_category_pkey PRIMARY KEY (product_id, category_id);


--
-- Name: dtb_product_class_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_product_class
    ADD CONSTRAINT dtb_product_class_pkey PRIMARY KEY (product_class_id);


--
-- Name: dtb_product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_product_image
    ADD CONSTRAINT dtb_product_image_pkey PRIMARY KEY (product_image_id);


--
-- Name: dtb_product_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_product
    ADD CONSTRAINT dtb_product_pkey PRIMARY KEY (product_id);


--
-- Name: dtb_product_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_product_stock
    ADD CONSTRAINT dtb_product_stock_pkey PRIMARY KEY (product_stock_id);


--
-- Name: dtb_product_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_product_tag
    ADD CONSTRAINT dtb_product_tag_pkey PRIMARY KEY (product_tag_id);


--
-- Name: dtb_shipment_item_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_shipment_item
    ADD CONSTRAINT dtb_shipment_item_pkey PRIMARY KEY (item_id);


--
-- Name: dtb_shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_shipping
    ADD CONSTRAINT dtb_shipping_pkey PRIMARY KEY (shipping_id);


--
-- Name: dtb_tax_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_tax_rule
    ADD CONSTRAINT dtb_tax_rule_pkey PRIMARY KEY (tax_rule_id);


--
-- Name: dtb_template_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY dtb_template
    ADD CONSTRAINT dtb_template_pkey PRIMARY KEY (template_id);


--
-- Name: mtb_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_authority
    ADD CONSTRAINT mtb_authority_pkey PRIMARY KEY (id);


--
-- Name: mtb_country_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_country
    ADD CONSTRAINT mtb_country_pkey PRIMARY KEY (id);


--
-- Name: mtb_csv_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_csv_type
    ADD CONSTRAINT mtb_csv_type_pkey PRIMARY KEY (id);


--
-- Name: mtb_customer_order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_customer_order_status
    ADD CONSTRAINT mtb_customer_order_status_pkey PRIMARY KEY (id);


--
-- Name: mtb_customer_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_customer_status
    ADD CONSTRAINT mtb_customer_status_pkey PRIMARY KEY (id);


--
-- Name: mtb_db_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_db
    ADD CONSTRAINT mtb_db_pkey PRIMARY KEY (id);


--
-- Name: mtb_device_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_device_type
    ADD CONSTRAINT mtb_device_type_pkey PRIMARY KEY (id);


--
-- Name: mtb_disp_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_disp
    ADD CONSTRAINT mtb_disp_pkey PRIMARY KEY (id);


--
-- Name: mtb_job_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_job
    ADD CONSTRAINT mtb_job_pkey PRIMARY KEY (id);


--
-- Name: mtb_order_status_color_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_order_status_color
    ADD CONSTRAINT mtb_order_status_color_pkey PRIMARY KEY (id);


--
-- Name: mtb_order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_order_status
    ADD CONSTRAINT mtb_order_status_pkey PRIMARY KEY (id);


--
-- Name: mtb_page_max_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_page_max
    ADD CONSTRAINT mtb_page_max_pkey PRIMARY KEY (id);


--
-- Name: mtb_pref_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_pref
    ADD CONSTRAINT mtb_pref_pkey PRIMARY KEY (id);


--
-- Name: mtb_product_list_max_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_product_list_max
    ADD CONSTRAINT mtb_product_list_max_pkey PRIMARY KEY (id);


--
-- Name: mtb_product_list_order_by_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_product_list_order_by
    ADD CONSTRAINT mtb_product_list_order_by_pkey PRIMARY KEY (id);


--
-- Name: mtb_product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_product_type
    ADD CONSTRAINT mtb_product_type_pkey PRIMARY KEY (id);


--
-- Name: mtb_sex_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_sex
    ADD CONSTRAINT mtb_sex_pkey PRIMARY KEY (id);


--
-- Name: mtb_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_tag
    ADD CONSTRAINT mtb_tag_pkey PRIMARY KEY (id);


--
-- Name: mtb_taxrule_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_taxrule
    ADD CONSTRAINT mtb_taxrule_pkey PRIMARY KEY (id);


--
-- Name: mtb_work_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_work
    ADD CONSTRAINT mtb_work_pkey PRIMARY KEY (id);


--
-- Name: mtb_zip_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY mtb_zip
    ADD CONSTRAINT mtb_zip_pkey PRIMARY KEY (zip_id);


--
-- Name: device_type_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX device_type_id ON dtb_block USING btree (device_type_id, file_name);


--
-- Name: dtb_customer_buy_times_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_customer_buy_times_idx ON dtb_customer USING btree (buy_times);


--
-- Name: dtb_customer_buy_total_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_customer_buy_total_idx ON dtb_customer USING btree (buy_total);


--
-- Name: dtb_customer_create_date_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_customer_create_date_idx ON dtb_customer USING btree (create_date);


--
-- Name: dtb_customer_last_buy_date_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_customer_last_buy_date_idx ON dtb_customer USING btree (last_buy_date);


--
-- Name: dtb_customer_update_date_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_customer_update_date_idx ON dtb_customer USING btree (update_date);


--
-- Name: dtb_order_commit_date_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_order_commit_date_idx ON dtb_order USING btree (commit_date);


--
-- Name: dtb_order_detail_product_id_key; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_order_detail_product_id_key ON dtb_order_detail USING btree (product_id);


--
-- Name: dtb_order_order_date_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_order_order_date_idx ON dtb_order USING btree (order_date);


--
-- Name: dtb_order_payment_date_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_order_payment_date_idx ON dtb_order USING btree (payment_date);


--
-- Name: dtb_order_update_date_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_order_update_date_idx ON dtb_order USING btree (update_date);


--
-- Name: dtb_product_class_price02_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_product_class_price02_idx ON dtb_product_class USING btree (price02);


--
-- Name: dtb_product_class_stock_stock_unlimited_idx; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX dtb_product_class_stock_stock_unlimited_idx ON dtb_product_class USING btree (stock, stock_unlimited);


--
-- Name: idx_10bc3be64af96afc; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_10bc3be64af96afc ON dtb_member USING btree (authority);


--
-- Name: idx_10bc3be6534e6880; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_10bc3be6534e6880 ON dtb_member USING btree (work);


--
-- Name: idx_10bc3be661220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_10bc3be661220ea6 ON dtb_member USING btree (creator_id);


--
-- Name: idx_187c95ad61220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_187c95ad61220ea6 ON dtb_class_name USING btree (creator_id);


--
-- Name: idx_1a11d1ba14959723; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1a11d1ba14959723 ON dtb_product_class USING btree (product_type_id);


--
-- Name: idx_1a11d1ba248d128; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1a11d1ba248d128 ON dtb_product_class USING btree (class_category_id1);


--
-- Name: idx_1a11d1ba4584665a; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1a11d1ba4584665a ON dtb_product_class USING btree (product_id);


--
-- Name: idx_1a11d1ba61220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1a11d1ba61220ea6 ON dtb_product_class USING btree (creator_id);


--
-- Name: idx_1a11d1ba9b418092; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1a11d1ba9b418092 ON dtb_product_class USING btree (class_category_id2);


--
-- Name: idx_1a11d1bab28989b5; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1a11d1bab28989b5 ON dtb_product_class USING btree (delivery_date_id);


--
-- Name: idx_1cb16db261220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1cb16db261220ea6 ON dtb_mail_template USING btree (creator_id);


--
-- Name: idx_1d3655f4a1559831; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d3655f4a1559831 ON dtb_base_info USING btree (pref);


--
-- Name: idx_1d3655f4f92f3e70; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d3655f4f92f3e70 ON dtb_base_info USING btree (country_id);


--
-- Name: idx_1d66d8074af5c325; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d66d8074af5c325 ON dtb_order USING btree (order_country_id);


--
-- Name: idx_1d66d8074c3a3bb; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d66d8074c3a3bb ON dtb_order USING btree (payment_id);


--
-- Name: idx_1d66d8074ffa550e; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d66d8074ffa550e ON dtb_order USING btree (device_type_id);


--
-- Name: idx_1d66d8077b00651c; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d66d8077b00651c ON dtb_order USING btree (status);


--
-- Name: idx_1d66d8079395c3f3; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d66d8079395c3f3 ON dtb_order USING btree (customer_id);


--
-- Name: idx_1d66d807acf92697; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d66d807acf92697 ON dtb_order USING btree (order_sex);


--
-- Name: idx_1d66d807b883af98; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d66d807b883af98 ON dtb_order USING btree (order_job);


--
-- Name: idx_1d66d807eca4a226; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_1d66d807eca4a226 ON dtb_order USING btree (order_pref);


--
-- Name: idx_2ebd22ce12136921; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_2ebd22ce12136921 ON dtb_shipping USING btree (delivery_id);


--
-- Name: idx_2ebd22ce30e90e33; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_2ebd22ce30e90e33 ON dtb_shipping USING btree (shipping_pref);


--
-- Name: idx_2ebd22ce41d46e2e; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_2ebd22ce41d46e2e ON dtb_shipping USING btree (shipping_country_id);


--
-- Name: idx_2ebd22ce5eeadd3b; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_2ebd22ce5eeadd3b ON dtb_shipping USING btree (time_id);


--
-- Name: idx_2ebd22ce8d9f6d38; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_2ebd22ce8d9f6d38 ON dtb_shipping USING btree (order_id);


--
-- Name: idx_2ebd22ceab45aeca; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_2ebd22ceab45aeca ON dtb_shipping USING btree (fee_id);


--
-- Name: idx_3267cc7a4584665a; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_3267cc7a4584665a ON dtb_product_image USING btree (product_id);


--
-- Name: idx_3267cc7a61220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_3267cc7a61220ea6 ON dtb_product_image USING btree (creator_id);


--
-- Name: idx_3420d9fa14959723; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_3420d9fa14959723 ON dtb_delivery USING btree (product_type_id);


--
-- Name: idx_3420d9fa61220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_3420d9fa61220ea6 ON dtb_delivery USING btree (creator_id);


--
-- Name: idx_35dcd731c4663e4; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_35dcd731c4663e4 ON dtb_block_position USING btree (page_id);


--
-- Name: idx_35dcd731e9ed820c; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_35dcd731e9ed820c ON dtb_block_position USING btree (block_id);


--
-- Name: idx_4433e721389b783; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_4433e721389b783 ON dtb_product_tag USING btree (tag);


--
-- Name: idx_4433e7214584665a; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_4433e7214584665a ON dtb_product_tag USING btree (product_id);


--
-- Name: idx_4433e72161220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_4433e72161220ea6 ON dtb_product_tag USING btree (creator_id);


--
-- Name: idx_4870ab115da0fb8; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_4870ab115da0fb8 ON dtb_mail_history USING btree (template_id);


--
-- Name: idx_4870ab1161220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_4870ab1161220ea6 ON dtb_mail_history USING btree (creator_id);


--
-- Name: idx_4870ab118d9f6d38; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_4870ab118d9f6d38 ON dtb_mail_history USING btree (order_id);


--
-- Name: idx_491552412136921; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_491552412136921 ON dtb_delivery_fee USING btree (delivery_id);


--
-- Name: idx_4915524a1559831; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_4915524a1559831 ON dtb_delivery_fee USING btree (pref);


--
-- Name: idx_4a1f70b161220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_4a1f70b161220ea6 ON dtb_authority_role USING btree (creator_id);


--
-- Name: idx_4a1f70b181ec865b; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_4a1f70b181ec865b ON dtb_authority_role USING btree (authority_id);


--
-- Name: idx_5631540d12136921; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_5631540d12136921 ON dtb_payment_option USING btree (delivery_id);


--
-- Name: idx_5631540d4c3a3bb; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_5631540d4c3a3bb ON dtb_payment_option USING btree (payment_id);


--
-- Name: idx_57c3c03921b06187; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_57c3c03921b06187 ON dtb_shipment_item USING btree (product_class_id);


--
-- Name: idx_57c3c0394584665a; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_57c3c0394584665a ON dtb_shipment_item USING btree (product_id);


--
-- Name: idx_57c3c0394887f3f8; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_57c3c0394887f3f8 ON dtb_shipment_item USING btree (shipping_id);


--
-- Name: idx_57c3c0398d9f6d38; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_57c3c0398d9f6d38 ON dtb_shipment_item USING btree (order_id);


--
-- Name: idx_58fe357321b06187; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_58fe357321b06187 ON dtb_order_detail USING btree (product_class_id);


--
-- Name: idx_58fe35738d9f6d38; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_58fe35738d9f6d38 ON dtb_order_detail USING btree (order_id);


--
-- Name: idx_59f696de4584665a; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_59f696de4584665a ON dtb_tax_rule USING btree (product_id);


--
-- Name: idx_59f696de61220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_59f696de61220ea6 ON dtb_tax_rule USING btree (creator_id);


--
-- Name: idx_59f696de800f7945; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_59f696de800f7945 ON dtb_tax_rule USING btree (calc_rule);


--
-- Name: idx_59f696dee171ef5f; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_59f696dee171ef5f ON dtb_tax_rule USING btree (pref_id);


--
-- Name: idx_59f696def92f3e70; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_59f696def92f3e70 ON dtb_tax_rule USING btree (country_id);


--
-- Name: idx_5ed2c2b61220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_5ed2c2b61220ea6 ON dtb_category USING btree (creator_id);


--
-- Name: idx_5ed2c2b796a8f92; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_5ed2c2b796a8f92 ON dtb_category USING btree (parent_category_id);


--
-- Name: idx_6b54dcbd4ffa550e; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_6b54dcbd4ffa550e ON dtb_block USING btree (device_type_id);


--
-- Name: idx_6c38c0f89395c3f3; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_6c38c0f89395c3f3 ON dtb_customer_address USING btree (customer_id);


--
-- Name: idx_6c38c0f8a1559831; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_6c38c0f8a1559831 ON dtb_customer_address USING btree (pref);


--
-- Name: idx_6c38c0f8f92f3e70; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_6c38c0f8f92f3e70 ON dtb_customer_address USING btree (country_id);


--
-- Name: idx_7aff628f61220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_7aff628f61220ea6 ON dtb_payment USING btree (creator_id);


--
-- Name: idx_8298bbe37b00651c; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_8298bbe37b00651c ON dtb_customer USING btree (status);


--
-- Name: idx_8298bbe3a1559831; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_8298bbe3a1559831 ON dtb_customer USING btree (pref);


--
-- Name: idx_8298bbe3efa269f7; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_8298bbe3efa269f7 ON dtb_customer USING btree (sex);


--
-- Name: idx_8298bbe3f92f3e70; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_8298bbe3f92f3e70 ON dtb_customer USING btree (country_id);


--
-- Name: idx_8298bbe3fbd8e0f8; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_8298bbe3fbd8e0f8 ON dtb_customer USING btree (job);


--
-- Name: idx_92639ebdec942bcf; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_92639ebdec942bcf ON dtb_plugin_event_handler USING btree (plugin_id);


--
-- Name: idx_94c12a694ffa550e; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_94c12a694ffa550e ON dtb_template USING btree (device_type_id);


--
-- Name: idx_9b0d1dba61220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_9b0d1dba61220ea6 ON dtb_class_category USING btree (creator_id);


--
-- Name: idx_9b0d1dbab462fb2a; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_9b0d1dbab462fb2a ON dtb_class_category USING btree (class_name_id);


--
-- Name: idx_b057789112469de2; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_b057789112469de2 ON dtb_product_category USING btree (category_id);


--
-- Name: idx_b05778914584665a; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_b05778914584665a ON dtb_product_category USING btree (product_id);


--
-- Name: idx_bc6c9e4561220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_bc6c9e4561220ea6 ON dtb_product_stock USING btree (creator_id);


--
-- Name: idx_c49de22f61220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_c49de22f61220ea6 ON dtb_product USING btree (creator_id);


--
-- Name: idx_c49de22f7b00651c; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_c49de22f7b00651c ON dtb_product USING btree (status);


--
-- Name: idx_e80ee3a612136921; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_e80ee3a612136921 ON dtb_delivery_time USING btree (delivery_id);


--
-- Name: idx_ea4c351761220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_ea4c351761220ea6 ON dtb_news USING btree (creator_id);


--
-- Name: idx_ed6313834584665a; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_ed6313834584665a ON dtb_customer_favorite_product USING btree (product_id);


--
-- Name: idx_ed6313839395c3f3; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_ed6313839395c3f3 ON dtb_customer_favorite_product USING btree (customer_id);


--
-- Name: idx_f27999414ffa550e; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_f27999414ffa550e ON dtb_page_layout USING btree (device_type_id);


--
-- Name: idx_f55f48c32c648c74; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_f55f48c32c648c74 ON dtb_csv USING btree (csv_type);


--
-- Name: idx_f55f48c361220ea6; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_f55f48c361220ea6 ON dtb_csv USING btree (creator_id);


--
-- Name: idx_ff18f0eb5c77387; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_ff18f0eb5c77387 ON dtb_help USING btree (law_country_id);


--
-- Name: idx_ff18f0ebe3d20f82; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX idx_ff18f0ebe3d20f82 ON dtb_help USING btree (law_pref);


--
-- Name: secret_key; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX secret_key ON dtb_customer USING btree (secret_key);


--
-- Name: uniq_59f696de21b06187; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX uniq_59f696de21b06187 ON dtb_tax_rule USING btree (product_class_id);


--
-- Name: uniq_bc6c9e4521b06187; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX uniq_bc6c9e4521b06187 ON dtb_product_stock USING btree (product_class_id);


--
-- Name: fk_10bc3be64af96afc; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_member
    ADD CONSTRAINT fk_10bc3be64af96afc FOREIGN KEY (authority) REFERENCES mtb_authority(id);


--
-- Name: fk_10bc3be6534e6880; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_member
    ADD CONSTRAINT fk_10bc3be6534e6880 FOREIGN KEY (work) REFERENCES mtb_work(id);


--
-- Name: fk_10bc3be661220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_member
    ADD CONSTRAINT fk_10bc3be661220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_187c95ad61220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_class_name
    ADD CONSTRAINT fk_187c95ad61220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_1a11d1ba14959723; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_class
    ADD CONSTRAINT fk_1a11d1ba14959723 FOREIGN KEY (product_type_id) REFERENCES mtb_product_type(id);


--
-- Name: fk_1a11d1ba248d128; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_class
    ADD CONSTRAINT fk_1a11d1ba248d128 FOREIGN KEY (class_category_id1) REFERENCES dtb_class_category(class_category_id);


--
-- Name: fk_1a11d1ba4584665a; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_class
    ADD CONSTRAINT fk_1a11d1ba4584665a FOREIGN KEY (product_id) REFERENCES dtb_product(product_id);


--
-- Name: fk_1a11d1ba61220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_class
    ADD CONSTRAINT fk_1a11d1ba61220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_1a11d1ba9b418092; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_class
    ADD CONSTRAINT fk_1a11d1ba9b418092 FOREIGN KEY (class_category_id2) REFERENCES dtb_class_category(class_category_id);


--
-- Name: fk_1a11d1bab28989b5; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_class
    ADD CONSTRAINT fk_1a11d1bab28989b5 FOREIGN KEY (delivery_date_id) REFERENCES dtb_delivery_date(date_id);


--
-- Name: fk_1cb16db261220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_mail_template
    ADD CONSTRAINT fk_1cb16db261220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_1d3655f4a1559831; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_base_info
    ADD CONSTRAINT fk_1d3655f4a1559831 FOREIGN KEY (pref) REFERENCES mtb_pref(id);


--
-- Name: fk_1d3655f4f92f3e70; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_base_info
    ADD CONSTRAINT fk_1d3655f4f92f3e70 FOREIGN KEY (country_id) REFERENCES mtb_country(id);


--
-- Name: fk_1d66d8074af5c325; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order
    ADD CONSTRAINT fk_1d66d8074af5c325 FOREIGN KEY (order_country_id) REFERENCES mtb_country(id);


--
-- Name: fk_1d66d8074c3a3bb; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order
    ADD CONSTRAINT fk_1d66d8074c3a3bb FOREIGN KEY (payment_id) REFERENCES dtb_payment(payment_id);


--
-- Name: fk_1d66d8074ffa550e; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order
    ADD CONSTRAINT fk_1d66d8074ffa550e FOREIGN KEY (device_type_id) REFERENCES mtb_device_type(id);


--
-- Name: fk_1d66d8079395c3f3; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order
    ADD CONSTRAINT fk_1d66d8079395c3f3 FOREIGN KEY (customer_id) REFERENCES dtb_customer(customer_id);


--
-- Name: fk_1d66d807acf92697; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order
    ADD CONSTRAINT fk_1d66d807acf92697 FOREIGN KEY (order_sex) REFERENCES mtb_sex(id);


--
-- Name: fk_1d66d807b883af98; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order
    ADD CONSTRAINT fk_1d66d807b883af98 FOREIGN KEY (order_job) REFERENCES mtb_job(id);


--
-- Name: fk_1d66d807eca4a226; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order
    ADD CONSTRAINT fk_1d66d807eca4a226 FOREIGN KEY (order_pref) REFERENCES mtb_pref(id);


--
-- Name: fk_2ebd22ce12136921; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipping
    ADD CONSTRAINT fk_2ebd22ce12136921 FOREIGN KEY (delivery_id) REFERENCES dtb_delivery(delivery_id);


--
-- Name: fk_2ebd22ce30e90e33; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipping
    ADD CONSTRAINT fk_2ebd22ce30e90e33 FOREIGN KEY (shipping_pref) REFERENCES mtb_pref(id);


--
-- Name: fk_2ebd22ce41d46e2e; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipping
    ADD CONSTRAINT fk_2ebd22ce41d46e2e FOREIGN KEY (shipping_country_id) REFERENCES mtb_country(id);


--
-- Name: fk_2ebd22ce5eeadd3b; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipping
    ADD CONSTRAINT fk_2ebd22ce5eeadd3b FOREIGN KEY (time_id) REFERENCES dtb_delivery_time(time_id);


--
-- Name: fk_2ebd22ce8d9f6d38; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipping
    ADD CONSTRAINT fk_2ebd22ce8d9f6d38 FOREIGN KEY (order_id) REFERENCES dtb_order(order_id);


--
-- Name: fk_2ebd22ceab45aeca; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipping
    ADD CONSTRAINT fk_2ebd22ceab45aeca FOREIGN KEY (fee_id) REFERENCES dtb_delivery_fee(fee_id);


--
-- Name: fk_3267cc7a4584665a; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_image
    ADD CONSTRAINT fk_3267cc7a4584665a FOREIGN KEY (product_id) REFERENCES dtb_product(product_id);


--
-- Name: fk_3267cc7a61220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_image
    ADD CONSTRAINT fk_3267cc7a61220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_3420d9fa14959723; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_delivery
    ADD CONSTRAINT fk_3420d9fa14959723 FOREIGN KEY (product_type_id) REFERENCES mtb_product_type(id);


--
-- Name: fk_3420d9fa61220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_delivery
    ADD CONSTRAINT fk_3420d9fa61220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_35dcd731c4663e4; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_block_position
    ADD CONSTRAINT fk_35dcd731c4663e4 FOREIGN KEY (page_id) REFERENCES dtb_page_layout(page_id);


--
-- Name: fk_35dcd731e9ed820c; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_block_position
    ADD CONSTRAINT fk_35dcd731e9ed820c FOREIGN KEY (block_id) REFERENCES dtb_block(block_id);


--
-- Name: fk_4433e721389b783; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_tag
    ADD CONSTRAINT fk_4433e721389b783 FOREIGN KEY (tag) REFERENCES mtb_tag(id);


--
-- Name: fk_4433e7214584665a; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_tag
    ADD CONSTRAINT fk_4433e7214584665a FOREIGN KEY (product_id) REFERENCES dtb_product(product_id);


--
-- Name: fk_4433e72161220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_tag
    ADD CONSTRAINT fk_4433e72161220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_4870ab115da0fb8; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_mail_history
    ADD CONSTRAINT fk_4870ab115da0fb8 FOREIGN KEY (template_id) REFERENCES dtb_mail_template(template_id);


--
-- Name: fk_4870ab1161220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_mail_history
    ADD CONSTRAINT fk_4870ab1161220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_4870ab118d9f6d38; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_mail_history
    ADD CONSTRAINT fk_4870ab118d9f6d38 FOREIGN KEY (order_id) REFERENCES dtb_order(order_id);


--
-- Name: fk_491552412136921; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_delivery_fee
    ADD CONSTRAINT fk_491552412136921 FOREIGN KEY (delivery_id) REFERENCES dtb_delivery(delivery_id);


--
-- Name: fk_4915524a1559831; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_delivery_fee
    ADD CONSTRAINT fk_4915524a1559831 FOREIGN KEY (pref) REFERENCES mtb_pref(id);


--
-- Name: fk_4a1f70b161220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_authority_role
    ADD CONSTRAINT fk_4a1f70b161220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_4a1f70b181ec865b; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_authority_role
    ADD CONSTRAINT fk_4a1f70b181ec865b FOREIGN KEY (authority_id) REFERENCES mtb_authority(id);


--
-- Name: fk_5631540d12136921; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_payment_option
    ADD CONSTRAINT fk_5631540d12136921 FOREIGN KEY (delivery_id) REFERENCES dtb_delivery(delivery_id);


--
-- Name: fk_5631540d4c3a3bb; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_payment_option
    ADD CONSTRAINT fk_5631540d4c3a3bb FOREIGN KEY (payment_id) REFERENCES dtb_payment(payment_id);


--
-- Name: fk_57c3c03921b06187; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipment_item
    ADD CONSTRAINT fk_57c3c03921b06187 FOREIGN KEY (product_class_id) REFERENCES dtb_product_class(product_class_id);


--
-- Name: fk_57c3c0394584665a; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipment_item
    ADD CONSTRAINT fk_57c3c0394584665a FOREIGN KEY (product_id) REFERENCES dtb_product(product_id);


--
-- Name: fk_57c3c0394887f3f8; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipment_item
    ADD CONSTRAINT fk_57c3c0394887f3f8 FOREIGN KEY (shipping_id) REFERENCES dtb_shipping(shipping_id);


--
-- Name: fk_57c3c0398d9f6d38; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_shipment_item
    ADD CONSTRAINT fk_57c3c0398d9f6d38 FOREIGN KEY (order_id) REFERENCES dtb_order(order_id);


--
-- Name: fk_58fe357321b06187; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order_detail
    ADD CONSTRAINT fk_58fe357321b06187 FOREIGN KEY (product_class_id) REFERENCES dtb_product_class(product_class_id);


--
-- Name: fk_58fe35734584665a; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order_detail
    ADD CONSTRAINT fk_58fe35734584665a FOREIGN KEY (product_id) REFERENCES dtb_product(product_id);


--
-- Name: fk_58fe35738d9f6d38; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_order_detail
    ADD CONSTRAINT fk_58fe35738d9f6d38 FOREIGN KEY (order_id) REFERENCES dtb_order(order_id);


--
-- Name: fk_59f696de21b06187; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_tax_rule
    ADD CONSTRAINT fk_59f696de21b06187 FOREIGN KEY (product_class_id) REFERENCES dtb_product_class(product_class_id);


--
-- Name: fk_59f696de4584665a; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_tax_rule
    ADD CONSTRAINT fk_59f696de4584665a FOREIGN KEY (product_id) REFERENCES dtb_product(product_id);


--
-- Name: fk_59f696de61220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_tax_rule
    ADD CONSTRAINT fk_59f696de61220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_59f696de800f7945; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_tax_rule
    ADD CONSTRAINT fk_59f696de800f7945 FOREIGN KEY (calc_rule) REFERENCES mtb_taxrule(id);


--
-- Name: fk_59f696dee171ef5f; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_tax_rule
    ADD CONSTRAINT fk_59f696dee171ef5f FOREIGN KEY (pref_id) REFERENCES mtb_pref(id);


--
-- Name: fk_59f696def92f3e70; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_tax_rule
    ADD CONSTRAINT fk_59f696def92f3e70 FOREIGN KEY (country_id) REFERENCES mtb_country(id);


--
-- Name: fk_5ed2c2b61220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_category
    ADD CONSTRAINT fk_5ed2c2b61220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_5ed2c2b796a8f92; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_category
    ADD CONSTRAINT fk_5ed2c2b796a8f92 FOREIGN KEY (parent_category_id) REFERENCES dtb_category(category_id);


--
-- Name: fk_6b54dcbd4ffa550e; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_block
    ADD CONSTRAINT fk_6b54dcbd4ffa550e FOREIGN KEY (device_type_id) REFERENCES mtb_device_type(id);


--
-- Name: fk_6c38c0f89395c3f3; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer_address
    ADD CONSTRAINT fk_6c38c0f89395c3f3 FOREIGN KEY (customer_id) REFERENCES dtb_customer(customer_id);


--
-- Name: fk_6c38c0f8a1559831; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer_address
    ADD CONSTRAINT fk_6c38c0f8a1559831 FOREIGN KEY (pref) REFERENCES mtb_pref(id);


--
-- Name: fk_6c38c0f8f92f3e70; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer_address
    ADD CONSTRAINT fk_6c38c0f8f92f3e70 FOREIGN KEY (country_id) REFERENCES mtb_country(id);


--
-- Name: fk_7aff628f61220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_payment
    ADD CONSTRAINT fk_7aff628f61220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_8298bbe37b00651c; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer
    ADD CONSTRAINT fk_8298bbe37b00651c FOREIGN KEY (status) REFERENCES mtb_customer_status(id);


--
-- Name: fk_8298bbe3a1559831; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer
    ADD CONSTRAINT fk_8298bbe3a1559831 FOREIGN KEY (pref) REFERENCES mtb_pref(id);


--
-- Name: fk_8298bbe3efa269f7; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer
    ADD CONSTRAINT fk_8298bbe3efa269f7 FOREIGN KEY (sex) REFERENCES mtb_sex(id);


--
-- Name: fk_8298bbe3f92f3e70; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer
    ADD CONSTRAINT fk_8298bbe3f92f3e70 FOREIGN KEY (country_id) REFERENCES mtb_country(id);


--
-- Name: fk_8298bbe3fbd8e0f8; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer
    ADD CONSTRAINT fk_8298bbe3fbd8e0f8 FOREIGN KEY (job) REFERENCES mtb_job(id);


--
-- Name: fk_92639ebdec942bcf; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_plugin_event_handler
    ADD CONSTRAINT fk_92639ebdec942bcf FOREIGN KEY (plugin_id) REFERENCES dtb_plugin(plugin_id);


--
-- Name: fk_94c12a694ffa550e; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_template
    ADD CONSTRAINT fk_94c12a694ffa550e FOREIGN KEY (device_type_id) REFERENCES mtb_device_type(id);


--
-- Name: fk_9b0d1dba61220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_class_category
    ADD CONSTRAINT fk_9b0d1dba61220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_9b0d1dbab462fb2a; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_class_category
    ADD CONSTRAINT fk_9b0d1dbab462fb2a FOREIGN KEY (class_name_id) REFERENCES dtb_class_name(class_name_id);


--
-- Name: fk_b057789112469de2; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_category
    ADD CONSTRAINT fk_b057789112469de2 FOREIGN KEY (category_id) REFERENCES dtb_category(category_id);


--
-- Name: fk_b05778914584665a; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_category
    ADD CONSTRAINT fk_b05778914584665a FOREIGN KEY (product_id) REFERENCES dtb_product(product_id);


--
-- Name: fk_bc6c9e4521b06187; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_stock
    ADD CONSTRAINT fk_bc6c9e4521b06187 FOREIGN KEY (product_class_id) REFERENCES dtb_product_class(product_class_id);


--
-- Name: fk_bc6c9e4561220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product_stock
    ADD CONSTRAINT fk_bc6c9e4561220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_c49de22f61220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product
    ADD CONSTRAINT fk_c49de22f61220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_c49de22f7b00651c; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_product
    ADD CONSTRAINT fk_c49de22f7b00651c FOREIGN KEY (status) REFERENCES mtb_disp(id);


--
-- Name: fk_e80ee3a612136921; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_delivery_time
    ADD CONSTRAINT fk_e80ee3a612136921 FOREIGN KEY (delivery_id) REFERENCES dtb_delivery(delivery_id);


--
-- Name: fk_ea4c351761220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_news
    ADD CONSTRAINT fk_ea4c351761220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_ed6313834584665a; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer_favorite_product
    ADD CONSTRAINT fk_ed6313834584665a FOREIGN KEY (product_id) REFERENCES dtb_product(product_id);


--
-- Name: fk_ed6313839395c3f3; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_customer_favorite_product
    ADD CONSTRAINT fk_ed6313839395c3f3 FOREIGN KEY (customer_id) REFERENCES dtb_customer(customer_id);


--
-- Name: fk_f27999414ffa550e; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_page_layout
    ADD CONSTRAINT fk_f27999414ffa550e FOREIGN KEY (device_type_id) REFERENCES mtb_device_type(id);


--
-- Name: fk_f55f48c32c648c74; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_csv
    ADD CONSTRAINT fk_f55f48c32c648c74 FOREIGN KEY (csv_type) REFERENCES mtb_csv_type(id);


--
-- Name: fk_f55f48c361220ea6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_csv
    ADD CONSTRAINT fk_f55f48c361220ea6 FOREIGN KEY (creator_id) REFERENCES dtb_member(member_id);


--
-- Name: fk_ff18f0eb5c77387; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_help
    ADD CONSTRAINT fk_ff18f0eb5c77387 FOREIGN KEY (law_country_id) REFERENCES mtb_country(id);


--
-- Name: fk_ff18f0ebe3d20f82; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY dtb_help
    ADD CONSTRAINT fk_ff18f0ebe3d20f82 FOREIGN KEY (law_pref) REFERENCES mtb_pref(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

