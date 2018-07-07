--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appelation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.appelation (
    id integer NOT NULL,
    name character varying(50),
    regionid integer
);


--
-- Name: appelation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.appelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: appelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.appelation_id_seq OWNED BY public.appelation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country (
    id integer NOT NULL,
    name character varying(25)
);


--
-- Name: county_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.county_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: county_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.county_id_seq OWNED BY public.country.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: flavor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flavor (
    name character varying(25)
);


--
-- Name: grape_flavor_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grape_flavor_profile (
    id integer NOT NULL,
    regionid integer,
    grapeid integer,
    dmnt_flavors character varying(25)[]
);


--
-- Name: grape_flavor_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grape_flavor_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grape_flavor_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grape_flavor_profile_id_seq OWNED BY public.grape_flavor_profile.id;


--
-- Name: variety; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.variety (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: grape_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grape_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grape_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grape_id_seq OWNED BY public.variety.id;


--
-- Name: region; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.region (
    id integer NOT NULL,
    name character varying(25),
    parent_regionid integer
);


--
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- Name: vineyard; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vineyard (
    id integer NOT NULL,
    name character varying(100),
    regionid integer
);


--
-- Name: vineyard_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vineyard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vineyard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vineyard_id_seq OWNED BY public.vineyard.id;


--
-- Name: appelation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appelation ALTER COLUMN id SET DEFAULT nextval('public.appelation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.county_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: grape_flavor_profile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grape_flavor_profile ALTER COLUMN id SET DEFAULT nextval('public.grape_flavor_profile_id_seq'::regclass);


--
-- Name: region id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- Name: variety id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variety ALTER COLUMN id SET DEFAULT nextval('public.grape_id_seq'::regclass);


--
-- Name: vineyard id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vineyard ALTER COLUMN id SET DEFAULT nextval('public.vineyard_id_seq'::regclass);


--
-- Data for Name: appelation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.appelation (id, name, regionid) FROM stdin;
70	Alexander Valley	0
72	Amador County	0
73	Anderson Valley	0
78	California	0
79	Calistoga	0
80	Carneros	0
85	Diamond Mountain	0
89	Fort Ross - Seaview	0
91	Gualtallary	0
92	Howell Mountain	0
93	Knights Valley	0
94	Lodi	0
96	McLaren Vale	0
97	Moon Mountain	0
98	Mt. Veeder	0
99	Napa Valley	0
100	Oakville	0
101	Paso Robles	0
102	Paso Robles Willow Creek District	0
110	Ribera del Duero	0
111	Rioja	0
112	Russian River Valley	0
113	Rutherford	0
114	Santa Barbara County	0
115	Santa Lucia Highlands	0
117	Sonoma Coast	0
118	Sonoma County	0
119	Spring Mountain District	0
124	Sta. Rita Hills	0
125	Stags Leap District	0
126	Unknown	0
127	Vino de la Tierra de Castilla y León	0
133	Yountville	0
83	Columbia Valley	18
108	Red Mountain	18
129	Walla Walla Valley	18
130	Washington	18
87	Dundee Hills	11
88	Eola - Amity Hills	11
109	Ribbon Ridge	11
131	Willamette Valley	11
132	Yamhill-Carlton	11
120	St. Émilion Grand Cru	2
121	St. Estèphe	2
123	St. Julien	2
122	St. Helena	4
95	Margaux	2
103	Pauillac	2
104	Pessac-Léognan	2
105	Pomerol	2
116	Sauternes	2
81	Châteauneuf-du-Pape	15
90	Gigondas	15
71	Alsace	19
82	Clos Vougeot Grand Cru	3
84	Corton-Charlemagne Grand Cru	3
128	Vouvray	8
77	Brunello di Montalcino	17
74	Barbaresco	13
75	Barbera d’Alba	13
76	Barolo	13
107	Puente Alto	9
106	Porto	6
86	Douro	6
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add appelation	7	add_appelation
20	Can change appelation	7	change_appelation
21	Can delete appelation	7	delete_appelation
22	Can add country	8	add_country
23	Can change country	8	change_country
24	Can delete country	8	delete_country
25	Can add flavor	9	add_flavor
26	Can change flavor	9	change_flavor
27	Can delete flavor	9	delete_flavor
28	Can add grape flavor profile	10	add_grapeflavorprofile
29	Can change grape flavor profile	10	change_grapeflavorprofile
30	Can delete grape flavor profile	10	delete_grapeflavorprofile
31	Can add region	11	add_region
32	Can change region	11	change_region
33	Can delete region	11	delete_region
34	Can add variety	12	add_variety
35	Can change variety	12	change_variety
36	Can delete variety	12	delete_variety
37	Can add vineyard	13	add_vineyard
38	Can change vineyard	13	change_vineyard
39	Can delete vineyard	13	delete_vineyard
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$CPzZibOB6Klk$IaXQ+kPTODhn9uhtaQvwJhUZ6rEZUb7RJ0Kk+Ja+6dc=	2018-07-01 15:30:41.607389-04	t	django-admin			django-admin@tokalon.local	t	t	2018-07-01 15:29:50.530364-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.country (id, name) FROM stdin;
4	Argentina
5	Australia
6	Chile
7	France
8	Italy
9	Portugal
10	Spain
11	USA
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	wine	appelation
8	wine	country
9	wine	flavor
10	wine	grapeflavorprofile
11	wine	region
12	wine	variety
13	wine	vineyard
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-07-01 15:27:06.574919-04
2	auth	0001_initial	2018-07-01 15:27:06.633927-04
3	admin	0001_initial	2018-07-01 15:27:06.653886-04
4	admin	0002_logentry_remove_auto_add	2018-07-01 15:27:06.664396-04
5	contenttypes	0002_remove_content_type_name	2018-07-01 15:27:06.692174-04
6	auth	0002_alter_permission_name_max_length	2018-07-01 15:27:06.699031-04
7	auth	0003_alter_user_email_max_length	2018-07-01 15:27:06.708159-04
8	auth	0004_alter_user_username_opts	2018-07-01 15:27:06.715983-04
9	auth	0005_alter_user_last_login_null	2018-07-01 15:27:06.724946-04
10	auth	0006_require_contenttypes_0002	2018-07-01 15:27:06.726652-04
11	auth	0007_alter_validators_add_error_messages	2018-07-01 15:27:06.734889-04
12	auth	0008_alter_user_username_max_length	2018-07-01 15:27:06.746941-04
13	auth	0009_alter_user_last_name_max_length	2018-07-01 15:27:06.756141-04
14	sessions	0001_initial	2018-07-01 15:27:06.764776-04
15	wine	0001_initial	2018-07-01 18:46:23.939707-04
16	wine	0002_country_flavor_grapeflavorprofile_region_variety_vineyard	2018-07-01 18:46:23.951991-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
b7iwrk1wavsxf24x1xgnnd17pf0rbhf0	MzM3Y2Y3NTBhMGQ2ZTY5ZTAwYzlhMjNhYjQ5NTUyMTE5MjBmYWNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OGVjMGUzMGY1YjNmMWQ5ODExZTBjNzIyZDI1NDU3YTNmMDU5NTk2In0=	2018-07-15 15:30:41.609454-04
\.


--
-- Data for Name: flavor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flavor (name) FROM stdin;
lemon
grapefruit
melon
wet stone
raspberry
\.


--
-- Data for Name: grape_flavor_profile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.grape_flavor_profile (id, regionid, grapeid, dmnt_flavors) FROM stdin;
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.region (id, name, parent_regionid) FROM stdin;
2	Bordeaux	\N
3	Burgundy	\N
4	California	\N
5	Castilla y León	\N
6	Douro	\N
7	La Rioja	\N
8	Loire Valley	\N
9	Maipo Valley	\N
11	Oregon	\N
12	Pennsylvania	\N
13	Piedmont	\N
14	Rapel Valley	\N
15	Rhône	\N
16	South Australia	\N
17	Tuscany	\N
18	Washington	\N
19	Alsace	\N
20	Agrelo	10
10	Mendoza	0
21	Barrancas	10
22	Las Compuertas	10
23	Lujan de Cuyo	10
24	Lunlunta	10
25	Maipu	10
26	Perdriel	10
27	San Martin	10
28	San Rafael	10
29	Uco Valley	10
30	Ugarteche	10
31	Vistalba	10
32	Altamira	29
33	La Consulta	29
34	San Carlos	29
35	Tunuyan	29
36	Tupungato	29
37	Vista Flores	29
38	Gualtallary	36
\.


--
-- Data for Name: variety; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.variety (id, name) FROM stdin;
2	Barbera
3	Cabernet Franc
4	Cabernet Sauvignon
5	Chardonnay
6	Chenin Blanc
7	Gewürztraminer
8	Grenache
9	Malbec
10	Merlot
11	Mourvedre
12	Nebbiolo
13	Petite Sirah
14	Pinot Noir
15	Riesling
16	Sangiovese
17	Sauvignon Blanc
18	Sémillon
19	Shiraz
20	Syrah
21	Tempranillo
22	Zinfandel
\.


--
-- Data for Name: vineyard; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vineyard (id, name, regionid) FROM stdin;
173	Adrianna Vineyard	0
174	B. Thieriot Vineyard	0
175	Bearwallow Vineyard	0
176	Beaux Frères Vineyard	0
177	Beckstoffer Bourn	0
178	Beckstoffer Georges III Vineyard	0
179	Beckstoffer Las Piedras Vineyard	0
180	Beckstoffer To-Kalon Vineyard	0
181	Bone Ash Vineyard	0
182	Bootlegger's Hill	0
183	Cailloux Vineyard	0
184	Carlisle Vineyard	0
185	CIX Estate Vineyard	0
186	Clos Apalta	0
187	Coliseum Block	0
188	Dragon Vineyard	0
189	Dusi Vineyard	0
190	Eastside Vineyard	0
191	El Puntido	0
192	En Cerise Vineyard	0
193	En Chamberlin Vineyard	0
194	Finca Mirador	0
195	Frei Road Vineyard	0
196	Galitzine Vineyard	0
197	Gap's Crown Vineyard	0
198	Gavarini Chiniera	0
199	Ginestra Casa Maté	0
200	Greer Vineyard	0
201	Hayne Vineyard	0
202	Heimbourg	0
203	Herrenweg de Turckheim	0
204	Home Ranch	0
205	Houyi Vineyard Pritchard Hill	0
206	Hudson	0
207	Hudson Vineyard	0
208	In the Rocks	0
209	James Berry Vineyard	0
210	Keefer Ranch Vineyard	0
211	Kenefick Ranch	0
212	La Crau	0
213	Lauren Vineyard	0
214	Le Haut-Lieu	0
215	Library Vineyard	0
216	Lore Vineyard	0
217	Mineral Springs Ranch	0
218	Montosoli	0
219	Morrison Lane	0
220	Olsen Vineyard	0
221	Paderewski Vineyard	0
222	Panek Vineyard	0
223	Papera Ranch	0
224	Pellet Vineyard	0
225	Pesenti Vineyard	0
226	Powerline Estate	0
227	Prado Enea	0
228	Pym-Rae	0
229	Quixote Vineyard	0
230	Rattlesnake Hill	0
231	Rattlesnake Ridge	0
232	Realm Estate	0
233	Rocche	0
234	Sacrashe Vineyard	0
235	Serraboella	0
236	Seven Springs Vineyard	0
237	Shake Ridge	0
238	Shea Vineyard	0
239	Showket Vineyards	0
240	Silver Eagle Vineyard	0
241	Siren's Call	0
242	SJR Vineyard	0
243	Soberanes Vineyard	0
244	Stagecoach Vineyard	0
245	State Lane Vineyard	0
246	Stoneridge Vineyard	0
247	Stoney Vine Vineyard	0
248	Sugarloaf Mountain Vineyard	0
249	Summa	0
250	Tench Vineyard	0
251	Thorn Ridge Vineyard	0
252	Three Palms Vineyard	0
253	Three Twins Vineyard	0
254	Ueberroth Vineyard	0
255	Vigna Martina	0
256	Wight	0
257	Wildfoote Vineyard, Vixen Block	0
105	Adrianna Vineyard	0
106	B. Thieriot Vineyard	0
107	Bearwallow Vineyard	0
108	Beaux Frères Vineyard	0
109	Beckstoffer Bourn	0
110	Beckstoffer Georges III Vineyard	0
111	Beckstoffer Las Piedras Vineyard	0
112	Beckstoffer To-Kalon Vineyard	0
113	Bone Ash Vineyard	0
114	Bootlegger's Hill	0
115	Cailloux Vineyard	0
116	Carlisle Vineyard	0
117	CIX Estate Vineyard	0
118	Clos Apalta	0
119	Coliseum Block	0
120	Dragon Vineyard	0
121	Dusi Vineyard	0
122	Eastside Vineyard	0
123	El Puntido	0
124	En Cerise Vineyard	0
125	En Chamberlin Vineyard	0
126	Finca Mirador	0
127	Frei Road Vineyard	0
128	Galitzine Vineyard	0
129	Gap's Crown Vineyard	0
130	Gavarini Chiniera	0
131	Ginestra Casa Maté	0
132	Greer Vineyard	0
133	Hayne Vineyard	0
134	Heimbourg	0
135	Herrenweg de Turckheim	0
136	Home Ranch	0
137	Houyi Vineyard Pritchard Hill	0
138	Hudson	0
139	Hudson Vineyard	0
140	In the Rocks	0
141	James Berry Vineyard	0
142	Keefer Ranch Vineyard	0
143	Kenefick Ranch	0
144	La Crau	0
145	Lauren Vineyard	0
146	Le Haut-Lieu	0
147	Library Vineyard	0
148	Lore Vineyard	0
149	Mineral Springs Ranch	0
150	Montosoli	0
151	Morrison Lane	0
152	Olsen Vineyard	0
153	Paderewski Vineyard	0
154	Panek Vineyard	0
155	Papera Ranch	0
156	Pellet Vineyard	0
157	Pesenti Vineyard	0
158	Powerline Estate	0
159	Prado Enea	0
160	Pym-Rae	0
161	Quixote Vineyard	0
162	Rattlesnake Hill	0
163	Rattlesnake Ridge	0
164	Realm Estate	0
165	Rocche	0
166	Sacrashe Vineyard	0
167	Serraboella	0
168	Seven Springs Vineyard	0
169	Shake Ridge	0
170	Shea Vineyard	0
171	Showket Vineyards	0
172	Silver Eagle Vineyard	0
\.


--
-- Name: appelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.appelation_id_seq', 133, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 39, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: county_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.county_id_seq', 11, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 16, true);


--
-- Name: grape_flavor_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grape_flavor_profile_id_seq', 1, false);


--
-- Name: grape_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grape_id_seq', 22, true);


--
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.region_id_seq', 38, true);


--
-- Name: vineyard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vineyard_id_seq', 257, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

