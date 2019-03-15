--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.prices DROP CONSTRAINT prices_city_id_fkey;
ALTER TABLE ONLY public.histdata DROP CONSTRAINT histdata_city_id_fkey;
ALTER TABLE ONLY public.prices DROP CONSTRAINT prices_pkey;
ALTER TABLE ONLY public.histdata DROP CONSTRAINT histdata_pkey;
ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
ALTER TABLE public.prices ALTER COLUMN price_id DROP DEFAULT;
ALTER TABLE public.histdata ALTER COLUMN hist_id DROP DEFAULT;
ALTER TABLE public.cities ALTER COLUMN city_id DROP DEFAULT;
DROP SEQUENCE public.prices_price_id_seq;
DROP TABLE public.prices;
DROP SEQUENCE public.histdata_hist_id_seq;
DROP TABLE public.histdata;
DROP SEQUENCE public.cities_city_id_seq;
DROP TABLE public.cities;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    city_name character varying(25),
    state character varying(25),
    latitude real,
    longitude real
);


--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;


--
-- Name: histdata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.histdata (
    hist_id integer NOT NULL,
    city_id integer,
    city_name character varying(25),
    state character varying(25),
    month_count integer,
    year_count integer,
    price_item integer
);


--
-- Name: histdata_hist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.histdata_hist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: histdata_hist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.histdata_hist_id_seq OWNED BY public.histdata.hist_id;


--
-- Name: prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prices (
    price_id integer NOT NULL,
    city_id integer,
    median_home_price integer,
    sales_price_mom character varying(20),
    print_date character varying(10)
);


--
-- Name: prices_price_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prices_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prices_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prices_price_id_seq OWNED BY public.prices.price_id;


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);


--
-- Name: histdata hist_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.histdata ALTER COLUMN hist_id SET DEFAULT nextval('public.histdata_hist_id_seq'::regclass);


--
-- Name: prices price_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices ALTER COLUMN price_id SET DEFAULT nextval('public.prices_price_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities (city_id, city_name, state, latitude, longitude) FROM stdin;
1	Birmingham	Alabama	33.5219994	-86.8069992
2	Helena	Alabama	33.2960014	-86.8434982
3	Peoria	Arizona	33.7050018	-112.281502
4	Phoenix	Arizona	33.4480019	-112.073997
5	Scottsdale	Arizona	33.4939995	-111.926003
6	Tucson	Arizona	32.9609985	-111.556
7	Little Rock	Arkansas	34.4485703	-92.3311234
8	North Little Rock	Arkansas	34.7659988	-92.2677002
9	Los Angeles	California	34.0522003	-118.242996
10	Newark	California	37.5407982	-122.033401
11	Oakland	California	37.8043594	-122.271111
12	Richmond	California	37.9378014	-122.343147
13	Riverside	California	33.9804993	-117.375397
14	Sacramento	California	38.5815697	-121.4944
15	San Francisco	California	37.7799988	-122.419998
16	San Jose	California	37.3347015	-121.888138
17	South San Francisco	California	37.6557999	-122.412003
18	Aurora	Colorado	39.7129288	-104.819351
19	Boulder	Colorado	40.0149002	-105.2705
20	Denver	Colorado	39.7392349	-104.984169
21	Lafayette	Colorado	39.9942017	-105.090462
22	Colorado Springs	Colorado	38.8339005	-104.82
23	Bridgeport	Connecitcut	41.1791916	-73.1894836
24	Greenwich	Connecitcut	41.0265312	-73.6285477
25	Hartford	Connecitcut	41.7659988	-72.677002
26	New Haven	Connecitcut	41.3082504	-72.9241562
27	Dover	Delaware	39.1599998	-75.5199966
28	Newark	Delaware	39.6815987	-75.7536087
29	Wilmington	Delaware	39.7444305	-75.5450974
30	Jacksonville	Florida	30.3321838	-81.6556015
31	Jacksonville Beach	Florida	30.2882996	-81.3918686
32	Miami	Florida	25.7616005	-80.1917877
33	Miami Beach	Florida	25.7922401	-80.1348495
34	North Miami	Florida	25.9330006	-80.1624985
35	North Miami Beach	Florida	25.9342003	-80.1643982
36	Orlando	Florida	28.5383358	-81.3792343
37	South Miami	Florida	25.7093391	-80.2977219
38	Tampa	Florida	27.9500008	-82.4570007
39	Atlanta	Georgia	33.75	-84.3899994
40	Fayetteville	Georgia	33.4477501	-84.4551315
41	Jackson	Georgia	33.2944107	-83.9664612
42	North Atlanta	Georgia	33.7851295	-84.4805679
43	East Honolulu	Hawaii	21.2750607	-157.705399
44	Honolulu	Hawaii	21.3069496	-157.858307
45	Boise	Idaho	43.613739	-116.237648
46	Aurora	Illinois	41.760601	-88.3200989
47	Chicago	Illinois	41.8755989	-87.6243973
48	Chicago Heights	Illinois	41.5063019	-87.6356964
49	Frankfort	Illinois	41.4958992	-87.8487015
50	Lansing	Illinois	41.5662003	-87.5382004
51	Montgomery	Illinois	41.7305984	-88.3459015
52	North Aurora	Illinois	41.8059998	-88.327301
53	North Chicago	Illinois	42.3255997	-87.8412018
54	West Chicago	Illinois	41.8848	-88.2040024
55	Indianapolis	Indiana	39.7900009	-86.1579971
56	Des Moines	Iowa	41.5909386	-93.6036987
57	West Des Moines	Iowa	41.5644989	-93.7594986
58	Kansas City	Kansas	39.1066666	-94.6763
59	Louisville	Kentucky	38.2542	-85.7593994
60	Jefferson	Louisiana	29.9659996	-90.1530991
61	New Orleans	Louisiana	29.9498997	-90.0699997
62	Annapolis	Maryland	38.9785995	-76.4926987
63	Baltimore	Maryland	39.2909012	-76.6107025
64	Columbia	Maryland	39.2155991	-76.8582001
65	Boston	Massachusetts	42.3602982	-71.0582962
66	Burlington	Massachusetts	42.5047989	-71.1956024
67	Concord	Massachusetts	42.4604988	-71.3479996
68	Manchester	Massachusetts	42.5778008	-70.768898
69	Salem	Massachusetts	42.5195007	-70.896698
70	Detroit	Michigan	42.3487015	-83.0566025
71	Birmingham	Michigan	42.5466995	-83.2113037
72	Trenton	Michigan	42.1407013	-83.1800003
73	Bloomington	Minnesota	44.8321991	-93.3205032
74	Columbia Heights	Minnesota	45.0460014	-93.2518005
75	Minneapolis	Minnesota	44.9772987	-93.2655029
76	South St Paul	Minnesota	44.8939018	-93.0367966
77	St Paul	Minnesota	44.9500008	-93.0940018
78	West St Paul	Minnesota	44.9101982	-93.0802002
79	Kansas City	Missouri	39.1001015	-94.5781021
80	Manchester	Missouri	38.5970001	-90.5093002
81	North Kansas City	Missouri	39.1431999	-94.5734024
82	Omaha	Nebraska	41.2587013	-95.9377975
83	Las Vegas	Nevada	36.1689987	-115.129997
84	North Las Vegas	Nevada	36.273201	-115.105003
85	Manchester	New Hampshire	42.9956017	-71.4546967
86	Salem	New Hampshire	42.7879982	-71.2008896
87	Burlington	New Jersey	42.7315903	-71.5169983
88	Trenton	New Jersey	40.2217407	-74.7561417
89	Santa Fe	New Mexico	35.6672325	-105.964455
90	Albany	New York	42.6598282	-73.7813416
91	Charlottee	North Carolina	35.2270012	-80.8431015
92	Concord	North Carolina	35.4090004	-80.5796967
93	Denver	North Carolina	35.5312386	-81.0297012
94	Durham	North Carolina	36.0181313	-78.875
95	Harrisburg	North Carolina	35.3262482	-80.6446533
96	Raleigh	North Carolina	35.7709999	-78.6380005
97	Columbus	Ohio	39.9622459	-83.0006485
98	Newark	Ohio	40.0579987	-82.401001
99	Oklahoma City	Oklahoma	35.4729805	-97.534996
100	Albany	Oregon	44.6365013	-123.105003
101	Portland	Oregon	45.5201988	-122.674187
102	Salem	Oregon	44.9311104	-123.02916
103	Springfield	Oregon	44.0460014	-123.022003
104	Harrisburg	Pennsylvania	40.2697906	-76.8756104
105	Philidelphia	Pennsylvania	39.9519997	-75.1634979
106	East Greenwich	Rhode Island	41.6603012	-71.4558029
107	East Providence	Rhode Island	41.8137016	-71.3700562
108	Lincoln	Rhode Island	41.9119987	-71.440979
109	North Providence	Rhode Island	41.8499985	-71.4661713
110	Providence	Rhode Island	41.8235512	-71.4221344
111	Charleston	South Carolina	32.7876015	-79.9402008
112	North Charleston	South Carolina	32.854599	-79.7947998
113	Memphis	Tennessee	35.1490211	-90.0515976
114	Nashville	Tennessee	36.1650009	-86.7839966
115	Austin	Texas	30.2660007	-97.75
116	Dallas	Texas	32.776001	-96.7968521
117	Fort Worth	Texas	32.7529984	-97.3327026
118	Houston	Texas	29.7588997	-95.3669968
119	Richmond	Texas	29.5820999	-95.7606964
120	Provo	Utah	40.233799	-111.658501
121	Salt Lake City	Utah	40.7607994	-111.890999
122	Burlington	Vermont	44.4768982	-73.213501
123	South Burlington	Vermont	44.4668999	-73.1708984
124	Richmond	Virginia	37.5385017	-77.4342804
125	Virginia Beach	Virginia	36.8529015	-75.9774094
126	Olympia	Washington	47.041523	-122.903999
127	Seattle	Washington	47.60289	-122.339798
128	Springfield	West Virginia	39.4505997	-78.6936035
129	Madison	Wisconsin	43.0746994	-89.3836975
130	Milwaukee	Wisconsin	43.0349007	-87.922493
131	New Richmond	Wisconsin	45.1230202	-92.536499
132	Juneau	Alaska	58.301899	-134.419006
133	Anchorage	Alaska	61.2159996	-149.894806
134	Helena	Montana	46.5958061	-112.027031
135	Billings	Montana	45.7873993	-108.496071
136	Fargo	North Dakota	46.8772278	-96.7898178
137	Bismarck	North Dakota	46.8033447	-100.779007
138	Rapid City	South Dakota	44.0811768	-103.227997
139	Sioux Falls	South Dakota	43.5499763	-96.700325
140	Cheyenne	Wyoming	41.1399803	-104.820198
141	Jackson	Wyoming	43.4799652	-110.761818
142	Tallahassee	Florida	30.4517994	-84.2727737
143	Montgomery	Alabama	32.366951	-86.3006516
144	Frankfort	Kentucky	38.1972733	-84.8631134
145	Augusta	Maine	44.3235359	-69.7652588
146	Portland	Maine	43.6610184	-70.2548523
147	South Portland	Maine	43.6414719	-70.2408829
148	Jackson	Mississippi	32.3199997	-90.2070007
149	Biloxi	Mississippi	30.3959999	-88.8852997
150	Lincoln	Nebraska	40.8098679	-96.6753464
151	Albuquerque	New Mexico	35.0840988	-106.651001
152	Springfield	Illinois	39.7832489	-89.6503754
153	Charleston	West Virginia	38.3506012	-81.6330032
154	Pittsburgh	Pennsylvania	40.4417	-79.9899979
155	Topeka	Kansas	39.0400009	-95.6900024
156	Baton Rouge	Louisiana	30.4580898	-91.1402283
157	Lansing	Michigan	42.7335014	-84.5466995
158	Jefferson City	Missouri	38.5729828	-92.1892853
159	Carson City	Nevada	39.1609497	-119.753876
160	Concord	New Hampshire	43.2200928	-71.5491257
161	Washington	District of Columbia	38.8950005	-77.0360031
\.


--
-- Data for Name: histdata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.histdata (hist_id, city_id, city_name, state, month_count, year_count, price_item) FROM stdin;
1	23	Bridgeport	Connecitcut	1	2009	1220000
2	23	Bridgeport	Connecitcut	2	2009	1168000
3	23	Bridgeport	Connecitcut	3	2009	1140000
4	23	Bridgeport	Connecitcut	4	2009	900000
5	23	Bridgeport	Connecitcut	5	2009	875000
6	23	Bridgeport	Connecitcut	6	2009	990000
7	23	Bridgeport	Connecitcut	7	2009	1607500
8	23	Bridgeport	Connecitcut	8	2009	885445
9	23	Bridgeport	Connecitcut	9	2009	1215000
10	23	Bridgeport	Connecitcut	10	2009	927500
11	23	Bridgeport	Connecitcut	11	2009	1175000
12	23	Bridgeport	Connecitcut	12	2009	1203000
13	23	Bridgeport	Connecitcut	1	2010	1045000
14	23	Bridgeport	Connecitcut	2	2010	850000
15	23	Bridgeport	Connecitcut	3	2010	949450
16	23	Bridgeport	Connecitcut	4	2010	960000
17	23	Bridgeport	Connecitcut	5	2010	1050000
18	23	Bridgeport	Connecitcut	6	2010	977500
19	23	Bridgeport	Connecitcut	7	2010	1400000
20	23	Bridgeport	Connecitcut	8	2010	1265000
21	23	Bridgeport	Connecitcut	9	2010	1495000
22	23	Bridgeport	Connecitcut	10	2010	1257250
23	23	Bridgeport	Connecitcut	11	2010	717500
24	23	Bridgeport	Connecitcut	12	2010	1228000
25	23	Bridgeport	Connecitcut	1	2011	1350000
26	23	Bridgeport	Connecitcut	2	2011	1450000
27	23	Bridgeport	Connecitcut	3	2011	1605000
28	23	Bridgeport	Connecitcut	4	2011	1205000
29	23	Bridgeport	Connecitcut	5	2011	1486000
30	23	Bridgeport	Connecitcut	6	2011	1393200
31	23	Bridgeport	Connecitcut	7	2011	995000
32	23	Bridgeport	Connecitcut	8	2011	1260000
33	23	Bridgeport	Connecitcut	9	2011	955000
34	23	Bridgeport	Connecitcut	10	2011	1165000
35	23	Bridgeport	Connecitcut	11	2011	818750
36	23	Bridgeport	Connecitcut	12	2011	1080000
37	23	Bridgeport	Connecitcut	1	2012	1140000
38	23	Bridgeport	Connecitcut	2	2012	947500
39	23	Bridgeport	Connecitcut	3	2012	917000
40	23	Bridgeport	Connecitcut	4	2012	1127500
41	23	Bridgeport	Connecitcut	5	2012	1275000
42	23	Bridgeport	Connecitcut	6	2012	1075000
43	23	Bridgeport	Connecitcut	7	2012	1275000
44	23	Bridgeport	Connecitcut	8	2012	1075500
45	23	Bridgeport	Connecitcut	9	2012	955000
46	23	Bridgeport	Connecitcut	10	2012	915000
47	23	Bridgeport	Connecitcut	11	2012	850000
48	23	Bridgeport	Connecitcut	12	2012	1362500
49	23	Bridgeport	Connecitcut	1	2013	922500
50	23	Bridgeport	Connecitcut	2	2013	1117500
51	23	Bridgeport	Connecitcut	3	2013	1012500
52	23	Bridgeport	Connecitcut	4	2013	1110000
53	23	Bridgeport	Connecitcut	5	2013	1150000
54	23	Bridgeport	Connecitcut	6	2013	1225907
55	23	Bridgeport	Connecitcut	7	2013	1150000
56	23	Bridgeport	Connecitcut	8	2013	1210000
57	23	Bridgeport	Connecitcut	9	2013	962500
58	23	Bridgeport	Connecitcut	10	2013	1177500
59	23	Bridgeport	Connecitcut	11	2013	1300000
60	23	Bridgeport	Connecitcut	12	2013	1266200
61	23	Bridgeport	Connecitcut	1	2014	1517500
62	23	Bridgeport	Connecitcut	2	2014	950000
63	23	Bridgeport	Connecitcut	3	2014	1050000
64	23	Bridgeport	Connecitcut	4	2014	1100000
65	23	Bridgeport	Connecitcut	5	2014	1120000
66	23	Bridgeport	Connecitcut	6	2014	1376500
67	23	Bridgeport	Connecitcut	7	2014	1250250
68	23	Bridgeport	Connecitcut	8	2014	1127351
69	23	Bridgeport	Connecitcut	9	2014	1150000
70	23	Bridgeport	Connecitcut	10	2014	1112500
71	23	Bridgeport	Connecitcut	11	2014	987500
72	23	Bridgeport	Connecitcut	12	2014	435000
73	23	Bridgeport	Connecitcut	1	2015	335000
74	23	Bridgeport	Connecitcut	2	2015	347250
75	23	Bridgeport	Connecitcut	3	2015	342750
76	23	Bridgeport	Connecitcut	4	2015	365000
77	23	Bridgeport	Connecitcut	5	2015	417000
78	23	Bridgeport	Connecitcut	6	2015	430000
79	23	Bridgeport	Connecitcut	7	2015	415000
80	23	Bridgeport	Connecitcut	8	2015	413000
81	23	Bridgeport	Connecitcut	9	2015	361500
82	23	Bridgeport	Connecitcut	10	2015	387250
83	23	Bridgeport	Connecitcut	11	2015	345000
84	23	Bridgeport	Connecitcut	12	2015	370000
85	23	Bridgeport	Connecitcut	1	2016	351250
86	23	Bridgeport	Connecitcut	2	2016	350000
87	23	Bridgeport	Connecitcut	3	2016	337750
88	23	Bridgeport	Connecitcut	4	2016	360000
89	23	Bridgeport	Connecitcut	5	2016	386500
90	23	Bridgeport	Connecitcut	6	2016	409950
91	23	Bridgeport	Connecitcut	7	2016	399900
92	23	Bridgeport	Connecitcut	8	2016	395000
93	23	Bridgeport	Connecitcut	9	2016	375000
94	23	Bridgeport	Connecitcut	10	2016	350000
95	23	Bridgeport	Connecitcut	11	2016	360000
96	23	Bridgeport	Connecitcut	12	2016	365000
97	23	Bridgeport	Connecitcut	1	2017	375220
98	23	Bridgeport	Connecitcut	2	2017	344800
99	23	Bridgeport	Connecitcut	3	2017	344750
100	23	Bridgeport	Connecitcut	4	2017	410000
101	23	Bridgeport	Connecitcut	5	2017	416000
102	23	Bridgeport	Connecitcut	6	2017	450000
103	23	Bridgeport	Connecitcut	7	2017	410000
104	23	Bridgeport	Connecitcut	8	2017	415000
105	23	Bridgeport	Connecitcut	9	2017	402250
106	23	Bridgeport	Connecitcut	10	2017	365000
107	23	Bridgeport	Connecitcut	11	2017	357000
108	23	Bridgeport	Connecitcut	12	2017	400000
109	23	Bridgeport	Connecitcut	1	2018	370000
110	23	Bridgeport	Connecitcut	2	2018	395000
111	23	Bridgeport	Connecitcut	3	2018	365000
112	23	Bridgeport	Connecitcut	4	2018	385000
113	23	Bridgeport	Connecitcut	5	2018	391150
114	23	Bridgeport	Connecitcut	6	2018	440000
115	23	Bridgeport	Connecitcut	7	2018	449500
116	23	Bridgeport	Connecitcut	8	2018	426000
117	23	Bridgeport	Connecitcut	9	2018	377500
118	23	Bridgeport	Connecitcut	10	2018	350000
119	23	Bridgeport	Connecitcut	11	2018	375000
120	23	Bridgeport	Connecitcut	12	2018	378500
121	23	Bridgeport	Connecitcut	1	2019	0
122	141	Jackson	Wyoming	1	2009	0
123	141	Jackson	Wyoming	2	2009	723900
124	141	Jackson	Wyoming	3	2009	722600
125	141	Jackson	Wyoming	4	2009	721300
126	141	Jackson	Wyoming	5	2009	718600
127	141	Jackson	Wyoming	6	2009	714600
128	141	Jackson	Wyoming	7	2009	710200
129	141	Jackson	Wyoming	8	2009	705600
130	141	Jackson	Wyoming	9	2009	701500
131	141	Jackson	Wyoming	10	2009	697500
132	141	Jackson	Wyoming	11	2009	694300
133	141	Jackson	Wyoming	12	2009	688700
134	141	Jackson	Wyoming	1	2010	684900
135	141	Jackson	Wyoming	2	2010	686300
136	141	Jackson	Wyoming	3	2010	685600
137	141	Jackson	Wyoming	4	2010	679400
138	141	Jackson	Wyoming	5	2010	675900
139	141	Jackson	Wyoming	6	2010	676100
140	141	Jackson	Wyoming	7	2010	676400
141	141	Jackson	Wyoming	8	2010	677000
142	141	Jackson	Wyoming	9	2010	677100
143	141	Jackson	Wyoming	10	2010	676200
144	141	Jackson	Wyoming	11	2010	673700
145	141	Jackson	Wyoming	12	2010	671700
146	141	Jackson	Wyoming	1	2011	669900
147	141	Jackson	Wyoming	2	2011	666700
148	141	Jackson	Wyoming	3	2011	662400
149	141	Jackson	Wyoming	4	2011	660500
150	141	Jackson	Wyoming	5	2011	660300
151	141	Jackson	Wyoming	6	2011	660500
152	141	Jackson	Wyoming	7	2011	659800
153	141	Jackson	Wyoming	8	2011	658800
154	141	Jackson	Wyoming	9	2011	657900
155	141	Jackson	Wyoming	10	2011	657400
156	141	Jackson	Wyoming	11	2011	657600
157	141	Jackson	Wyoming	12	2011	658800
158	141	Jackson	Wyoming	1	2012	659500
159	141	Jackson	Wyoming	2	2012	659800
160	141	Jackson	Wyoming	3	2012	661000
161	141	Jackson	Wyoming	4	2012	662900
162	141	Jackson	Wyoming	5	2012	664100
163	141	Jackson	Wyoming	6	2012	664600
164	141	Jackson	Wyoming	7	2012	665200
165	141	Jackson	Wyoming	8	2012	666400
166	141	Jackson	Wyoming	9	2012	668300
167	141	Jackson	Wyoming	10	2012	669400
168	141	Jackson	Wyoming	11	2012	670800
169	141	Jackson	Wyoming	12	2012	671500
170	141	Jackson	Wyoming	1	2013	671000
171	141	Jackson	Wyoming	2	2013	670600
172	141	Jackson	Wyoming	3	2013	672900
173	141	Jackson	Wyoming	4	2013	674300
174	141	Jackson	Wyoming	5	2013	672300
175	141	Jackson	Wyoming	6	2013	669900
176	141	Jackson	Wyoming	7	2013	671200
177	141	Jackson	Wyoming	8	2013	674500
178	141	Jackson	Wyoming	9	2013	676900
179	141	Jackson	Wyoming	10	2013	679200
180	141	Jackson	Wyoming	11	2013	680400
181	141	Jackson	Wyoming	12	2013	680600
182	141	Jackson	Wyoming	1	2014	681400
183	141	Jackson	Wyoming	2	2014	683900
184	141	Jackson	Wyoming	3	2014	686800
185	141	Jackson	Wyoming	4	2014	690100
186	141	Jackson	Wyoming	5	2014	692400
187	141	Jackson	Wyoming	6	2014	691300
188	141	Jackson	Wyoming	7	2014	689600
189	141	Jackson	Wyoming	8	2014	689900
190	141	Jackson	Wyoming	9	2014	691600
191	141	Jackson	Wyoming	10	2014	694200
192	141	Jackson	Wyoming	11	2014	697200
193	141	Jackson	Wyoming	12	2014	699700
194	141	Jackson	Wyoming	1	2015	702800
195	141	Jackson	Wyoming	2	2015	704300
196	141	Jackson	Wyoming	3	2015	704900
197	141	Jackson	Wyoming	4	2015	708800
198	141	Jackson	Wyoming	5	2015	715100
199	141	Jackson	Wyoming	6	2015	720000
200	141	Jackson	Wyoming	7	2015	724000
201	141	Jackson	Wyoming	8	2015	724900
202	141	Jackson	Wyoming	9	2015	723600
203	141	Jackson	Wyoming	10	2015	722200
204	141	Jackson	Wyoming	11	2015	722700
205	141	Jackson	Wyoming	12	2015	725800
206	141	Jackson	Wyoming	1	2016	729800
207	141	Jackson	Wyoming	2	2016	731700
208	141	Jackson	Wyoming	3	2016	733700
209	141	Jackson	Wyoming	4	2016	735900
210	141	Jackson	Wyoming	5	2016	737500
211	141	Jackson	Wyoming	6	2016	739600
212	141	Jackson	Wyoming	7	2016	739800
213	141	Jackson	Wyoming	8	2016	735900
214	141	Jackson	Wyoming	9	2016	731600
215	141	Jackson	Wyoming	10	2016	729700
216	141	Jackson	Wyoming	11	2016	728200
217	141	Jackson	Wyoming	12	2016	727700
218	141	Jackson	Wyoming	1	2017	729100
219	141	Jackson	Wyoming	2	2017	730800
220	141	Jackson	Wyoming	3	2017	731400
221	141	Jackson	Wyoming	4	2017	731800
222	141	Jackson	Wyoming	5	2017	730000
223	141	Jackson	Wyoming	6	2017	727200
224	141	Jackson	Wyoming	7	2017	726700
225	141	Jackson	Wyoming	8	2017	728400
226	141	Jackson	Wyoming	9	2017	729500
227	141	Jackson	Wyoming	10	2017	731900
228	141	Jackson	Wyoming	11	2017	739600
229	141	Jackson	Wyoming	12	2017	750700
230	141	Jackson	Wyoming	1	2018	760700
231	141	Jackson	Wyoming	2	2018	770600
232	141	Jackson	Wyoming	3	2018	778200
233	141	Jackson	Wyoming	4	2018	784600
234	141	Jackson	Wyoming	5	2018	794000
235	141	Jackson	Wyoming	6	2018	807300
236	141	Jackson	Wyoming	7	2018	817300
237	141	Jackson	Wyoming	8	2018	829800
238	141	Jackson	Wyoming	9	2018	846100
239	141	Jackson	Wyoming	10	2018	863400
240	141	Jackson	Wyoming	11	2018	875200
241	141	Jackson	Wyoming	12	2018	879500
242	141	Jackson	Wyoming	1	2019	877600
243	15	San Francisco	California	1	2009	560000
244	15	San Francisco	California	2	2009	600000
245	15	San Francisco	California	3	2009	583000
246	15	San Francisco	California	4	2009	620000
247	15	San Francisco	California	5	2009	652000
248	15	San Francisco	California	6	2009	675000
249	15	San Francisco	California	7	2009	660000
250	15	San Francisco	California	8	2009	637500
251	15	San Francisco	California	9	2009	650000
252	15	San Francisco	California	10	2009	670750
253	15	San Francisco	California	11	2009	670000
254	15	San Francisco	California	12	2009	675000
255	15	San Francisco	California	1	2010	636000
256	15	San Francisco	California	2	2010	615000
257	15	San Francisco	California	3	2010	700000
258	15	San Francisco	California	4	2010	685000
259	15	San Francisco	California	5	2010	671000
260	15	San Francisco	California	6	2010	715000
261	15	San Francisco	California	7	2010	688700
262	15	San Francisco	California	8	2010	689000
263	15	San Francisco	California	9	2010	640000
264	15	San Francisco	California	10	2010	660000
265	15	San Francisco	California	11	2010	689000
266	15	San Francisco	California	12	2010	649000
267	15	San Francisco	California	1	2011	582000
268	15	San Francisco	California	2	2011	565000
269	15	San Francisco	California	3	2011	635000
270	15	San Francisco	California	4	2011	639000
271	15	San Francisco	California	5	2011	699000
272	15	San Francisco	California	6	2011	685000
273	15	San Francisco	California	7	2011	658000
274	15	San Francisco	California	8	2011	649500
275	15	San Francisco	California	9	2011	610000
276	15	San Francisco	California	10	2011	629000
277	15	San Francisco	California	11	2011	630000
278	15	San Francisco	California	12	2011	585000
279	15	San Francisco	California	1	2012	565000
280	15	San Francisco	California	2	2012	605000
281	15	San Francisco	California	3	2012	637000
282	15	San Francisco	California	4	2012	695000
283	15	San Francisco	California	5	2012	682000
284	15	San Francisco	California	6	2012	725000
285	15	San Francisco	California	7	2012	716000
286	15	San Francisco	California	8	2012	705000
287	15	San Francisco	California	9	2012	720000
288	15	San Francisco	California	10	2012	751000
289	15	San Francisco	California	11	2012	760000
290	15	San Francisco	California	12	2012	750000
291	15	San Francisco	California	1	2013	710000
292	15	San Francisco	California	2	2013	769500
293	15	San Francisco	California	3	2013	840000
294	15	San Francisco	California	4	2013	845000
295	15	San Francisco	California	5	2013	875000
296	15	San Francisco	California	6	2013	850000
297	15	San Francisco	California	7	2013	841000
298	15	San Francisco	California	8	2013	850000
299	15	San Francisco	California	9	2013	831544
300	15	San Francisco	California	10	2013	868000
301	15	San Francisco	California	11	2013	835000
302	15	San Francisco	California	12	2013	835000
303	15	San Francisco	California	1	2014	886000
304	15	San Francisco	California	2	2014	916000
305	15	San Francisco	California	3	2014	960000
306	15	San Francisco	California	4	2014	935000
307	15	San Francisco	California	5	2014	970000
308	15	San Francisco	California	6	2014	995000
309	15	San Francisco	California	7	2014	950000
310	15	San Francisco	California	8	2014	926000
311	15	San Francisco	California	9	2014	925000
312	15	San Francisco	California	10	2014	988000
313	15	San Francisco	California	11	2014	1000000
314	15	San Francisco	California	12	2014	950000
315	15	San Francisco	California	1	2015	930050
316	15	San Francisco	California	2	2015	1077750
317	15	San Francisco	California	3	2015	1100000
318	15	San Francisco	California	4	2015	1150000
319	15	San Francisco	California	5	2015	1200000
320	15	San Francisco	California	6	2015	1150000
321	15	San Francisco	California	7	2015	1135000
322	15	San Francisco	California	8	2015	1150000
323	15	San Francisco	California	9	2015	1100000
324	15	San Francisco	California	10	2015	1140289
325	15	San Francisco	California	11	2015	1150000
326	15	San Francisco	California	12	2015	1080000
327	15	San Francisco	California	1	2016	1050000
328	15	San Francisco	California	2	2016	1110000
329	15	San Francisco	California	3	2016	1110000
330	15	San Francisco	California	4	2016	1238000
331	15	San Francisco	California	5	2016	1208500
332	15	San Francisco	California	6	2016	1200000
333	15	San Francisco	California	7	2016	1200000
334	15	San Francisco	California	8	2016	1135000
335	15	San Francisco	California	9	2016	1130000
336	15	San Francisco	California	10	2016	1238000
337	15	San Francisco	California	11	2016	1136000
338	15	San Francisco	California	12	2016	1150000
339	15	San Francisco	California	1	2017	1050000
340	15	San Francisco	California	2	2017	1245000
341	15	San Francisco	California	3	2017	1200000
342	15	San Francisco	California	4	2017	1270000
343	15	San Francisco	California	5	2017	1300000
344	15	San Francisco	California	6	2017	1291500
345	15	San Francisco	California	7	2017	1285500
346	15	San Francisco	California	8	2017	1238000
347	15	San Francisco	California	9	2017	1245000
348	15	San Francisco	California	10	2017	1297500
349	15	San Francisco	California	11	2017	1350050
350	15	San Francisco	California	12	2017	1320000
351	15	San Francisco	California	1	2018	1300000
352	15	San Francisco	California	2	2018	1390000
353	15	San Francisco	California	3	2018	1414000
354	15	San Francisco	California	4	2018	1425000
355	15	San Francisco	California	5	2018	1446250
356	15	San Francisco	California	6	2018	1406500
357	15	San Francisco	California	7	2018	1400000
358	15	San Francisco	California	8	2018	1388444
359	15	San Francisco	California	9	2018	1425000
360	15	San Francisco	California	10	2018	1400000
361	15	San Francisco	California	11	2018	1338000
362	15	San Francisco	California	12	2018	1350000
363	15	San Francisco	California	1	2019	0
364	16	San Jose	California	1	2009	405000
365	16	San Jose	California	2	2009	420000
366	16	San Jose	California	3	2009	397000
367	16	San Jose	California	4	2009	420000
368	16	San Jose	California	5	2009	437500
369	16	San Jose	California	6	2009	472000
370	16	San Jose	California	7	2009	500000
371	16	San Jose	California	8	2009	485000
372	16	San Jose	California	9	2009	470000
373	16	San Jose	California	10	2009	490000
374	16	San Jose	California	11	2009	500000
375	16	San Jose	California	12	2009	488500
376	16	San Jose	California	1	2010	461000
377	16	San Jose	California	2	2010	475000
378	16	San Jose	California	3	2010	510000
379	16	San Jose	California	4	2010	514750
380	16	San Jose	California	5	2010	531500
381	16	San Jose	California	6	2010	525000
382	16	San Jose	California	7	2010	550000
383	16	San Jose	California	8	2010	520000
384	16	San Jose	California	9	2010	500500
385	16	San Jose	California	10	2010	520000
386	16	San Jose	California	11	2010	495000
387	16	San Jose	California	12	2010	476500
388	16	San Jose	California	1	2011	446500
389	16	San Jose	California	2	2011	435000
390	16	San Jose	California	3	2011	472500
391	16	San Jose	California	4	2011	495000
392	16	San Jose	California	5	2011	490000
393	16	San Jose	California	6	2011	520000
394	16	San Jose	California	7	2011	515000
395	16	San Jose	California	8	2011	499500
396	16	San Jose	California	9	2011	465000
397	16	San Jose	California	10	2011	455500
398	16	San Jose	California	11	2011	468000
399	16	San Jose	California	12	2011	445750
400	16	San Jose	California	1	2012	422500
401	16	San Jose	California	2	2012	444000
402	16	San Jose	California	3	2012	482000
403	16	San Jose	California	4	2012	522500
404	16	San Jose	California	5	2012	535000
405	16	San Jose	California	6	2012	576000
406	16	San Jose	California	7	2012	581000
407	16	San Jose	California	8	2012	576000
408	16	San Jose	California	9	2012	565000
409	16	San Jose	California	10	2012	570000
410	16	San Jose	California	11	2012	582000
411	16	San Jose	California	12	2012	588500
412	16	San Jose	California	1	2013	567750
413	16	San Jose	California	2	2013	598000
414	16	San Jose	California	3	2013	630000
415	16	San Jose	California	4	2013	690000
416	16	San Jose	California	5	2013	705000
417	16	San Jose	California	6	2013	700000
418	16	San Jose	California	7	2013	705000
419	16	San Jose	California	8	2013	680000
420	16	San Jose	California	9	2013	675000
421	16	San Jose	California	10	2013	670000
422	16	San Jose	California	11	2013	679000
423	16	San Jose	California	12	2013	655000
424	16	San Jose	California	1	2014	650000
425	16	San Jose	California	2	2014	685000
426	16	San Jose	California	3	2014	730000
427	16	San Jose	California	4	2014	751000
428	16	San Jose	California	5	2014	750250
429	16	San Jose	California	6	2014	770000
430	16	San Jose	California	7	2014	740000
431	16	San Jose	California	8	2014	750000
432	16	San Jose	California	9	2014	727121
433	16	San Jose	California	10	2014	750000
434	16	San Jose	California	11	2014	740000
435	16	San Jose	California	12	2014	723000
436	16	San Jose	California	1	2015	696500
437	16	San Jose	California	2	2015	750000
438	16	San Jose	California	3	2015	810000
439	16	San Jose	California	4	2015	826000
440	16	San Jose	California	5	2015	851000
441	16	San Jose	California	6	2015	868500
442	16	San Jose	California	7	2015	860000
443	16	San Jose	California	8	2015	850000
444	16	San Jose	California	9	2015	820000
445	16	San Jose	California	10	2015	830000
446	16	San Jose	California	11	2015	840000
447	16	San Jose	California	12	2015	820000
448	16	San Jose	California	1	2016	770000
449	16	San Jose	California	2	2016	825000
450	16	San Jose	California	3	2016	860000
451	16	San Jose	California	4	2016	915000
452	16	San Jose	California	5	2016	930000
453	16	San Jose	California	6	2016	900000
454	16	San Jose	California	7	2016	904000
455	16	San Jose	California	8	2016	860000
456	16	San Jose	California	9	2016	863500
457	16	San Jose	California	10	2016	880000
458	16	San Jose	California	11	2016	875000
459	16	San Jose	California	12	2016	840000
460	16	San Jose	California	1	2017	820000
461	16	San Jose	California	2	2017	880500
462	16	San Jose	California	3	2017	955500
463	16	San Jose	California	4	2017	957000
464	16	San Jose	California	5	2017	979500
465	16	San Jose	California	6	2017	1000000
466	16	San Jose	California	7	2017	975000
467	16	San Jose	California	8	2017	975000
468	16	San Jose	California	9	2017	1000000
469	16	San Jose	California	10	2017	1036000
470	16	San Jose	California	11	2017	1075000
471	16	San Jose	California	12	2017	1100000
472	16	San Jose	California	1	2018	995000
473	16	San Jose	California	2	2018	1173000
474	16	San Jose	California	3	2018	1280000
475	16	San Jose	California	4	2018	1210000
476	16	San Jose	California	5	2018	1250000
477	16	San Jose	California	6	2018	1225000
478	16	San Jose	California	7	2018	1160000
479	16	San Jose	California	8	2018	1188000
480	16	San Jose	California	9	2018	1100000
481	16	San Jose	California	10	2018	1150000
482	16	San Jose	California	11	2018	1080000
483	16	San Jose	California	12	2018	1020000
484	16	San Jose	California	1	2019	0
485	44	Honolulu	Hawaii	1	2009	400000
486	44	Honolulu	Hawaii	2	2009	410000
487	44	Honolulu	Hawaii	3	2009	410000
488	44	Honolulu	Hawaii	4	2009	382500
489	44	Honolulu	Hawaii	5	2009	412250
490	44	Honolulu	Hawaii	6	2009	425000
491	44	Honolulu	Hawaii	7	2009	410000
492	44	Honolulu	Hawaii	8	2009	401000
493	44	Honolulu	Hawaii	9	2009	425000
494	44	Honolulu	Hawaii	10	2009	415000
495	44	Honolulu	Hawaii	11	2009	400000
496	44	Honolulu	Hawaii	12	2009	411400
497	44	Honolulu	Hawaii	1	2010	405000
498	44	Honolulu	Hawaii	2	2010	399000
499	44	Honolulu	Hawaii	3	2010	399000
500	44	Honolulu	Hawaii	4	2010	415000
501	44	Honolulu	Hawaii	5	2010	425000
502	44	Honolulu	Hawaii	6	2010	419000
503	44	Honolulu	Hawaii	7	2010	445000
504	44	Honolulu	Hawaii	8	2010	440000
505	44	Honolulu	Hawaii	9	2010	465000
506	44	Honolulu	Hawaii	10	2010	437500
507	44	Honolulu	Hawaii	11	2010	415000
508	44	Honolulu	Hawaii	12	2010	430000
509	44	Honolulu	Hawaii	1	2011	415000
510	44	Honolulu	Hawaii	2	2011	418950
511	44	Honolulu	Hawaii	3	2011	410000
512	44	Honolulu	Hawaii	4	2011	389500
513	44	Honolulu	Hawaii	5	2011	412500
514	44	Honolulu	Hawaii	6	2011	395579
515	44	Honolulu	Hawaii	7	2011	406000
516	44	Honolulu	Hawaii	8	2011	400000
517	44	Honolulu	Hawaii	9	2011	404500
518	44	Honolulu	Hawaii	10	2011	430000
519	44	Honolulu	Hawaii	11	2011	421500
520	44	Honolulu	Hawaii	12	2011	405000
521	44	Honolulu	Hawaii	1	2012	386500
522	44	Honolulu	Hawaii	2	2012	425000
523	44	Honolulu	Hawaii	3	2012	403000
524	44	Honolulu	Hawaii	4	2012	415000
525	44	Honolulu	Hawaii	5	2012	401000
526	44	Honolulu	Hawaii	6	2012	423500
527	44	Honolulu	Hawaii	7	2012	420000
528	44	Honolulu	Hawaii	8	2012	435000
529	44	Honolulu	Hawaii	9	2012	450000
530	44	Honolulu	Hawaii	10	2012	440000
531	44	Honolulu	Hawaii	11	2012	450000
532	44	Honolulu	Hawaii	12	2012	438500
533	44	Honolulu	Hawaii	1	2013	425250
534	44	Honolulu	Hawaii	2	2013	442000
535	44	Honolulu	Hawaii	3	2013	419450
536	44	Honolulu	Hawaii	4	2013	445000
537	44	Honolulu	Hawaii	5	2013	415000
538	44	Honolulu	Hawaii	6	2013	470000
539	44	Honolulu	Hawaii	7	2013	443500
540	44	Honolulu	Hawaii	8	2013	500000
541	44	Honolulu	Hawaii	9	2013	460000
542	44	Honolulu	Hawaii	10	2013	440000
543	44	Honolulu	Hawaii	11	2013	440000
544	44	Honolulu	Hawaii	12	2013	450000
545	44	Honolulu	Hawaii	1	2014	490000
546	44	Honolulu	Hawaii	2	2014	462250
547	44	Honolulu	Hawaii	3	2014	481323
548	44	Honolulu	Hawaii	4	2014	448250
549	44	Honolulu	Hawaii	5	2014	485000
550	44	Honolulu	Hawaii	6	2014	500000
551	44	Honolulu	Hawaii	7	2014	468000
552	44	Honolulu	Hawaii	8	2014	476000
553	44	Honolulu	Hawaii	9	2014	500000
554	44	Honolulu	Hawaii	10	2014	415000
555	44	Honolulu	Hawaii	11	2014	475000
556	44	Honolulu	Hawaii	12	2014	490000
557	44	Honolulu	Hawaii	1	2015	534261
558	44	Honolulu	Hawaii	2	2015	471750
559	44	Honolulu	Hawaii	3	2015	500000
560	44	Honolulu	Hawaii	4	2015	483500
561	44	Honolulu	Hawaii	5	2015	485000
562	44	Honolulu	Hawaii	6	2015	480000
563	44	Honolulu	Hawaii	7	2015	480000
564	44	Honolulu	Hawaii	8	2015	525000
565	44	Honolulu	Hawaii	9	2015	515000
566	44	Honolulu	Hawaii	10	2015	505000
567	44	Honolulu	Hawaii	11	2015	509996
568	44	Honolulu	Hawaii	12	2015	520000
569	44	Honolulu	Hawaii	1	2016	519500
570	44	Honolulu	Hawaii	2	2016	525000
571	44	Honolulu	Hawaii	3	2016	515000
572	44	Honolulu	Hawaii	4	2016	527000
573	44	Honolulu	Hawaii	5	2016	520000
574	44	Honolulu	Hawaii	6	2016	545000
575	44	Honolulu	Hawaii	7	2016	550000
576	44	Honolulu	Hawaii	8	2016	535000
577	44	Honolulu	Hawaii	9	2016	533500
578	44	Honolulu	Hawaii	10	2016	558250
579	44	Honolulu	Hawaii	11	2016	611000
580	44	Honolulu	Hawaii	12	2016	545700
581	44	Honolulu	Hawaii	1	2017	566500
582	44	Honolulu	Hawaii	2	2017	525000
583	44	Honolulu	Hawaii	3	2017	517500
584	44	Honolulu	Hawaii	4	2017	530000
585	44	Honolulu	Hawaii	5	2017	538500
586	44	Honolulu	Hawaii	6	2017	575000
587	44	Honolulu	Hawaii	7	2017	575000
588	44	Honolulu	Hawaii	8	2017	570000
589	44	Honolulu	Hawaii	9	2017	590000
590	44	Honolulu	Hawaii	10	2017	625000
591	44	Honolulu	Hawaii	11	2017	595000
592	44	Honolulu	Hawaii	12	2017	590000
593	44	Honolulu	Hawaii	1	2018	565000
594	44	Honolulu	Hawaii	2	2018	555000
595	44	Honolulu	Hawaii	3	2018	555000
596	44	Honolulu	Hawaii	4	2018	549000
597	44	Honolulu	Hawaii	5	2018	595000
598	44	Honolulu	Hawaii	6	2018	579000
599	44	Honolulu	Hawaii	7	2018	590000
600	44	Honolulu	Hawaii	8	2018	589000
601	44	Honolulu	Hawaii	9	2018	575000
602	44	Honolulu	Hawaii	10	2018	575000
603	44	Honolulu	Hawaii	11	2018	575000
604	44	Honolulu	Hawaii	12	2018	537000
605	44	Honolulu	Hawaii	1	2019	0
606	161	Washington	District of Columbia	1	2009	0
607	161	Washington	District of Columbia	2	2009	365100
608	161	Washington	District of Columbia	3	2009	363000
609	161	Washington	District of Columbia	4	2009	360500
610	161	Washington	District of Columbia	5	2009	357800
611	161	Washington	District of Columbia	6	2009	355600
612	161	Washington	District of Columbia	7	2009	354300
613	161	Washington	District of Columbia	8	2009	353400
614	161	Washington	District of Columbia	9	2009	352900
615	161	Washington	District of Columbia	10	2009	352600
616	161	Washington	District of Columbia	11	2009	352600
617	161	Washington	District of Columbia	12	2009	353200
618	161	Washington	District of Columbia	1	2010	354000
619	161	Washington	District of Columbia	2	2010	354400
620	161	Washington	District of Columbia	3	2010	354500
621	161	Washington	District of Columbia	4	2010	354900
622	161	Washington	District of Columbia	5	2010	355200
623	161	Washington	District of Columbia	6	2010	354600
624	161	Washington	District of Columbia	7	2010	353700
625	161	Washington	District of Columbia	8	2010	353200
626	161	Washington	District of Columbia	9	2010	353400
627	161	Washington	District of Columbia	10	2010	354000
628	161	Washington	District of Columbia	11	2010	355100
629	161	Washington	District of Columbia	12	2010	356100
630	161	Washington	District of Columbia	1	2011	356400
631	161	Washington	District of Columbia	2	2011	355200
632	161	Washington	District of Columbia	3	2011	353700
633	161	Washington	District of Columbia	4	2011	353000
634	161	Washington	District of Columbia	5	2011	353400
635	161	Washington	District of Columbia	6	2011	354000
636	161	Washington	District of Columbia	7	2011	353400
637	161	Washington	District of Columbia	8	2011	352000
638	161	Washington	District of Columbia	9	2011	351300
639	161	Washington	District of Columbia	10	2011	351600
640	161	Washington	District of Columbia	11	2011	351800
641	161	Washington	District of Columbia	12	2011	352200
642	161	Washington	District of Columbia	1	2012	353600
643	161	Washington	District of Columbia	2	2012	356100
644	161	Washington	District of Columbia	3	2012	359100
645	161	Washington	District of Columbia	4	2012	361700
646	161	Washington	District of Columbia	5	2012	363700
647	161	Washington	District of Columbia	6	2012	366000
648	161	Washington	District of Columbia	7	2012	369400
649	161	Washington	District of Columbia	8	2012	373000
650	161	Washington	District of Columbia	9	2012	376700
651	161	Washington	District of Columbia	10	2012	379900
652	161	Washington	District of Columbia	11	2012	382700
653	161	Washington	District of Columbia	12	2012	384700
654	161	Washington	District of Columbia	1	2013	386600
655	161	Washington	District of Columbia	2	2013	388700
656	161	Washington	District of Columbia	3	2013	391900
657	161	Washington	District of Columbia	4	2013	396700
658	161	Washington	District of Columbia	5	2013	402300
659	161	Washington	District of Columbia	6	2013	406400
660	161	Washington	District of Columbia	7	2013	410700
661	161	Washington	District of Columbia	8	2013	416000
662	161	Washington	District of Columbia	9	2013	420200
663	161	Washington	District of Columbia	10	2013	422700
664	161	Washington	District of Columbia	11	2013	425500
665	161	Washington	District of Columbia	12	2013	428400
666	161	Washington	District of Columbia	1	2014	430900
667	161	Washington	District of Columbia	2	2014	433800
668	161	Washington	District of Columbia	3	2014	437200
669	161	Washington	District of Columbia	4	2014	439800
670	161	Washington	District of Columbia	5	2014	441600
671	161	Washington	District of Columbia	6	2014	443500
672	161	Washington	District of Columbia	7	2014	445200
673	161	Washington	District of Columbia	8	2014	446600
991	127	Seattle	Washington	11	2010	310000
674	161	Washington	District of Columbia	9	2014	447700
675	161	Washington	District of Columbia	10	2014	449000
676	161	Washington	District of Columbia	11	2014	450200
677	161	Washington	District of Columbia	12	2014	452100
678	161	Washington	District of Columbia	1	2015	454500
679	161	Washington	District of Columbia	2	2015	458000
680	161	Washington	District of Columbia	3	2015	460900
681	161	Washington	District of Columbia	4	2015	463100
682	161	Washington	District of Columbia	5	2015	465500
683	161	Washington	District of Columbia	6	2015	469000
684	161	Washington	District of Columbia	7	2015	471800
685	161	Washington	District of Columbia	8	2015	474000
686	161	Washington	District of Columbia	9	2015	476600
687	161	Washington	District of Columbia	10	2015	479100
688	161	Washington	District of Columbia	11	2015	480700
689	161	Washington	District of Columbia	12	2015	482000
690	161	Washington	District of Columbia	1	2016	482700
691	161	Washington	District of Columbia	2	2016	483700
692	161	Washington	District of Columbia	3	2016	486600
693	161	Washington	District of Columbia	4	2016	491700
694	161	Washington	District of Columbia	5	2016	497100
695	161	Washington	District of Columbia	6	2016	502000
696	161	Washington	District of Columbia	7	2016	505900
697	161	Washington	District of Columbia	8	2016	508600
698	161	Washington	District of Columbia	9	2016	510400
699	161	Washington	District of Columbia	10	2016	514100
700	161	Washington	District of Columbia	11	2016	520600
701	161	Washington	District of Columbia	12	2016	528000
702	161	Washington	District of Columbia	1	2017	532600
703	161	Washington	District of Columbia	2	2017	534800
704	161	Washington	District of Columbia	3	2017	535900
705	161	Washington	District of Columbia	4	2017	537600
706	161	Washington	District of Columbia	5	2017	539000
707	161	Washington	District of Columbia	6	2017	541000
708	161	Washington	District of Columbia	7	2017	544000
709	161	Washington	District of Columbia	8	2017	547000
710	161	Washington	District of Columbia	9	2017	548300
711	161	Washington	District of Columbia	10	2017	548400
712	161	Washington	District of Columbia	11	2017	548300
713	161	Washington	District of Columbia	12	2017	548400
714	161	Washington	District of Columbia	1	2018	551800
715	161	Washington	District of Columbia	2	2018	558100
716	161	Washington	District of Columbia	3	2018	562800
717	161	Washington	District of Columbia	4	2018	563100
718	161	Washington	District of Columbia	5	2018	563800
719	161	Washington	District of Columbia	6	2018	566100
720	161	Washington	District of Columbia	7	2018	568200
721	161	Washington	District of Columbia	8	2018	569100
722	161	Washington	District of Columbia	9	2018	571500
723	161	Washington	District of Columbia	10	2018	575600
724	161	Washington	District of Columbia	11	2018	579400
725	161	Washington	District of Columbia	12	2018	581000
726	161	Washington	District of Columbia	1	2019	581200
727	65	Boston	Massachusetts	1	2009	270000
728	65	Boston	Massachusetts	2	2009	269900
729	65	Boston	Massachusetts	3	2009	269000
730	65	Boston	Massachusetts	4	2009	287100
731	65	Boston	Massachusetts	5	2009	302000
732	65	Boston	Massachusetts	6	2009	334000
733	65	Boston	Massachusetts	7	2009	333000
734	65	Boston	Massachusetts	8	2009	335000
735	65	Boston	Massachusetts	9	2009	318007
736	65	Boston	Massachusetts	10	2009	300000
737	65	Boston	Massachusetts	11	2009	306250
738	65	Boston	Massachusetts	12	2009	320000
739	65	Boston	Massachusetts	1	2010	317500
740	65	Boston	Massachusetts	2	2010	289000
741	65	Boston	Massachusetts	3	2010	305000
742	65	Boston	Massachusetts	4	2010	312000
743	65	Boston	Massachusetts	5	2010	321770
744	65	Boston	Massachusetts	6	2010	360000
745	65	Boston	Massachusetts	7	2010	360000
746	65	Boston	Massachusetts	8	2010	355000
747	65	Boston	Massachusetts	9	2010	323000
748	65	Boston	Massachusetts	10	2010	319900
749	65	Boston	Massachusetts	11	2010	330000
750	65	Boston	Massachusetts	12	2010	315000
751	65	Boston	Massachusetts	1	2011	306000
752	65	Boston	Massachusetts	2	2011	289000
753	65	Boston	Massachusetts	3	2011	299900
754	65	Boston	Massachusetts	4	2011	315000
755	65	Boston	Massachusetts	5	2011	330000
756	65	Boston	Massachusetts	6	2011	360000
757	65	Boston	Massachusetts	7	2011	355000
758	65	Boston	Massachusetts	8	2011	349000
759	65	Boston	Massachusetts	9	2011	329000
760	65	Boston	Massachusetts	10	2011	302500
761	65	Boston	Massachusetts	11	2011	319000
762	65	Boston	Massachusetts	12	2011	311250
763	65	Boston	Massachusetts	1	2012	300000
764	65	Boston	Massachusetts	2	2012	289800
765	65	Boston	Massachusetts	3	2012	305000
766	65	Boston	Massachusetts	4	2012	320000
767	65	Boston	Massachusetts	5	2012	339500
768	65	Boston	Massachusetts	6	2012	374148
769	65	Boston	Massachusetts	7	2012	363000
770	65	Boston	Massachusetts	8	2012	355000
771	65	Boston	Massachusetts	9	2012	336000
772	65	Boston	Massachusetts	10	2012	322500
773	65	Boston	Massachusetts	11	2012	335000
774	65	Boston	Massachusetts	12	2012	343250
992	127	Seattle	Washington	12	2010	308750
775	65	Boston	Massachusetts	1	2013	322500
776	65	Boston	Massachusetts	2	2013	317500
777	65	Boston	Massachusetts	3	2013	325000
778	65	Boston	Massachusetts	4	2013	349900
779	65	Boston	Massachusetts	5	2013	364000
780	65	Boston	Massachusetts	6	2013	390000
781	65	Boston	Massachusetts	7	2013	386550
782	65	Boston	Massachusetts	8	2013	387500
783	65	Boston	Massachusetts	9	2013	369900
784	65	Boston	Massachusetts	10	2013	360000
785	65	Boston	Massachusetts	11	2013	362000
786	65	Boston	Massachusetts	12	2013	371000
787	65	Boston	Massachusetts	1	2014	366000
788	65	Boston	Massachusetts	2	2014	339000
789	65	Boston	Massachusetts	3	2014	360000
790	65	Boston	Massachusetts	4	2014	365000
791	65	Boston	Massachusetts	5	2014	385000
792	65	Boston	Massachusetts	6	2014	411000
793	65	Boston	Massachusetts	7	2014	405000
794	65	Boston	Massachusetts	8	2014	399567
795	65	Boston	Massachusetts	9	2014	377250
796	65	Boston	Massachusetts	10	2014	370000
797	65	Boston	Massachusetts	11	2014	380000
798	65	Boston	Massachusetts	12	2014	387750
799	65	Boston	Massachusetts	1	2015	385000
800	65	Boston	Massachusetts	2	2015	370000
801	65	Boston	Massachusetts	3	2015	372000
802	65	Boston	Massachusetts	4	2015	385000
803	65	Boston	Massachusetts	5	2015	405000
804	65	Boston	Massachusetts	6	2015	425000
805	65	Boston	Massachusetts	7	2015	425000
806	65	Boston	Massachusetts	8	2015	420250
807	65	Boston	Massachusetts	9	2015	395000
808	65	Boston	Massachusetts	10	2015	390000
809	65	Boston	Massachusetts	11	2015	400000
810	65	Boston	Massachusetts	12	2015	400000
811	65	Boston	Massachusetts	1	2016	395000
812	65	Boston	Massachusetts	2	2016	376000
813	65	Boston	Massachusetts	3	2016	390000
814	65	Boston	Massachusetts	4	2016	415000
815	65	Boston	Massachusetts	5	2016	425950
816	65	Boston	Massachusetts	6	2016	447000
817	65	Boston	Massachusetts	7	2016	449000
818	65	Boston	Massachusetts	8	2016	438000
819	65	Boston	Massachusetts	9	2016	419900
820	65	Boston	Massachusetts	10	2016	415000
821	65	Boston	Massachusetts	11	2016	425420
822	65	Boston	Massachusetts	12	2016	419900
823	65	Boston	Massachusetts	1	2017	424500
824	65	Boston	Massachusetts	2	2017	403000
825	65	Boston	Massachusetts	3	2017	434000
826	65	Boston	Massachusetts	4	2017	447500
827	65	Boston	Massachusetts	5	2017	455000
828	65	Boston	Massachusetts	6	2017	475500
829	65	Boston	Massachusetts	7	2017	475000
830	65	Boston	Massachusetts	8	2017	465000
831	65	Boston	Massachusetts	9	2017	449000
832	65	Boston	Massachusetts	10	2017	447000
833	65	Boston	Massachusetts	11	2017	450000
834	65	Boston	Massachusetts	12	2017	455000
835	65	Boston	Massachusetts	1	2018	450000
836	65	Boston	Massachusetts	2	2018	437200
837	65	Boston	Massachusetts	3	2018	461450
838	65	Boston	Massachusetts	4	2018	480000
839	65	Boston	Massachusetts	5	2018	495000
840	65	Boston	Massachusetts	6	2018	515000
841	65	Boston	Massachusetts	7	2018	515000
842	65	Boston	Massachusetts	8	2018	500000
843	65	Boston	Massachusetts	9	2018	465000
844	65	Boston	Massachusetts	10	2018	465500
845	65	Boston	Massachusetts	11	2018	470000
846	65	Boston	Massachusetts	12	2018	450500
847	65	Boston	Massachusetts	1	2019	0
848	9	Los Angeles	California	1	2009	300000
849	9	Los Angeles	California	2	2009	295000
850	9	Los Angeles	California	3	2009	298000
851	9	Los Angeles	California	4	2009	295000
852	9	Los Angeles	California	5	2009	299250
853	9	Los Angeles	California	6	2009	315000
854	9	Los Angeles	California	7	2009	320000
855	9	Los Angeles	California	8	2009	325000
856	9	Los Angeles	California	9	2009	330000
857	9	Los Angeles	California	10	2009	325000
858	9	Los Angeles	California	11	2009	325000
859	9	Los Angeles	California	12	2009	339000
860	9	Los Angeles	California	1	2010	320000
861	9	Los Angeles	California	2	2010	315000
862	9	Los Angeles	California	3	2010	326000
863	9	Los Angeles	California	4	2010	330000
864	9	Los Angeles	California	5	2010	348750
865	9	Los Angeles	California	6	2010	335000
866	9	Los Angeles	California	7	2010	339000
867	9	Los Angeles	California	8	2010	335000
868	9	Los Angeles	California	9	2010	340000
869	9	Los Angeles	California	10	2010	323000
870	9	Los Angeles	California	11	2010	325000
871	9	Los Angeles	California	12	2010	330000
872	9	Los Angeles	California	1	2011	300250
873	9	Los Angeles	California	2	2011	312500
874	9	Los Angeles	California	3	2011	320000
875	9	Los Angeles	California	4	2011	321378
876	9	Los Angeles	California	5	2011	316000
877	9	Los Angeles	California	6	2011	320000
878	9	Los Angeles	California	7	2011	323000
879	9	Los Angeles	California	8	2011	315000
880	9	Los Angeles	California	9	2011	315000
881	9	Los Angeles	California	10	2011	300000
882	9	Los Angeles	California	11	2011	310000
883	9	Los Angeles	California	12	2011	305000
884	9	Los Angeles	California	1	2012	290000
885	9	Los Angeles	California	2	2012	300000
886	9	Los Angeles	California	3	2012	309000
887	9	Los Angeles	California	4	2012	315000
888	9	Los Angeles	California	5	2012	318000
889	9	Los Angeles	California	6	2012	328000
890	9	Los Angeles	California	7	2012	335000
891	9	Los Angeles	California	8	2012	335000
892	9	Los Angeles	California	9	2012	347000
893	9	Los Angeles	California	10	2012	345000
894	9	Los Angeles	California	11	2012	350000
895	9	Los Angeles	California	12	2012	353000
896	9	Los Angeles	California	1	2013	345000
897	9	Los Angeles	California	2	2013	353000
898	9	Los Angeles	California	3	2013	387000
899	9	Los Angeles	California	4	2013	400000
900	9	Los Angeles	California	5	2013	415000
901	9	Los Angeles	California	6	2013	433000
902	9	Los Angeles	California	7	2013	430000
903	9	Los Angeles	California	8	2013	440000
904	9	Los Angeles	California	9	2013	435000
905	9	Los Angeles	California	10	2013	434000
906	9	Los Angeles	California	11	2013	430000
907	9	Los Angeles	California	12	2013	437000
908	9	Los Angeles	California	1	2014	423000
909	9	Los Angeles	California	2	2014	435000
910	9	Los Angeles	California	3	2014	450000
911	9	Los Angeles	California	4	2014	455000
912	9	Los Angeles	California	5	2014	465000
913	9	Los Angeles	California	6	2014	465000
914	9	Los Angeles	California	7	2014	470000
915	9	Los Angeles	California	8	2014	475000
916	9	Los Angeles	California	9	2014	470000
917	9	Los Angeles	California	10	2014	472250
918	9	Los Angeles	California	11	2014	465000
919	9	Los Angeles	California	12	2014	465000
920	9	Los Angeles	California	1	2015	460000
921	9	Los Angeles	California	2	2015	470000
922	9	Los Angeles	California	3	2015	478750
923	9	Los Angeles	California	4	2015	490000
924	9	Los Angeles	California	5	2015	491500
925	9	Los Angeles	California	6	2015	504000
926	9	Los Angeles	California	7	2015	504000
927	9	Los Angeles	California	8	2015	510000
928	9	Los Angeles	California	9	2015	499000
929	9	Los Angeles	California	10	2015	495000
930	9	Los Angeles	California	11	2015	500000
931	9	Los Angeles	California	12	2015	508000
932	9	Los Angeles	California	1	2016	500000
933	9	Los Angeles	California	2	2016	501500
934	9	Los Angeles	California	3	2016	518091
935	9	Los Angeles	California	4	2016	530000
936	9	Los Angeles	California	5	2016	540000
937	9	Los Angeles	California	6	2016	545000
938	9	Los Angeles	California	7	2016	540750
939	9	Los Angeles	California	8	2016	545000
940	9	Los Angeles	California	9	2016	535000
941	9	Los Angeles	California	10	2016	540000
942	9	Los Angeles	California	11	2016	540500
943	9	Los Angeles	California	12	2016	535000
944	9	Los Angeles	California	1	2017	540000
945	9	Los Angeles	California	2	2017	540000
946	9	Los Angeles	California	3	2017	555000
947	9	Los Angeles	California	4	2017	560000
948	9	Los Angeles	California	5	2017	578000
949	9	Los Angeles	California	6	2017	587000
950	9	Los Angeles	California	7	2017	590000
951	9	Los Angeles	California	8	2017	590000
952	9	Los Angeles	California	9	2017	590000
953	9	Los Angeles	California	10	2017	575000
954	9	Los Angeles	California	11	2017	589000
955	9	Los Angeles	California	12	2017	585000
956	9	Los Angeles	California	1	2018	575000
957	9	Los Angeles	California	2	2018	595000
958	9	Los Angeles	California	3	2018	600000
959	9	Los Angeles	California	4	2018	610000
960	9	Los Angeles	California	5	2018	630000
961	9	Los Angeles	California	6	2018	635000
962	9	Los Angeles	California	7	2018	625000
963	9	Los Angeles	California	8	2018	627000
964	9	Los Angeles	California	9	2018	615000
965	9	Los Angeles	California	10	2018	615000
966	9	Los Angeles	California	11	2018	620000
967	9	Los Angeles	California	12	2018	599000
968	9	Los Angeles	California	1	2019	0
969	127	Seattle	Washington	1	2009	338725
970	127	Seattle	Washington	2	2009	325000
971	127	Seattle	Washington	3	2009	329995
972	127	Seattle	Washington	4	2009	326950
973	127	Seattle	Washington	5	2009	333000
974	127	Seattle	Washington	6	2009	340000
975	127	Seattle	Washington	7	2009	330000
976	127	Seattle	Washington	8	2009	325000
977	127	Seattle	Washington	9	2009	326000
978	127	Seattle	Washington	10	2009	320000
979	127	Seattle	Washington	11	2009	310000
980	127	Seattle	Washington	12	2009	325000
981	127	Seattle	Washington	1	2010	316695
982	127	Seattle	Washington	2	2010	315561
983	127	Seattle	Washington	3	2010	317438
984	127	Seattle	Washington	4	2010	315000
985	127	Seattle	Washington	5	2010	319900
986	127	Seattle	Washington	6	2010	319950
987	127	Seattle	Washington	7	2010	342750
988	127	Seattle	Washington	8	2010	325000
989	127	Seattle	Washington	9	2010	317400
990	127	Seattle	Washington	10	2010	315000
993	127	Seattle	Washington	1	2011	284782
994	127	Seattle	Washington	2	2011	290000
995	127	Seattle	Washington	3	2011	290000
996	127	Seattle	Washington	4	2011	289000
997	127	Seattle	Washington	5	2011	279500
998	127	Seattle	Washington	6	2011	287500
999	127	Seattle	Washington	7	2011	284950
1000	127	Seattle	Washington	8	2011	282500
1001	127	Seattle	Washington	9	2011	275000
1002	127	Seattle	Washington	10	2011	257250
1003	127	Seattle	Washington	11	2011	270000
1004	127	Seattle	Washington	12	2011	265000
1005	127	Seattle	Washington	1	2012	251675
1006	127	Seattle	Washington	2	2012	260000
1007	127	Seattle	Washington	3	2012	274950
1008	127	Seattle	Washington	4	2012	289950
1009	127	Seattle	Washington	5	2012	299000
1010	127	Seattle	Washington	6	2012	310000
1011	127	Seattle	Washington	7	2012	308175
1012	127	Seattle	Washington	8	2012	312000
1013	127	Seattle	Washington	9	2012	314700
1014	127	Seattle	Washington	10	2012	308000
1015	127	Seattle	Washington	11	2012	319950
1016	127	Seattle	Washington	12	2012	310000
1017	127	Seattle	Washington	1	2013	290000
1018	127	Seattle	Washington	2	2013	310000
1019	127	Seattle	Washington	3	2013	324950
1020	127	Seattle	Washington	4	2013	329000
1021	127	Seattle	Washington	5	2013	349000
1022	127	Seattle	Washington	6	2013	349990
1023	127	Seattle	Washington	7	2013	362500
1024	127	Seattle	Washington	8	2013	355000
1025	127	Seattle	Washington	9	2013	352000
1026	127	Seattle	Washington	10	2013	350000
1027	127	Seattle	Washington	11	2013	345500
1028	127	Seattle	Washington	12	2013	349925
1029	127	Seattle	Washington	1	2014	329820
1030	127	Seattle	Washington	2	2014	347250
1031	127	Seattle	Washington	3	2014	345000
1032	127	Seattle	Washington	4	2014	355000
1033	127	Seattle	Washington	5	2014	365000
1034	127	Seattle	Washington	6	2014	385000
1035	127	Seattle	Washington	7	2014	379900
1036	127	Seattle	Washington	8	2014	371000
1037	127	Seattle	Washington	9	2014	379950
1038	127	Seattle	Washington	10	2014	370000
1039	127	Seattle	Washington	11	2014	372000
1040	127	Seattle	Washington	12	2014	369000
1041	127	Seattle	Washington	1	2015	360000
1042	127	Seattle	Washington	2	2015	360000
1043	127	Seattle	Washington	3	2015	385000
1044	127	Seattle	Washington	4	2015	400000
1045	127	Seattle	Washington	5	2015	398000
1046	127	Seattle	Washington	6	2015	415000
1047	127	Seattle	Washington	7	2015	410000
1048	127	Seattle	Washington	8	2015	414000
1049	127	Seattle	Washington	9	2015	399950
1050	127	Seattle	Washington	10	2015	405000
1051	127	Seattle	Washington	11	2015	404395
1052	127	Seattle	Washington	12	2015	401000
1053	127	Seattle	Washington	1	2016	406840
1054	127	Seattle	Washington	2	2016	403850
1055	127	Seattle	Washington	3	2016	425000
1056	127	Seattle	Washington	4	2016	430000
1057	127	Seattle	Washington	5	2016	440000
1058	127	Seattle	Washington	6	2016	465000
1059	127	Seattle	Washington	7	2016	450000
1060	127	Seattle	Washington	8	2016	450000
1061	127	Seattle	Washington	9	2016	449950
1062	127	Seattle	Washington	10	2016	442285
1063	127	Seattle	Washington	11	2016	455000
1064	127	Seattle	Washington	12	2016	460175
1065	127	Seattle	Washington	1	2017	443000
1066	127	Seattle	Washington	2	2017	459950
1067	127	Seattle	Washington	3	2017	484925
1068	127	Seattle	Washington	4	2017	505000
1069	127	Seattle	Washington	5	2017	510000
1070	127	Seattle	Washington	6	2017	525000
1071	127	Seattle	Washington	7	2017	529169
1072	127	Seattle	Washington	8	2017	520000
1073	127	Seattle	Washington	9	2017	510000
1074	127	Seattle	Washington	10	2017	511667
1075	127	Seattle	Washington	11	2017	525000
1076	127	Seattle	Washington	12	2017	529863
1077	127	Seattle	Washington	1	2018	515000
1078	127	Seattle	Washington	2	2018	530000
1079	127	Seattle	Washington	3	2018	559950
1080	127	Seattle	Washington	4	2018	579950
1081	127	Seattle	Washington	5	2018	586000
1082	127	Seattle	Washington	6	2018	582016
1083	127	Seattle	Washington	7	2018	575000
1084	127	Seattle	Washington	8	2018	550000
1085	127	Seattle	Washington	9	2018	545000
1086	127	Seattle	Washington	10	2018	550000
1087	127	Seattle	Washington	11	2018	545000
1088	127	Seattle	Washington	12	2018	538000
1089	127	Seattle	Washington	1	2019	0
1090	133	Anchorage	Alaska	1	2009	0
1091	133	Anchorage	Alaska	2	2009	301500
1092	133	Anchorage	Alaska	3	2009	302500
1093	133	Anchorage	Alaska	4	2009	303600
1094	133	Anchorage	Alaska	5	2009	304500
1095	133	Anchorage	Alaska	6	2009	305300
1096	133	Anchorage	Alaska	7	2009	305700
1097	133	Anchorage	Alaska	8	2009	306000
1098	133	Anchorage	Alaska	9	2009	306200
1099	133	Anchorage	Alaska	10	2009	306300
1100	133	Anchorage	Alaska	11	2009	306400
1101	133	Anchorage	Alaska	12	2009	306300
1102	133	Anchorage	Alaska	1	2010	306300
1103	133	Anchorage	Alaska	2	2010	306300
1104	133	Anchorage	Alaska	3	2010	306200
1105	133	Anchorage	Alaska	4	2010	306000
1106	133	Anchorage	Alaska	5	2010	306200
1107	133	Anchorage	Alaska	6	2010	306900
1108	133	Anchorage	Alaska	7	2010	307500
1109	133	Anchorage	Alaska	8	2010	307200
1110	133	Anchorage	Alaska	9	2010	306700
1111	133	Anchorage	Alaska	10	2010	306500
1112	133	Anchorage	Alaska	11	2010	306400
1113	133	Anchorage	Alaska	12	2010	306400
1114	133	Anchorage	Alaska	1	2011	306700
1115	133	Anchorage	Alaska	2	2011	306900
1116	133	Anchorage	Alaska	3	2011	306900
1117	133	Anchorage	Alaska	4	2011	306800
1118	133	Anchorage	Alaska	5	2011	306800
1119	133	Anchorage	Alaska	6	2011	306800
1120	133	Anchorage	Alaska	7	2011	306400
1121	133	Anchorage	Alaska	8	2011	306200
1122	133	Anchorage	Alaska	9	2011	306500
1123	133	Anchorage	Alaska	10	2011	306900
1124	133	Anchorage	Alaska	11	2011	306800
1125	133	Anchorage	Alaska	12	2011	306900
1126	133	Anchorage	Alaska	1	2012	306600
1127	133	Anchorage	Alaska	2	2012	306100
1128	133	Anchorage	Alaska	3	2012	305700
1129	133	Anchorage	Alaska	4	2012	305300
1130	133	Anchorage	Alaska	5	2012	305200
1131	133	Anchorage	Alaska	6	2012	305700
1132	133	Anchorage	Alaska	7	2012	306700
1133	133	Anchorage	Alaska	8	2012	308100
1134	133	Anchorage	Alaska	9	2012	309100
1135	133	Anchorage	Alaska	10	2012	310000
1136	133	Anchorage	Alaska	11	2012	311200
1137	133	Anchorage	Alaska	12	2012	312400
1138	133	Anchorage	Alaska	1	2013	313500
1139	133	Anchorage	Alaska	2	2013	314700
1140	133	Anchorage	Alaska	3	2013	315800
1141	133	Anchorage	Alaska	4	2013	317300
1142	133	Anchorage	Alaska	5	2013	318600
1143	133	Anchorage	Alaska	6	2013	319400
1144	133	Anchorage	Alaska	7	2013	319800
1145	133	Anchorage	Alaska	8	2013	320200
1146	133	Anchorage	Alaska	9	2013	320600
1147	133	Anchorage	Alaska	10	2013	321200
1148	133	Anchorage	Alaska	11	2013	321700
1149	133	Anchorage	Alaska	12	2013	322200
1150	133	Anchorage	Alaska	1	2014	323000
1151	133	Anchorage	Alaska	2	2014	324200
1152	133	Anchorage	Alaska	3	2014	325700
1153	133	Anchorage	Alaska	4	2014	326300
1154	133	Anchorage	Alaska	5	2014	325400
1155	133	Anchorage	Alaska	6	2014	324400
1156	133	Anchorage	Alaska	7	2014	324300
1157	133	Anchorage	Alaska	8	2014	324900
1158	133	Anchorage	Alaska	9	2014	325600
1159	133	Anchorage	Alaska	10	2014	326400
1160	133	Anchorage	Alaska	11	2014	326800
1161	133	Anchorage	Alaska	12	2014	327600
1162	133	Anchorage	Alaska	1	2015	328900
1163	133	Anchorage	Alaska	2	2015	329900
1164	133	Anchorage	Alaska	3	2015	330700
1165	133	Anchorage	Alaska	4	2015	331700
1166	133	Anchorage	Alaska	5	2015	333000
1167	133	Anchorage	Alaska	6	2015	333900
1168	133	Anchorage	Alaska	7	2015	334600
1169	133	Anchorage	Alaska	8	2015	335300
1170	133	Anchorage	Alaska	9	2015	336400
1171	133	Anchorage	Alaska	10	2015	337000
1172	133	Anchorage	Alaska	11	2015	337200
1173	133	Anchorage	Alaska	12	2015	337500
1174	133	Anchorage	Alaska	1	2016	338200
1175	133	Anchorage	Alaska	2	2016	338800
1176	133	Anchorage	Alaska	3	2016	339000
1177	133	Anchorage	Alaska	4	2016	339300
1178	133	Anchorage	Alaska	5	2016	339900
1179	133	Anchorage	Alaska	6	2016	340700
1180	133	Anchorage	Alaska	7	2016	341300
1181	133	Anchorage	Alaska	8	2016	341300
1182	133	Anchorage	Alaska	9	2016	340700
1183	133	Anchorage	Alaska	10	2016	339600
1184	133	Anchorage	Alaska	11	2016	338500
1185	133	Anchorage	Alaska	12	2016	338200
1186	133	Anchorage	Alaska	1	2017	338300
1187	133	Anchorage	Alaska	2	2017	338200
1188	133	Anchorage	Alaska	3	2017	337900
1189	133	Anchorage	Alaska	4	2017	337800
1190	133	Anchorage	Alaska	5	2017	337500
1191	133	Anchorage	Alaska	6	2017	337100
1192	133	Anchorage	Alaska	7	2017	336700
1193	133	Anchorage	Alaska	8	2017	336300
1194	133	Anchorage	Alaska	9	2017	336300
1195	133	Anchorage	Alaska	10	2017	337100
1196	133	Anchorage	Alaska	11	2017	337800
1197	133	Anchorage	Alaska	12	2017	338700
1198	133	Anchorage	Alaska	1	2018	339300
1199	133	Anchorage	Alaska	2	2018	338700
1200	133	Anchorage	Alaska	3	2018	337300
1201	133	Anchorage	Alaska	4	2018	336700
1202	133	Anchorage	Alaska	5	2018	337400
1203	133	Anchorage	Alaska	6	2018	339100
1204	133	Anchorage	Alaska	7	2018	340100
1205	133	Anchorage	Alaska	8	2018	340500
1206	133	Anchorage	Alaska	9	2018	339700
1207	133	Anchorage	Alaska	10	2018	338700
1208	133	Anchorage	Alaska	11	2018	339200
1209	133	Anchorage	Alaska	12	2018	337600
1210	133	Anchorage	Alaska	1	2019	333500
1211	19	Boulder	Colorado	1	2009	278750
1212	19	Boulder	Colorado	2	2009	260000
1213	19	Boulder	Colorado	3	2009	265000
1214	19	Boulder	Colorado	4	2009	260000
1215	19	Boulder	Colorado	5	2009	279000
1216	19	Boulder	Colorado	6	2009	275000
1217	19	Boulder	Colorado	7	2009	278000
1218	19	Boulder	Colorado	8	2009	289250
1219	19	Boulder	Colorado	9	2009	265500
1220	19	Boulder	Colorado	10	2009	277000
1221	19	Boulder	Colorado	11	2009	275000
1222	19	Boulder	Colorado	12	2009	285000
1223	19	Boulder	Colorado	1	2010	287200
1224	19	Boulder	Colorado	2	2010	273500
1225	19	Boulder	Colorado	3	2010	292735
1226	19	Boulder	Colorado	4	2010	285000
1227	19	Boulder	Colorado	5	2010	289700
1228	19	Boulder	Colorado	6	2010	320000
1229	19	Boulder	Colorado	7	2010	316050
1230	19	Boulder	Colorado	8	2010	326000
1231	19	Boulder	Colorado	9	2010	305000
1232	19	Boulder	Colorado	10	2010	333450
1233	19	Boulder	Colorado	11	2010	297000
1234	19	Boulder	Colorado	12	2010	320000
1235	19	Boulder	Colorado	1	2011	269500
1236	19	Boulder	Colorado	2	2011	281750
1237	19	Boulder	Colorado	3	2011	292400
1238	19	Boulder	Colorado	4	2011	299000
1239	19	Boulder	Colorado	5	2011	313500
1240	19	Boulder	Colorado	6	2011	315000
1241	19	Boulder	Colorado	7	2011	305000
1242	19	Boulder	Colorado	8	2011	292000
1243	19	Boulder	Colorado	9	2011	285000
1244	19	Boulder	Colorado	10	2011	306500
1245	19	Boulder	Colorado	11	2011	294272
1246	19	Boulder	Colorado	12	2011	306625
1247	19	Boulder	Colorado	1	2012	295000
1248	19	Boulder	Colorado	2	2012	282500
1249	19	Boulder	Colorado	3	2012	323250
1250	19	Boulder	Colorado	4	2012	303000
1251	19	Boulder	Colorado	5	2012	343377
1252	19	Boulder	Colorado	6	2012	330000
1253	19	Boulder	Colorado	7	2012	311500
1254	19	Boulder	Colorado	8	2012	322000
1255	19	Boulder	Colorado	9	2012	305000
1256	19	Boulder	Colorado	10	2012	308000
1257	19	Boulder	Colorado	11	2012	310034
1258	19	Boulder	Colorado	12	2012	325000
1259	19	Boulder	Colorado	1	2013	313750
1260	19	Boulder	Colorado	2	2013	326500
1261	19	Boulder	Colorado	3	2013	335000
1262	19	Boulder	Colorado	4	2013	340000
1263	19	Boulder	Colorado	5	2013	365000
1264	19	Boulder	Colorado	6	2013	351000
1265	19	Boulder	Colorado	7	2013	330000
1266	19	Boulder	Colorado	8	2013	334450
1267	19	Boulder	Colorado	9	2013	325000
1268	19	Boulder	Colorado	10	2013	333300
1269	19	Boulder	Colorado	11	2013	325000
1270	19	Boulder	Colorado	12	2013	352500
1271	19	Boulder	Colorado	1	2014	340000
1272	19	Boulder	Colorado	2	2014	339000
1273	19	Boulder	Colorado	3	2014	350000
1274	19	Boulder	Colorado	4	2014	355475
1275	19	Boulder	Colorado	5	2014	348950
1276	19	Boulder	Colorado	6	2014	361500
1277	19	Boulder	Colorado	7	2014	375050
1278	19	Boulder	Colorado	8	2014	355000
1279	19	Boulder	Colorado	9	2014	340000
1280	19	Boulder	Colorado	10	2014	345500
1281	19	Boulder	Colorado	11	2014	342750
1282	19	Boulder	Colorado	12	2014	359500
1283	19	Boulder	Colorado	1	2015	360000
1284	19	Boulder	Colorado	2	2015	340000
1285	19	Boulder	Colorado	3	2015	419500
1286	19	Boulder	Colorado	4	2015	379944
1287	19	Boulder	Colorado	5	2015	419500
1288	19	Boulder	Colorado	6	2015	385500
1289	19	Boulder	Colorado	7	2015	409000
1290	19	Boulder	Colorado	8	2015	384750
1291	19	Boulder	Colorado	9	2015	377500
1292	19	Boulder	Colorado	10	2015	405000
1293	19	Boulder	Colorado	11	2015	390000
1294	19	Boulder	Colorado	12	2015	412500
1295	19	Boulder	Colorado	1	2016	408500
1296	19	Boulder	Colorado	2	2016	409495
1297	19	Boulder	Colorado	3	2016	459950
1298	19	Boulder	Colorado	4	2016	460000
1299	19	Boulder	Colorado	5	2016	464000
1300	19	Boulder	Colorado	6	2016	475000
1301	19	Boulder	Colorado	7	2016	461664
1302	19	Boulder	Colorado	8	2016	432500
1303	19	Boulder	Colorado	9	2016	435000
1304	19	Boulder	Colorado	10	2016	440000
1305	19	Boulder	Colorado	11	2016	447800
1306	19	Boulder	Colorado	12	2016	420000
1307	19	Boulder	Colorado	1	2017	475500
1308	19	Boulder	Colorado	2	2017	450000
1309	19	Boulder	Colorado	3	2017	450000
1310	19	Boulder	Colorado	4	2017	485059
1311	19	Boulder	Colorado	5	2017	512900
1312	19	Boulder	Colorado	6	2017	509000
1313	19	Boulder	Colorado	7	2017	480000
1314	19	Boulder	Colorado	8	2017	480000
1315	19	Boulder	Colorado	9	2017	472000
1316	19	Boulder	Colorado	10	2017	497750
1317	19	Boulder	Colorado	11	2017	440000
1318	19	Boulder	Colorado	12	2017	492900
1319	19	Boulder	Colorado	1	2018	491038
1320	19	Boulder	Colorado	2	2018	499950
1321	19	Boulder	Colorado	3	2018	530450
1322	19	Boulder	Colorado	4	2018	525000
1323	19	Boulder	Colorado	5	2018	531450
1324	19	Boulder	Colorado	6	2018	535550
1325	19	Boulder	Colorado	7	2018	531500
1326	19	Boulder	Colorado	8	2018	495000
1327	19	Boulder	Colorado	9	2018	515000
1328	19	Boulder	Colorado	10	2018	515000
1329	19	Boulder	Colorado	11	2018	493750
1330	19	Boulder	Colorado	12	2018	539500
1331	19	Boulder	Colorado	1	2019	0
1332	89	Santa Fe	New Mexico	1	2009	349900
1333	89	Santa Fe	New Mexico	2	2009	370000
1334	89	Santa Fe	New Mexico	3	2009	389000
1335	89	Santa Fe	New Mexico	4	2009	349900
1336	89	Santa Fe	New Mexico	5	2009	379000
1337	89	Santa Fe	New Mexico	6	2009	425000
1338	89	Santa Fe	New Mexico	7	2009	347000
1339	89	Santa Fe	New Mexico	8	2009	279000
1340	89	Santa Fe	New Mexico	9	2009	375000
1341	89	Santa Fe	New Mexico	10	2009	349700
1342	89	Santa Fe	New Mexico	11	2009	319000
1343	89	Santa Fe	New Mexico	12	2009	359000
1344	89	Santa Fe	New Mexico	1	2010	350000
1345	89	Santa Fe	New Mexico	2	2010	379900
1346	89	Santa Fe	New Mexico	3	2010	332500
1347	89	Santa Fe	New Mexico	4	2010	303950
1348	89	Santa Fe	New Mexico	5	2010	359500
1349	89	Santa Fe	New Mexico	6	2010	375000
1350	89	Santa Fe	New Mexico	7	2010	349000
1351	89	Santa Fe	New Mexico	8	2010	349850
1352	89	Santa Fe	New Mexico	9	2010	390000
1353	89	Santa Fe	New Mexico	10	2010	341750
1354	89	Santa Fe	New Mexico	11	2010	350000
1355	89	Santa Fe	New Mexico	12	2010	340000
1356	89	Santa Fe	New Mexico	1	2011	392000
1357	89	Santa Fe	New Mexico	2	2011	335000
1358	89	Santa Fe	New Mexico	3	2011	348500
1359	89	Santa Fe	New Mexico	4	2011	375450
1360	89	Santa Fe	New Mexico	5	2011	349500
1361	89	Santa Fe	New Mexico	6	2011	337000
1362	89	Santa Fe	New Mexico	7	2011	335000
1363	89	Santa Fe	New Mexico	8	2011	339000
1364	89	Santa Fe	New Mexico	9	2011	299450
1365	89	Santa Fe	New Mexico	10	2011	325000
1366	89	Santa Fe	New Mexico	11	2011	345000
1367	89	Santa Fe	New Mexico	12	2011	350000
1368	89	Santa Fe	New Mexico	1	2012	344500
1369	89	Santa Fe	New Mexico	2	2012	300000
1370	89	Santa Fe	New Mexico	3	2012	349000
1371	89	Santa Fe	New Mexico	4	2012	325000
1372	89	Santa Fe	New Mexico	5	2012	325000
1373	89	Santa Fe	New Mexico	6	2012	339000
1374	89	Santa Fe	New Mexico	7	2012	317000
1375	89	Santa Fe	New Mexico	8	2012	329500
1376	89	Santa Fe	New Mexico	9	2012	297226
1377	89	Santa Fe	New Mexico	10	2012	349950
1378	89	Santa Fe	New Mexico	11	2012	350000
1379	89	Santa Fe	New Mexico	12	2012	350609
1380	89	Santa Fe	New Mexico	1	2013	304500
1381	89	Santa Fe	New Mexico	2	2013	302703
1382	89	Santa Fe	New Mexico	3	2013	299000
1383	89	Santa Fe	New Mexico	4	2013	325000
1384	89	Santa Fe	New Mexico	5	2013	310750
1385	89	Santa Fe	New Mexico	6	2013	329000
1386	89	Santa Fe	New Mexico	7	2013	390450
1387	89	Santa Fe	New Mexico	8	2013	319000
1388	89	Santa Fe	New Mexico	9	2013	369500
1389	89	Santa Fe	New Mexico	10	2013	349500
1390	89	Santa Fe	New Mexico	11	2013	350000
1391	89	Santa Fe	New Mexico	12	2013	292250
1392	89	Santa Fe	New Mexico	1	2014	318000
1393	89	Santa Fe	New Mexico	2	2014	340500
1394	89	Santa Fe	New Mexico	3	2014	309000
1395	89	Santa Fe	New Mexico	4	2014	319500
1396	89	Santa Fe	New Mexico	5	2014	298450
1397	89	Santa Fe	New Mexico	6	2014	310000
1398	89	Santa Fe	New Mexico	7	2014	350000
1399	89	Santa Fe	New Mexico	8	2014	335000
1400	89	Santa Fe	New Mexico	9	2014	349000
1401	89	Santa Fe	New Mexico	10	2014	358350
1402	89	Santa Fe	New Mexico	11	2014	332000
1403	89	Santa Fe	New Mexico	12	2014	339450
1404	89	Santa Fe	New Mexico	1	2015	315000
1405	89	Santa Fe	New Mexico	2	2015	289000
1406	89	Santa Fe	New Mexico	3	2015	327000
1407	89	Santa Fe	New Mexico	4	2015	299500
1408	89	Santa Fe	New Mexico	5	2015	354500
1409	89	Santa Fe	New Mexico	6	2015	346500
1410	89	Santa Fe	New Mexico	7	2015	349900
1411	89	Santa Fe	New Mexico	8	2015	333950
1412	89	Santa Fe	New Mexico	9	2015	342500
1413	89	Santa Fe	New Mexico	10	2015	339000
1414	89	Santa Fe	New Mexico	11	2015	307500
1415	89	Santa Fe	New Mexico	12	2015	364000
1416	89	Santa Fe	New Mexico	1	2016	334000
1417	89	Santa Fe	New Mexico	2	2016	330000
1418	89	Santa Fe	New Mexico	3	2016	352500
1419	89	Santa Fe	New Mexico	4	2016	325000
1420	89	Santa Fe	New Mexico	5	2016	385000
1421	89	Santa Fe	New Mexico	6	2016	348000
1422	89	Santa Fe	New Mexico	7	2016	344950
1423	89	Santa Fe	New Mexico	8	2016	369000
1424	89	Santa Fe	New Mexico	9	2016	345900
1425	89	Santa Fe	New Mexico	10	2016	349500
1426	89	Santa Fe	New Mexico	11	2016	335000
1427	89	Santa Fe	New Mexico	12	2016	329000
1428	89	Santa Fe	New Mexico	1	2017	365000
1429	89	Santa Fe	New Mexico	2	2017	333500
1430	89	Santa Fe	New Mexico	3	2017	329000
1431	89	Santa Fe	New Mexico	4	2017	369900
1432	89	Santa Fe	New Mexico	5	2017	382000
1433	89	Santa Fe	New Mexico	6	2017	359000
1434	89	Santa Fe	New Mexico	7	2017	354000
1435	89	Santa Fe	New Mexico	8	2017	375000
1436	89	Santa Fe	New Mexico	9	2017	369000
1437	89	Santa Fe	New Mexico	10	2017	345000
1438	89	Santa Fe	New Mexico	11	2017	399000
1439	89	Santa Fe	New Mexico	12	2017	329000
1440	89	Santa Fe	New Mexico	1	2018	348500
1441	89	Santa Fe	New Mexico	2	2018	392000
1442	89	Santa Fe	New Mexico	3	2018	365000
1443	89	Santa Fe	New Mexico	4	2018	370000
1444	89	Santa Fe	New Mexico	5	2018	385000
1445	89	Santa Fe	New Mexico	6	2018	409900
1446	89	Santa Fe	New Mexico	7	2018	365000
1447	89	Santa Fe	New Mexico	8	2018	399000
1448	89	Santa Fe	New Mexico	9	2018	395000
1449	89	Santa Fe	New Mexico	10	2018	449000
1450	89	Santa Fe	New Mexico	11	2018	427000
1451	89	Santa Fe	New Mexico	12	2018	430000
1452	89	Santa Fe	New Mexico	1	2019	0
1453	132	Juneau	Alaska	1	2009	0
1454	132	Juneau	Alaska	2	2009	256000
1455	132	Juneau	Alaska	3	2009	269900
1456	132	Juneau	Alaska	4	2009	269000
1457	132	Juneau	Alaska	5	2009	270900
1458	132	Juneau	Alaska	6	2009	273000
1459	132	Juneau	Alaska	7	2009	275000
1460	132	Juneau	Alaska	8	2009	269000
1461	132	Juneau	Alaska	9	2009	279000
1462	132	Juneau	Alaska	10	2009	270000
1463	132	Juneau	Alaska	11	2009	274000
1464	132	Juneau	Alaska	12	2009	279000
1465	132	Juneau	Alaska	1	2010	273000
1466	132	Juneau	Alaska	2	2010	275300
1467	132	Juneau	Alaska	3	2010	232000
1468	132	Juneau	Alaska	4	2010	269300
1469	132	Juneau	Alaska	5	2010	284000
1470	132	Juneau	Alaska	6	2010	299000
1471	132	Juneau	Alaska	7	2010	290500
1472	132	Juneau	Alaska	8	2010	292500
1473	132	Juneau	Alaska	9	2010	285800
1474	132	Juneau	Alaska	10	2010	282500
1475	132	Juneau	Alaska	11	2010	289900
1476	132	Juneau	Alaska	12	2010	289900
1477	132	Juneau	Alaska	1	2011	289900
1478	132	Juneau	Alaska	2	2011	295000
1479	132	Juneau	Alaska	3	2011	322500
1480	132	Juneau	Alaska	4	2011	311900
1481	132	Juneau	Alaska	5	2011	319900
1482	132	Juneau	Alaska	6	2011	312000
1483	132	Juneau	Alaska	7	2011	319000
1484	132	Juneau	Alaska	8	2011	310000
1485	132	Juneau	Alaska	9	2011	306300
1486	132	Juneau	Alaska	10	2011	297000
1487	132	Juneau	Alaska	11	2011	285000
1488	132	Juneau	Alaska	12	2011	279900
1489	132	Juneau	Alaska	1	2012	279500
1490	132	Juneau	Alaska	2	2012	277500
1491	132	Juneau	Alaska	3	2012	287500
1492	132	Juneau	Alaska	4	2012	304500
1493	132	Juneau	Alaska	5	2012	310000
1494	132	Juneau	Alaska	6	2012	315000
1495	132	Juneau	Alaska	7	2012	340000
1496	132	Juneau	Alaska	8	2012	339500
1497	132	Juneau	Alaska	9	2012	340000
1498	132	Juneau	Alaska	10	2012	323500
1499	132	Juneau	Alaska	11	2012	324000
1500	132	Juneau	Alaska	12	2012	315000
1501	132	Juneau	Alaska	1	2013	323000
1502	132	Juneau	Alaska	2	2013	315000
1503	132	Juneau	Alaska	3	2013	322000
1504	132	Juneau	Alaska	4	2013	315000
1505	132	Juneau	Alaska	5	2013	310000
1506	132	Juneau	Alaska	6	2013	315000
1507	132	Juneau	Alaska	7	2013	320000
1508	132	Juneau	Alaska	8	2013	322500
1509	132	Juneau	Alaska	9	2013	295000
1510	132	Juneau	Alaska	10	2013	299000
1511	132	Juneau	Alaska	11	2013	302500
1512	132	Juneau	Alaska	12	2013	320000
1513	132	Juneau	Alaska	1	2014	310000
1514	132	Juneau	Alaska	2	2014	297000
1515	132	Juneau	Alaska	3	2014	299900
1516	132	Juneau	Alaska	4	2014	295000
1517	132	Juneau	Alaska	5	2014	344000
1518	132	Juneau	Alaska	6	2014	337000
1519	132	Juneau	Alaska	7	2014	349500
1520	132	Juneau	Alaska	8	2014	347500
1521	132	Juneau	Alaska	9	2014	330000
1522	132	Juneau	Alaska	10	2014	340000
1523	132	Juneau	Alaska	11	2014	328500
1524	132	Juneau	Alaska	12	2014	324900
1525	132	Juneau	Alaska	1	2015	325000
1526	132	Juneau	Alaska	2	2015	329500
1527	132	Juneau	Alaska	3	2015	327500
1528	132	Juneau	Alaska	4	2015	325000
1529	132	Juneau	Alaska	5	2015	329900
1530	132	Juneau	Alaska	6	2015	339000
1531	132	Juneau	Alaska	7	2015	330000
1532	132	Juneau	Alaska	8	2015	335000
1533	132	Juneau	Alaska	9	2015	325000
1534	132	Juneau	Alaska	10	2015	323000
1535	132	Juneau	Alaska	11	2015	322500
1536	132	Juneau	Alaska	12	2015	319300
1537	132	Juneau	Alaska	1	2016	315000
1538	132	Juneau	Alaska	2	2016	312500
1539	132	Juneau	Alaska	3	2016	317300
1540	132	Juneau	Alaska	4	2016	335000
1541	132	Juneau	Alaska	5	2016	349500
1542	132	Juneau	Alaska	6	2016	344500
1543	132	Juneau	Alaska	7	2016	365000
1544	132	Juneau	Alaska	8	2016	343200
1545	132	Juneau	Alaska	9	2016	359000
1546	132	Juneau	Alaska	10	2016	365000
1547	132	Juneau	Alaska	11	2016	359000
1548	132	Juneau	Alaska	12	2016	345000
1549	132	Juneau	Alaska	1	2017	340000
1550	132	Juneau	Alaska	2	2017	338000
1551	132	Juneau	Alaska	3	2017	330000
1552	132	Juneau	Alaska	4	2017	345000
1553	132	Juneau	Alaska	5	2017	339900
1554	132	Juneau	Alaska	6	2017	345000
1555	132	Juneau	Alaska	7	2017	339000
1556	132	Juneau	Alaska	8	2017	350000
1557	132	Juneau	Alaska	9	2017	341200
1558	132	Juneau	Alaska	10	2017	349900
1559	132	Juneau	Alaska	11	2017	350000
1560	132	Juneau	Alaska	12	2017	357000
1561	132	Juneau	Alaska	1	2018	359000
1562	132	Juneau	Alaska	2	2018	369000
1563	132	Juneau	Alaska	3	2018	0
1564	132	Juneau	Alaska	4	2018	0
1565	132	Juneau	Alaska	5	2018	0
1566	132	Juneau	Alaska	6	2018	0
1567	132	Juneau	Alaska	7	2018	0
1568	132	Juneau	Alaska	8	2018	0
1569	132	Juneau	Alaska	9	2018	0
1570	132	Juneau	Alaska	10	2018	0
1571	132	Juneau	Alaska	11	2018	0
1572	132	Juneau	Alaska	12	2018	0
1573	132	Juneau	Alaska	1	2019	0
1574	63	Baltimore	Maryland	1	2009	225995
1575	63	Baltimore	Maryland	2	2009	227000
1576	63	Baltimore	Maryland	3	2009	240000
1577	63	Baltimore	Maryland	4	2009	232500
1578	63	Baltimore	Maryland	5	2009	235000
1579	63	Baltimore	Maryland	6	2009	249900
1580	63	Baltimore	Maryland	7	2009	249000
1581	63	Baltimore	Maryland	8	2009	257000
1582	63	Baltimore	Maryland	9	2009	244300
1583	63	Baltimore	Maryland	10	2009	238875
1584	63	Baltimore	Maryland	11	2009	230000
1585	63	Baltimore	Maryland	12	2009	232000
1586	63	Baltimore	Maryland	1	2010	229900
1587	63	Baltimore	Maryland	2	2010	220000
1588	63	Baltimore	Maryland	3	2010	222038
1589	63	Baltimore	Maryland	4	2010	225000
1590	63	Baltimore	Maryland	5	2010	230000
1591	63	Baltimore	Maryland	6	2010	241750
1592	63	Baltimore	Maryland	7	2010	240000
1593	63	Baltimore	Maryland	8	2010	250000
1594	63	Baltimore	Maryland	9	2010	239000
1595	63	Baltimore	Maryland	10	2010	238000
1596	63	Baltimore	Maryland	11	2010	230000
1597	63	Baltimore	Maryland	12	2010	223700
1598	63	Baltimore	Maryland	1	2011	217750
1599	63	Baltimore	Maryland	2	2011	204900
1600	63	Baltimore	Maryland	3	2011	200000
1601	63	Baltimore	Maryland	4	2011	209900
1602	63	Baltimore	Maryland	5	2011	215000
1603	63	Baltimore	Maryland	6	2011	225000
1604	63	Baltimore	Maryland	7	2011	235000
1605	63	Baltimore	Maryland	8	2011	229000
1606	63	Baltimore	Maryland	9	2011	230000
1607	63	Baltimore	Maryland	10	2011	218500
1608	63	Baltimore	Maryland	11	2011	220000
1609	63	Baltimore	Maryland	12	2011	225000
1610	63	Baltimore	Maryland	1	2012	217500
1611	63	Baltimore	Maryland	2	2012	205000
1612	63	Baltimore	Maryland	3	2012	210000
1613	63	Baltimore	Maryland	4	2012	224455
1614	63	Baltimore	Maryland	5	2012	235000
1615	63	Baltimore	Maryland	6	2012	245000
1616	63	Baltimore	Maryland	7	2012	245463
1617	63	Baltimore	Maryland	8	2012	240000
1618	63	Baltimore	Maryland	9	2012	240000
1619	63	Baltimore	Maryland	10	2012	237000
1620	63	Baltimore	Maryland	11	2012	233500
1621	63	Baltimore	Maryland	12	2012	225000
1622	63	Baltimore	Maryland	1	2013	225000
1623	63	Baltimore	Maryland	2	2013	213000
1624	63	Baltimore	Maryland	3	2013	225000
1625	63	Baltimore	Maryland	4	2013	232000
1626	63	Baltimore	Maryland	5	2013	243000
1627	63	Baltimore	Maryland	6	2013	252000
1628	63	Baltimore	Maryland	7	2013	270000
1629	63	Baltimore	Maryland	8	2013	255900
1630	63	Baltimore	Maryland	9	2013	248750
1631	63	Baltimore	Maryland	10	2013	245000
1632	63	Baltimore	Maryland	11	2013	245000
1633	63	Baltimore	Maryland	12	2013	234765
1634	63	Baltimore	Maryland	1	2014	230000
1635	63	Baltimore	Maryland	2	2014	211000
1636	63	Baltimore	Maryland	3	2014	231214
1637	63	Baltimore	Maryland	4	2014	230000
1638	63	Baltimore	Maryland	5	2014	246900
1639	63	Baltimore	Maryland	6	2014	260000
1640	63	Baltimore	Maryland	7	2014	265000
1641	63	Baltimore	Maryland	8	2014	255000
1642	63	Baltimore	Maryland	9	2014	235000
1643	63	Baltimore	Maryland	10	2014	244250
1644	63	Baltimore	Maryland	11	2014	240000
1645	63	Baltimore	Maryland	12	2014	230000
1646	63	Baltimore	Maryland	1	2015	225000
1647	63	Baltimore	Maryland	2	2015	218000
1648	63	Baltimore	Maryland	3	2015	223000
1649	63	Baltimore	Maryland	4	2015	230000
1650	63	Baltimore	Maryland	5	2015	250000
1651	63	Baltimore	Maryland	6	2015	250000
1652	63	Baltimore	Maryland	7	2015	255000
1653	63	Baltimore	Maryland	8	2015	265000
1654	63	Baltimore	Maryland	9	2015	250000
1655	63	Baltimore	Maryland	10	2015	235000
1656	63	Baltimore	Maryland	11	2015	235000
1657	63	Baltimore	Maryland	12	2015	240000
1658	63	Baltimore	Maryland	1	2016	227900
1659	63	Baltimore	Maryland	2	2016	223600
1660	63	Baltimore	Maryland	3	2016	230000
1661	63	Baltimore	Maryland	4	2016	244500
1662	63	Baltimore	Maryland	5	2016	250000
1663	63	Baltimore	Maryland	6	2016	270000
1664	63	Baltimore	Maryland	7	2016	275000
1665	63	Baltimore	Maryland	8	2016	260000
1666	63	Baltimore	Maryland	9	2016	257000
1667	63	Baltimore	Maryland	10	2016	259900
1668	63	Baltimore	Maryland	11	2016	250000
1669	63	Baltimore	Maryland	12	2016	251000
1670	63	Baltimore	Maryland	1	2017	239552
1671	63	Baltimore	Maryland	2	2017	232500
1672	63	Baltimore	Maryland	3	2017	240000
1673	63	Baltimore	Maryland	4	2017	250500
1674	63	Baltimore	Maryland	5	2017	270000
1675	63	Baltimore	Maryland	6	2017	275000
1676	63	Baltimore	Maryland	7	2017	279900
1677	63	Baltimore	Maryland	8	2017	270000
1678	63	Baltimore	Maryland	9	2017	265000
1679	63	Baltimore	Maryland	10	2017	257500
1680	63	Baltimore	Maryland	11	2017	259900
1681	63	Baltimore	Maryland	12	2017	260000
1682	63	Baltimore	Maryland	1	2018	239900
1683	63	Baltimore	Maryland	2	2018	243000
1684	63	Baltimore	Maryland	3	2018	257250
1685	63	Baltimore	Maryland	4	2018	263615
1686	63	Baltimore	Maryland	5	2018	269900
1687	63	Baltimore	Maryland	6	2018	285000
1688	63	Baltimore	Maryland	7	2018	290000
1689	63	Baltimore	Maryland	8	2018	277000
1690	63	Baltimore	Maryland	9	2018	270500
1691	63	Baltimore	Maryland	10	2018	262750
1692	63	Baltimore	Maryland	11	2018	267000
1693	63	Baltimore	Maryland	12	2018	255000
1694	63	Baltimore	Maryland	1	2019	0
1695	126	Olympia	Washington	1	2009	250000
1696	126	Olympia	Washington	2	2009	253349
1697	126	Olympia	Washington	3	2009	240000
1698	126	Olympia	Washington	4	2009	235000
1699	126	Olympia	Washington	5	2009	239950
1700	126	Olympia	Washington	6	2009	242250
1701	126	Olympia	Washington	7	2009	248500
1702	126	Olympia	Washington	8	2009	249950
1703	126	Olympia	Washington	9	2009	239975
1704	126	Olympia	Washington	10	2009	228000
1705	126	Olympia	Washington	11	2009	233747
1706	126	Olympia	Washington	12	2009	224500
1707	126	Olympia	Washington	1	2010	228250
1708	126	Olympia	Washington	2	2010	230000
1709	126	Olympia	Washington	3	2010	229000
1710	126	Olympia	Washington	4	2010	229000
1711	126	Olympia	Washington	5	2010	231570
1712	126	Olympia	Washington	6	2010	237500
1713	126	Olympia	Washington	7	2010	236450
1714	126	Olympia	Washington	8	2010	239000
1715	126	Olympia	Washington	9	2010	238516
1716	126	Olympia	Washington	10	2010	220000
1717	126	Olympia	Washington	11	2010	220141
1718	126	Olympia	Washington	12	2010	226000
1719	126	Olympia	Washington	1	2011	205000
1720	126	Olympia	Washington	2	2011	211495
1721	126	Olympia	Washington	3	2011	204950
1722	126	Olympia	Washington	4	2011	214995
1723	126	Olympia	Washington	5	2011	222000
1724	126	Olympia	Washington	6	2011	224990
1725	126	Olympia	Washington	7	2011	235000
1726	126	Olympia	Washington	8	2011	223017
1727	126	Olympia	Washington	9	2011	219900
1728	126	Olympia	Washington	10	2011	211400
1729	126	Olympia	Washington	11	2011	215500
1730	126	Olympia	Washington	12	2011	215000
1731	126	Olympia	Washington	1	2012	205907
1732	126	Olympia	Washington	2	2012	216495
1733	126	Olympia	Washington	3	2012	211000
1734	126	Olympia	Washington	4	2012	218244
1735	126	Olympia	Washington	5	2012	219475
1736	126	Olympia	Washington	6	2012	229995
1737	126	Olympia	Washington	7	2012	224500
1738	126	Olympia	Washington	8	2012	223500
1739	126	Olympia	Washington	9	2012	215700
1740	126	Olympia	Washington	10	2012	225350
1741	126	Olympia	Washington	11	2012	219000
1742	126	Olympia	Washington	12	2012	203000
1743	126	Olympia	Washington	1	2013	217998
1744	126	Olympia	Washington	2	2013	225500
1745	126	Olympia	Washington	3	2013	215000
1746	126	Olympia	Washington	4	2013	229925
1747	126	Olympia	Washington	5	2013	230000
1748	126	Olympia	Washington	6	2013	225000
1749	126	Olympia	Washington	7	2013	229000
1750	126	Olympia	Washington	8	2013	237250
1751	126	Olympia	Washington	9	2013	225000
1752	126	Olympia	Washington	10	2013	215000
1753	126	Olympia	Washington	11	2013	231250
1754	126	Olympia	Washington	12	2013	226475
1755	126	Olympia	Washington	1	2014	218750
1756	126	Olympia	Washington	2	2014	214975
1757	126	Olympia	Washington	3	2014	223700
1758	126	Olympia	Washington	4	2014	222450
1759	126	Olympia	Washington	5	2014	229900
1760	126	Olympia	Washington	6	2014	237950
1761	126	Olympia	Washington	7	2014	236053
1762	126	Olympia	Washington	8	2014	239925
1763	126	Olympia	Washington	9	2014	235000
1764	126	Olympia	Washington	10	2014	233475
1765	126	Olympia	Washington	11	2014	231000
1766	126	Olympia	Washington	12	2014	239492
1767	126	Olympia	Washington	1	2015	243895
1768	126	Olympia	Washington	2	2015	227100
1769	126	Olympia	Washington	3	2015	229000
1770	126	Olympia	Washington	4	2015	230000
1771	126	Olympia	Washington	5	2015	249950
1772	126	Olympia	Washington	6	2015	251700
1773	126	Olympia	Washington	7	2015	254000
1774	126	Olympia	Washington	8	2015	255000
1775	126	Olympia	Washington	9	2015	255000
1776	126	Olympia	Washington	10	2015	250000
1777	126	Olympia	Washington	11	2015	244900
1778	126	Olympia	Washington	12	2015	245000
1779	126	Olympia	Washington	1	2016	242000
1780	126	Olympia	Washington	2	2016	249750
1781	126	Olympia	Washington	3	2016	249825
1782	126	Olympia	Washington	4	2016	259900
1783	126	Olympia	Washington	5	2016	267500
1784	126	Olympia	Washington	6	2016	270000
1785	126	Olympia	Washington	7	2016	269503
1786	126	Olympia	Washington	8	2016	275975
1787	126	Olympia	Washington	9	2016	272690
1788	126	Olympia	Washington	10	2016	268000
1789	126	Olympia	Washington	11	2016	269200
1790	126	Olympia	Washington	12	2016	275000
1791	126	Olympia	Washington	1	2017	263100
1792	126	Olympia	Washington	2	2017	271900
1793	126	Olympia	Washington	3	2017	278300
1794	126	Olympia	Washington	4	2017	280175
1795	126	Olympia	Washington	5	2017	292893
1796	126	Olympia	Washington	6	2017	292000
1797	126	Olympia	Washington	7	2017	289925
1798	126	Olympia	Washington	8	2017	289900
1799	126	Olympia	Washington	9	2017	289000
1800	126	Olympia	Washington	10	2017	279680
1801	126	Olympia	Washington	11	2017	290643
1802	126	Olympia	Washington	12	2017	286169
1803	126	Olympia	Washington	1	2018	285250
1804	126	Olympia	Washington	2	2018	299000
1805	126	Olympia	Washington	3	2018	308500
1806	126	Olympia	Washington	4	2018	301091
1807	126	Olympia	Washington	5	2018	320000
1808	126	Olympia	Washington	6	2018	321860
1809	126	Olympia	Washington	7	2018	322000
1810	126	Olympia	Washington	8	2018	323950
1811	126	Olympia	Washington	9	2018	320000
1812	126	Olympia	Washington	10	2018	315000
1813	126	Olympia	Washington	11	2018	319220
1814	126	Olympia	Washington	12	2018	324900
1815	126	Olympia	Washington	1	2019	0
1816	101	Portland	Oregon	1	2009	245747
1817	101	Portland	Oregon	2	2009	250000
1818	101	Portland	Oregon	3	2009	240000
1819	101	Portland	Oregon	4	2009	242000
1820	101	Portland	Oregon	5	2009	244900
1821	101	Portland	Oregon	6	2009	242500
1822	101	Portland	Oregon	7	2009	239900
1823	101	Portland	Oregon	8	2009	242500
1824	101	Portland	Oregon	9	2009	235000
1825	101	Portland	Oregon	10	2009	235000
1826	101	Portland	Oregon	11	2009	230000
1827	101	Portland	Oregon	12	2009	235000
1828	101	Portland	Oregon	1	2010	229900
1829	101	Portland	Oregon	2	2010	225000
1830	101	Portland	Oregon	3	2010	233000
1831	101	Portland	Oregon	4	2010	235000
1832	101	Portland	Oregon	5	2010	232000
1833	101	Portland	Oregon	6	2010	235500
1834	101	Portland	Oregon	7	2010	239900
1835	101	Portland	Oregon	8	2010	240000
1836	101	Portland	Oregon	9	2010	235000
1837	101	Portland	Oregon	10	2010	226000
1838	101	Portland	Oregon	11	2010	230000
1839	101	Portland	Oregon	12	2010	225000
1840	101	Portland	Oregon	1	2011	212000
1841	101	Portland	Oregon	2	2011	209700
1842	101	Portland	Oregon	3	2011	208000
1843	101	Portland	Oregon	4	2011	215000
1844	101	Portland	Oregon	5	2011	214000
1845	101	Portland	Oregon	6	2011	215000
1846	101	Portland	Oregon	7	2011	220000
1847	101	Portland	Oregon	8	2011	219700
1848	101	Portland	Oregon	9	2011	221000
1849	101	Portland	Oregon	10	2011	210000
1850	101	Portland	Oregon	11	2011	220000
1851	101	Portland	Oregon	12	2011	208000
1852	101	Portland	Oregon	1	2012	201089
1853	101	Portland	Oregon	2	2012	203000
1854	101	Portland	Oregon	3	2012	210000
1855	101	Portland	Oregon	4	2012	219000
1856	101	Portland	Oregon	5	2012	229000
1857	101	Portland	Oregon	6	2012	235000
1858	101	Portland	Oregon	7	2012	235000
1859	101	Portland	Oregon	8	2012	233738
1860	101	Portland	Oregon	9	2012	229900
1861	101	Portland	Oregon	10	2012	236000
1862	101	Portland	Oregon	11	2012	234000
1863	101	Portland	Oregon	12	2012	235000
1864	101	Portland	Oregon	1	2013	236998
1865	101	Portland	Oregon	2	2013	234700
1866	101	Portland	Oregon	3	2013	245000
1867	101	Portland	Oregon	4	2013	245000
1868	101	Portland	Oregon	5	2013	260000
1869	101	Portland	Oregon	6	2013	260000
1870	101	Portland	Oregon	7	2013	270000
1871	101	Portland	Oregon	8	2013	269000
1872	101	Portland	Oregon	9	2013	268000
1873	101	Portland	Oregon	10	2013	263000
1874	101	Portland	Oregon	11	2013	264000
1875	101	Portland	Oregon	12	2013	255000
1876	101	Portland	Oregon	1	2014	254900
1877	101	Portland	Oregon	2	2014	265000
1878	101	Portland	Oregon	3	2014	265000
1879	101	Portland	Oregon	4	2014	270000
1880	101	Portland	Oregon	5	2014	279900
1881	101	Portland	Oregon	6	2014	282995
1882	101	Portland	Oregon	7	2014	289000
1883	101	Portland	Oregon	8	2014	285000
1884	101	Portland	Oregon	9	2014	280000
1885	101	Portland	Oregon	10	2014	279900
1886	101	Portland	Oregon	11	2014	279000
1887	101	Portland	Oregon	12	2014	279925
1888	101	Portland	Oregon	1	2015	270000
1889	101	Portland	Oregon	2	2015	274869
1890	101	Portland	Oregon	3	2015	285000
1891	101	Portland	Oregon	4	2015	290003
1892	101	Portland	Oregon	5	2015	302500
1893	101	Portland	Oregon	6	2015	307000
1894	101	Portland	Oregon	7	2015	305000
1895	101	Portland	Oregon	8	2015	306703
1896	101	Portland	Oregon	9	2015	299900
1897	101	Portland	Oregon	10	2015	299900
1898	101	Portland	Oregon	11	2015	305000
1899	101	Portland	Oregon	12	2015	310000
1900	101	Portland	Oregon	1	2016	300000
1901	101	Portland	Oregon	2	2016	305000
1902	101	Portland	Oregon	3	2016	324990
1903	101	Portland	Oregon	4	2016	335000
1904	101	Portland	Oregon	5	2016	339900
1905	101	Portland	Oregon	6	2016	347000
1906	101	Portland	Oregon	7	2016	342000
1907	101	Portland	Oregon	8	2016	345000
1908	101	Portland	Oregon	9	2016	340000
1909	101	Portland	Oregon	10	2016	340100
1910	101	Portland	Oregon	11	2016	340232
1911	101	Portland	Oregon	12	2016	339000
1912	101	Portland	Oregon	1	2017	340000
1913	101	Portland	Oregon	2	2017	345000
1914	101	Portland	Oregon	3	2017	354113
1915	101	Portland	Oregon	4	2017	365000
1916	101	Portland	Oregon	5	2017	371000
1917	101	Portland	Oregon	6	2017	377000
1918	101	Portland	Oregon	7	2017	379900
1919	101	Portland	Oregon	8	2017	375000
1920	101	Portland	Oregon	9	2017	371495
1921	101	Portland	Oregon	10	2017	373000
1922	101	Portland	Oregon	11	2017	365000
1923	101	Portland	Oregon	12	2017	369945
1924	101	Portland	Oregon	1	2018	385000
1925	101	Portland	Oregon	2	2018	378720
1926	101	Portland	Oregon	3	2018	384644
1927	101	Portland	Oregon	4	2018	395100
1928	101	Portland	Oregon	5	2018	400000
1929	101	Portland	Oregon	6	2018	405000
1930	101	Portland	Oregon	7	2018	395000
1931	101	Portland	Oregon	8	2018	400000
1932	101	Portland	Oregon	9	2018	385900
1933	101	Portland	Oregon	10	2018	388000
1934	101	Portland	Oregon	11	2018	385000
1935	101	Portland	Oregon	12	2018	385000
1936	101	Portland	Oregon	1	2019	0
1937	122	Burlington	Vermont	1	2009	211000
1938	122	Burlington	Vermont	2	2009	195375
1939	122	Burlington	Vermont	3	2009	221000
1940	122	Burlington	Vermont	4	2009	233308
1941	122	Burlington	Vermont	5	2009	219000
1942	122	Burlington	Vermont	6	2009	237948
1943	122	Burlington	Vermont	7	2009	227000
1944	122	Burlington	Vermont	8	2009	222500
1945	122	Burlington	Vermont	9	2009	213500
1946	122	Burlington	Vermont	10	2009	225000
1947	122	Burlington	Vermont	11	2009	204000
1948	122	Burlington	Vermont	12	2009	235000
1949	122	Burlington	Vermont	1	2010	231000
1950	122	Burlington	Vermont	2	2010	213250
1951	122	Burlington	Vermont	3	2010	221500
1952	122	Burlington	Vermont	4	2010	216000
1953	122	Burlington	Vermont	5	2010	215000
1954	122	Burlington	Vermont	6	2010	231500
1955	122	Burlington	Vermont	7	2010	245000
1956	122	Burlington	Vermont	8	2010	255000
1957	122	Burlington	Vermont	9	2010	240000
1958	122	Burlington	Vermont	10	2010	250000
1959	122	Burlington	Vermont	11	2010	239000
1960	122	Burlington	Vermont	12	2010	239000
1961	122	Burlington	Vermont	1	2011	213000
1962	122	Burlington	Vermont	2	2011	200000
1963	122	Burlington	Vermont	3	2011	220000
1964	122	Burlington	Vermont	4	2011	241600
1965	122	Burlington	Vermont	5	2011	228500
1966	122	Burlington	Vermont	6	2011	240000
1967	122	Burlington	Vermont	7	2011	230000
1968	122	Burlington	Vermont	8	2011	221900
1969	122	Burlington	Vermont	9	2011	227500
1970	122	Burlington	Vermont	10	2011	247000
1971	122	Burlington	Vermont	11	2011	227450
1972	122	Burlington	Vermont	12	2011	229950
1973	122	Burlington	Vermont	1	2012	205500
1974	122	Burlington	Vermont	2	2012	193750
1975	122	Burlington	Vermont	3	2012	222000
1976	122	Burlington	Vermont	4	2012	235750
1977	122	Burlington	Vermont	5	2012	229900
1978	122	Burlington	Vermont	6	2012	242000
1979	122	Burlington	Vermont	7	2012	245500
1980	122	Burlington	Vermont	8	2012	247750
1981	122	Burlington	Vermont	9	2012	258500
1982	122	Burlington	Vermont	10	2012	226250
1983	122	Burlington	Vermont	11	2012	242500
1984	122	Burlington	Vermont	12	2012	248450
1985	122	Burlington	Vermont	1	2013	230300
1986	122	Burlington	Vermont	2	2013	240200
1987	122	Burlington	Vermont	3	2013	228000
1988	122	Burlington	Vermont	4	2013	230000
1989	122	Burlington	Vermont	5	2013	236000
1990	122	Burlington	Vermont	6	2013	255000
1991	122	Burlington	Vermont	7	2013	249000
1992	122	Burlington	Vermont	8	2013	249750
1993	122	Burlington	Vermont	9	2013	232700
1994	122	Burlington	Vermont	10	2013	228250
1995	122	Burlington	Vermont	11	2013	234128
1996	122	Burlington	Vermont	12	2013	220000
1997	122	Burlington	Vermont	1	2014	242500
1998	122	Burlington	Vermont	2	2014	241500
1999	122	Burlington	Vermont	3	2014	234000
2000	122	Burlington	Vermont	4	2014	248500
2001	122	Burlington	Vermont	5	2014	246000
2002	122	Burlington	Vermont	6	2014	241250
2003	122	Burlington	Vermont	7	2014	266900
2004	122	Burlington	Vermont	8	2014	263135
2005	122	Burlington	Vermont	9	2014	240000
2006	122	Burlington	Vermont	10	2014	237000
2007	122	Burlington	Vermont	11	2014	257000
2008	122	Burlington	Vermont	12	2014	245000
2009	122	Burlington	Vermont	1	2015	236000
2010	122	Burlington	Vermont	2	2015	237000
2011	122	Burlington	Vermont	3	2015	230000
2012	122	Burlington	Vermont	4	2015	241000
2013	122	Burlington	Vermont	5	2015	251000
2014	122	Burlington	Vermont	6	2015	266000
2015	122	Burlington	Vermont	7	2015	262950
2016	122	Burlington	Vermont	8	2015	235500
2017	122	Burlington	Vermont	9	2015	244500
2018	122	Burlington	Vermont	10	2015	240000
2019	122	Burlington	Vermont	11	2015	250000
2020	122	Burlington	Vermont	12	2015	250000
2021	122	Burlington	Vermont	1	2016	239950
2022	122	Burlington	Vermont	2	2016	226750
2023	122	Burlington	Vermont	3	2016	225250
2024	122	Burlington	Vermont	4	2016	282000
2025	122	Burlington	Vermont	5	2016	249500
2026	122	Burlington	Vermont	6	2016	265950
2027	122	Burlington	Vermont	7	2016	256000
2028	122	Burlington	Vermont	8	2016	250000
2029	122	Burlington	Vermont	9	2016	249900
2030	122	Burlington	Vermont	10	2016	252377
2031	122	Burlington	Vermont	11	2016	269501
2032	122	Burlington	Vermont	12	2016	265981
2033	122	Burlington	Vermont	1	2017	251950
2034	122	Burlington	Vermont	2	2017	277381
2035	122	Burlington	Vermont	3	2017	255200
2036	122	Burlington	Vermont	4	2017	262500
2037	122	Burlington	Vermont	5	2017	262000
2038	122	Burlington	Vermont	6	2017	270000
2039	122	Burlington	Vermont	7	2017	274900
2040	122	Burlington	Vermont	8	2017	279000
2041	122	Burlington	Vermont	9	2017	269042
2042	122	Burlington	Vermont	10	2017	260000
2043	122	Burlington	Vermont	11	2017	284000
2044	122	Burlington	Vermont	12	2017	279950
2045	122	Burlington	Vermont	1	2018	274500
2046	122	Burlington	Vermont	2	2018	244823
2047	122	Burlington	Vermont	3	2018	265000
2048	122	Burlington	Vermont	4	2018	269500
2049	122	Burlington	Vermont	5	2018	275000
2050	122	Burlington	Vermont	6	2018	288500
2051	122	Burlington	Vermont	7	2018	286250
2052	122	Burlington	Vermont	8	2018	278500
2053	122	Burlington	Vermont	9	2018	300000
2054	122	Burlington	Vermont	10	2018	283000
2055	122	Burlington	Vermont	11	2018	284900
2056	122	Burlington	Vermont	12	2018	305000
2057	122	Burlington	Vermont	1	2019	0
2058	29	Wilmington	Delaware	1	2009	216750
2059	29	Wilmington	Delaware	2	2009	205000
2060	29	Wilmington	Delaware	3	2009	207000
2061	29	Wilmington	Delaware	4	2009	210000
2062	29	Wilmington	Delaware	5	2009	224950
2063	29	Wilmington	Delaware	6	2009	220000
2064	29	Wilmington	Delaware	7	2009	222000
2065	29	Wilmington	Delaware	8	2009	218000
2066	29	Wilmington	Delaware	9	2009	209950
2067	29	Wilmington	Delaware	10	2009	210000
2068	29	Wilmington	Delaware	11	2009	202000
2069	29	Wilmington	Delaware	12	2009	200000
2070	29	Wilmington	Delaware	1	2010	194500
2071	29	Wilmington	Delaware	2	2010	205000
2072	29	Wilmington	Delaware	3	2010	200000
2073	29	Wilmington	Delaware	4	2010	200000
2074	29	Wilmington	Delaware	5	2010	208500
2075	29	Wilmington	Delaware	6	2010	209000
2076	29	Wilmington	Delaware	7	2010	215000
2077	29	Wilmington	Delaware	8	2010	216000
2078	29	Wilmington	Delaware	9	2010	207000
2079	29	Wilmington	Delaware	10	2010	210000
2080	29	Wilmington	Delaware	11	2010	199000
2081	29	Wilmington	Delaware	12	2010	208950
2082	29	Wilmington	Delaware	1	2011	190500
2083	29	Wilmington	Delaware	2	2011	176900
2084	29	Wilmington	Delaware	3	2011	187000
2085	29	Wilmington	Delaware	4	2011	180750
2086	29	Wilmington	Delaware	5	2011	194900
2087	29	Wilmington	Delaware	6	2011	193750
2088	29	Wilmington	Delaware	7	2011	195250
2089	29	Wilmington	Delaware	8	2011	204700
2090	29	Wilmington	Delaware	9	2011	195000
2091	29	Wilmington	Delaware	10	2011	184950
2092	29	Wilmington	Delaware	11	2011	181000
2093	29	Wilmington	Delaware	12	2011	175000
2094	29	Wilmington	Delaware	1	2012	170000
2095	29	Wilmington	Delaware	2	2012	164900
2096	29	Wilmington	Delaware	3	2012	163750
2097	29	Wilmington	Delaware	4	2012	169450
2098	29	Wilmington	Delaware	5	2012	187000
2099	29	Wilmington	Delaware	6	2012	193300
2100	29	Wilmington	Delaware	7	2012	190100
2101	29	Wilmington	Delaware	8	2012	191000
2102	29	Wilmington	Delaware	9	2012	185000
2103	29	Wilmington	Delaware	10	2012	183500
2104	29	Wilmington	Delaware	11	2012	181900
2105	29	Wilmington	Delaware	12	2012	185000
2106	29	Wilmington	Delaware	1	2013	180000
2107	29	Wilmington	Delaware	2	2013	171900
2108	29	Wilmington	Delaware	3	2013	172500
2109	29	Wilmington	Delaware	4	2013	181500
2110	29	Wilmington	Delaware	5	2013	187950
2111	29	Wilmington	Delaware	6	2013	220000
2112	29	Wilmington	Delaware	7	2013	210000
2113	29	Wilmington	Delaware	8	2013	200000
2114	29	Wilmington	Delaware	9	2013	190000
2115	29	Wilmington	Delaware	10	2013	200000
2116	29	Wilmington	Delaware	11	2013	187400
2117	29	Wilmington	Delaware	12	2013	195000
2118	29	Wilmington	Delaware	1	2014	172500
2119	29	Wilmington	Delaware	2	2014	180495
2120	29	Wilmington	Delaware	3	2014	180000
2121	29	Wilmington	Delaware	4	2014	180100
2122	29	Wilmington	Delaware	5	2014	195000
2123	29	Wilmington	Delaware	6	2014	204950
2124	29	Wilmington	Delaware	7	2014	208000
2125	29	Wilmington	Delaware	8	2014	210000
2126	29	Wilmington	Delaware	9	2014	199900
2127	29	Wilmington	Delaware	10	2014	200000
2128	29	Wilmington	Delaware	11	2014	198000
2129	29	Wilmington	Delaware	12	2014	190000
2130	29	Wilmington	Delaware	1	2015	182500
2131	29	Wilmington	Delaware	2	2015	205000
2132	29	Wilmington	Delaware	3	2015	196750
2133	29	Wilmington	Delaware	4	2015	198500
2134	29	Wilmington	Delaware	5	2015	200100
2135	29	Wilmington	Delaware	6	2015	220000
2136	29	Wilmington	Delaware	7	2015	216619
2137	29	Wilmington	Delaware	8	2015	214030
2138	29	Wilmington	Delaware	9	2015	214000
2139	29	Wilmington	Delaware	10	2015	205000
2140	29	Wilmington	Delaware	11	2015	209950
2141	29	Wilmington	Delaware	12	2015	199500
2142	29	Wilmington	Delaware	1	2016	196000
2143	29	Wilmington	Delaware	2	2016	189000
2144	29	Wilmington	Delaware	3	2016	195000
2145	29	Wilmington	Delaware	4	2016	199700
2146	29	Wilmington	Delaware	5	2016	200000
2147	29	Wilmington	Delaware	6	2016	214000
2148	29	Wilmington	Delaware	7	2016	224950
2149	29	Wilmington	Delaware	8	2016	215950
2150	29	Wilmington	Delaware	9	2016	200000
2151	29	Wilmington	Delaware	10	2016	211500
2152	29	Wilmington	Delaware	11	2016	205775
2153	29	Wilmington	Delaware	12	2016	210000
2154	29	Wilmington	Delaware	1	2017	203000
2155	29	Wilmington	Delaware	2	2017	189900
2156	29	Wilmington	Delaware	3	2017	203450
2157	29	Wilmington	Delaware	4	2017	200000
2158	29	Wilmington	Delaware	5	2017	213000
2159	29	Wilmington	Delaware	6	2017	225000
2160	29	Wilmington	Delaware	7	2017	219900
2161	29	Wilmington	Delaware	8	2017	215000
2162	29	Wilmington	Delaware	9	2017	210000
2163	29	Wilmington	Delaware	10	2017	205000
2164	29	Wilmington	Delaware	11	2017	207750
2165	29	Wilmington	Delaware	12	2017	210425
2166	29	Wilmington	Delaware	1	2018	203000
2167	29	Wilmington	Delaware	2	2018	183000
2168	29	Wilmington	Delaware	3	2018	206921
2169	29	Wilmington	Delaware	4	2018	200000
2170	29	Wilmington	Delaware	5	2018	211750
2171	29	Wilmington	Delaware	6	2018	229000
2172	29	Wilmington	Delaware	7	2018	218250
2173	29	Wilmington	Delaware	8	2018	224900
2174	29	Wilmington	Delaware	9	2018	219900
2175	29	Wilmington	Delaware	10	2018	208000
2176	29	Wilmington	Delaware	11	2018	222500
2177	29	Wilmington	Delaware	12	2018	223000
2178	29	Wilmington	Delaware	1	2019	0
2179	85	Manchester	New Hampshire	1	2009	203950
2180	85	Manchester	New Hampshire	2	2009	181250
2181	85	Manchester	New Hampshire	3	2009	197750
2182	85	Manchester	New Hampshire	4	2009	190000
2183	85	Manchester	New Hampshire	5	2009	200000
2184	85	Manchester	New Hampshire	6	2009	225000
2185	85	Manchester	New Hampshire	7	2009	219000
2186	85	Manchester	New Hampshire	8	2009	216750
2187	85	Manchester	New Hampshire	9	2009	210000
2188	85	Manchester	New Hampshire	10	2009	205000
2189	85	Manchester	New Hampshire	11	2009	203500
2190	85	Manchester	New Hampshire	12	2009	204000
2191	85	Manchester	New Hampshire	1	2010	205000
2192	85	Manchester	New Hampshire	2	2010	185000
2193	85	Manchester	New Hampshire	3	2010	200000
2194	85	Manchester	New Hampshire	4	2010	206900
2195	85	Manchester	New Hampshire	5	2010	216900
2196	85	Manchester	New Hampshire	6	2010	229900
2197	85	Manchester	New Hampshire	7	2010	221850
2198	85	Manchester	New Hampshire	8	2010	222500
2199	85	Manchester	New Hampshire	9	2010	210000
2200	85	Manchester	New Hampshire	10	2010	200000
2201	85	Manchester	New Hampshire	11	2010	210000
2202	85	Manchester	New Hampshire	12	2010	210000
2203	85	Manchester	New Hampshire	1	2011	199700
2204	85	Manchester	New Hampshire	2	2011	170000
2205	85	Manchester	New Hampshire	3	2011	192000
2206	85	Manchester	New Hampshire	4	2011	194000
2207	85	Manchester	New Hampshire	5	2011	195000
2208	85	Manchester	New Hampshire	6	2011	210900
2209	85	Manchester	New Hampshire	7	2011	205000
2210	85	Manchester	New Hampshire	8	2011	199000
2211	85	Manchester	New Hampshire	9	2011	200000
2212	85	Manchester	New Hampshire	10	2011	188000
2213	85	Manchester	New Hampshire	11	2011	199000
2214	85	Manchester	New Hampshire	12	2011	179900
2215	85	Manchester	New Hampshire	1	2012	195000
2216	85	Manchester	New Hampshire	2	2012	175750
2217	85	Manchester	New Hampshire	3	2012	184700
2218	85	Manchester	New Hampshire	4	2012	184950
2219	85	Manchester	New Hampshire	5	2012	197000
2220	85	Manchester	New Hampshire	6	2012	196500
2221	85	Manchester	New Hampshire	7	2012	210000
2222	85	Manchester	New Hampshire	8	2012	191525
2223	85	Manchester	New Hampshire	9	2012	192850
2224	85	Manchester	New Hampshire	10	2012	210000
2225	85	Manchester	New Hampshire	11	2012	186450
2226	85	Manchester	New Hampshire	12	2012	193950
2227	85	Manchester	New Hampshire	1	2013	189250
2228	85	Manchester	New Hampshire	2	2013	195250
2229	85	Manchester	New Hampshire	3	2013	190000
2230	85	Manchester	New Hampshire	4	2013	200000
2231	85	Manchester	New Hampshire	5	2013	200000
2232	85	Manchester	New Hampshire	6	2013	224900
2233	85	Manchester	New Hampshire	7	2013	230000
2234	85	Manchester	New Hampshire	8	2013	219000
2235	85	Manchester	New Hampshire	9	2013	220000
2236	85	Manchester	New Hampshire	10	2013	216000
2237	85	Manchester	New Hampshire	11	2013	212150
2238	85	Manchester	New Hampshire	12	2013	211000
2239	85	Manchester	New Hampshire	1	2014	210000
2240	85	Manchester	New Hampshire	2	2014	198000
2241	85	Manchester	New Hampshire	3	2014	196000
2242	85	Manchester	New Hampshire	4	2014	208750
2243	85	Manchester	New Hampshire	5	2014	221500
2244	85	Manchester	New Hampshire	6	2014	225000
2245	85	Manchester	New Hampshire	7	2014	220000
2246	85	Manchester	New Hampshire	8	2014	228000
2247	85	Manchester	New Hampshire	9	2014	217500
2248	85	Manchester	New Hampshire	10	2014	217350
2249	85	Manchester	New Hampshire	11	2014	223700
2250	85	Manchester	New Hampshire	12	2014	216000
2251	85	Manchester	New Hampshire	1	2015	221825
2252	85	Manchester	New Hampshire	2	2015	223000
2253	85	Manchester	New Hampshire	3	2015	216500
2254	85	Manchester	New Hampshire	4	2015	225000
2255	85	Manchester	New Hampshire	5	2015	228500
2256	85	Manchester	New Hampshire	6	2015	245000
2257	85	Manchester	New Hampshire	7	2015	245000
2258	85	Manchester	New Hampshire	8	2015	240000
2259	85	Manchester	New Hampshire	9	2015	230000
2260	85	Manchester	New Hampshire	10	2015	224500
2261	85	Manchester	New Hampshire	11	2015	232517
2262	85	Manchester	New Hampshire	12	2015	227517
2263	85	Manchester	New Hampshire	1	2016	232533
2264	85	Manchester	New Hampshire	2	2016	225000
2265	85	Manchester	New Hampshire	3	2016	225000
2266	85	Manchester	New Hampshire	4	2016	235000
2267	85	Manchester	New Hampshire	5	2016	234933
2268	85	Manchester	New Hampshire	6	2016	240000
2269	85	Manchester	New Hampshire	7	2016	250000
2270	85	Manchester	New Hampshire	8	2016	250000
2271	85	Manchester	New Hampshire	9	2016	247500
2272	85	Manchester	New Hampshire	10	2016	237967
2273	85	Manchester	New Hampshire	11	2016	240000
2274	85	Manchester	New Hampshire	12	2016	248533
2275	85	Manchester	New Hampshire	1	2017	245000
2276	85	Manchester	New Hampshire	2	2017	239000
2277	85	Manchester	New Hampshire	3	2017	249500
2278	85	Manchester	New Hampshire	4	2017	250000
2279	85	Manchester	New Hampshire	5	2017	269817
2280	85	Manchester	New Hampshire	6	2017	272400
2281	85	Manchester	New Hampshire	7	2017	262767
2282	85	Manchester	New Hampshire	8	2017	269933
2283	85	Manchester	New Hampshire	9	2017	250000
2284	85	Manchester	New Hampshire	10	2017	258125
2285	85	Manchester	New Hampshire	11	2017	260000
2286	85	Manchester	New Hampshire	12	2017	260000
2287	85	Manchester	New Hampshire	1	2018	266500
2288	85	Manchester	New Hampshire	2	2018	244000
2289	85	Manchester	New Hampshire	3	2018	255000
2290	85	Manchester	New Hampshire	4	2018	265000
2291	85	Manchester	New Hampshire	5	2018	279533
2292	85	Manchester	New Hampshire	6	2018	287000
2293	85	Manchester	New Hampshire	7	2018	284217
2294	85	Manchester	New Hampshire	8	2018	275000
2295	85	Manchester	New Hampshire	9	2018	280000
2296	85	Manchester	New Hampshire	10	2018	273000
2297	85	Manchester	New Hampshire	11	2018	279933
2298	85	Manchester	New Hampshire	12	2018	265000
2299	85	Manchester	New Hampshire	1	2019	0
2300	121	Salt Lake City	Utah	1	2009	225000
2301	121	Salt Lake City	Utah	2	2009	220000
2302	121	Salt Lake City	Utah	3	2009	216500
2303	121	Salt Lake City	Utah	4	2009	215000
2304	121	Salt Lake City	Utah	5	2009	222000
2305	121	Salt Lake City	Utah	6	2009	219000
2306	121	Salt Lake City	Utah	7	2009	219900
2307	121	Salt Lake City	Utah	8	2009	216408
2308	121	Salt Lake City	Utah	9	2009	202000
2309	121	Salt Lake City	Utah	10	2009	205000
2310	121	Salt Lake City	Utah	11	2009	200000
2311	121	Salt Lake City	Utah	12	2009	210000
2312	121	Salt Lake City	Utah	1	2010	210841
2313	121	Salt Lake City	Utah	2	2010	205256
2314	121	Salt Lake City	Utah	3	2010	197500
2315	121	Salt Lake City	Utah	4	2010	197000
2316	121	Salt Lake City	Utah	5	2010	199450
2317	121	Salt Lake City	Utah	6	2010	217000
2318	121	Salt Lake City	Utah	7	2010	223000
2319	121	Salt Lake City	Utah	8	2010	215000
2320	121	Salt Lake City	Utah	9	2010	208000
2321	121	Salt Lake City	Utah	10	2010	201900
2322	121	Salt Lake City	Utah	11	2010	198000
2323	121	Salt Lake City	Utah	12	2010	195000
2324	121	Salt Lake City	Utah	1	2011	190550
2325	121	Salt Lake City	Utah	2	2011	179500
2326	121	Salt Lake City	Utah	3	2011	185000
2327	121	Salt Lake City	Utah	4	2011	182850
2328	121	Salt Lake City	Utah	5	2011	185000
2329	121	Salt Lake City	Utah	6	2011	188900
2330	121	Salt Lake City	Utah	7	2011	185000
2331	121	Salt Lake City	Utah	8	2011	182500
2332	121	Salt Lake City	Utah	9	2011	175000
2333	121	Salt Lake City	Utah	10	2011	181250
2334	121	Salt Lake City	Utah	11	2011	177600
2335	121	Salt Lake City	Utah	12	2011	178250
2336	121	Salt Lake City	Utah	1	2012	170550
2337	121	Salt Lake City	Utah	2	2012	175000
2338	121	Salt Lake City	Utah	3	2012	177000
2339	121	Salt Lake City	Utah	4	2012	191900
2340	121	Salt Lake City	Utah	5	2012	196400
2341	121	Salt Lake City	Utah	6	2012	192750
2342	121	Salt Lake City	Utah	7	2012	192000
2343	121	Salt Lake City	Utah	8	2012	201875
2344	121	Salt Lake City	Utah	9	2012	193250
2345	121	Salt Lake City	Utah	10	2012	201900
2346	121	Salt Lake City	Utah	11	2012	205000
2347	121	Salt Lake City	Utah	12	2012	200000
2348	121	Salt Lake City	Utah	1	2013	200364
2349	121	Salt Lake City	Utah	2	2013	209185
2350	121	Salt Lake City	Utah	3	2013	204900
2351	121	Salt Lake City	Utah	4	2013	220000
2352	121	Salt Lake City	Utah	5	2013	227000
2353	121	Salt Lake City	Utah	6	2013	233500
2354	121	Salt Lake City	Utah	7	2013	225500
2355	121	Salt Lake City	Utah	8	2013	227000
2356	121	Salt Lake City	Utah	9	2013	222000
2357	121	Salt Lake City	Utah	10	2013	216350
2358	121	Salt Lake City	Utah	11	2013	223068
2359	121	Salt Lake City	Utah	12	2013	225000
2360	121	Salt Lake City	Utah	1	2014	218000
2361	121	Salt Lake City	Utah	2	2014	222183
2362	121	Salt Lake City	Utah	3	2014	224000
2363	121	Salt Lake City	Utah	4	2014	222500
2364	121	Salt Lake City	Utah	5	2014	229700
2365	121	Salt Lake City	Utah	6	2014	233000
2366	121	Salt Lake City	Utah	7	2014	235000
2367	121	Salt Lake City	Utah	8	2014	235000
2368	121	Salt Lake City	Utah	9	2014	230000
2369	121	Salt Lake City	Utah	10	2014	229950
2370	121	Salt Lake City	Utah	11	2014	234400
2371	121	Salt Lake City	Utah	12	2014	236000
2372	121	Salt Lake City	Utah	1	2015	232000
2373	121	Salt Lake City	Utah	2	2015	227524
2374	121	Salt Lake City	Utah	3	2015	235000
2375	121	Salt Lake City	Utah	4	2015	240000
2376	121	Salt Lake City	Utah	5	2015	251750
2377	121	Salt Lake City	Utah	6	2015	252807
2378	121	Salt Lake City	Utah	7	2015	250000
2379	121	Salt Lake City	Utah	8	2015	245000
2380	121	Salt Lake City	Utah	9	2015	247000
2381	121	Salt Lake City	Utah	10	2015	244050
2382	121	Salt Lake City	Utah	11	2015	250000
2383	121	Salt Lake City	Utah	12	2015	246000
2384	121	Salt Lake City	Utah	1	2016	239014
2385	121	Salt Lake City	Utah	2	2016	245450
2386	121	Salt Lake City	Utah	3	2016	250850
2387	121	Salt Lake City	Utah	4	2016	254000
2388	121	Salt Lake City	Utah	5	2016	263870
2389	121	Salt Lake City	Utah	6	2016	270000
2390	121	Salt Lake City	Utah	7	2016	268875
2391	121	Salt Lake City	Utah	8	2016	265000
2392	121	Salt Lake City	Utah	9	2016	260000
2393	121	Salt Lake City	Utah	10	2016	262300
2394	121	Salt Lake City	Utah	11	2016	265561
2395	121	Salt Lake City	Utah	12	2016	264900
2396	121	Salt Lake City	Utah	1	2017	270000
2397	121	Salt Lake City	Utah	2	2017	260000
2398	121	Salt Lake City	Utah	3	2017	280000
2399	121	Salt Lake City	Utah	4	2017	285000
2400	121	Salt Lake City	Utah	5	2017	295000
2401	121	Salt Lake City	Utah	6	2017	295000
2402	121	Salt Lake City	Utah	7	2017	289225
2403	121	Salt Lake City	Utah	8	2017	287000
2404	121	Salt Lake City	Utah	9	2017	286900
2405	121	Salt Lake City	Utah	10	2017	294500
2406	121	Salt Lake City	Utah	11	2017	299900
2407	121	Salt Lake City	Utah	12	2017	290000
2408	121	Salt Lake City	Utah	1	2018	293000
2409	121	Salt Lake City	Utah	2	2018	303850
2410	121	Salt Lake City	Utah	3	2018	311861
2411	121	Salt Lake City	Utah	4	2018	307000
2412	121	Salt Lake City	Utah	5	2018	319490
2413	121	Salt Lake City	Utah	6	2018	323750
2414	121	Salt Lake City	Utah	7	2018	323000
2415	121	Salt Lake City	Utah	8	2018	314900
2416	121	Salt Lake City	Utah	9	2018	320750
2417	121	Salt Lake City	Utah	10	2018	322150
2418	121	Salt Lake City	Utah	11	2018	315000
2419	121	Salt Lake City	Utah	12	2018	319000
2420	121	Salt Lake City	Utah	1	2019	0
2421	146	Portland	Maine	1	2009	0
2422	146	Portland	Maine	2	2009	216500
2423	146	Portland	Maine	3	2009	216300
2424	146	Portland	Maine	4	2009	216000
2425	146	Portland	Maine	5	2009	215500
2426	146	Portland	Maine	6	2009	214800
2427	146	Portland	Maine	7	2009	214200
2428	146	Portland	Maine	8	2009	213700
2429	146	Portland	Maine	9	2009	213100
2430	146	Portland	Maine	10	2009	212700
2431	146	Portland	Maine	11	2009	212400
2432	146	Portland	Maine	12	2009	212300
2433	146	Portland	Maine	1	2010	212300
2434	146	Portland	Maine	2	2010	212400
2435	146	Portland	Maine	3	2010	212300
2436	146	Portland	Maine	4	2010	212600
2437	146	Portland	Maine	5	2010	213200
2438	146	Portland	Maine	6	2010	213900
2439	146	Portland	Maine	7	2010	214300
2440	146	Portland	Maine	8	2010	214400
2441	146	Portland	Maine	9	2010	214400
2442	146	Portland	Maine	10	2010	214200
2443	146	Portland	Maine	11	2010	213500
2444	146	Portland	Maine	12	2010	212500
2445	146	Portland	Maine	1	2011	211600
2446	146	Portland	Maine	2	2011	210800
2447	146	Portland	Maine	3	2011	209600
2448	146	Portland	Maine	4	2011	208500
2449	146	Portland	Maine	5	2011	208200
2450	146	Portland	Maine	6	2011	208200
2451	146	Portland	Maine	7	2011	207900
2452	146	Portland	Maine	8	2011	207800
2453	146	Portland	Maine	9	2011	208100
2454	146	Portland	Maine	10	2011	208300
2455	146	Portland	Maine	11	2011	208000
2456	146	Portland	Maine	12	2011	207700
2457	146	Portland	Maine	1	2012	207600
2458	146	Portland	Maine	2	2012	207600
2459	146	Portland	Maine	3	2012	207700
2460	146	Portland	Maine	4	2012	207600
2461	146	Portland	Maine	5	2012	207700
2462	146	Portland	Maine	6	2012	207700
2463	146	Portland	Maine	7	2012	207900
2464	146	Portland	Maine	8	2012	208200
2465	146	Portland	Maine	9	2012	209000
2466	146	Portland	Maine	10	2012	210000
2467	146	Portland	Maine	11	2012	211200
2468	146	Portland	Maine	12	2012	212500
2469	146	Portland	Maine	1	2013	213800
2470	146	Portland	Maine	2	2013	214900
2471	146	Portland	Maine	3	2013	216200
2472	146	Portland	Maine	4	2013	217200
2473	146	Portland	Maine	5	2013	217100
2474	146	Portland	Maine	6	2013	216600
2475	146	Portland	Maine	7	2013	216300
2476	146	Portland	Maine	8	2013	216100
2477	146	Portland	Maine	9	2013	215900
2478	146	Portland	Maine	10	2013	215900
2479	146	Portland	Maine	11	2013	216100
2480	146	Portland	Maine	12	2013	216000
2481	146	Portland	Maine	1	2014	216300
2482	146	Portland	Maine	2	2014	217200
2483	146	Portland	Maine	3	2014	218100
2484	146	Portland	Maine	4	2014	220300
2485	146	Portland	Maine	5	2014	223800
2486	146	Portland	Maine	6	2014	228100
2487	146	Portland	Maine	7	2014	231100
2488	146	Portland	Maine	8	2014	232800
2489	146	Portland	Maine	9	2014	232900
2490	146	Portland	Maine	10	2014	233000
2491	146	Portland	Maine	11	2014	233600
2492	146	Portland	Maine	12	2014	234400
2493	146	Portland	Maine	1	2015	234500
2494	146	Portland	Maine	2	2015	234900
2495	146	Portland	Maine	3	2015	235700
2496	146	Portland	Maine	4	2015	236200
2497	146	Portland	Maine	5	2015	236000
2498	146	Portland	Maine	6	2015	235000
2499	146	Portland	Maine	7	2015	234300
2500	146	Portland	Maine	8	2015	234400
2501	146	Portland	Maine	9	2015	235100
2502	146	Portland	Maine	10	2015	235600
2503	146	Portland	Maine	11	2015	236900
2504	146	Portland	Maine	12	2015	238400
2505	146	Portland	Maine	1	2016	239800
2506	146	Portland	Maine	2	2016	241600
2507	146	Portland	Maine	3	2016	243700
2508	146	Portland	Maine	4	2016	246000
2509	146	Portland	Maine	5	2016	248500
2510	146	Portland	Maine	6	2016	251300
2511	146	Portland	Maine	7	2016	254600
2512	146	Portland	Maine	8	2016	257800
2513	146	Portland	Maine	9	2016	260600
2514	146	Portland	Maine	10	2016	263300
2515	146	Portland	Maine	11	2016	265800
2516	146	Portland	Maine	12	2016	267800
2517	146	Portland	Maine	1	2017	269400
2518	146	Portland	Maine	2	2017	270500
2519	146	Portland	Maine	3	2017	271800
2520	146	Portland	Maine	4	2017	273100
2521	146	Portland	Maine	5	2017	273900
2522	146	Portland	Maine	6	2017	274500
2523	146	Portland	Maine	7	2017	275700
2524	146	Portland	Maine	8	2017	277000
2525	146	Portland	Maine	9	2017	277900
2526	146	Portland	Maine	10	2017	279300
2527	146	Portland	Maine	11	2017	281500
2528	146	Portland	Maine	12	2017	283500
2529	146	Portland	Maine	1	2018	285400
2530	146	Portland	Maine	2	2018	287800
2531	146	Portland	Maine	3	2018	290200
2532	146	Portland	Maine	4	2018	292100
2533	146	Portland	Maine	5	2018	294000
2534	146	Portland	Maine	6	2018	296100
2535	146	Portland	Maine	7	2018	298300
2536	146	Portland	Maine	8	2018	301000
2537	146	Portland	Maine	9	2018	304500
2538	146	Portland	Maine	10	2018	307400
2539	146	Portland	Maine	11	2018	308100
2540	146	Portland	Maine	12	2018	309600
2541	146	Portland	Maine	1	2019	312400
2542	20	Denver	Colorado	1	2009	156000
2543	20	Denver	Colorado	2	2009	168000
2544	20	Denver	Colorado	3	2009	180950
2545	20	Denver	Colorado	4	2009	188500
2546	20	Denver	Colorado	5	2009	195000
2547	20	Denver	Colorado	6	2009	210000
2548	20	Denver	Colorado	7	2009	210000
2549	20	Denver	Colorado	8	2009	209500
2550	20	Denver	Colorado	9	2009	200000
2551	20	Denver	Colorado	10	2009	204000
2552	20	Denver	Colorado	11	2009	195000
2553	20	Denver	Colorado	12	2009	197000
2554	20	Denver	Colorado	1	2010	185000
2555	20	Denver	Colorado	2	2010	200000
2556	20	Denver	Colorado	3	2010	203000
2557	20	Denver	Colorado	4	2010	205000
2558	20	Denver	Colorado	5	2010	210000
2559	20	Denver	Colorado	6	2010	213075
2560	20	Denver	Colorado	7	2010	220403
2561	20	Denver	Colorado	8	2010	219000
2562	20	Denver	Colorado	9	2010	209000
2563	20	Denver	Colorado	10	2010	208000
2564	20	Denver	Colorado	11	2010	205000
2565	20	Denver	Colorado	12	2010	207500
2566	20	Denver	Colorado	1	2011	189900
2567	20	Denver	Colorado	2	2011	200000
2568	20	Denver	Colorado	3	2011	202568
2569	20	Denver	Colorado	4	2011	196500
2570	20	Denver	Colorado	5	2011	209000
2571	20	Denver	Colorado	6	2011	215000
2572	20	Denver	Colorado	7	2011	210000
2573	20	Denver	Colorado	8	2011	209700
2574	20	Denver	Colorado	9	2011	204900
2575	20	Denver	Colorado	10	2011	204000
2576	20	Denver	Colorado	11	2011	205000
2577	20	Denver	Colorado	12	2011	204000
2578	20	Denver	Colorado	1	2012	200000
2579	20	Denver	Colorado	2	2012	191725
2580	20	Denver	Colorado	3	2012	209000
2581	20	Denver	Colorado	4	2012	225000
2582	20	Denver	Colorado	5	2012	235000
2583	20	Denver	Colorado	6	2012	245000
2584	20	Denver	Colorado	7	2012	240000
2585	20	Denver	Colorado	8	2012	237800
2586	20	Denver	Colorado	9	2012	235000
2587	20	Denver	Colorado	10	2012	235000
2588	20	Denver	Colorado	11	2012	235000
2589	20	Denver	Colorado	12	2012	231950
2590	20	Denver	Colorado	1	2013	226500
2591	20	Denver	Colorado	2	2013	233000
2592	20	Denver	Colorado	3	2013	247000
2593	20	Denver	Colorado	4	2013	252375
2594	20	Denver	Colorado	5	2013	255500
2595	20	Denver	Colorado	6	2013	264900
2596	20	Denver	Colorado	7	2013	264000
2597	20	Denver	Colorado	8	2013	258000
2598	20	Denver	Colorado	9	2013	254750
2599	20	Denver	Colorado	10	2013	250001
2600	20	Denver	Colorado	11	2013	246000
2601	20	Denver	Colorado	12	2013	250050
2602	20	Denver	Colorado	1	2014	250000
2603	20	Denver	Colorado	2	2014	248000
2604	20	Denver	Colorado	3	2014	262170
2605	20	Denver	Colorado	4	2014	271000
2606	20	Denver	Colorado	5	2014	272000
2607	20	Denver	Colorado	6	2014	282500
2608	20	Denver	Colorado	7	2014	281000
2609	20	Denver	Colorado	8	2014	273500
2610	20	Denver	Colorado	9	2014	272825
2611	20	Denver	Colorado	10	2014	271500
2612	20	Denver	Colorado	11	2014	275000
2613	20	Denver	Colorado	12	2014	279900
2614	20	Denver	Colorado	1	2015	285000
2615	20	Denver	Colorado	2	2015	289900
2616	20	Denver	Colorado	3	2015	315000
2617	20	Denver	Colorado	4	2015	315000
2618	20	Denver	Colorado	5	2015	320000
2619	20	Denver	Colorado	6	2015	324950
2620	20	Denver	Colorado	7	2015	315000
2621	20	Denver	Colorado	8	2015	312000
2622	20	Denver	Colorado	9	2015	305000
2623	20	Denver	Colorado	10	2015	308500
2624	20	Denver	Colorado	11	2015	311361
2625	20	Denver	Colorado	12	2015	310000
2626	20	Denver	Colorado	1	2016	315000
2627	20	Denver	Colorado	2	2016	327500
2628	20	Denver	Colorado	3	2016	340000
2629	20	Denver	Colorado	4	2016	343000
2630	20	Denver	Colorado	5	2016	358000
2631	20	Denver	Colorado	6	2016	359950
2632	20	Denver	Colorado	7	2016	355000
2633	20	Denver	Colorado	8	2016	346500
2634	20	Denver	Colorado	9	2016	346000
2635	20	Denver	Colorado	10	2016	345000
2636	20	Denver	Colorado	11	2016	347100
2637	20	Denver	Colorado	12	2016	345250
2638	20	Denver	Colorado	1	2017	348000
2639	20	Denver	Colorado	2	2017	352500
2640	20	Denver	Colorado	3	2017	368000
2641	20	Denver	Colorado	4	2017	379900
2642	20	Denver	Colorado	5	2017	377200
2643	20	Denver	Colorado	6	2017	390000
2644	20	Denver	Colorado	7	2017	380000
2645	20	Denver	Colorado	8	2017	375000
2646	20	Denver	Colorado	9	2017	372500
2647	20	Denver	Colorado	10	2017	375000
2648	20	Denver	Colorado	11	2017	370000
2649	20	Denver	Colorado	12	2017	380000
2650	20	Denver	Colorado	1	2018	380000
2651	20	Denver	Colorado	2	2018	397925
2652	20	Denver	Colorado	3	2018	403000
2653	20	Denver	Colorado	4	2018	415000
2654	20	Denver	Colorado	5	2018	418000
2655	20	Denver	Colorado	6	2018	415500
2656	20	Denver	Colorado	7	2018	410000
2657	20	Denver	Colorado	8	2018	405000
2658	20	Denver	Colorado	9	2018	395000
2659	20	Denver	Colorado	10	2018	396900
2660	20	Denver	Colorado	11	2018	392750
2661	20	Denver	Colorado	12	2018	395000
2662	20	Denver	Colorado	1	2019	0
2663	110	Providence	Rhode Island	1	2009	165000
2664	110	Providence	Rhode Island	2	2009	162750
2665	110	Providence	Rhode Island	3	2009	163950
2666	110	Providence	Rhode Island	4	2009	167250
2667	110	Providence	Rhode Island	5	2009	180000
2668	110	Providence	Rhode Island	6	2009	192000
2669	110	Providence	Rhode Island	7	2009	199900
2670	110	Providence	Rhode Island	8	2009	207000
2671	110	Providence	Rhode Island	9	2009	194000
2672	110	Providence	Rhode Island	10	2009	195000
2673	110	Providence	Rhode Island	11	2009	198000
2674	110	Providence	Rhode Island	12	2009	187750
2675	110	Providence	Rhode Island	1	2010	180000
2676	110	Providence	Rhode Island	2	2010	180000
2677	110	Providence	Rhode Island	3	2010	189000
2678	110	Providence	Rhode Island	4	2010	194000
2679	110	Providence	Rhode Island	5	2010	193000
2680	110	Providence	Rhode Island	6	2010	207000
2681	110	Providence	Rhode Island	7	2010	210000
2682	110	Providence	Rhode Island	8	2010	208000
2683	110	Providence	Rhode Island	9	2010	200000
2684	110	Providence	Rhode Island	10	2010	205000
2685	110	Providence	Rhode Island	11	2010	198000
2686	110	Providence	Rhode Island	12	2010	195000
2687	110	Providence	Rhode Island	1	2011	187951
2688	110	Providence	Rhode Island	2	2011	185000
2689	110	Providence	Rhode Island	3	2011	175000
2690	110	Providence	Rhode Island	4	2011	176900
2691	110	Providence	Rhode Island	5	2011	190000
2692	110	Providence	Rhode Island	6	2011	210000
2693	110	Providence	Rhode Island	7	2011	207050
2694	110	Providence	Rhode Island	8	2011	194000
2695	110	Providence	Rhode Island	9	2011	194250
2696	110	Providence	Rhode Island	10	2011	177750
2697	110	Providence	Rhode Island	11	2011	180000
2698	110	Providence	Rhode Island	12	2011	170000
2699	110	Providence	Rhode Island	1	2012	172400
2700	110	Providence	Rhode Island	2	2012	165000
2701	110	Providence	Rhode Island	3	2012	166850
2702	110	Providence	Rhode Island	4	2012	177750
2703	110	Providence	Rhode Island	5	2012	183750
2704	110	Providence	Rhode Island	6	2012	199900
2705	110	Providence	Rhode Island	7	2012	193500
2706	110	Providence	Rhode Island	8	2012	199700
2707	110	Providence	Rhode Island	9	2012	187500
2708	110	Providence	Rhode Island	10	2012	190000
2709	110	Providence	Rhode Island	11	2012	195000
2710	110	Providence	Rhode Island	12	2012	189650
2711	110	Providence	Rhode Island	1	2013	179250
2712	110	Providence	Rhode Island	2	2013	180000
2713	110	Providence	Rhode Island	3	2013	185000
2714	110	Providence	Rhode Island	4	2013	184000
2715	110	Providence	Rhode Island	5	2013	205000
2716	110	Providence	Rhode Island	6	2013	221250
2717	110	Providence	Rhode Island	7	2013	215000
2718	110	Providence	Rhode Island	8	2013	220000
2719	110	Providence	Rhode Island	9	2013	205000
2720	110	Providence	Rhode Island	10	2013	200000
2721	110	Providence	Rhode Island	11	2013	203000
2722	110	Providence	Rhode Island	12	2013	195000
2723	110	Providence	Rhode Island	1	2014	190000
2724	110	Providence	Rhode Island	2	2014	189000
2725	110	Providence	Rhode Island	3	2014	190000
2726	110	Providence	Rhode Island	4	2014	204900
2727	110	Providence	Rhode Island	5	2014	205000
2728	110	Providence	Rhode Island	6	2014	227000
2729	110	Providence	Rhode Island	7	2014	221000
2730	110	Providence	Rhode Island	8	2014	220000
2731	110	Providence	Rhode Island	9	2014	215000
2732	110	Providence	Rhode Island	10	2014	222000
2733	110	Providence	Rhode Island	11	2014	214500
2734	110	Providence	Rhode Island	12	2014	202875
2735	110	Providence	Rhode Island	1	2015	204500
2736	110	Providence	Rhode Island	2	2015	200000
2737	110	Providence	Rhode Island	3	2015	205000
2738	110	Providence	Rhode Island	4	2015	205950
2739	110	Providence	Rhode Island	5	2015	226750
2740	110	Providence	Rhode Island	6	2015	235000
2741	110	Providence	Rhode Island	7	2015	235000
2742	110	Providence	Rhode Island	8	2015	235000
2743	110	Providence	Rhode Island	9	2015	232000
2744	110	Providence	Rhode Island	10	2015	225900
2745	110	Providence	Rhode Island	11	2015	225000
2746	110	Providence	Rhode Island	12	2015	224000
2747	110	Providence	Rhode Island	1	2016	220000
2748	110	Providence	Rhode Island	2	2016	214000
2749	110	Providence	Rhode Island	3	2016	227000
2750	110	Providence	Rhode Island	4	2016	230000
2751	110	Providence	Rhode Island	5	2016	237550
2752	110	Providence	Rhode Island	6	2016	245000
2753	110	Providence	Rhode Island	7	2016	250000
2754	110	Providence	Rhode Island	8	2016	244500
2755	110	Providence	Rhode Island	9	2016	239900
2756	110	Providence	Rhode Island	10	2016	235000
2757	110	Providence	Rhode Island	11	2016	242500
2758	110	Providence	Rhode Island	12	2016	235000
2759	110	Providence	Rhode Island	1	2017	227500
2760	110	Providence	Rhode Island	2	2017	228188
2761	110	Providence	Rhode Island	3	2017	225000
2762	110	Providence	Rhode Island	4	2017	240000
2763	110	Providence	Rhode Island	5	2017	245950
2764	110	Providence	Rhode Island	6	2017	263650
2765	110	Providence	Rhode Island	7	2017	265000
2766	110	Providence	Rhode Island	8	2017	255000
2767	110	Providence	Rhode Island	9	2017	260000
2768	110	Providence	Rhode Island	10	2017	250500
2769	110	Providence	Rhode Island	11	2017	259900
2770	110	Providence	Rhode Island	12	2017	250000
2771	110	Providence	Rhode Island	1	2018	245000
2772	110	Providence	Rhode Island	2	2018	245000
2773	110	Providence	Rhode Island	3	2018	255000
2774	110	Providence	Rhode Island	4	2018	257500
2775	110	Providence	Rhode Island	5	2018	265000
2776	110	Providence	Rhode Island	6	2018	276750
2777	110	Providence	Rhode Island	7	2018	275000
2778	110	Providence	Rhode Island	8	2018	272000
2779	110	Providence	Rhode Island	9	2018	270000
2780	110	Providence	Rhode Island	10	2018	270000
2781	110	Providence	Rhode Island	11	2018	270000
2782	110	Providence	Rhode Island	12	2018	265000
2783	110	Providence	Rhode Island	1	2019	0
2784	159	Carson City	Nevada	1	2009	0
2785	159	Carson City	Nevada	2	2009	226500
2786	159	Carson City	Nevada	3	2009	223600
2787	159	Carson City	Nevada	4	2009	221000
2788	159	Carson City	Nevada	5	2009	217600
2789	159	Carson City	Nevada	6	2009	213600
2790	159	Carson City	Nevada	7	2009	209900
2791	159	Carson City	Nevada	8	2009	206500
2792	159	Carson City	Nevada	9	2009	203500
2793	159	Carson City	Nevada	10	2009	200700
2794	159	Carson City	Nevada	11	2009	198600
2795	159	Carson City	Nevada	12	2009	195700
2796	159	Carson City	Nevada	1	2010	193800
2797	159	Carson City	Nevada	2	2010	194900
2798	159	Carson City	Nevada	3	2010	193100
2799	159	Carson City	Nevada	4	2010	187400
2800	159	Carson City	Nevada	5	2010	183700
2801	159	Carson City	Nevada	6	2010	182900
2802	159	Carson City	Nevada	7	2010	181300
2803	159	Carson City	Nevada	8	2010	179200
2804	159	Carson City	Nevada	9	2010	177000
2805	159	Carson City	Nevada	10	2010	174600
2806	159	Carson City	Nevada	11	2010	171600
2807	159	Carson City	Nevada	12	2010	168600
2808	159	Carson City	Nevada	1	2011	165600
2809	159	Carson City	Nevada	2	2011	162000
2810	159	Carson City	Nevada	3	2011	158300
2811	159	Carson City	Nevada	4	2011	156100
2812	159	Carson City	Nevada	5	2011	155100
2813	159	Carson City	Nevada	6	2011	154000
2814	159	Carson City	Nevada	7	2011	152700
2815	159	Carson City	Nevada	8	2011	151900
2816	159	Carson City	Nevada	9	2011	151200
2817	159	Carson City	Nevada	10	2011	150400
2818	159	Carson City	Nevada	11	2011	149500
2819	159	Carson City	Nevada	12	2011	148900
2820	159	Carson City	Nevada	1	2012	148400
2821	159	Carson City	Nevada	2	2012	148000
2822	159	Carson City	Nevada	3	2012	148300
2823	159	Carson City	Nevada	4	2012	149100
2824	159	Carson City	Nevada	5	2012	149500
2825	159	Carson City	Nevada	6	2012	149600
2826	159	Carson City	Nevada	7	2012	150200
2827	159	Carson City	Nevada	8	2012	151400
2828	159	Carson City	Nevada	9	2012	152700
2829	159	Carson City	Nevada	10	2012	154200
2830	159	Carson City	Nevada	11	2012	155900
2831	159	Carson City	Nevada	12	2012	157700
2832	159	Carson City	Nevada	1	2013	159500
2833	159	Carson City	Nevada	2	2013	162300
2834	159	Carson City	Nevada	3	2013	166200
2835	159	Carson City	Nevada	4	2013	170300
2836	159	Carson City	Nevada	5	2013	173500
2837	159	Carson City	Nevada	6	2013	176900
2838	159	Carson City	Nevada	7	2013	179100
2839	159	Carson City	Nevada	8	2013	178700
2840	159	Carson City	Nevada	9	2013	177400
2841	159	Carson City	Nevada	10	2013	177300
2842	159	Carson City	Nevada	11	2013	178700
2843	159	Carson City	Nevada	12	2013	181100
2844	159	Carson City	Nevada	1	2014	183100
2845	159	Carson City	Nevada	2	2014	183100
2846	159	Carson City	Nevada	3	2014	183000
2847	159	Carson City	Nevada	4	2014	184700
2848	159	Carson City	Nevada	5	2014	187500
2849	159	Carson City	Nevada	6	2014	189600
2850	159	Carson City	Nevada	7	2014	192700
2851	159	Carson City	Nevada	8	2014	196100
2852	159	Carson City	Nevada	9	2014	199300
2853	159	Carson City	Nevada	10	2014	201800
2854	159	Carson City	Nevada	11	2014	204000
2855	159	Carson City	Nevada	12	2014	205700
2856	159	Carson City	Nevada	1	2015	206800
2857	159	Carson City	Nevada	2	2015	208600
2858	159	Carson City	Nevada	3	2015	210900
2859	159	Carson City	Nevada	4	2015	212400
2860	159	Carson City	Nevada	5	2015	213400
2861	159	Carson City	Nevada	6	2015	214600
2862	159	Carson City	Nevada	7	2015	215500
2863	159	Carson City	Nevada	8	2015	216900
2864	159	Carson City	Nevada	9	2015	219700
2865	159	Carson City	Nevada	10	2015	222400
2866	159	Carson City	Nevada	11	2015	224500
2867	159	Carson City	Nevada	12	2015	226500
2868	159	Carson City	Nevada	1	2016	228700
2869	159	Carson City	Nevada	2	2016	230900
2870	159	Carson City	Nevada	3	2016	233200
2871	159	Carson City	Nevada	4	2016	235000
2872	159	Carson City	Nevada	5	2016	236400
2873	159	Carson City	Nevada	6	2016	237500
2874	159	Carson City	Nevada	7	2016	239400
2875	159	Carson City	Nevada	8	2016	243000
2876	159	Carson City	Nevada	9	2016	247700
2877	159	Carson City	Nevada	10	2016	251000
2878	159	Carson City	Nevada	11	2016	253300
2879	159	Carson City	Nevada	12	2016	256100
2880	159	Carson City	Nevada	1	2017	259400
2881	159	Carson City	Nevada	2	2017	262300
2882	159	Carson City	Nevada	3	2017	265400
2883	159	Carson City	Nevada	4	2017	268500
2884	159	Carson City	Nevada	5	2017	270500
2885	159	Carson City	Nevada	6	2017	271400
2886	159	Carson City	Nevada	7	2017	272400
2887	159	Carson City	Nevada	8	2017	273600
2888	159	Carson City	Nevada	9	2017	274500
2889	159	Carson City	Nevada	10	2017	275200
2890	159	Carson City	Nevada	11	2017	275700
2891	159	Carson City	Nevada	12	2017	276100
2892	159	Carson City	Nevada	1	2018	277600
2893	159	Carson City	Nevada	2	2018	280000
2894	159	Carson City	Nevada	3	2018	282400
2895	159	Carson City	Nevada	4	2018	286700
2896	159	Carson City	Nevada	5	2018	291400
2897	159	Carson City	Nevada	6	2018	294900
2898	159	Carson City	Nevada	7	2018	298100
2899	159	Carson City	Nevada	8	2018	301500
2900	159	Carson City	Nevada	9	2018	304300
2901	159	Carson City	Nevada	10	2018	309300
2902	159	Carson City	Nevada	11	2018	315600
2903	159	Carson City	Nevada	12	2018	321400
2904	159	Carson City	Nevada	1	2019	325100
2905	14	Sacramento	California	1	2009	180000
2906	14	Sacramento	California	2	2009	180000
2907	14	Sacramento	California	3	2009	188000
2908	14	Sacramento	California	4	2009	188750
2909	14	Sacramento	California	5	2009	200000
2910	14	Sacramento	California	6	2009	205000
2911	14	Sacramento	California	7	2009	205000
2912	14	Sacramento	California	8	2009	205250
2913	14	Sacramento	California	9	2009	208000
2914	14	Sacramento	California	10	2009	210000
2915	14	Sacramento	California	11	2009	208000
2916	14	Sacramento	California	12	2009	206500
2917	14	Sacramento	California	1	2010	197000
2918	14	Sacramento	California	2	2010	195000
2919	14	Sacramento	California	3	2010	205000
2920	14	Sacramento	California	4	2010	204500
2921	14	Sacramento	California	5	2010	210000
2922	14	Sacramento	California	6	2010	210000
2923	14	Sacramento	California	7	2010	210000
2924	14	Sacramento	California	8	2010	205000
2925	14	Sacramento	California	9	2010	204000
2926	14	Sacramento	California	10	2010	199000
2927	14	Sacramento	California	11	2010	200000
2928	14	Sacramento	California	12	2010	191000
2929	14	Sacramento	California	1	2011	180000
2930	14	Sacramento	California	2	2011	180000
2931	14	Sacramento	California	3	2011	180000
2932	14	Sacramento	California	4	2011	185000
2933	14	Sacramento	California	5	2011	180000
2934	14	Sacramento	California	6	2011	185000
2935	14	Sacramento	California	7	2011	185000
2936	14	Sacramento	California	8	2011	185000
2937	14	Sacramento	California	9	2011	183750
2938	14	Sacramento	California	10	2011	177000
2939	14	Sacramento	California	11	2011	180000
2940	14	Sacramento	California	12	2011	178000
2941	14	Sacramento	California	1	2012	172750
2942	14	Sacramento	California	2	2012	176000
2943	14	Sacramento	California	3	2012	182500
2944	14	Sacramento	California	4	2012	185000
2945	14	Sacramento	California	5	2012	190000
2946	14	Sacramento	California	6	2012	195000
2947	14	Sacramento	California	7	2012	201000
2948	14	Sacramento	California	8	2012	205000
2949	14	Sacramento	California	9	2012	212000
2950	14	Sacramento	California	10	2012	210000
2951	14	Sacramento	California	11	2012	215000
2952	14	Sacramento	California	12	2012	220000
2953	14	Sacramento	California	1	2013	219000
2954	14	Sacramento	California	2	2013	225000
2955	14	Sacramento	California	3	2013	242000
2956	14	Sacramento	California	4	2013	247000
2957	14	Sacramento	California	5	2013	265000
2958	14	Sacramento	California	6	2013	270500
2959	14	Sacramento	California	7	2013	275000
2960	14	Sacramento	California	8	2013	275000
2961	14	Sacramento	California	9	2013	277000
2962	14	Sacramento	California	10	2013	275000
2963	14	Sacramento	California	11	2013	269000
2964	14	Sacramento	California	12	2013	272000
2965	14	Sacramento	California	1	2014	265000
2966	14	Sacramento	California	2	2014	280000
2967	14	Sacramento	California	3	2014	285500
2968	14	Sacramento	California	4	2014	287750
2969	14	Sacramento	California	5	2014	300000
2970	14	Sacramento	California	6	2014	300000
2971	14	Sacramento	California	7	2014	299000
2972	14	Sacramento	California	8	2014	300000
2973	14	Sacramento	California	9	2014	295150
2974	14	Sacramento	California	10	2014	296500
2975	14	Sacramento	California	11	2014	287500
2976	14	Sacramento	California	12	2014	296500
2977	14	Sacramento	California	1	2015	280000
2978	14	Sacramento	California	2	2015	305000
2979	14	Sacramento	California	3	2015	305000
2980	14	Sacramento	California	4	2015	315000
2981	14	Sacramento	California	5	2015	325000
2982	14	Sacramento	California	6	2015	325000
2983	14	Sacramento	California	7	2015	319000
2984	14	Sacramento	California	8	2015	315000
2985	14	Sacramento	California	9	2015	315000
2986	14	Sacramento	California	10	2015	315000
2987	14	Sacramento	California	11	2015	320000
2988	14	Sacramento	California	12	2015	320000
2989	14	Sacramento	California	1	2016	315000
2990	14	Sacramento	California	2	2016	320000
3117	120	Provo	Utah	8	2016	270000
2991	14	Sacramento	California	3	2016	331000
2992	14	Sacramento	California	4	2016	337250
2993	14	Sacramento	California	5	2016	349000
2994	14	Sacramento	California	6	2016	355000
2995	14	Sacramento	California	7	2016	348000
2996	14	Sacramento	California	8	2016	350000
2997	14	Sacramento	California	9	2016	346000
2998	14	Sacramento	California	10	2016	345000
2999	14	Sacramento	California	11	2016	345000
3000	14	Sacramento	California	12	2016	340000
3001	14	Sacramento	California	1	2017	330000
3002	14	Sacramento	California	2	2017	340000
3003	14	Sacramento	California	3	2017	350000
3004	14	Sacramento	California	4	2017	358750
3005	14	Sacramento	California	5	2017	375000
3006	14	Sacramento	California	6	2017	378000
3007	14	Sacramento	California	7	2017	380000
3008	14	Sacramento	California	8	2017	380000
3009	14	Sacramento	California	9	2017	375000
3010	14	Sacramento	California	10	2017	375000
3011	14	Sacramento	California	11	2017	377750
3012	14	Sacramento	California	12	2017	375000
3013	14	Sacramento	California	1	2018	369000
3014	14	Sacramento	California	2	2018	376000
3015	14	Sacramento	California	3	2018	388000
3016	14	Sacramento	California	4	2018	395000
3017	14	Sacramento	California	5	2018	405000
3018	14	Sacramento	California	6	2018	405000
3019	14	Sacramento	California	7	2018	400000
3020	14	Sacramento	California	8	2018	392000
3021	14	Sacramento	California	9	2018	395000
3022	14	Sacramento	California	10	2018	386000
3023	14	Sacramento	California	11	2018	387500
3024	14	Sacramento	California	12	2018	390000
3025	14	Sacramento	California	1	2019	0
3026	120	Provo	Utah	1	2009	211000
3027	120	Provo	Utah	2	2009	217000
3028	120	Provo	Utah	3	2009	211000
3029	120	Provo	Utah	4	2009	202500
3030	120	Provo	Utah	5	2009	207000
3031	120	Provo	Utah	6	2009	200000
3032	120	Provo	Utah	7	2009	205000
3033	120	Provo	Utah	8	2009	203900
3034	120	Provo	Utah	9	2009	203900
3035	120	Provo	Utah	10	2009	198350
3036	120	Provo	Utah	11	2009	195441
3037	120	Provo	Utah	12	2009	201000
3038	120	Provo	Utah	1	2010	209950
3039	120	Provo	Utah	2	2010	195500
3040	120	Provo	Utah	3	2010	191000
3041	120	Provo	Utah	4	2010	185000
3042	120	Provo	Utah	5	2010	186150
3043	120	Provo	Utah	6	2010	195000
3044	120	Provo	Utah	7	2010	199000
3045	120	Provo	Utah	8	2010	190750
3046	120	Provo	Utah	9	2010	189050
3047	120	Provo	Utah	10	2010	189500
3048	120	Provo	Utah	11	2010	184900
3049	120	Provo	Utah	12	2010	187000
3050	120	Provo	Utah	1	2011	181375
3051	120	Provo	Utah	2	2011	179900
3052	120	Provo	Utah	3	2011	175000
3053	120	Provo	Utah	4	2011	180000
3054	120	Provo	Utah	5	2011	179900
3055	120	Provo	Utah	6	2011	174900
3056	120	Provo	Utah	7	2011	174650
3057	120	Provo	Utah	8	2011	183950
3058	120	Provo	Utah	9	2011	181500
3059	120	Provo	Utah	10	2011	177750
3060	120	Provo	Utah	11	2011	177250
3061	120	Provo	Utah	12	2011	172000
3062	120	Provo	Utah	1	2012	164900
3063	120	Provo	Utah	2	2012	180000
3064	120	Provo	Utah	3	2012	175000
3065	120	Provo	Utah	4	2012	183701
3066	120	Provo	Utah	5	2012	177635
3067	120	Provo	Utah	6	2012	183500
3068	120	Provo	Utah	7	2012	193350
3069	120	Provo	Utah	8	2012	194200
3070	120	Provo	Utah	9	2012	192500
3071	120	Provo	Utah	10	2012	193000
3072	120	Provo	Utah	11	2012	190000
3073	120	Provo	Utah	12	2012	190000
3074	120	Provo	Utah	1	2013	198000
3075	120	Provo	Utah	2	2013	200000
3076	120	Provo	Utah	3	2013	192000
3077	120	Provo	Utah	4	2013	191000
3078	120	Provo	Utah	5	2013	212600
3079	120	Provo	Utah	6	2013	212000
3080	120	Provo	Utah	7	2013	215500
3081	120	Provo	Utah	8	2013	212256
3082	120	Provo	Utah	9	2013	215000
3083	120	Provo	Utah	10	2013	211098
3084	120	Provo	Utah	11	2013	217378
3085	120	Provo	Utah	12	2013	219525
3086	120	Provo	Utah	1	2014	207630
3087	120	Provo	Utah	2	2014	210000
3088	120	Provo	Utah	3	2014	213250
3089	120	Provo	Utah	4	2014	215000
3090	120	Provo	Utah	5	2014	219900
3091	120	Provo	Utah	6	2014	228000
3092	120	Provo	Utah	7	2014	228000
3093	120	Provo	Utah	8	2014	230000
3094	120	Provo	Utah	9	2014	215000
3095	120	Provo	Utah	10	2014	223500
3096	120	Provo	Utah	11	2014	224081
3097	120	Provo	Utah	12	2014	234750
3098	120	Provo	Utah	1	2015	222300
3099	120	Provo	Utah	2	2015	228000
3100	120	Provo	Utah	3	2015	230000
3101	120	Provo	Utah	4	2015	225000
3102	120	Provo	Utah	5	2015	230000
3103	120	Provo	Utah	6	2015	243000
3104	120	Provo	Utah	7	2015	234150
3105	120	Provo	Utah	8	2015	235000
3106	120	Provo	Utah	9	2015	242000
3107	120	Provo	Utah	10	2015	238900
3108	120	Provo	Utah	11	2015	247000
3109	120	Provo	Utah	12	2015	244950
3110	120	Provo	Utah	1	2016	242000
3111	120	Provo	Utah	2	2016	252750
3112	120	Provo	Utah	3	2016	243000
3113	120	Provo	Utah	4	2016	251900
3114	120	Provo	Utah	5	2016	255000
3115	120	Provo	Utah	6	2016	259700
3116	120	Provo	Utah	7	2016	257300
3118	120	Provo	Utah	9	2016	255250
3119	120	Provo	Utah	10	2016	253000
3120	120	Provo	Utah	11	2016	255298
3121	120	Provo	Utah	12	2016	260000
3122	120	Provo	Utah	1	2017	259900
3123	120	Provo	Utah	2	2017	263400
3124	120	Provo	Utah	3	2017	265000
3125	120	Provo	Utah	4	2017	272000
3126	120	Provo	Utah	5	2017	270250
3127	120	Provo	Utah	6	2017	273000
3128	120	Provo	Utah	7	2017	277250
3129	120	Provo	Utah	8	2017	278106
3130	120	Provo	Utah	9	2017	274000
3131	120	Provo	Utah	10	2017	281500
3132	120	Provo	Utah	11	2017	284595
3133	120	Provo	Utah	12	2017	275000
3134	120	Provo	Utah	1	2018	280000
3135	120	Provo	Utah	2	2018	302900
3136	120	Provo	Utah	3	2018	290500
3137	120	Provo	Utah	4	2018	299873
3138	120	Provo	Utah	5	2018	311525
3139	120	Provo	Utah	6	2018	317900
3140	120	Provo	Utah	7	2018	317745
3141	120	Provo	Utah	8	2018	316569
3142	120	Provo	Utah	9	2018	315390
3143	120	Provo	Utah	10	2018	309102
3144	120	Provo	Utah	11	2018	309122
3145	120	Provo	Utah	12	2018	316661
3146	120	Provo	Utah	1	2019	0
3147	129	Madison	Wisconsin	1	2009	190000
3148	129	Madison	Wisconsin	2	2009	190000
3149	129	Madison	Wisconsin	3	2009	189000
3150	129	Madison	Wisconsin	4	2009	187500
3151	129	Madison	Wisconsin	5	2009	193000
3152	129	Madison	Wisconsin	6	2009	193900
3153	129	Madison	Wisconsin	7	2009	197000
3154	129	Madison	Wisconsin	8	2009	203000
3155	129	Madison	Wisconsin	9	2009	186000
3156	129	Madison	Wisconsin	10	2009	181200
3157	129	Madison	Wisconsin	11	2009	182000
3158	129	Madison	Wisconsin	12	2009	180000
3159	129	Madison	Wisconsin	1	2010	181500
3160	129	Madison	Wisconsin	2	2010	191500
3161	129	Madison	Wisconsin	3	2010	190000
3162	129	Madison	Wisconsin	4	2010	187000
3163	129	Madison	Wisconsin	5	2010	193000
3164	129	Madison	Wisconsin	6	2010	199900
3165	129	Madison	Wisconsin	7	2010	212000
3166	129	Madison	Wisconsin	8	2010	207144
3167	129	Madison	Wisconsin	9	2010	193600
3168	129	Madison	Wisconsin	10	2010	193500
3169	129	Madison	Wisconsin	11	2010	197400
3170	129	Madison	Wisconsin	12	2010	201750
3171	129	Madison	Wisconsin	1	2011	192700
3172	129	Madison	Wisconsin	2	2011	184500
3173	129	Madison	Wisconsin	3	2011	191500
3174	129	Madison	Wisconsin	4	2011	179900
3175	129	Madison	Wisconsin	5	2011	195000
3176	129	Madison	Wisconsin	6	2011	195000
3177	129	Madison	Wisconsin	7	2011	205000
3178	129	Madison	Wisconsin	8	2011	198000
3179	129	Madison	Wisconsin	9	2011	185000
3180	129	Madison	Wisconsin	10	2011	185000
3181	129	Madison	Wisconsin	11	2011	199950
3182	129	Madison	Wisconsin	12	2011	184000
3183	129	Madison	Wisconsin	1	2012	175000
3184	129	Madison	Wisconsin	2	2012	170000
3185	129	Madison	Wisconsin	3	2012	173400
3186	129	Madison	Wisconsin	4	2012	192000
3187	129	Madison	Wisconsin	5	2012	192000
3188	129	Madison	Wisconsin	6	2012	197500
3189	129	Madison	Wisconsin	7	2012	187850
3190	129	Madison	Wisconsin	8	2012	200000
3191	129	Madison	Wisconsin	9	2012	186500
3192	129	Madison	Wisconsin	10	2012	184450
3193	129	Madison	Wisconsin	11	2012	185000
3194	129	Madison	Wisconsin	12	2012	185000
3195	129	Madison	Wisconsin	1	2013	183500
3196	129	Madison	Wisconsin	2	2013	177250
3197	129	Madison	Wisconsin	3	2013	185500
3198	129	Madison	Wisconsin	4	2013	198000
3199	129	Madison	Wisconsin	5	2013	195000
3200	129	Madison	Wisconsin	6	2013	210000
3201	129	Madison	Wisconsin	7	2013	208646
3202	129	Madison	Wisconsin	8	2013	209450
3203	129	Madison	Wisconsin	9	2013	199900
3204	129	Madison	Wisconsin	10	2013	199900
3205	129	Madison	Wisconsin	11	2013	200000
3206	129	Madison	Wisconsin	12	2013	191950
3207	129	Madison	Wisconsin	1	2014	185000
3208	129	Madison	Wisconsin	2	2014	186000
3209	129	Madison	Wisconsin	3	2014	192500
3210	129	Madison	Wisconsin	4	2014	195000
3211	129	Madison	Wisconsin	5	2014	203000
3212	129	Madison	Wisconsin	6	2014	209900
3213	129	Madison	Wisconsin	7	2014	229450
3214	129	Madison	Wisconsin	8	2014	216200
3215	129	Madison	Wisconsin	9	2014	210250
3216	129	Madison	Wisconsin	10	2014	204000
3217	129	Madison	Wisconsin	11	2014	214950
3218	129	Madison	Wisconsin	12	2014	200500
3219	129	Madison	Wisconsin	1	2015	197250
3220	129	Madison	Wisconsin	2	2015	202000
3221	129	Madison	Wisconsin	3	2015	210750
3222	129	Madison	Wisconsin	4	2015	219900
3223	129	Madison	Wisconsin	5	2015	219463
3224	129	Madison	Wisconsin	6	2015	222000
3225	129	Madison	Wisconsin	7	2015	225000
3226	129	Madison	Wisconsin	8	2015	231850
3227	129	Madison	Wisconsin	9	2015	222000
3228	129	Madison	Wisconsin	10	2015	215000
3229	129	Madison	Wisconsin	11	2015	224000
3230	129	Madison	Wisconsin	12	2015	223600
3231	129	Madison	Wisconsin	1	2016	225000
3232	129	Madison	Wisconsin	2	2016	213000
3233	129	Madison	Wisconsin	3	2016	220475
3234	129	Madison	Wisconsin	4	2016	228325
3235	129	Madison	Wisconsin	5	2016	223000
3236	129	Madison	Wisconsin	6	2016	238000
3237	129	Madison	Wisconsin	7	2016	244900
3238	129	Madison	Wisconsin	8	2016	242000
3239	129	Madison	Wisconsin	9	2016	236900
3240	129	Madison	Wisconsin	10	2016	226900
3241	129	Madison	Wisconsin	11	2016	236500
3242	129	Madison	Wisconsin	12	2016	240250
3243	129	Madison	Wisconsin	1	2017	225000
3244	129	Madison	Wisconsin	2	2017	232000
3245	129	Madison	Wisconsin	3	2017	245000
3246	129	Madison	Wisconsin	4	2017	249900
3247	129	Madison	Wisconsin	5	2017	246250
3248	129	Madison	Wisconsin	6	2017	264500
3249	129	Madison	Wisconsin	7	2017	255000
3250	129	Madison	Wisconsin	8	2017	260750
3251	129	Madison	Wisconsin	9	2017	250000
3252	129	Madison	Wisconsin	10	2017	248650
3253	129	Madison	Wisconsin	11	2017	250000
3254	129	Madison	Wisconsin	12	2017	241600
3255	129	Madison	Wisconsin	1	2018	253000
3256	129	Madison	Wisconsin	2	2018	250000
3257	129	Madison	Wisconsin	3	2018	265000
3258	129	Madison	Wisconsin	4	2018	255000
3259	129	Madison	Wisconsin	5	2018	266400
3260	129	Madison	Wisconsin	6	2018	278000
3261	129	Madison	Wisconsin	7	2018	275000
3262	129	Madison	Wisconsin	8	2018	269900
3263	129	Madison	Wisconsin	9	2018	258200
3264	129	Madison	Wisconsin	10	2018	260000
3265	129	Madison	Wisconsin	11	2018	269700
3266	129	Madison	Wisconsin	12	2018	255500
3267	129	Madison	Wisconsin	1	2019	0
3268	47	Chicago	Illinois	1	2009	177000
3269	47	Chicago	Illinois	2	2009	172000
3270	47	Chicago	Illinois	3	2009	180000
3271	47	Chicago	Illinois	4	2009	182000
3272	47	Chicago	Illinois	5	2009	185000
3273	47	Chicago	Illinois	6	2009	199000
3274	47	Chicago	Illinois	7	2009	202000
3275	47	Chicago	Illinois	8	2009	202500
3276	47	Chicago	Illinois	9	2009	190000
3277	47	Chicago	Illinois	10	2009	185000
3278	47	Chicago	Illinois	11	2009	185000
3279	47	Chicago	Illinois	12	2009	185000
3280	47	Chicago	Illinois	1	2010	167000
3281	47	Chicago	Illinois	2	2010	160000
3282	47	Chicago	Illinois	3	2010	168500
3283	47	Chicago	Illinois	4	2010	176500
3284	47	Chicago	Illinois	5	2010	185000
3285	47	Chicago	Illinois	6	2010	200000
3286	47	Chicago	Illinois	7	2010	190000
3287	47	Chicago	Illinois	8	2010	190000
3288	47	Chicago	Illinois	9	2010	175000
3289	47	Chicago	Illinois	10	2010	173750
3290	47	Chicago	Illinois	11	2010	170000
3291	47	Chicago	Illinois	12	2010	170000
3292	47	Chicago	Illinois	1	2011	160000
3293	47	Chicago	Illinois	2	2011	144000
3294	47	Chicago	Illinois	3	2011	149500
3295	47	Chicago	Illinois	4	2011	160000
3296	47	Chicago	Illinois	5	2011	159000
3297	47	Chicago	Illinois	6	2011	170000
3298	47	Chicago	Illinois	7	2011	180000
3299	47	Chicago	Illinois	8	2011	178315
3300	47	Chicago	Illinois	9	2011	160000
3301	47	Chicago	Illinois	10	2011	154450
3302	47	Chicago	Illinois	11	2011	150000
3303	47	Chicago	Illinois	12	2011	144500
3304	47	Chicago	Illinois	1	2012	140000
3305	47	Chicago	Illinois	2	2012	132000
3306	47	Chicago	Illinois	3	2012	141600
3307	47	Chicago	Illinois	4	2012	155000
3308	47	Chicago	Illinois	5	2012	160000
3309	47	Chicago	Illinois	6	2012	175000
3310	47	Chicago	Illinois	7	2012	174502
3311	47	Chicago	Illinois	8	2012	170000
3312	47	Chicago	Illinois	9	2012	165000
3313	47	Chicago	Illinois	10	2012	153000
3314	47	Chicago	Illinois	11	2012	153250
3315	47	Chicago	Illinois	12	2012	150500
3316	47	Chicago	Illinois	1	2013	145000
3317	47	Chicago	Illinois	2	2013	135750
3318	47	Chicago	Illinois	3	2013	145500
3319	47	Chicago	Illinois	4	2013	160000
3320	47	Chicago	Illinois	5	2013	173000
3321	47	Chicago	Illinois	6	2013	193000
3322	47	Chicago	Illinois	7	2013	202000
3323	47	Chicago	Illinois	8	2013	198000
3324	47	Chicago	Illinois	9	2013	186000
3325	47	Chicago	Illinois	10	2013	182000
3326	47	Chicago	Illinois	11	2013	172000
3327	47	Chicago	Illinois	12	2013	175000
3328	47	Chicago	Illinois	1	2014	165000
3329	47	Chicago	Illinois	2	2014	156000
3330	47	Chicago	Illinois	3	2014	168000
3331	47	Chicago	Illinois	4	2014	180000
3332	47	Chicago	Illinois	5	2014	200000
3333	47	Chicago	Illinois	6	2014	215000
3334	47	Chicago	Illinois	7	2014	215000
3335	47	Chicago	Illinois	8	2014	217000
3336	47	Chicago	Illinois	9	2014	198000
3337	47	Chicago	Illinois	10	2014	190000
3338	47	Chicago	Illinois	11	2014	184800
3339	47	Chicago	Illinois	12	2014	185000
3340	47	Chicago	Illinois	1	2015	178000
3341	47	Chicago	Illinois	2	2015	170000
3342	47	Chicago	Illinois	3	2015	185000
3343	47	Chicago	Illinois	4	2015	205000
3344	47	Chicago	Illinois	5	2015	218000
3345	47	Chicago	Illinois	6	2015	230000
3346	47	Chicago	Illinois	7	2015	227500
3347	47	Chicago	Illinois	8	2015	223700
3348	47	Chicago	Illinois	9	2015	207000
3349	47	Chicago	Illinois	10	2015	205000
3350	47	Chicago	Illinois	11	2015	198000
3351	47	Chicago	Illinois	12	2015	199500
3352	47	Chicago	Illinois	1	2016	190000
3353	47	Chicago	Illinois	2	2016	186750
3354	47	Chicago	Illinois	3	2016	201000
3355	47	Chicago	Illinois	4	2016	223000
3356	47	Chicago	Illinois	5	2016	230000
3357	47	Chicago	Illinois	6	2016	239833
3358	47	Chicago	Illinois	7	2016	240000
3359	47	Chicago	Illinois	8	2016	232500
3360	47	Chicago	Illinois	9	2016	222000
3361	47	Chicago	Illinois	10	2016	216000
3362	47	Chicago	Illinois	11	2016	215000
3363	47	Chicago	Illinois	12	2016	215000
3364	47	Chicago	Illinois	1	2017	210000
3365	47	Chicago	Illinois	2	2017	202500
3366	47	Chicago	Illinois	3	2017	225000
3367	47	Chicago	Illinois	4	2017	240000
3368	47	Chicago	Illinois	5	2017	245000
3369	47	Chicago	Illinois	6	2017	250000
3370	47	Chicago	Illinois	7	2017	250000
3371	47	Chicago	Illinois	8	2017	242000
3372	47	Chicago	Illinois	9	2017	230000
3373	47	Chicago	Illinois	10	2017	225000
3374	47	Chicago	Illinois	11	2017	225000
3375	47	Chicago	Illinois	12	2017	225000
3376	47	Chicago	Illinois	1	2018	219900
3377	47	Chicago	Illinois	2	2018	224000
3378	47	Chicago	Illinois	3	2018	239200
3379	47	Chicago	Illinois	4	2018	245050
3380	47	Chicago	Illinois	5	2018	252000
3381	47	Chicago	Illinois	6	2018	261000
3382	47	Chicago	Illinois	7	2018	255000
3383	47	Chicago	Illinois	8	2018	242500
3384	47	Chicago	Illinois	9	2018	239000
3385	47	Chicago	Illinois	10	2018	230000
3386	47	Chicago	Illinois	11	2018	230000
3387	47	Chicago	Illinois	12	2018	226000
3388	47	Chicago	Illinois	1	2019	0
3389	124	Richmond	Virginia	1	2009	191500
3390	124	Richmond	Virginia	2	2009	190000
3391	124	Richmond	Virginia	3	2009	196900
3392	124	Richmond	Virginia	4	2009	190000
3393	124	Richmond	Virginia	5	2009	209950
3394	124	Richmond	Virginia	6	2009	209250
3395	124	Richmond	Virginia	7	2009	195000
3396	124	Richmond	Virginia	8	2009	202500
3397	124	Richmond	Virginia	9	2009	190000
3398	124	Richmond	Virginia	10	2009	194750
3399	124	Richmond	Virginia	11	2009	192950
3400	124	Richmond	Virginia	12	2009	204550
3401	124	Richmond	Virginia	1	2010	180000
3402	124	Richmond	Virginia	2	2010	185000
3403	124	Richmond	Virginia	3	2010	184900
3404	124	Richmond	Virginia	4	2010	191500
3405	124	Richmond	Virginia	5	2010	193000
3406	124	Richmond	Virginia	6	2010	195000
3407	124	Richmond	Virginia	7	2010	205000
3408	124	Richmond	Virginia	8	2010	205000
3409	124	Richmond	Virginia	9	2010	190000
3410	124	Richmond	Virginia	10	2010	180000
3411	124	Richmond	Virginia	11	2010	180000
3412	124	Richmond	Virginia	12	2010	190000
3413	124	Richmond	Virginia	1	2011	171000
3414	124	Richmond	Virginia	2	2011	163725
3415	124	Richmond	Virginia	3	2011	178500
3416	124	Richmond	Virginia	4	2011	178000
3417	124	Richmond	Virginia	5	2011	174950
3418	124	Richmond	Virginia	6	2011	189950
3419	124	Richmond	Virginia	7	2011	190000
3420	124	Richmond	Virginia	8	2011	193000
3421	124	Richmond	Virginia	9	2011	179000
3422	124	Richmond	Virginia	10	2011	168000
3423	124	Richmond	Virginia	11	2011	173500
3424	124	Richmond	Virginia	12	2011	176000
3425	124	Richmond	Virginia	1	2012	152950
3426	124	Richmond	Virginia	2	2012	163076
3427	124	Richmond	Virginia	3	2012	169900
3428	124	Richmond	Virginia	4	2012	180375
3429	124	Richmond	Virginia	5	2012	182950
3430	124	Richmond	Virginia	6	2012	205000
3431	124	Richmond	Virginia	7	2012	197000
3432	124	Richmond	Virginia	8	2012	185000
3433	124	Richmond	Virginia	9	2012	180000
3434	124	Richmond	Virginia	10	2012	174250
3435	124	Richmond	Virginia	11	2012	185000
3436	124	Richmond	Virginia	12	2012	190075
3437	124	Richmond	Virginia	1	2013	170000
3438	124	Richmond	Virginia	2	2013	176500
3439	124	Richmond	Virginia	3	2013	185000
3440	124	Richmond	Virginia	4	2013	185600
3441	124	Richmond	Virginia	5	2013	196000
3442	124	Richmond	Virginia	6	2013	210000
3443	124	Richmond	Virginia	7	2013	209000
3444	124	Richmond	Virginia	8	2013	210000
3445	124	Richmond	Virginia	9	2013	195000
3446	124	Richmond	Virginia	10	2013	192500
3447	124	Richmond	Virginia	11	2013	189000
3448	124	Richmond	Virginia	12	2013	200000
3449	124	Richmond	Virginia	1	2014	185000
3450	124	Richmond	Virginia	2	2014	180720
3451	124	Richmond	Virginia	3	2014	198550
3452	124	Richmond	Virginia	4	2014	200000
3453	124	Richmond	Virginia	5	2014	205000
3454	124	Richmond	Virginia	6	2014	220000
3455	124	Richmond	Virginia	7	2014	210000
3456	124	Richmond	Virginia	8	2014	217000
3457	124	Richmond	Virginia	9	2014	209500
3458	124	Richmond	Virginia	10	2014	202000
3459	124	Richmond	Virginia	11	2014	205108
3460	124	Richmond	Virginia	12	2014	215000
3461	124	Richmond	Virginia	1	2015	185000
3462	124	Richmond	Virginia	2	2015	196938
3463	124	Richmond	Virginia	3	2015	205000
3464	124	Richmond	Virginia	4	2015	203722
3465	124	Richmond	Virginia	5	2015	220000
3466	124	Richmond	Virginia	6	2015	227500
3467	124	Richmond	Virginia	7	2015	225000
3468	124	Richmond	Virginia	8	2015	223000
3469	124	Richmond	Virginia	9	2015	212750
3470	124	Richmond	Virginia	10	2015	213800
3471	124	Richmond	Virginia	11	2015	212000
3472	124	Richmond	Virginia	12	2015	217500
3473	124	Richmond	Virginia	1	2016	201500
3474	124	Richmond	Virginia	2	2016	197975
3475	124	Richmond	Virginia	3	2016	214900
3476	124	Richmond	Virginia	4	2016	218000
3477	124	Richmond	Virginia	5	2016	225000
3478	124	Richmond	Virginia	6	2016	234900
3479	124	Richmond	Virginia	7	2016	231000
3480	124	Richmond	Virginia	8	2016	229725
3481	124	Richmond	Virginia	9	2016	219975
3482	124	Richmond	Virginia	10	2016	225000
3483	124	Richmond	Virginia	11	2016	230000
3484	124	Richmond	Virginia	12	2016	224000
3485	124	Richmond	Virginia	1	2017	220150
3486	124	Richmond	Virginia	2	2017	220500
3487	124	Richmond	Virginia	3	2017	225100
3488	124	Richmond	Virginia	4	2017	227918
3489	124	Richmond	Virginia	5	2017	239700
3490	124	Richmond	Virginia	6	2017	249000
3491	124	Richmond	Virginia	7	2017	250000
3492	124	Richmond	Virginia	8	2017	245000
3493	124	Richmond	Virginia	9	2017	234900
3494	124	Richmond	Virginia	10	2017	222500
3495	124	Richmond	Virginia	11	2017	235000
3496	124	Richmond	Virginia	12	2017	242500
3497	124	Richmond	Virginia	1	2018	223000
3498	124	Richmond	Virginia	2	2018	226750
3499	124	Richmond	Virginia	3	2018	238700
3500	124	Richmond	Virginia	4	2018	240000
3501	124	Richmond	Virginia	5	2018	245000
3502	124	Richmond	Virginia	6	2018	252500
3503	124	Richmond	Virginia	7	2018	254500
3504	124	Richmond	Virginia	8	2018	250000
3505	124	Richmond	Virginia	9	2018	235500
3506	124	Richmond	Virginia	10	2018	239000
3507	124	Richmond	Virginia	11	2018	242000
3508	124	Richmond	Virginia	12	2018	235000
3509	124	Richmond	Virginia	1	2019	0
3510	147	South Portland	Maine	1	2009	0
3511	147	South Portland	Maine	2	2009	201900
3512	147	South Portland	Maine	3	2009	201400
3513	147	South Portland	Maine	4	2009	201000
3514	147	South Portland	Maine	5	2009	200300
3515	147	South Portland	Maine	6	2009	199400
3516	147	South Portland	Maine	7	2009	198500
3517	147	South Portland	Maine	8	2009	197800
3518	147	South Portland	Maine	9	2009	197100
3519	147	South Portland	Maine	10	2009	196500
3520	147	South Portland	Maine	11	2009	196200
3521	147	South Portland	Maine	12	2009	196000
3522	147	South Portland	Maine	1	2010	196000
3523	147	South Portland	Maine	2	2010	196300
3524	147	South Portland	Maine	3	2010	196300
3525	147	South Portland	Maine	4	2010	196300
3526	147	South Portland	Maine	5	2010	197000
3527	147	South Portland	Maine	6	2010	198100
3528	147	South Portland	Maine	7	2010	198500
3529	147	South Portland	Maine	8	2010	198500
3530	147	South Portland	Maine	9	2010	198400
3531	147	South Portland	Maine	10	2010	198100
3532	147	South Portland	Maine	11	2010	197300
3533	147	South Portland	Maine	12	2010	196400
3534	147	South Portland	Maine	1	2011	195400
3535	147	South Portland	Maine	2	2011	194400
3536	147	South Portland	Maine	3	2011	193600
3537	147	South Portland	Maine	4	2011	193000
3538	147	South Portland	Maine	5	2011	192700
3539	147	South Portland	Maine	6	2011	192700
3540	147	South Portland	Maine	7	2011	192700
3541	147	South Portland	Maine	8	2011	192700
3542	147	South Portland	Maine	9	2011	192700
3543	147	South Portland	Maine	10	2011	192700
3544	147	South Portland	Maine	11	2011	192400
3545	147	South Portland	Maine	12	2011	192200
3546	147	South Portland	Maine	1	2012	191900
3547	147	South Portland	Maine	2	2012	191600
3548	147	South Portland	Maine	3	2012	191500
3549	147	South Portland	Maine	4	2012	191700
3550	147	South Portland	Maine	5	2012	191600
3551	147	South Portland	Maine	6	2012	191700
3552	147	South Portland	Maine	7	2012	192300
3553	147	South Portland	Maine	8	2012	193200
3554	147	South Portland	Maine	9	2012	194000
3555	147	South Portland	Maine	10	2012	194900
3556	147	South Portland	Maine	11	2012	195700
3557	147	South Portland	Maine	12	2012	196600
3558	147	South Portland	Maine	1	2013	197700
3559	147	South Portland	Maine	2	2013	198800
3560	147	South Portland	Maine	3	2013	200000
3561	147	South Portland	Maine	4	2013	200700
3562	147	South Portland	Maine	5	2013	200700
3563	147	South Portland	Maine	6	2013	200300
3564	147	South Portland	Maine	7	2013	200100
3565	147	South Portland	Maine	8	2013	200000
3566	147	South Portland	Maine	9	2013	199900
3567	147	South Portland	Maine	10	2013	199500
3568	147	South Portland	Maine	11	2013	199700
3569	147	South Portland	Maine	12	2013	200000
3570	147	South Portland	Maine	1	2014	200300
3571	147	South Portland	Maine	2	2014	201000
3572	147	South Portland	Maine	3	2014	201800
3573	147	South Portland	Maine	4	2014	203200
3574	147	South Portland	Maine	5	2014	205600
3575	147	South Portland	Maine	6	2014	208400
3576	147	South Portland	Maine	7	2014	210200
3577	147	South Portland	Maine	8	2014	211300
3578	147	South Portland	Maine	9	2014	212300
3579	147	South Portland	Maine	10	2014	213600
3580	147	South Portland	Maine	11	2014	215700
3581	147	South Portland	Maine	12	2014	218000
3582	147	South Portland	Maine	1	2015	220100
3583	147	South Portland	Maine	2	2015	221500
3584	147	South Portland	Maine	3	2015	222400
3585	147	South Portland	Maine	4	2015	222800
3586	147	South Portland	Maine	5	2015	223300
3587	147	South Portland	Maine	6	2015	224000
3588	147	South Portland	Maine	7	2015	224200
3589	147	South Portland	Maine	8	2015	223800
3590	147	South Portland	Maine	9	2015	223900
3591	147	South Portland	Maine	10	2015	224900
3592	147	South Portland	Maine	11	2015	225900
3593	147	South Portland	Maine	12	2015	225600
3594	147	South Portland	Maine	1	2016	225400
3595	147	South Portland	Maine	2	2016	226600
3596	147	South Portland	Maine	3	2016	229200
3597	147	South Portland	Maine	4	2016	232600
3598	147	South Portland	Maine	5	2016	235600
3599	147	South Portland	Maine	6	2016	237600
3600	147	South Portland	Maine	7	2016	239300
3601	147	South Portland	Maine	8	2016	241200
3602	147	South Portland	Maine	9	2016	243300
3603	147	South Portland	Maine	10	2016	245500
3604	147	South Portland	Maine	11	2016	247400
3605	147	South Portland	Maine	12	2016	249200
3606	147	South Portland	Maine	1	2017	251100
3607	147	South Portland	Maine	2	2017	253600
3608	147	South Portland	Maine	3	2017	256500
3609	147	South Portland	Maine	4	2017	258200
3610	147	South Portland	Maine	5	2017	258800
3611	147	South Portland	Maine	6	2017	259500
3612	147	South Portland	Maine	7	2017	260600
3613	147	South Portland	Maine	8	2017	261500
3614	147	South Portland	Maine	9	2017	261900
3615	147	South Portland	Maine	10	2017	263100
3616	147	South Portland	Maine	11	2017	266000
3617	147	South Portland	Maine	12	2017	269200
3618	147	South Portland	Maine	1	2018	270600
3619	147	South Portland	Maine	2	2018	270400
3620	147	South Portland	Maine	3	2018	269900
3621	147	South Portland	Maine	4	2018	270000
3622	147	South Portland	Maine	5	2018	271100
3623	147	South Portland	Maine	6	2018	273000
3624	147	South Portland	Maine	7	2018	276300
3625	147	South Portland	Maine	8	2018	281000
3626	147	South Portland	Maine	9	2018	285800
3627	147	South Portland	Maine	10	2018	288300
3628	147	South Portland	Maine	11	2018	287900
3629	147	South Portland	Maine	12	2018	288600
3630	147	South Portland	Maine	1	2019	291700
3631	90	Albany	New York	1	2009	170000
3632	90	Albany	New York	2	2009	167250
3633	90	Albany	New York	3	2009	177000
3634	90	Albany	New York	4	2009	175583
3635	90	Albany	New York	5	2009	185000
3636	90	Albany	New York	6	2009	183450
3637	90	Albany	New York	7	2009	189938
3638	90	Albany	New York	8	2009	196250
3639	90	Albany	New York	9	2009	185000
3640	90	Albany	New York	10	2009	179500
3641	90	Albany	New York	11	2009	177750
3642	90	Albany	New York	12	2009	174900
3643	90	Albany	New York	1	2010	170000
3644	90	Albany	New York	2	2010	179900
3645	90	Albany	New York	3	2010	175000
3646	90	Albany	New York	4	2010	188000
3647	90	Albany	New York	5	2010	182000
3648	90	Albany	New York	6	2010	189900
3649	90	Albany	New York	7	2010	196000
3650	90	Albany	New York	8	2010	195000
3651	90	Albany	New York	9	2010	203500
3652	90	Albany	New York	10	2010	198500
3653	90	Albany	New York	11	2010	185500
3654	90	Albany	New York	12	2010	175362
3655	90	Albany	New York	1	2011	172000
3656	90	Albany	New York	2	2011	170000
3657	90	Albany	New York	3	2011	173700
3658	90	Albany	New York	4	2011	176080
3659	90	Albany	New York	5	2011	183000
3660	90	Albany	New York	6	2011	190775
3661	90	Albany	New York	7	2011	195000
3662	90	Albany	New York	8	2011	193200
3663	90	Albany	New York	9	2011	190000
3664	90	Albany	New York	10	2011	185500
3665	90	Albany	New York	11	2011	190000
3666	90	Albany	New York	12	2011	179950
3667	90	Albany	New York	1	2012	171380
3668	90	Albany	New York	2	2012	188000
3669	90	Albany	New York	3	2012	184050
3670	90	Albany	New York	4	2012	189000
3671	90	Albany	New York	5	2012	185000
3672	90	Albany	New York	6	2012	203000
3673	90	Albany	New York	7	2012	200000
3674	90	Albany	New York	8	2012	205900
3675	90	Albany	New York	9	2012	210000
3676	90	Albany	New York	10	2012	198150
3677	90	Albany	New York	11	2012	197500
3678	90	Albany	New York	12	2012	200000
3679	90	Albany	New York	1	2013	175000
3680	90	Albany	New York	2	2013	194000
3681	90	Albany	New York	3	2013	185000
3682	90	Albany	New York	4	2013	192000
3683	90	Albany	New York	5	2013	190000
3684	90	Albany	New York	6	2013	217775
3685	90	Albany	New York	7	2013	205000
3686	90	Albany	New York	8	2013	203000
3687	90	Albany	New York	9	2013	199000
3688	90	Albany	New York	10	2013	189000
3689	90	Albany	New York	11	2013	192900
3690	90	Albany	New York	12	2013	190750
3691	90	Albany	New York	1	2014	192250
3692	90	Albany	New York	2	2014	190000
3693	90	Albany	New York	3	2014	185770
3694	90	Albany	New York	4	2014	185000
3695	90	Albany	New York	5	2014	182000
3696	90	Albany	New York	6	2014	204000
3697	90	Albany	New York	7	2014	209900
3698	90	Albany	New York	8	2014	210000
3699	90	Albany	New York	9	2014	195350
3700	90	Albany	New York	10	2014	188315
3701	90	Albany	New York	11	2014	195497
3702	90	Albany	New York	12	2014	188000
3703	90	Albany	New York	1	2015	193000
3704	90	Albany	New York	2	2015	175300
3705	90	Albany	New York	3	2015	182250
3706	90	Albany	New York	4	2015	185000
3707	90	Albany	New York	5	2015	197250
3708	90	Albany	New York	6	2015	195000
3709	90	Albany	New York	7	2015	222700
3710	90	Albany	New York	8	2015	211000
3711	90	Albany	New York	9	2015	198304
3712	90	Albany	New York	10	2015	188000
3713	90	Albany	New York	11	2015	196800
3714	90	Albany	New York	12	2015	192750
3715	90	Albany	New York	1	2016	182500
3716	90	Albany	New York	2	2016	180000
3717	90	Albany	New York	3	2016	175000
3718	90	Albany	New York	4	2016	182000
3719	90	Albany	New York	5	2016	193500
3720	90	Albany	New York	6	2016	195000
3721	90	Albany	New York	7	2016	211000
3722	90	Albany	New York	8	2016	206000
3723	90	Albany	New York	9	2016	199450
3724	90	Albany	New York	10	2016	198950
3725	90	Albany	New York	11	2016	195000
3726	90	Albany	New York	12	2016	191500
3727	90	Albany	New York	1	2017	183170
3728	90	Albany	New York	2	2017	180000
3729	90	Albany	New York	3	2017	185000
3730	90	Albany	New York	4	2017	189450
3731	90	Albany	New York	5	2017	191290
3732	90	Albany	New York	6	2017	208000
3733	90	Albany	New York	7	2017	214250
3734	90	Albany	New York	8	2017	210000
3735	90	Albany	New York	9	2017	210000
3736	90	Albany	New York	10	2017	195000
3737	90	Albany	New York	11	2017	200000
3738	90	Albany	New York	12	2017	190000
3739	90	Albany	New York	1	2018	185000
3740	90	Albany	New York	2	2018	187250
3741	90	Albany	New York	3	2018	195250
3742	90	Albany	New York	4	2018	200000
3743	90	Albany	New York	5	2018	210000
3744	90	Albany	New York	6	2018	215000
3745	90	Albany	New York	7	2018	223500
3746	90	Albany	New York	8	2018	217000
3747	90	Albany	New York	9	2018	210000
3748	90	Albany	New York	10	2018	200000
3749	90	Albany	New York	11	2018	210000
3750	90	Albany	New York	12	2018	199950
3751	90	Albany	New York	1	2019	0
3752	96	Raleigh	North Carolina	1	2009	189000
3753	96	Raleigh	North Carolina	2	2009	199000
3754	96	Raleigh	North Carolina	3	2009	195000
3755	96	Raleigh	North Carolina	4	2009	182000
3756	96	Raleigh	North Carolina	5	2009	194000
3757	96	Raleigh	North Carolina	6	2009	192000
3758	96	Raleigh	North Carolina	7	2009	195250
3759	96	Raleigh	North Carolina	8	2009	196000
3760	96	Raleigh	North Carolina	9	2009	180000
3761	96	Raleigh	North Carolina	10	2009	189900
3762	96	Raleigh	North Carolina	11	2009	190000
3763	96	Raleigh	North Carolina	12	2009	192000
3764	96	Raleigh	North Carolina	1	2010	200000
3765	96	Raleigh	North Carolina	2	2010	185000
3766	96	Raleigh	North Carolina	3	2010	190000
3767	96	Raleigh	North Carolina	4	2010	198000
3768	96	Raleigh	North Carolina	5	2010	194000
3769	96	Raleigh	North Carolina	6	2010	210000
3770	96	Raleigh	North Carolina	7	2010	208000
3771	96	Raleigh	North Carolina	8	2010	198000
3772	96	Raleigh	North Carolina	9	2010	203000
3773	96	Raleigh	North Carolina	10	2010	200000
3774	96	Raleigh	North Carolina	11	2010	217500
3775	96	Raleigh	North Carolina	12	2010	199000
3776	96	Raleigh	North Carolina	1	2011	193000
3777	96	Raleigh	North Carolina	2	2011	190000
3778	96	Raleigh	North Carolina	3	2011	194000
3779	96	Raleigh	North Carolina	4	2011	191000
3780	96	Raleigh	North Carolina	5	2011	200000
3781	96	Raleigh	North Carolina	6	2011	207250
3782	96	Raleigh	North Carolina	7	2011	205000
3783	96	Raleigh	North Carolina	8	2011	200000
3784	96	Raleigh	North Carolina	9	2011	190000
3785	96	Raleigh	North Carolina	10	2011	195000
3786	96	Raleigh	North Carolina	11	2011	206250
3787	96	Raleigh	North Carolina	12	2011	204000
3788	96	Raleigh	North Carolina	1	2012	186500
3789	96	Raleigh	North Carolina	2	2012	189750
3790	96	Raleigh	North Carolina	3	2012	197000
3791	96	Raleigh	North Carolina	4	2012	205000
3792	96	Raleigh	North Carolina	5	2012	210000
3793	96	Raleigh	North Carolina	6	2012	206000
3794	96	Raleigh	North Carolina	7	2012	206000
3795	96	Raleigh	North Carolina	8	2012	206000
3796	96	Raleigh	North Carolina	9	2012	196000
3797	96	Raleigh	North Carolina	10	2012	200500
3798	96	Raleigh	North Carolina	11	2012	215000
3799	96	Raleigh	North Carolina	12	2012	207000
3800	96	Raleigh	North Carolina	1	2013	195000
3801	96	Raleigh	North Carolina	2	2013	188215
3802	96	Raleigh	North Carolina	3	2013	205000
3803	96	Raleigh	North Carolina	4	2013	205000
3804	96	Raleigh	North Carolina	5	2013	212250
3805	96	Raleigh	North Carolina	6	2013	214563
3806	96	Raleigh	North Carolina	7	2013	213000
3807	96	Raleigh	North Carolina	8	2013	221567
3808	96	Raleigh	North Carolina	9	2013	205000
3809	96	Raleigh	North Carolina	10	2013	220000
3810	96	Raleigh	North Carolina	11	2013	212500
3811	96	Raleigh	North Carolina	12	2013	221000
3812	96	Raleigh	North Carolina	1	2014	211000
3813	96	Raleigh	North Carolina	2	2014	212575
3814	96	Raleigh	North Carolina	3	2014	214065
3815	96	Raleigh	North Carolina	4	2014	217000
3816	96	Raleigh	North Carolina	5	2014	226000
3817	96	Raleigh	North Carolina	6	2014	222250
3818	96	Raleigh	North Carolina	7	2014	225000
3819	96	Raleigh	North Carolina	8	2014	221000
3820	96	Raleigh	North Carolina	9	2014	219000
3821	96	Raleigh	North Carolina	10	2014	218000
3822	96	Raleigh	North Carolina	11	2014	218900
3823	96	Raleigh	North Carolina	12	2014	215000
3824	96	Raleigh	North Carolina	1	2015	208000
3825	96	Raleigh	North Carolina	2	2015	215000
3826	96	Raleigh	North Carolina	3	2015	230000
3827	96	Raleigh	North Carolina	4	2015	226000
3828	96	Raleigh	North Carolina	5	2015	240000
3829	96	Raleigh	North Carolina	6	2015	247000
3830	96	Raleigh	North Carolina	7	2015	235000
3831	96	Raleigh	North Carolina	8	2015	239373
3832	96	Raleigh	North Carolina	9	2015	234950
3833	96	Raleigh	North Carolina	10	2015	235000
3834	96	Raleigh	North Carolina	11	2015	239000
3835	96	Raleigh	North Carolina	12	2015	237000
3836	96	Raleigh	North Carolina	1	2016	225000
3837	96	Raleigh	North Carolina	2	2016	232000
3838	96	Raleigh	North Carolina	3	2016	236000
3839	96	Raleigh	North Carolina	4	2016	244500
3840	96	Raleigh	North Carolina	5	2016	247000
3841	96	Raleigh	North Carolina	6	2016	260000
3842	96	Raleigh	North Carolina	7	2016	249000
3843	96	Raleigh	North Carolina	8	2016	244000
3844	96	Raleigh	North Carolina	9	2016	250000
3845	96	Raleigh	North Carolina	10	2016	249000
3846	96	Raleigh	North Carolina	11	2016	250000
3847	96	Raleigh	North Carolina	12	2016	259352
3848	96	Raleigh	North Carolina	1	2017	247990
3849	96	Raleigh	North Carolina	2	2017	250000
3850	96	Raleigh	North Carolina	3	2017	261950
3851	96	Raleigh	North Carolina	4	2017	265000
3852	96	Raleigh	North Carolina	5	2017	270000
3853	96	Raleigh	North Carolina	6	2017	275000
3854	96	Raleigh	North Carolina	7	2017	265925
3855	96	Raleigh	North Carolina	8	2017	265000
3856	96	Raleigh	North Carolina	9	2017	262000
3857	96	Raleigh	North Carolina	10	2017	265000
3858	96	Raleigh	North Carolina	11	2017	269000
3859	96	Raleigh	North Carolina	12	2017	270000
3860	96	Raleigh	North Carolina	1	2018	267830
3861	96	Raleigh	North Carolina	2	2018	276000
3862	96	Raleigh	North Carolina	3	2018	280000
3863	96	Raleigh	North Carolina	4	2018	282000
3864	96	Raleigh	North Carolina	5	2018	284325
3865	96	Raleigh	North Carolina	6	2018	289250
3866	96	Raleigh	North Carolina	7	2018	285000
3867	96	Raleigh	North Carolina	8	2018	283500
3868	96	Raleigh	North Carolina	9	2018	281500
3869	96	Raleigh	North Carolina	10	2018	277000
3870	96	Raleigh	North Carolina	11	2018	283870
3871	96	Raleigh	North Carolina	12	2018	279000
3872	96	Raleigh	North Carolina	1	2019	0
3873	94	Durham	North Carolina	1	2009	184500
3874	94	Durham	North Carolina	2	2009	169000
3875	94	Durham	North Carolina	3	2009	191700
3876	94	Durham	North Carolina	4	2009	182000
3877	94	Durham	North Carolina	5	2009	193500
3878	94	Durham	North Carolina	6	2009	190000
3879	94	Durham	North Carolina	7	2009	187500
3880	94	Durham	North Carolina	8	2009	193000
3881	94	Durham	North Carolina	9	2009	191000
3882	94	Durham	North Carolina	10	2009	187250
3883	94	Durham	North Carolina	11	2009	174500
3884	94	Durham	North Carolina	12	2009	180000
3885	94	Durham	North Carolina	1	2010	188000
3886	94	Durham	North Carolina	2	2010	178500
3887	94	Durham	North Carolina	3	2010	185000
3888	94	Durham	North Carolina	4	2010	181386
3889	94	Durham	North Carolina	5	2010	190000
3890	94	Durham	North Carolina	6	2010	209000
3891	94	Durham	North Carolina	7	2010	206000
3892	94	Durham	North Carolina	8	2010	215000
3893	94	Durham	North Carolina	9	2010	185000
3894	94	Durham	North Carolina	10	2010	207000
3895	94	Durham	North Carolina	11	2010	196750
3896	94	Durham	North Carolina	12	2010	181963
3897	94	Durham	North Carolina	1	2011	194250
3898	94	Durham	North Carolina	2	2011	189000
3899	94	Durham	North Carolina	3	2011	180750
3900	94	Durham	North Carolina	4	2011	200000
3901	94	Durham	North Carolina	5	2011	197500
3902	94	Durham	North Carolina	6	2011	186000
3903	94	Durham	North Carolina	7	2011	193250
3904	94	Durham	North Carolina	8	2011	188000
3905	94	Durham	North Carolina	9	2011	184000
3906	94	Durham	North Carolina	10	2011	175000
3907	94	Durham	North Carolina	11	2011	184500
3908	94	Durham	North Carolina	12	2011	170250
3909	94	Durham	North Carolina	1	2012	165000
3910	94	Durham	North Carolina	2	2012	167500
3911	94	Durham	North Carolina	3	2012	186000
3912	94	Durham	North Carolina	4	2012	197000
3913	94	Durham	North Carolina	5	2012	194700
3914	94	Durham	North Carolina	6	2012	214950
3915	94	Durham	North Carolina	7	2012	194000
3916	94	Durham	North Carolina	8	2012	194000
3917	94	Durham	North Carolina	9	2012	193000
3918	94	Durham	North Carolina	10	2012	185000
3919	94	Durham	North Carolina	11	2012	198500
3920	94	Durham	North Carolina	12	2012	172750
3921	94	Durham	North Carolina	1	2013	170000
3922	94	Durham	North Carolina	2	2013	184000
3923	94	Durham	North Carolina	3	2013	198000
3924	94	Durham	North Carolina	4	2013	196000
3925	94	Durham	North Carolina	5	2013	212000
3926	94	Durham	North Carolina	6	2013	212500
3927	94	Durham	North Carolina	7	2013	200250
3928	94	Durham	North Carolina	8	2013	205000
3929	94	Durham	North Carolina	9	2013	186750
3930	94	Durham	North Carolina	10	2013	192000
3931	94	Durham	North Carolina	11	2013	194000
3932	94	Durham	North Carolina	12	2013	208000
3933	94	Durham	North Carolina	1	2014	208500
3934	94	Durham	North Carolina	2	2014	195500
3935	94	Durham	North Carolina	3	2014	195000
3936	94	Durham	North Carolina	4	2014	205000
3937	94	Durham	North Carolina	5	2014	211000
3938	94	Durham	North Carolina	6	2014	220000
3939	94	Durham	North Carolina	7	2014	210500
3940	94	Durham	North Carolina	8	2014	214500
3941	94	Durham	North Carolina	9	2014	192925
3942	94	Durham	North Carolina	10	2014	200000
3943	94	Durham	North Carolina	11	2014	207000
3944	94	Durham	North Carolina	12	2014	206500
3945	94	Durham	North Carolina	1	2015	191750
3946	94	Durham	North Carolina	2	2015	186000
3947	94	Durham	North Carolina	3	2015	216000
3948	94	Durham	North Carolina	4	2015	214750
3949	94	Durham	North Carolina	5	2015	225000
3950	94	Durham	North Carolina	6	2015	230000
3951	94	Durham	North Carolina	7	2015	216250
3952	94	Durham	North Carolina	8	2015	218000
3953	94	Durham	North Carolina	9	2015	223000
3954	94	Durham	North Carolina	10	2015	219000
3955	94	Durham	North Carolina	11	2015	229000
3956	94	Durham	North Carolina	12	2015	230000
3957	94	Durham	North Carolina	1	2016	230000
3958	94	Durham	North Carolina	2	2016	221500
3959	94	Durham	North Carolina	3	2016	238000
3960	94	Durham	North Carolina	4	2016	225000
3961	94	Durham	North Carolina	5	2016	236500
3962	94	Durham	North Carolina	6	2016	250000
3963	94	Durham	North Carolina	7	2016	245000
3964	94	Durham	North Carolina	8	2016	240000
3965	94	Durham	North Carolina	9	2016	230000
3966	94	Durham	North Carolina	10	2016	230000
3967	94	Durham	North Carolina	11	2016	230000
3968	94	Durham	North Carolina	12	2016	247500
3969	94	Durham	North Carolina	1	2017	232000
3970	94	Durham	North Carolina	2	2017	244000
3971	94	Durham	North Carolina	3	2017	235000
3972	94	Durham	North Carolina	4	2017	250000
3973	94	Durham	North Carolina	5	2017	260000
3974	94	Durham	North Carolina	6	2017	265000
3975	94	Durham	North Carolina	7	2017	267500
3976	94	Durham	North Carolina	8	2017	262500
3977	94	Durham	North Carolina	9	2017	250000
3978	94	Durham	North Carolina	10	2017	265000
3979	94	Durham	North Carolina	11	2017	260000
3980	94	Durham	North Carolina	12	2017	268500
3981	94	Durham	North Carolina	1	2018	254068
3982	94	Durham	North Carolina	2	2018	280500
3983	94	Durham	North Carolina	3	2018	280250
3984	94	Durham	North Carolina	4	2018	280000
3985	94	Durham	North Carolina	5	2018	277150
3986	94	Durham	North Carolina	6	2018	280000
3987	94	Durham	North Carolina	7	2018	278000
3988	94	Durham	North Carolina	8	2018	279000
3989	94	Durham	North Carolina	9	2018	271500
3990	94	Durham	North Carolina	10	2018	270000
3991	94	Durham	North Carolina	11	2018	280000
3992	94	Durham	North Carolina	12	2018	291000
3993	94	Durham	North Carolina	1	2019	0
3994	25	Hartford	Connecitcut	1	2009	175000
3995	25	Hartford	Connecitcut	2	2009	159250
3996	25	Hartford	Connecitcut	3	2009	170000
3997	25	Hartford	Connecitcut	4	2009	157500
3998	25	Hartford	Connecitcut	5	2009	200500
3999	25	Hartford	Connecitcut	6	2009	198500
4000	25	Hartford	Connecitcut	7	2009	190000
4001	25	Hartford	Connecitcut	8	2009	192500
4002	25	Hartford	Connecitcut	9	2009	188000
4003	25	Hartford	Connecitcut	10	2009	208000
4004	25	Hartford	Connecitcut	11	2009	215000
4005	25	Hartford	Connecitcut	12	2009	175000
4006	25	Hartford	Connecitcut	1	2010	159000
4007	25	Hartford	Connecitcut	2	2010	206212
4008	25	Hartford	Connecitcut	3	2010	245500
4009	25	Hartford	Connecitcut	4	2010	210000
4010	25	Hartford	Connecitcut	5	2010	202925
4011	25	Hartford	Connecitcut	6	2010	185000
4012	25	Hartford	Connecitcut	7	2010	193000
4013	25	Hartford	Connecitcut	8	2010	151500
4014	25	Hartford	Connecitcut	9	2010	291250
4015	25	Hartford	Connecitcut	10	2010	191000
4016	25	Hartford	Connecitcut	11	2010	190250
4017	25	Hartford	Connecitcut	12	2010	168000
4018	25	Hartford	Connecitcut	1	2011	182000
4019	25	Hartford	Connecitcut	2	2011	252500
4020	25	Hartford	Connecitcut	3	2011	274000
4021	25	Hartford	Connecitcut	4	2011	242450
4022	25	Hartford	Connecitcut	5	2011	160000
4023	25	Hartford	Connecitcut	6	2011	180000
4024	25	Hartford	Connecitcut	7	2011	155000
4025	25	Hartford	Connecitcut	8	2011	202500
4026	25	Hartford	Connecitcut	9	2011	127000
4027	25	Hartford	Connecitcut	10	2011	202500
4028	25	Hartford	Connecitcut	11	2011	152500
4029	25	Hartford	Connecitcut	12	2011	187500
4030	25	Hartford	Connecitcut	1	2012	220250
4031	25	Hartford	Connecitcut	2	2012	185000
4032	25	Hartford	Connecitcut	3	2012	170000
4033	25	Hartford	Connecitcut	4	2012	160000
4034	25	Hartford	Connecitcut	5	2012	355000
4035	25	Hartford	Connecitcut	6	2012	170000
4036	25	Hartford	Connecitcut	7	2012	267000
4037	25	Hartford	Connecitcut	8	2012	199900
4038	25	Hartford	Connecitcut	9	2012	179000
4039	25	Hartford	Connecitcut	10	2012	212000
4040	25	Hartford	Connecitcut	11	2012	189500
4041	25	Hartford	Connecitcut	12	2012	180500
4042	25	Hartford	Connecitcut	1	2013	184000
4043	25	Hartford	Connecitcut	2	2013	242000
4044	25	Hartford	Connecitcut	3	2013	158000
4045	25	Hartford	Connecitcut	4	2013	181750
4046	25	Hartford	Connecitcut	5	2013	186250
4047	25	Hartford	Connecitcut	6	2013	184000
4048	25	Hartford	Connecitcut	7	2013	200000
4049	25	Hartford	Connecitcut	8	2013	148000
4050	25	Hartford	Connecitcut	9	2013	156250
4051	25	Hartford	Connecitcut	10	2013	145700
4052	25	Hartford	Connecitcut	11	2013	215000
4053	25	Hartford	Connecitcut	12	2013	204000
4054	25	Hartford	Connecitcut	1	2014	227450
4055	25	Hartford	Connecitcut	2	2014	215950
4056	25	Hartford	Connecitcut	3	2014	192500
4057	25	Hartford	Connecitcut	4	2014	188000
4058	25	Hartford	Connecitcut	5	2014	194500
4059	25	Hartford	Connecitcut	6	2014	179900
4060	25	Hartford	Connecitcut	7	2014	180000
4061	25	Hartford	Connecitcut	8	2014	198000
4062	25	Hartford	Connecitcut	9	2014	162500
4063	25	Hartford	Connecitcut	10	2014	200200
4064	25	Hartford	Connecitcut	11	2014	197500
4065	25	Hartford	Connecitcut	12	2014	168500
4066	25	Hartford	Connecitcut	1	2015	173000
4067	25	Hartford	Connecitcut	2	2015	168000
4068	25	Hartford	Connecitcut	3	2015	181700
4069	25	Hartford	Connecitcut	4	2015	187150
4070	25	Hartford	Connecitcut	5	2015	193250
4071	25	Hartford	Connecitcut	6	2015	214000
4072	25	Hartford	Connecitcut	7	2015	204000
4073	25	Hartford	Connecitcut	8	2015	195000
4074	25	Hartford	Connecitcut	9	2015	200000
4075	25	Hartford	Connecitcut	10	2015	180000
4076	25	Hartford	Connecitcut	11	2015	186500
4077	25	Hartford	Connecitcut	12	2015	180000
4078	25	Hartford	Connecitcut	1	2016	181000
4079	25	Hartford	Connecitcut	2	2016	175000
4080	25	Hartford	Connecitcut	3	2016	179900
4081	25	Hartford	Connecitcut	4	2016	195000
4082	25	Hartford	Connecitcut	5	2016	199900
4083	25	Hartford	Connecitcut	6	2016	210000
4084	25	Hartford	Connecitcut	7	2016	215000
4085	25	Hartford	Connecitcut	8	2016	214900
4086	25	Hartford	Connecitcut	9	2016	210000
4087	25	Hartford	Connecitcut	10	2016	189900
4088	25	Hartford	Connecitcut	11	2016	194000
4089	25	Hartford	Connecitcut	12	2016	204000
4090	25	Hartford	Connecitcut	1	2017	185000
4091	25	Hartford	Connecitcut	2	2017	176000
4092	25	Hartford	Connecitcut	3	2017	192500
4093	25	Hartford	Connecitcut	4	2017	187750
4094	25	Hartford	Connecitcut	5	2017	207750
4095	25	Hartford	Connecitcut	6	2017	220000
4096	25	Hartford	Connecitcut	7	2017	220000
4097	25	Hartford	Connecitcut	8	2017	212250
4098	25	Hartford	Connecitcut	9	2017	205000
4099	25	Hartford	Connecitcut	10	2017	195900
4100	25	Hartford	Connecitcut	11	2017	196000
4101	25	Hartford	Connecitcut	12	2017	199000
4102	25	Hartford	Connecitcut	1	2018	188000
4103	25	Hartford	Connecitcut	2	2018	183625
4104	25	Hartford	Connecitcut	3	2018	201000
4105	25	Hartford	Connecitcut	4	2018	210000
4106	25	Hartford	Connecitcut	5	2018	210000
4107	25	Hartford	Connecitcut	6	2018	225000
4108	25	Hartford	Connecitcut	7	2018	231500
4109	25	Hartford	Connecitcut	8	2018	226900
4110	25	Hartford	Connecitcut	9	2018	195800
4111	25	Hartford	Connecitcut	10	2018	207750
4112	25	Hartford	Connecitcut	11	2018	200000
4113	25	Hartford	Connecitcut	12	2018	210000
4114	25	Hartford	Connecitcut	1	2019	0
4115	102	Salem	Oregon	1	2009	206750
4116	102	Salem	Oregon	2	2009	190000
4117	102	Salem	Oregon	3	2009	190000
4118	102	Salem	Oregon	4	2009	185000
4119	102	Salem	Oregon	5	2009	194500
4120	102	Salem	Oregon	6	2009	192250
4121	102	Salem	Oregon	7	2009	190000
4122	102	Salem	Oregon	8	2009	192000
4123	102	Salem	Oregon	9	2009	183818
4124	102	Salem	Oregon	10	2009	184900
4125	102	Salem	Oregon	11	2009	182000
4126	102	Salem	Oregon	12	2009	179900
4127	102	Salem	Oregon	1	2010	172450
4128	102	Salem	Oregon	2	2010	196500
4129	102	Salem	Oregon	3	2010	183900
4130	102	Salem	Oregon	4	2010	180000
4131	102	Salem	Oregon	5	2010	173150
4132	102	Salem	Oregon	6	2010	175000
4133	102	Salem	Oregon	7	2010	188450
4134	102	Salem	Oregon	8	2010	173000
4135	102	Salem	Oregon	9	2010	165750
4136	102	Salem	Oregon	10	2010	160840
4137	102	Salem	Oregon	11	2010	175500
4138	102	Salem	Oregon	12	2010	159500
4139	102	Salem	Oregon	1	2011	160000
4140	102	Salem	Oregon	2	2011	165000
4141	102	Salem	Oregon	3	2011	161250
4142	102	Salem	Oregon	4	2011	155000
4143	102	Salem	Oregon	5	2011	151750
4144	102	Salem	Oregon	6	2011	158000
4145	102	Salem	Oregon	7	2011	156000
4146	102	Salem	Oregon	8	2011	165000
4147	102	Salem	Oregon	9	2011	166600
4148	102	Salem	Oregon	10	2011	163030
4149	102	Salem	Oregon	11	2011	154950
4150	102	Salem	Oregon	12	2011	158000
4151	102	Salem	Oregon	1	2012	149000
4152	102	Salem	Oregon	2	2012	149900
4153	102	Salem	Oregon	3	2012	162000
4154	102	Salem	Oregon	4	2012	149900
4155	102	Salem	Oregon	5	2012	154750
4156	102	Salem	Oregon	6	2012	156450
4157	102	Salem	Oregon	7	2012	160000
4158	102	Salem	Oregon	8	2012	164900
4159	102	Salem	Oregon	9	2012	169900
4160	102	Salem	Oregon	10	2012	168000
4161	102	Salem	Oregon	11	2012	160000
4162	102	Salem	Oregon	12	2012	155400
4163	102	Salem	Oregon	1	2013	158765
4164	102	Salem	Oregon	2	2013	157000
4165	102	Salem	Oregon	3	2013	165000
4166	102	Salem	Oregon	4	2013	165000
4167	102	Salem	Oregon	5	2013	167950
4168	102	Salem	Oregon	6	2013	176500
4169	102	Salem	Oregon	7	2013	189900
4170	102	Salem	Oregon	8	2013	177000
4171	102	Salem	Oregon	9	2013	188000
4172	102	Salem	Oregon	10	2013	193231
4173	102	Salem	Oregon	11	2013	185000
4174	102	Salem	Oregon	12	2013	187000
4175	102	Salem	Oregon	1	2014	168000
4176	102	Salem	Oregon	2	2014	180000
4177	102	Salem	Oregon	3	2014	180000
4178	102	Salem	Oregon	4	2014	182000
4179	102	Salem	Oregon	5	2014	195000
4180	102	Salem	Oregon	6	2014	203000
4181	102	Salem	Oregon	7	2014	200000
4182	102	Salem	Oregon	8	2014	196000
4183	102	Salem	Oregon	9	2014	195000
4184	102	Salem	Oregon	10	2014	198200
4185	102	Salem	Oregon	11	2014	189900
4186	102	Salem	Oregon	12	2014	192450
4187	102	Salem	Oregon	1	2015	190000
4188	102	Salem	Oregon	2	2015	188900
4189	102	Salem	Oregon	3	2015	199900
4190	102	Salem	Oregon	4	2015	205000
4191	102	Salem	Oregon	5	2015	207900
4192	102	Salem	Oregon	6	2015	221499
4193	102	Salem	Oregon	7	2015	215000
4194	102	Salem	Oregon	8	2015	207045
4195	102	Salem	Oregon	9	2015	215500
4196	102	Salem	Oregon	10	2015	210000
4197	102	Salem	Oregon	11	2015	215000
4198	102	Salem	Oregon	12	2015	215000
4199	102	Salem	Oregon	1	2016	222150
4200	102	Salem	Oregon	2	2016	210000
4201	102	Salem	Oregon	3	2016	221550
4202	102	Salem	Oregon	4	2016	231000
4203	102	Salem	Oregon	5	2016	229900
4204	102	Salem	Oregon	6	2016	237000
4205	102	Salem	Oregon	7	2016	233850
4206	102	Salem	Oregon	8	2016	239450
4207	102	Salem	Oregon	9	2016	236000
4208	102	Salem	Oregon	10	2016	235000
4209	102	Salem	Oregon	11	2016	238000
4210	102	Salem	Oregon	12	2016	235000
4211	102	Salem	Oregon	1	2017	231769
4212	102	Salem	Oregon	2	2017	235600
4213	102	Salem	Oregon	3	2017	250000
4214	102	Salem	Oregon	4	2017	247900
4215	102	Salem	Oregon	5	2017	248475
4216	102	Salem	Oregon	6	2017	257750
4217	102	Salem	Oregon	7	2017	255000
4218	102	Salem	Oregon	8	2017	265000
4219	102	Salem	Oregon	9	2017	259950
4220	102	Salem	Oregon	10	2017	255000
4221	102	Salem	Oregon	11	2017	269900
4222	102	Salem	Oregon	12	2017	269900
4223	102	Salem	Oregon	1	2018	260500
4224	102	Salem	Oregon	2	2018	277700
4225	102	Salem	Oregon	3	2018	275000
4226	102	Salem	Oregon	4	2018	280250
4227	102	Salem	Oregon	5	2018	283260
4228	102	Salem	Oregon	6	2018	280000
4229	102	Salem	Oregon	7	2018	295000
4230	102	Salem	Oregon	8	2018	295000
4231	102	Salem	Oregon	9	2018	284000
4232	102	Salem	Oregon	10	2018	280000
4233	102	Salem	Oregon	11	2018	279999
4234	102	Salem	Oregon	12	2018	280000
4235	102	Salem	Oregon	1	2019	0
4236	160	Concord	New Hampshire	1	2009	200800
4237	160	Concord	New Hampshire	2	2009	199900
4238	160	Concord	New Hampshire	3	2009	198700
4239	160	Concord	New Hampshire	4	2009	197300
4240	160	Concord	New Hampshire	5	2009	195800
4241	160	Concord	New Hampshire	6	2009	194300
4242	160	Concord	New Hampshire	7	2009	192600
4243	160	Concord	New Hampshire	8	2009	191100
4244	160	Concord	New Hampshire	9	2009	189900
4245	160	Concord	New Hampshire	10	2009	188800
4246	160	Concord	New Hampshire	11	2009	188100
4247	160	Concord	New Hampshire	12	2009	187800
4248	160	Concord	New Hampshire	1	2010	188100
4249	160	Concord	New Hampshire	2	2010	187300
4250	160	Concord	New Hampshire	3	2010	185800
4251	160	Concord	New Hampshire	4	2010	184600
4252	160	Concord	New Hampshire	5	2010	184400
4253	160	Concord	New Hampshire	6	2010	183500
4254	160	Concord	New Hampshire	7	2010	182300
4255	160	Concord	New Hampshire	8	2010	180900
4256	160	Concord	New Hampshire	9	2010	180100
4257	160	Concord	New Hampshire	10	2010	179400
4258	160	Concord	New Hampshire	11	2010	177200
4259	160	Concord	New Hampshire	12	2010	173600
4260	160	Concord	New Hampshire	1	2011	170900
4261	160	Concord	New Hampshire	2	2011	170200
4262	160	Concord	New Hampshire	3	2011	170500
4263	160	Concord	New Hampshire	4	2011	170900
4264	160	Concord	New Hampshire	5	2011	170800
4265	160	Concord	New Hampshire	6	2011	170700
4266	160	Concord	New Hampshire	7	2011	170900
4267	160	Concord	New Hampshire	8	2011	171500
4268	160	Concord	New Hampshire	9	2011	171000
4269	160	Concord	New Hampshire	10	2011	169800
4270	160	Concord	New Hampshire	11	2011	169200
4271	160	Concord	New Hampshire	12	2011	169300
4272	160	Concord	New Hampshire	1	2012	169200
4273	160	Concord	New Hampshire	2	2012	169100
4274	160	Concord	New Hampshire	3	2012	169000
4275	160	Concord	New Hampshire	4	2012	168300
4276	160	Concord	New Hampshire	5	2012	167500
4277	160	Concord	New Hampshire	6	2012	167400
4278	160	Concord	New Hampshire	7	2012	167400
4279	160	Concord	New Hampshire	8	2012	167200
4280	160	Concord	New Hampshire	9	2012	167700
4281	160	Concord	New Hampshire	10	2012	169300
4282	160	Concord	New Hampshire	11	2012	170800
4283	160	Concord	New Hampshire	12	2012	171300
4284	160	Concord	New Hampshire	1	2013	171300
4285	160	Concord	New Hampshire	2	2013	171000
4286	160	Concord	New Hampshire	3	2013	171500
4287	160	Concord	New Hampshire	4	2013	172600
4288	160	Concord	New Hampshire	5	2013	173600
4289	160	Concord	New Hampshire	6	2013	174600
4290	160	Concord	New Hampshire	7	2013	176000
4291	160	Concord	New Hampshire	8	2013	176600
4292	160	Concord	New Hampshire	9	2013	176100
4293	160	Concord	New Hampshire	10	2013	175800
4294	160	Concord	New Hampshire	11	2013	176400
4295	160	Concord	New Hampshire	12	2013	177500
4296	160	Concord	New Hampshire	1	2014	178600
4297	160	Concord	New Hampshire	2	2014	179400
4298	160	Concord	New Hampshire	3	2014	180000
4299	160	Concord	New Hampshire	4	2014	180500
4300	160	Concord	New Hampshire	5	2014	180100
4301	160	Concord	New Hampshire	6	2014	179800
4302	160	Concord	New Hampshire	7	2014	180200
4303	160	Concord	New Hampshire	8	2014	180500
4304	160	Concord	New Hampshire	9	2014	180500
4305	160	Concord	New Hampshire	10	2014	180600
4306	160	Concord	New Hampshire	11	2014	181100
4307	160	Concord	New Hampshire	12	2014	182000
4308	160	Concord	New Hampshire	1	2015	183100
4309	160	Concord	New Hampshire	2	2015	183700
4310	160	Concord	New Hampshire	3	2015	184000
4311	160	Concord	New Hampshire	4	2015	184000
4312	160	Concord	New Hampshire	5	2015	184300
4313	160	Concord	New Hampshire	6	2015	184700
4314	160	Concord	New Hampshire	7	2015	184700
4315	160	Concord	New Hampshire	8	2015	185000
4316	160	Concord	New Hampshire	9	2015	186100
4317	160	Concord	New Hampshire	10	2015	187300
4318	160	Concord	New Hampshire	11	2015	187800
4319	160	Concord	New Hampshire	12	2015	188100
4320	160	Concord	New Hampshire	1	2016	188300
4321	160	Concord	New Hampshire	2	2016	189100
4322	160	Concord	New Hampshire	3	2016	190100
4323	160	Concord	New Hampshire	4	2016	191400
4324	160	Concord	New Hampshire	5	2016	192800
4325	160	Concord	New Hampshire	6	2016	194000
4326	160	Concord	New Hampshire	7	2016	194700
4327	160	Concord	New Hampshire	8	2016	195700
4328	160	Concord	New Hampshire	9	2016	197400
4329	160	Concord	New Hampshire	10	2016	198600
4330	160	Concord	New Hampshire	11	2016	199900
4331	160	Concord	New Hampshire	12	2016	202100
4332	160	Concord	New Hampshire	1	2017	205100
4333	160	Concord	New Hampshire	2	2017	207200
4334	160	Concord	New Hampshire	3	2017	208100
4335	160	Concord	New Hampshire	4	2017	208800
4336	160	Concord	New Hampshire	5	2017	209900
4337	160	Concord	New Hampshire	6	2017	211500
4338	160	Concord	New Hampshire	7	2017	213300
4339	160	Concord	New Hampshire	8	2017	215400
4340	160	Concord	New Hampshire	9	2017	216700
4341	160	Concord	New Hampshire	10	2017	217900
4342	160	Concord	New Hampshire	11	2017	218900
4343	160	Concord	New Hampshire	12	2017	219800
4344	160	Concord	New Hampshire	1	2018	220100
4345	160	Concord	New Hampshire	2	2018	220300
4346	160	Concord	New Hampshire	3	2018	220800
4347	160	Concord	New Hampshire	4	2018	222300
4348	160	Concord	New Hampshire	5	2018	224600
4349	160	Concord	New Hampshire	6	2018	226300
4350	160	Concord	New Hampshire	7	2018	227600
4351	160	Concord	New Hampshire	8	2018	229000
4352	160	Concord	New Hampshire	9	2018	230100
4353	160	Concord	New Hampshire	10	2018	231100
4354	160	Concord	New Hampshire	11	2018	232300
4355	160	Concord	New Hampshire	12	2018	233000
4356	160	Concord	New Hampshire	1	2019	0
4357	140	Cheyenne	Wyoming	1	2009	0
4358	140	Cheyenne	Wyoming	2	2009	188500
4359	140	Cheyenne	Wyoming	3	2009	188800
4360	140	Cheyenne	Wyoming	4	2009	189000
4361	140	Cheyenne	Wyoming	5	2009	189200
4362	140	Cheyenne	Wyoming	6	2009	189500
4363	140	Cheyenne	Wyoming	7	2009	189900
4364	140	Cheyenne	Wyoming	8	2009	190300
4365	140	Cheyenne	Wyoming	9	2009	190500
4366	140	Cheyenne	Wyoming	10	2009	190500
4367	140	Cheyenne	Wyoming	11	2009	190400
4368	140	Cheyenne	Wyoming	12	2009	190500
4369	140	Cheyenne	Wyoming	1	2010	190000
4370	140	Cheyenne	Wyoming	2	2010	189900
4371	140	Cheyenne	Wyoming	3	2010	190000
4372	140	Cheyenne	Wyoming	4	2010	190100
4373	140	Cheyenne	Wyoming	5	2010	190300
4374	140	Cheyenne	Wyoming	6	2010	190900
4375	140	Cheyenne	Wyoming	7	2010	191000
4376	140	Cheyenne	Wyoming	8	2010	191000
4377	140	Cheyenne	Wyoming	9	2010	191700
4378	140	Cheyenne	Wyoming	10	2010	192600
4379	140	Cheyenne	Wyoming	11	2010	192500
4380	140	Cheyenne	Wyoming	12	2010	191700
4381	140	Cheyenne	Wyoming	1	2011	191400
4382	140	Cheyenne	Wyoming	2	2011	191800
4383	140	Cheyenne	Wyoming	3	2011	192200
4384	140	Cheyenne	Wyoming	4	2011	192800
4385	140	Cheyenne	Wyoming	5	2011	193300
4386	140	Cheyenne	Wyoming	6	2011	193400
4387	140	Cheyenne	Wyoming	7	2011	193100
4388	140	Cheyenne	Wyoming	8	2011	192700
4389	140	Cheyenne	Wyoming	9	2011	192500
4390	140	Cheyenne	Wyoming	10	2011	192500
4391	140	Cheyenne	Wyoming	11	2011	192500
4392	140	Cheyenne	Wyoming	12	2011	192800
4393	140	Cheyenne	Wyoming	1	2012	192900
4394	140	Cheyenne	Wyoming	2	2012	192800
4395	140	Cheyenne	Wyoming	3	2012	192400
4396	140	Cheyenne	Wyoming	4	2012	192100
4397	140	Cheyenne	Wyoming	5	2012	191400
4398	140	Cheyenne	Wyoming	6	2012	190900
4399	140	Cheyenne	Wyoming	7	2012	191500
4400	140	Cheyenne	Wyoming	8	2012	192700
4401	140	Cheyenne	Wyoming	9	2012	193600
4402	140	Cheyenne	Wyoming	10	2012	194900
4403	140	Cheyenne	Wyoming	11	2012	196100
4404	140	Cheyenne	Wyoming	12	2012	196800
4405	140	Cheyenne	Wyoming	1	2013	197100
4406	140	Cheyenne	Wyoming	2	2013	197300
4407	140	Cheyenne	Wyoming	3	2013	197600
4408	140	Cheyenne	Wyoming	4	2013	198100
4409	140	Cheyenne	Wyoming	5	2013	198800
4410	140	Cheyenne	Wyoming	6	2013	199100
4411	140	Cheyenne	Wyoming	7	2013	199200
4412	140	Cheyenne	Wyoming	8	2013	198500
4413	140	Cheyenne	Wyoming	9	2013	196900
4414	140	Cheyenne	Wyoming	10	2013	195100
4415	140	Cheyenne	Wyoming	11	2013	194600
4416	140	Cheyenne	Wyoming	12	2013	195000
4417	140	Cheyenne	Wyoming	1	2014	195600
4418	140	Cheyenne	Wyoming	2	2014	195900
4419	140	Cheyenne	Wyoming	3	2014	196200
4420	140	Cheyenne	Wyoming	4	2014	195900
4421	140	Cheyenne	Wyoming	5	2014	195000
4422	140	Cheyenne	Wyoming	6	2014	194100
4423	140	Cheyenne	Wyoming	7	2014	194000
4424	140	Cheyenne	Wyoming	8	2014	194400
4425	140	Cheyenne	Wyoming	9	2014	195000
4426	140	Cheyenne	Wyoming	10	2014	195900
4427	140	Cheyenne	Wyoming	11	2014	197200
4428	140	Cheyenne	Wyoming	12	2014	198100
4429	140	Cheyenne	Wyoming	1	2015	198600
4430	140	Cheyenne	Wyoming	2	2015	199500
4431	140	Cheyenne	Wyoming	3	2015	200800
4432	140	Cheyenne	Wyoming	4	2015	201900
4433	140	Cheyenne	Wyoming	5	2015	203300
4434	140	Cheyenne	Wyoming	6	2015	205200
4435	140	Cheyenne	Wyoming	7	2015	207000
4436	140	Cheyenne	Wyoming	8	2015	208400
4437	140	Cheyenne	Wyoming	9	2015	209600
4438	140	Cheyenne	Wyoming	10	2015	210200
4439	140	Cheyenne	Wyoming	11	2015	210200
4440	140	Cheyenne	Wyoming	12	2015	210300
4441	140	Cheyenne	Wyoming	1	2016	210900
4442	140	Cheyenne	Wyoming	2	2016	211900
4443	140	Cheyenne	Wyoming	3	2016	213000
4444	140	Cheyenne	Wyoming	4	2016	214600
4445	140	Cheyenne	Wyoming	5	2016	216700
4446	140	Cheyenne	Wyoming	6	2016	218300
4447	140	Cheyenne	Wyoming	7	2016	218800
4448	140	Cheyenne	Wyoming	8	2016	218600
4449	140	Cheyenne	Wyoming	9	2016	218300
4450	140	Cheyenne	Wyoming	10	2016	217900
4451	140	Cheyenne	Wyoming	11	2016	217600
4452	140	Cheyenne	Wyoming	12	2016	217800
4453	140	Cheyenne	Wyoming	1	2017	218200
4454	140	Cheyenne	Wyoming	2	2017	218500
4455	140	Cheyenne	Wyoming	3	2017	219200
4456	140	Cheyenne	Wyoming	4	2017	220200
4457	140	Cheyenne	Wyoming	5	2017	220400
4458	140	Cheyenne	Wyoming	6	2017	219700
4459	140	Cheyenne	Wyoming	7	2017	220400
4460	140	Cheyenne	Wyoming	8	2017	223200
4461	140	Cheyenne	Wyoming	9	2017	225600
4462	140	Cheyenne	Wyoming	10	2017	226700
4463	140	Cheyenne	Wyoming	11	2017	227900
4464	140	Cheyenne	Wyoming	12	2017	230500
4465	140	Cheyenne	Wyoming	1	2018	233600
4466	140	Cheyenne	Wyoming	2	2018	236100
4467	140	Cheyenne	Wyoming	3	2018	237200
4468	140	Cheyenne	Wyoming	4	2018	238700
4469	140	Cheyenne	Wyoming	5	2018	241600
4470	140	Cheyenne	Wyoming	6	2018	244900
4471	140	Cheyenne	Wyoming	7	2018	246600
4472	140	Cheyenne	Wyoming	8	2018	246800
4473	140	Cheyenne	Wyoming	9	2018	247900
4474	140	Cheyenne	Wyoming	10	2018	251000
4475	140	Cheyenne	Wyoming	11	2018	253800
4476	140	Cheyenne	Wyoming	12	2018	254700
4477	140	Cheyenne	Wyoming	1	2019	255000
4478	22	Colorado Springs	Colorado	1	2009	192600
4479	22	Colorado Springs	Colorado	2	2009	192300
4480	22	Colorado Springs	Colorado	3	2009	191800
4481	22	Colorado Springs	Colorado	4	2009	190900
4482	22	Colorado Springs	Colorado	5	2009	189900
4483	22	Colorado Springs	Colorado	6	2009	189300
4484	22	Colorado Springs	Colorado	7	2009	189400
4485	22	Colorado Springs	Colorado	8	2009	189500
4486	22	Colorado Springs	Colorado	9	2009	189700
4487	22	Colorado Springs	Colorado	10	2009	190000
4488	22	Colorado Springs	Colorado	11	2009	190400
4489	22	Colorado Springs	Colorado	12	2009	190600
4490	22	Colorado Springs	Colorado	1	2010	191000
4491	22	Colorado Springs	Colorado	2	2010	190500
4492	22	Colorado Springs	Colorado	3	2010	189300
4493	22	Colorado Springs	Colorado	4	2010	189100
4494	22	Colorado Springs	Colorado	5	2010	190000
4495	22	Colorado Springs	Colorado	6	2010	189900
4496	22	Colorado Springs	Colorado	7	2010	188800
4497	22	Colorado Springs	Colorado	8	2010	188000
4498	22	Colorado Springs	Colorado	9	2010	187600
4499	22	Colorado Springs	Colorado	10	2010	186700
4500	22	Colorado Springs	Colorado	11	2010	185100
4501	22	Colorado Springs	Colorado	12	2010	183300
4502	22	Colorado Springs	Colorado	1	2011	181800
4503	22	Colorado Springs	Colorado	2	2011	181600
4504	22	Colorado Springs	Colorado	3	2011	182100
4505	22	Colorado Springs	Colorado	4	2011	182400
4506	22	Colorado Springs	Colorado	5	2011	182200
4507	22	Colorado Springs	Colorado	6	2011	182000
4508	22	Colorado Springs	Colorado	7	2011	181900
4509	22	Colorado Springs	Colorado	8	2011	182100
4510	22	Colorado Springs	Colorado	9	2011	181800
4511	22	Colorado Springs	Colorado	10	2011	181500
4512	22	Colorado Springs	Colorado	11	2011	182100
4513	22	Colorado Springs	Colorado	12	2011	183100
4514	22	Colorado Springs	Colorado	1	2012	183400
4515	22	Colorado Springs	Colorado	2	2012	183300
4516	22	Colorado Springs	Colorado	3	2012	183200
4517	22	Colorado Springs	Colorado	4	2012	182900
4518	22	Colorado Springs	Colorado	5	2012	183100
4519	22	Colorado Springs	Colorado	6	2012	183700
4520	22	Colorado Springs	Colorado	7	2012	184200
4521	22	Colorado Springs	Colorado	8	2012	184400
4522	22	Colorado Springs	Colorado	9	2012	185000
4523	22	Colorado Springs	Colorado	10	2012	185900
4524	22	Colorado Springs	Colorado	11	2012	186900
4525	22	Colorado Springs	Colorado	12	2012	187600
4526	22	Colorado Springs	Colorado	1	2013	188200
4527	22	Colorado Springs	Colorado	2	2013	188700
4528	22	Colorado Springs	Colorado	3	2013	189200
4529	22	Colorado Springs	Colorado	4	2013	190300
4530	22	Colorado Springs	Colorado	5	2013	191800
4531	22	Colorado Springs	Colorado	6	2013	193400
4532	22	Colorado Springs	Colorado	7	2013	194700
4533	22	Colorado Springs	Colorado	8	2013	195400
4534	22	Colorado Springs	Colorado	9	2013	196100
4535	22	Colorado Springs	Colorado	10	2013	196800
4536	22	Colorado Springs	Colorado	11	2013	196700
4537	22	Colorado Springs	Colorado	12	2013	196600
4538	22	Colorado Springs	Colorado	1	2014	197400
4539	22	Colorado Springs	Colorado	2	2014	198700
4540	22	Colorado Springs	Colorado	3	2014	199600
4541	22	Colorado Springs	Colorado	4	2014	199800
4542	22	Colorado Springs	Colorado	5	2014	199600
4543	22	Colorado Springs	Colorado	6	2014	199600
4544	22	Colorado Springs	Colorado	7	2014	200000
4545	22	Colorado Springs	Colorado	8	2014	200800
4546	22	Colorado Springs	Colorado	9	2014	201800
4547	22	Colorado Springs	Colorado	10	2014	202700
4548	22	Colorado Springs	Colorado	11	2014	203700
4549	22	Colorado Springs	Colorado	12	2014	204600
4550	22	Colorado Springs	Colorado	1	2015	205000
4551	22	Colorado Springs	Colorado	2	2015	205600
4552	22	Colorado Springs	Colorado	3	2015	207000
4553	22	Colorado Springs	Colorado	4	2015	208900
4554	22	Colorado Springs	Colorado	5	2015	210600
4555	22	Colorado Springs	Colorado	6	2015	212300
4556	22	Colorado Springs	Colorado	7	2015	214000
4557	22	Colorado Springs	Colorado	8	2015	215300
4558	22	Colorado Springs	Colorado	9	2015	216300
4559	22	Colorado Springs	Colorado	10	2015	217400
4560	22	Colorado Springs	Colorado	11	2015	218500
4561	22	Colorado Springs	Colorado	12	2015	219900
4562	22	Colorado Springs	Colorado	1	2016	221700
4563	22	Colorado Springs	Colorado	2	2016	223800
4564	22	Colorado Springs	Colorado	3	2016	226000
4565	22	Colorado Springs	Colorado	4	2016	227900
4566	22	Colorado Springs	Colorado	5	2016	229600
4567	22	Colorado Springs	Colorado	6	2016	231100
4568	22	Colorado Springs	Colorado	7	2016	232800
4569	22	Colorado Springs	Colorado	8	2016	234300
4570	22	Colorado Springs	Colorado	9	2016	235600
4571	22	Colorado Springs	Colorado	10	2016	236900
4572	22	Colorado Springs	Colorado	11	2016	238700
4573	22	Colorado Springs	Colorado	12	2016	240600
4574	22	Colorado Springs	Colorado	1	2017	242600
4575	22	Colorado Springs	Colorado	2	2017	244800
4576	22	Colorado Springs	Colorado	3	2017	247400
4577	22	Colorado Springs	Colorado	4	2017	250000
4578	22	Colorado Springs	Colorado	5	2017	251900
4579	22	Colorado Springs	Colorado	6	2017	253400
4580	22	Colorado Springs	Colorado	7	2017	255400
4581	22	Colorado Springs	Colorado	8	2017	257200
4582	22	Colorado Springs	Colorado	9	2017	258600
4583	22	Colorado Springs	Colorado	10	2017	260000
4584	22	Colorado Springs	Colorado	11	2017	261800
4585	22	Colorado Springs	Colorado	12	2017	264500
4586	22	Colorado Springs	Colorado	1	2018	267600
4587	22	Colorado Springs	Colorado	2	2018	270000
4588	22	Colorado Springs	Colorado	3	2018	271700
4589	22	Colorado Springs	Colorado	4	2018	273400
4590	22	Colorado Springs	Colorado	5	2018	274900
4591	22	Colorado Springs	Colorado	6	2018	276500
4592	22	Colorado Springs	Colorado	7	2018	278100
4593	22	Colorado Springs	Colorado	8	2018	279900
4594	22	Colorado Springs	Colorado	9	2018	282200
4595	22	Colorado Springs	Colorado	10	2018	284700
4596	22	Colorado Springs	Colorado	11	2018	287200
4597	22	Colorado Springs	Colorado	12	2018	289300
4598	22	Colorado Springs	Colorado	1	2019	0
4599	111	Charleston	South Carolina	1	2009	177568
4600	111	Charleston	South Carolina	2	2009	188000
4601	111	Charleston	South Carolina	3	2009	185000
4602	111	Charleston	South Carolina	4	2009	184000
4603	111	Charleston	South Carolina	5	2009	188000
4604	111	Charleston	South Carolina	6	2009	195500
4605	111	Charleston	South Carolina	7	2009	185000
4606	111	Charleston	South Carolina	8	2009	188508
4607	111	Charleston	South Carolina	9	2009	177855
4608	111	Charleston	South Carolina	10	2009	175621
4609	111	Charleston	South Carolina	11	2009	174000
4610	111	Charleston	South Carolina	12	2009	194876
4611	111	Charleston	South Carolina	1	2010	191100
4612	111	Charleston	South Carolina	2	2010	184595
4613	111	Charleston	South Carolina	3	2010	189500
4614	111	Charleston	South Carolina	4	2010	184864
4615	111	Charleston	South Carolina	5	2010	185000
4616	111	Charleston	South Carolina	6	2010	188000
4617	111	Charleston	South Carolina	7	2010	200000
4618	111	Charleston	South Carolina	8	2010	196990
4619	111	Charleston	South Carolina	9	2010	189945
4620	111	Charleston	South Carolina	10	2010	190000
4621	111	Charleston	South Carolina	11	2010	195000
4622	111	Charleston	South Carolina	12	2010	180038
4623	111	Charleston	South Carolina	1	2011	173300
4624	111	Charleston	South Carolina	2	2011	165000
4625	111	Charleston	South Carolina	3	2011	179990
4626	111	Charleston	South Carolina	4	2011	180270
4627	111	Charleston	South Carolina	5	2011	180000
4628	111	Charleston	South Carolina	6	2011	192100
4629	111	Charleston	South Carolina	7	2011	185000
4630	111	Charleston	South Carolina	8	2011	185000
4631	111	Charleston	South Carolina	9	2011	183985
4632	111	Charleston	South Carolina	10	2011	190620
4633	111	Charleston	South Carolina	11	2011	197395
4634	111	Charleston	South Carolina	12	2011	193783
4635	111	Charleston	South Carolina	1	2012	175515
4636	111	Charleston	South Carolina	2	2012	170000
4637	111	Charleston	South Carolina	3	2012	182000
4638	111	Charleston	South Carolina	4	2012	180000
4639	111	Charleston	South Carolina	5	2012	205000
4640	111	Charleston	South Carolina	6	2012	200000
4641	111	Charleston	South Carolina	7	2012	205000
4642	111	Charleston	South Carolina	8	2012	199865
4643	111	Charleston	South Carolina	9	2012	190000
4644	111	Charleston	South Carolina	10	2012	188974
4645	111	Charleston	South Carolina	11	2012	189500
4646	111	Charleston	South Carolina	12	2012	207000
4647	111	Charleston	South Carolina	1	2013	180355
4648	111	Charleston	South Carolina	2	2013	181580
4649	111	Charleston	South Carolina	3	2013	200880
4650	111	Charleston	South Carolina	4	2013	204440
4651	111	Charleston	South Carolina	5	2013	211000
4652	111	Charleston	South Carolina	6	2013	220000
4653	111	Charleston	South Carolina	7	2013	208000
4654	111	Charleston	South Carolina	8	2013	219750
4655	111	Charleston	South Carolina	9	2013	211245
4656	111	Charleston	South Carolina	10	2013	190565
4657	111	Charleston	South Carolina	11	2013	206000
4658	111	Charleston	South Carolina	12	2013	221893
4659	111	Charleston	South Carolina	1	2014	212605
4660	111	Charleston	South Carolina	2	2014	209900
4661	111	Charleston	South Carolina	3	2014	224000
4662	111	Charleston	South Carolina	4	2014	222800
4663	111	Charleston	South Carolina	5	2014	222950
4664	111	Charleston	South Carolina	6	2014	230000
4665	111	Charleston	South Carolina	7	2014	216852
4666	111	Charleston	South Carolina	8	2014	215000
4667	111	Charleston	South Carolina	9	2014	219500
4668	111	Charleston	South Carolina	10	2014	222000
4669	111	Charleston	South Carolina	11	2014	219452
4670	111	Charleston	South Carolina	12	2014	221010
4671	111	Charleston	South Carolina	1	2015	225000
4672	111	Charleston	South Carolina	2	2015	220000
4673	111	Charleston	South Carolina	3	2015	229900
4674	111	Charleston	South Carolina	4	2015	225000
4675	111	Charleston	South Carolina	5	2015	236000
4676	111	Charleston	South Carolina	6	2015	246415
4677	111	Charleston	South Carolina	7	2015	230338
4678	111	Charleston	South Carolina	8	2015	231250
4679	111	Charleston	South Carolina	9	2015	235000
4680	111	Charleston	South Carolina	10	2015	227000
4681	111	Charleston	South Carolina	11	2015	251575
4682	111	Charleston	South Carolina	12	2015	248351
4683	111	Charleston	South Carolina	1	2016	220000
4684	111	Charleston	South Carolina	2	2016	238150
4685	111	Charleston	South Carolina	3	2016	235000
4686	111	Charleston	South Carolina	4	2016	234000
4687	111	Charleston	South Carolina	5	2016	255000
4688	111	Charleston	South Carolina	6	2016	249900
4689	111	Charleston	South Carolina	7	2016	249900
4690	111	Charleston	South Carolina	8	2016	237055
4691	111	Charleston	South Carolina	9	2016	245000
4692	111	Charleston	South Carolina	10	2016	240000
4693	111	Charleston	South Carolina	11	2016	250000
4694	111	Charleston	South Carolina	12	2016	248000
4695	111	Charleston	South Carolina	1	2017	239700
4696	111	Charleston	South Carolina	2	2017	245000
4697	111	Charleston	South Carolina	3	2017	248000
4698	111	Charleston	South Carolina	4	2017	250000
4699	111	Charleston	South Carolina	5	2017	260000
4700	111	Charleston	South Carolina	6	2017	260000
4701	111	Charleston	South Carolina	7	2017	259000
4702	111	Charleston	South Carolina	8	2017	252500
4703	111	Charleston	South Carolina	9	2017	248745
4704	111	Charleston	South Carolina	10	2017	257200
4705	111	Charleston	South Carolina	11	2017	248411
4706	111	Charleston	South Carolina	12	2017	268500
4707	111	Charleston	South Carolina	1	2018	252250
4708	111	Charleston	South Carolina	2	2018	254620
4709	111	Charleston	South Carolina	3	2018	265000
4710	111	Charleston	South Carolina	4	2018	262500
4711	111	Charleston	South Carolina	5	2018	270623
4712	111	Charleston	South Carolina	6	2018	271500
4713	111	Charleston	South Carolina	7	2018	268000
4714	111	Charleston	South Carolina	8	2018	265000
4715	111	Charleston	South Carolina	9	2018	269450
4716	111	Charleston	South Carolina	10	2018	257000
4717	111	Charleston	South Carolina	11	2018	262627
4718	111	Charleston	South Carolina	12	2018	273000
4719	111	Charleston	South Carolina	1	2019	0
4720	135	Billings	Montana	1	2009	0
4721	135	Billings	Montana	2	2009	186000
4722	135	Billings	Montana	3	2009	186400
4723	135	Billings	Montana	4	2009	186700
4724	135	Billings	Montana	5	2009	187100
4725	135	Billings	Montana	6	2009	187600
4726	135	Billings	Montana	7	2009	187900
4727	135	Billings	Montana	8	2009	188000
4728	135	Billings	Montana	9	2009	188100
4729	135	Billings	Montana	10	2009	188300
4730	135	Billings	Montana	11	2009	188300
4731	135	Billings	Montana	12	2009	188500
4732	135	Billings	Montana	1	2010	188600
4733	135	Billings	Montana	2	2010	188400
4734	135	Billings	Montana	3	2010	188700
4735	135	Billings	Montana	4	2010	189700
4736	135	Billings	Montana	5	2010	190700
4737	135	Billings	Montana	6	2010	191000
4738	135	Billings	Montana	7	2010	191300
4739	135	Billings	Montana	8	2010	191500
4740	135	Billings	Montana	9	2010	191300
4741	135	Billings	Montana	10	2010	190800
4742	135	Billings	Montana	11	2010	190800
4743	135	Billings	Montana	12	2010	190800
4744	135	Billings	Montana	1	2011	190600
4745	135	Billings	Montana	2	2011	190100
4746	135	Billings	Montana	3	2011	189200
4747	135	Billings	Montana	4	2011	187600
4748	135	Billings	Montana	5	2011	185500
4749	135	Billings	Montana	6	2011	183800
4750	135	Billings	Montana	7	2011	182800
4751	135	Billings	Montana	8	2011	182100
4752	135	Billings	Montana	9	2011	181800
4753	135	Billings	Montana	10	2011	181900
4754	135	Billings	Montana	11	2011	182300
4755	135	Billings	Montana	12	2011	183100
4756	135	Billings	Montana	1	2012	183800
4757	135	Billings	Montana	2	2012	184200
4758	135	Billings	Montana	3	2012	184700
4759	135	Billings	Montana	4	2012	185400
4760	135	Billings	Montana	5	2012	185900
4761	135	Billings	Montana	6	2012	186500
4762	135	Billings	Montana	7	2012	187500
4763	135	Billings	Montana	8	2012	188900
4764	135	Billings	Montana	9	2012	190600
4765	135	Billings	Montana	10	2012	192200
4766	135	Billings	Montana	11	2012	193700
4767	135	Billings	Montana	12	2012	195100
4768	135	Billings	Montana	1	2013	195800
4769	135	Billings	Montana	2	2013	195900
4770	135	Billings	Montana	3	2013	195700
4771	135	Billings	Montana	4	2013	195500
4772	135	Billings	Montana	5	2013	196000
4773	135	Billings	Montana	6	2013	197200
4774	135	Billings	Montana	7	2013	198600
4775	135	Billings	Montana	8	2013	199300
4776	135	Billings	Montana	9	2013	199200
4777	135	Billings	Montana	10	2013	198700
4778	135	Billings	Montana	11	2013	198400
4779	135	Billings	Montana	12	2013	198400
4780	135	Billings	Montana	1	2014	198900
4781	135	Billings	Montana	2	2014	199700
4782	135	Billings	Montana	3	2014	200100
4783	135	Billings	Montana	4	2014	200800
4784	135	Billings	Montana	5	2014	201600
4785	135	Billings	Montana	6	2014	202600
4786	135	Billings	Montana	7	2014	204600
4787	135	Billings	Montana	8	2014	206900
4788	135	Billings	Montana	9	2014	208000
4789	135	Billings	Montana	10	2014	207300
4790	135	Billings	Montana	11	2014	205600
4791	135	Billings	Montana	12	2014	203800
4792	135	Billings	Montana	1	2015	202700
4793	135	Billings	Montana	2	2015	202300
4794	135	Billings	Montana	3	2015	202700
4795	135	Billings	Montana	4	2015	202900
4796	135	Billings	Montana	5	2015	203900
4797	135	Billings	Montana	6	2015	206500
4798	135	Billings	Montana	7	2015	208400
4799	135	Billings	Montana	8	2015	208600
4800	135	Billings	Montana	9	2015	208800
4801	135	Billings	Montana	10	2015	209500
4802	135	Billings	Montana	11	2015	209300
4803	135	Billings	Montana	12	2015	207600
4804	135	Billings	Montana	1	2016	206600
4805	135	Billings	Montana	2	2016	207500
4806	135	Billings	Montana	3	2016	209600
4807	135	Billings	Montana	4	2016	213600
4808	135	Billings	Montana	5	2016	217000
4809	135	Billings	Montana	6	2016	216500
4810	135	Billings	Montana	7	2016	212900
4811	135	Billings	Montana	8	2016	210800
4812	135	Billings	Montana	9	2016	211500
4813	135	Billings	Montana	10	2016	213400
4814	135	Billings	Montana	11	2016	214400
4815	135	Billings	Montana	12	2016	214700
4816	135	Billings	Montana	1	2017	214600
4817	135	Billings	Montana	2	2017	213400
4818	135	Billings	Montana	3	2017	211500
4819	135	Billings	Montana	4	2017	211100
4820	135	Billings	Montana	5	2017	211600
4821	135	Billings	Montana	6	2017	211000
4822	135	Billings	Montana	7	2017	209600
4823	135	Billings	Montana	8	2017	208600
4824	135	Billings	Montana	9	2017	207800
4825	135	Billings	Montana	10	2017	207700
4826	135	Billings	Montana	11	2017	209500
4827	135	Billings	Montana	12	2017	212300
4828	135	Billings	Montana	1	2018	216100
4829	135	Billings	Montana	2	2018	221500
4830	135	Billings	Montana	3	2018	226500
4831	135	Billings	Montana	4	2018	227000
4832	135	Billings	Montana	5	2018	224700
4833	135	Billings	Montana	6	2018	223300
4834	135	Billings	Montana	7	2018	224200
4835	135	Billings	Montana	8	2018	225600
4836	135	Billings	Montana	9	2018	227200
4837	135	Billings	Montana	10	2018	229400
4838	135	Billings	Montana	11	2018	232100
4839	135	Billings	Montana	12	2018	234900
4840	135	Billings	Montana	1	2019	236600
4841	115	Austin	Texas	1	2009	177200
4842	115	Austin	Texas	2	2009	190000
4843	115	Austin	Texas	3	2009	180000
4844	115	Austin	Texas	4	2009	188933
4845	115	Austin	Texas	5	2009	190000
4846	115	Austin	Texas	6	2009	195517
4847	115	Austin	Texas	7	2009	189500
4848	115	Austin	Texas	8	2009	187000
4849	115	Austin	Texas	9	2009	185000
4850	115	Austin	Texas	10	2009	179775
4851	115	Austin	Texas	11	2009	176500
4852	115	Austin	Texas	12	2009	187450
4853	115	Austin	Texas	1	2010	175000
4854	115	Austin	Texas	2	2010	184950
4855	115	Austin	Texas	3	2010	179193
4856	115	Austin	Texas	4	2010	186000
4857	115	Austin	Texas	5	2010	189000
4858	115	Austin	Texas	6	2010	200000
4859	115	Austin	Texas	7	2010	215000
4860	115	Austin	Texas	8	2010	196200
4861	115	Austin	Texas	9	2010	190050
4862	115	Austin	Texas	10	2010	191200
4863	115	Austin	Texas	11	2010	180000
4864	115	Austin	Texas	12	2010	188250
4865	115	Austin	Texas	1	2011	185000
4866	115	Austin	Texas	2	2011	185983
4867	115	Austin	Texas	3	2011	184500
4868	115	Austin	Texas	4	2011	191000
4869	115	Austin	Texas	5	2011	193809
4870	115	Austin	Texas	6	2011	198000
4871	115	Austin	Texas	7	2011	192500
4872	115	Austin	Texas	8	2011	195000
4873	115	Austin	Texas	9	2011	188250
4874	115	Austin	Texas	10	2011	189000
4875	115	Austin	Texas	11	2011	185980
4876	115	Austin	Texas	12	2011	190000
4877	115	Austin	Texas	1	2012	179900
4878	115	Austin	Texas	2	2012	190100
4879	115	Austin	Texas	3	2012	199700
4880	115	Austin	Texas	4	2012	205468
4881	115	Austin	Texas	5	2012	213700
4882	115	Austin	Texas	6	2012	215000
4883	115	Austin	Texas	7	2012	210000
4884	115	Austin	Texas	8	2012	209000
4885	115	Austin	Texas	9	2012	198000
4886	115	Austin	Texas	10	2012	199050
4887	115	Austin	Texas	11	2012	199900
4888	115	Austin	Texas	12	2012	210000
4889	115	Austin	Texas	1	2013	200000
4890	115	Austin	Texas	2	2013	207500
4891	115	Austin	Texas	3	2013	217200
4892	115	Austin	Texas	4	2013	226498
4893	115	Austin	Texas	5	2013	228000
4894	115	Austin	Texas	6	2013	230000
4895	115	Austin	Texas	7	2013	225000
4896	115	Austin	Texas	8	2013	219484
4897	115	Austin	Texas	9	2013	220500
4898	115	Austin	Texas	10	2013	218000
4899	115	Austin	Texas	11	2013	219385
4900	115	Austin	Texas	12	2013	226450
4901	115	Austin	Texas	1	2014	218000
4902	115	Austin	Texas	2	2014	228000
4903	115	Austin	Texas	3	2014	234000
4904	115	Austin	Texas	4	2014	238000
4905	115	Austin	Texas	5	2014	245668
4906	115	Austin	Texas	6	2014	251147
4907	115	Austin	Texas	7	2014	249990
4908	115	Austin	Texas	8	2014	247000
4909	115	Austin	Texas	9	2014	239700
4910	115	Austin	Texas	10	2014	239645
4911	115	Austin	Texas	11	2014	245000
4912	115	Austin	Texas	12	2014	246700
4913	115	Austin	Texas	1	2015	239534
4914	115	Austin	Texas	2	2015	248400
4915	115	Austin	Texas	3	2015	258750
4916	115	Austin	Texas	4	2015	270000
4917	115	Austin	Texas	5	2015	270000
4918	115	Austin	Texas	6	2015	273000
4919	115	Austin	Texas	7	2015	265500
4920	115	Austin	Texas	8	2015	264250
4921	115	Austin	Texas	9	2015	255000
4922	115	Austin	Texas	10	2015	256000
4923	115	Austin	Texas	11	2015	269000
4924	115	Austin	Texas	12	2015	272991
4925	115	Austin	Texas	1	2016	257750
4926	115	Austin	Texas	2	2016	269000
4927	115	Austin	Texas	3	2016	277000
4928	115	Austin	Texas	4	2016	289000
4929	115	Austin	Texas	5	2016	285000
4930	115	Austin	Texas	6	2016	295000
4931	115	Austin	Texas	7	2016	285000
4932	115	Austin	Texas	8	2016	286000
4933	115	Austin	Texas	9	2016	275000
4934	115	Austin	Texas	10	2016	278500
4935	115	Austin	Texas	11	2016	290000
4936	115	Austin	Texas	12	2016	289576
4937	115	Austin	Texas	1	2017	277500
4938	115	Austin	Texas	2	2017	287000
4939	115	Austin	Texas	3	2017	295000
4940	115	Austin	Texas	4	2017	301000
4941	115	Austin	Texas	5	2017	307000
4942	115	Austin	Texas	6	2017	309600
4943	115	Austin	Texas	7	2017	297969
4944	115	Austin	Texas	8	2017	295000
4945	115	Austin	Texas	9	2017	289300
4946	115	Austin	Texas	10	2017	290000
4947	115	Austin	Texas	11	2017	293000
4948	115	Austin	Texas	12	2017	305000
4949	115	Austin	Texas	1	2018	290000
4950	115	Austin	Texas	2	2018	296750
4951	115	Austin	Texas	3	2018	300000
4952	115	Austin	Texas	4	2018	315000
4953	115	Austin	Texas	5	2018	317500
4954	115	Austin	Texas	6	2018	321215
4955	115	Austin	Texas	7	2018	315000
4956	115	Austin	Texas	8	2018	316300
4957	115	Austin	Texas	9	2018	300000
4958	115	Austin	Texas	10	2018	305250
4959	115	Austin	Texas	11	2018	300520
4960	115	Austin	Texas	12	2018	305000
4961	115	Austin	Texas	1	2019	0
4962	151	Albuquerque	New Mexico	1	2009	0
4963	151	Albuquerque	New Mexico	2	2009	191800
4964	151	Albuquerque	New Mexico	3	2009	191200
4965	151	Albuquerque	New Mexico	4	2009	190500
4966	151	Albuquerque	New Mexico	5	2009	189600
4967	151	Albuquerque	New Mexico	6	2009	188500
4968	151	Albuquerque	New Mexico	7	2009	187500
4969	151	Albuquerque	New Mexico	8	2009	186400
4970	151	Albuquerque	New Mexico	9	2009	185700
4971	151	Albuquerque	New Mexico	10	2009	185500
4972	151	Albuquerque	New Mexico	11	2009	185700
4973	151	Albuquerque	New Mexico	12	2009	185900
4974	151	Albuquerque	New Mexico	1	2010	185900
4975	151	Albuquerque	New Mexico	2	2010	185800
4976	151	Albuquerque	New Mexico	3	2010	185500
4977	151	Albuquerque	New Mexico	4	2010	184900
4978	151	Albuquerque	New Mexico	5	2010	184400
4979	151	Albuquerque	New Mexico	6	2010	184100
4980	151	Albuquerque	New Mexico	7	2010	183700
4981	151	Albuquerque	New Mexico	8	2010	183300
4982	151	Albuquerque	New Mexico	9	2010	182600
4983	151	Albuquerque	New Mexico	10	2010	181100
4984	151	Albuquerque	New Mexico	11	2010	179700
4985	151	Albuquerque	New Mexico	12	2010	179000
4986	151	Albuquerque	New Mexico	1	2011	178400
4987	151	Albuquerque	New Mexico	2	2011	176900
4988	151	Albuquerque	New Mexico	3	2011	175400
4989	151	Albuquerque	New Mexico	4	2011	173900
4990	151	Albuquerque	New Mexico	5	2011	172500
4991	151	Albuquerque	New Mexico	6	2011	171200
4992	151	Albuquerque	New Mexico	7	2011	170100
4993	151	Albuquerque	New Mexico	8	2011	168900
4994	151	Albuquerque	New Mexico	9	2011	167500
4995	151	Albuquerque	New Mexico	10	2011	166200
4996	151	Albuquerque	New Mexico	11	2011	165300
4997	151	Albuquerque	New Mexico	12	2011	164600
4998	151	Albuquerque	New Mexico	1	2012	163900
4999	151	Albuquerque	New Mexico	2	2012	163200
5000	151	Albuquerque	New Mexico	3	2012	162500
5001	151	Albuquerque	New Mexico	4	2012	162400
5002	151	Albuquerque	New Mexico	5	2012	163000
5003	151	Albuquerque	New Mexico	6	2012	163400
5004	151	Albuquerque	New Mexico	7	2012	162900
5005	151	Albuquerque	New Mexico	8	2012	162700
5006	151	Albuquerque	New Mexico	9	2012	162900
5007	151	Albuquerque	New Mexico	10	2012	163100
5008	151	Albuquerque	New Mexico	11	2012	162800
5009	151	Albuquerque	New Mexico	12	2012	162200
5010	151	Albuquerque	New Mexico	1	2013	161900
5011	151	Albuquerque	New Mexico	2	2013	162200
5012	151	Albuquerque	New Mexico	3	2013	162400
5013	151	Albuquerque	New Mexico	4	2013	162300
5014	151	Albuquerque	New Mexico	5	2013	162400
5015	151	Albuquerque	New Mexico	6	2013	162800
5016	151	Albuquerque	New Mexico	7	2013	163300
5017	151	Albuquerque	New Mexico	8	2013	163700
5018	151	Albuquerque	New Mexico	9	2013	163700
5019	151	Albuquerque	New Mexico	10	2013	163200
5020	151	Albuquerque	New Mexico	11	2013	162400
5021	151	Albuquerque	New Mexico	12	2013	162100
5022	151	Albuquerque	New Mexico	1	2014	162700
5023	151	Albuquerque	New Mexico	2	2014	163900
5024	151	Albuquerque	New Mexico	3	2014	165500
5025	151	Albuquerque	New Mexico	4	2014	166700
5026	151	Albuquerque	New Mexico	5	2014	167000
5027	151	Albuquerque	New Mexico	6	2014	166900
5028	151	Albuquerque	New Mexico	7	2014	166900
5029	151	Albuquerque	New Mexico	8	2014	167200
5030	151	Albuquerque	New Mexico	9	2014	167700
5031	151	Albuquerque	New Mexico	10	2014	168300
5032	151	Albuquerque	New Mexico	11	2014	169100
5033	151	Albuquerque	New Mexico	12	2014	169400
5034	151	Albuquerque	New Mexico	1	2015	169300
5035	151	Albuquerque	New Mexico	2	2015	169400
5036	151	Albuquerque	New Mexico	3	2015	170000
5037	151	Albuquerque	New Mexico	4	2015	170900
5038	151	Albuquerque	New Mexico	5	2015	171500
5039	151	Albuquerque	New Mexico	6	2015	172000
5040	151	Albuquerque	New Mexico	7	2015	172800
5041	151	Albuquerque	New Mexico	8	2015	173700
5042	151	Albuquerque	New Mexico	9	2015	174700
5043	151	Albuquerque	New Mexico	10	2015	175700
5044	151	Albuquerque	New Mexico	11	2015	176500
5045	151	Albuquerque	New Mexico	12	2015	177000
5046	151	Albuquerque	New Mexico	1	2016	176900
5047	151	Albuquerque	New Mexico	2	2016	176700
5048	151	Albuquerque	New Mexico	3	2016	176900
5049	151	Albuquerque	New Mexico	4	2016	177400
5050	151	Albuquerque	New Mexico	5	2016	177700
5051	151	Albuquerque	New Mexico	6	2016	178000
5052	151	Albuquerque	New Mexico	7	2016	178200
5053	151	Albuquerque	New Mexico	8	2016	178300
5054	151	Albuquerque	New Mexico	9	2016	178500
5055	151	Albuquerque	New Mexico	10	2016	179300
5056	151	Albuquerque	New Mexico	11	2016	180400
5057	151	Albuquerque	New Mexico	12	2016	181400
5058	151	Albuquerque	New Mexico	1	2017	182100
5059	151	Albuquerque	New Mexico	2	2017	182300
5060	151	Albuquerque	New Mexico	3	2017	182200
5061	151	Albuquerque	New Mexico	4	2017	182400
5062	151	Albuquerque	New Mexico	5	2017	182600
5063	151	Albuquerque	New Mexico	6	2017	182500
5064	151	Albuquerque	New Mexico	7	2017	183000
5065	151	Albuquerque	New Mexico	8	2017	183900
5066	151	Albuquerque	New Mexico	9	2017	184700
5067	151	Albuquerque	New Mexico	10	2017	185600
5068	151	Albuquerque	New Mexico	11	2017	186600
5069	151	Albuquerque	New Mexico	12	2017	187100
5070	151	Albuquerque	New Mexico	1	2018	188100
5071	151	Albuquerque	New Mexico	2	2018	189500
5072	151	Albuquerque	New Mexico	3	2018	190600
5073	151	Albuquerque	New Mexico	4	2018	191200
5074	151	Albuquerque	New Mexico	5	2018	192000
5075	151	Albuquerque	New Mexico	6	2018	193200
5076	151	Albuquerque	New Mexico	7	2018	194700
5077	151	Albuquerque	New Mexico	8	2018	196100
5078	151	Albuquerque	New Mexico	9	2018	196900
5079	151	Albuquerque	New Mexico	10	2018	197800
5080	151	Albuquerque	New Mexico	11	2018	198800
5081	151	Albuquerque	New Mexico	12	2018	199900
5082	151	Albuquerque	New Mexico	1	2019	200700
5083	134	Helena	Montana	1	2009	0
5084	134	Helena	Montana	2	2009	185500
5085	134	Helena	Montana	3	2009	185700
5086	134	Helena	Montana	4	2009	185800
5087	134	Helena	Montana	5	2009	185600
5088	134	Helena	Montana	6	2009	185100
5089	134	Helena	Montana	7	2009	184700
5090	134	Helena	Montana	8	2009	184200
5091	134	Helena	Montana	9	2009	183800
5092	134	Helena	Montana	10	2009	183500
5093	134	Helena	Montana	11	2009	183300
5094	134	Helena	Montana	12	2009	183100
5095	134	Helena	Montana	1	2010	183000
5096	134	Helena	Montana	2	2010	183300
5097	134	Helena	Montana	3	2010	183100
5098	134	Helena	Montana	4	2010	182100
5099	134	Helena	Montana	5	2010	181700
5100	134	Helena	Montana	6	2010	182200
5101	134	Helena	Montana	7	2010	183000
5102	134	Helena	Montana	8	2010	183300
5103	134	Helena	Montana	9	2010	183400
5104	134	Helena	Montana	10	2010	183200
5105	134	Helena	Montana	11	2010	182600
5106	134	Helena	Montana	12	2010	181400
5107	134	Helena	Montana	1	2011	180700
5108	134	Helena	Montana	2	2011	180500
5109	134	Helena	Montana	3	2011	180700
5110	134	Helena	Montana	4	2011	180600
5111	134	Helena	Montana	5	2011	180100
5112	134	Helena	Montana	6	2011	179600
5113	134	Helena	Montana	7	2011	179400
5114	134	Helena	Montana	8	2011	179700
5115	134	Helena	Montana	9	2011	180100
5116	134	Helena	Montana	10	2011	180200
5117	134	Helena	Montana	11	2011	180600
5118	134	Helena	Montana	12	2011	181400
5119	134	Helena	Montana	1	2012	182300
5120	134	Helena	Montana	2	2012	182800
5121	134	Helena	Montana	3	2012	183000
5122	134	Helena	Montana	4	2012	183200
5123	134	Helena	Montana	5	2012	183000
5124	134	Helena	Montana	6	2012	182600
5125	134	Helena	Montana	7	2012	182500
5126	134	Helena	Montana	8	2012	183100
5127	134	Helena	Montana	9	2012	184000
5128	134	Helena	Montana	10	2012	184900
5129	134	Helena	Montana	11	2012	185700
5130	134	Helena	Montana	12	2012	186900
5131	134	Helena	Montana	1	2013	188300
5132	134	Helena	Montana	2	2013	189400
5133	134	Helena	Montana	3	2013	189700
5134	134	Helena	Montana	4	2013	191900
5135	134	Helena	Montana	5	2013	196900
5136	134	Helena	Montana	6	2013	201400
5137	134	Helena	Montana	7	2013	203800
5138	134	Helena	Montana	8	2013	205700
5139	134	Helena	Montana	9	2013	207100
5140	134	Helena	Montana	10	2013	208000
5141	134	Helena	Montana	11	2013	208900
5142	134	Helena	Montana	12	2013	209100
5143	134	Helena	Montana	1	2014	209200
5144	134	Helena	Montana	2	2014	210000
5145	134	Helena	Montana	3	2014	211800
5146	134	Helena	Montana	4	2014	212700
5147	134	Helena	Montana	5	2014	213000
5148	134	Helena	Montana	6	2014	213300
5149	134	Helena	Montana	7	2014	213500
5150	134	Helena	Montana	8	2014	213000
5151	134	Helena	Montana	9	2014	212100
5152	134	Helena	Montana	10	2014	211700
5153	134	Helena	Montana	11	2014	211700
5154	134	Helena	Montana	12	2014	211300
5155	134	Helena	Montana	1	2015	210100
5156	134	Helena	Montana	2	2015	209100
5157	134	Helena	Montana	3	2015	209400
5158	134	Helena	Montana	4	2015	210000
5159	134	Helena	Montana	5	2015	210000
5160	134	Helena	Montana	6	2015	210100
5161	134	Helena	Montana	7	2015	210800
5162	134	Helena	Montana	8	2015	211200
5163	134	Helena	Montana	9	2015	211700
5164	134	Helena	Montana	10	2015	212600
5165	134	Helena	Montana	11	2015	213100
5166	134	Helena	Montana	12	2015	213600
5167	134	Helena	Montana	1	2016	214700
5168	134	Helena	Montana	2	2016	216300
5169	134	Helena	Montana	3	2016	218100
5170	134	Helena	Montana	4	2016	219100
5171	134	Helena	Montana	5	2016	218700
5172	134	Helena	Montana	6	2016	218600
5173	134	Helena	Montana	7	2016	219200
5174	134	Helena	Montana	8	2016	220000
5175	134	Helena	Montana	9	2016	220900
5176	134	Helena	Montana	10	2016	221500
5177	134	Helena	Montana	11	2016	221400
5178	134	Helena	Montana	12	2016	222300
5179	134	Helena	Montana	1	2017	223700
5180	134	Helena	Montana	2	2017	224600
5181	134	Helena	Montana	3	2017	225200
5182	134	Helena	Montana	4	2017	226200
5183	134	Helena	Montana	5	2017	227400
5184	134	Helena	Montana	6	2017	228400
5185	134	Helena	Montana	7	2017	228900
5186	134	Helena	Montana	8	2017	229200
5187	134	Helena	Montana	9	2017	229100
5188	134	Helena	Montana	10	2017	229200
5189	134	Helena	Montana	11	2017	229700
5190	134	Helena	Montana	12	2017	230700
5191	134	Helena	Montana	1	2018	231800
5192	134	Helena	Montana	2	2018	232500
5193	134	Helena	Montana	3	2018	232800
5194	134	Helena	Montana	4	2018	233700
5195	134	Helena	Montana	5	2018	234900
5196	134	Helena	Montana	6	2018	235800
5197	134	Helena	Montana	7	2018	236800
5198	134	Helena	Montana	8	2018	238100
5199	134	Helena	Montana	9	2018	240400
5200	134	Helena	Montana	10	2018	244100
5201	134	Helena	Montana	11	2018	248300
5202	134	Helena	Montana	12	2018	251600
5203	134	Helena	Montana	1	2019	253800
5204	105	Philidelphia	Pennsylvania	1	2009	138000
5205	105	Philidelphia	Pennsylvania	2	2009	138000
5206	105	Philidelphia	Pennsylvania	3	2009	142450
5207	105	Philidelphia	Pennsylvania	4	2009	150000
5208	105	Philidelphia	Pennsylvania	5	2009	150000
5209	105	Philidelphia	Pennsylvania	6	2009	163000
5210	105	Philidelphia	Pennsylvania	7	2009	170000
5211	105	Philidelphia	Pennsylvania	8	2009	175000
5212	105	Philidelphia	Pennsylvania	9	2009	160000
5213	105	Philidelphia	Pennsylvania	10	2009	150000
5214	105	Philidelphia	Pennsylvania	11	2009	159900
5215	105	Philidelphia	Pennsylvania	12	2009	155000
5216	105	Philidelphia	Pennsylvania	1	2010	140000
5217	105	Philidelphia	Pennsylvania	2	2010	130000
5218	105	Philidelphia	Pennsylvania	3	2010	147300
5219	105	Philidelphia	Pennsylvania	4	2010	147000
5220	105	Philidelphia	Pennsylvania	5	2010	162500
5221	105	Philidelphia	Pennsylvania	6	2010	175000
5222	105	Philidelphia	Pennsylvania	7	2010	156900
5223	105	Philidelphia	Pennsylvania	8	2010	140000
5224	105	Philidelphia	Pennsylvania	9	2010	148000
5225	105	Philidelphia	Pennsylvania	10	2010	143000
5226	105	Philidelphia	Pennsylvania	11	2010	145750
5227	105	Philidelphia	Pennsylvania	12	2010	149500
5228	105	Philidelphia	Pennsylvania	1	2011	149700
5229	105	Philidelphia	Pennsylvania	2	2011	135000
5230	105	Philidelphia	Pennsylvania	3	2011	137500
5231	105	Philidelphia	Pennsylvania	4	2011	135000
5232	105	Philidelphia	Pennsylvania	5	2011	145500
5233	105	Philidelphia	Pennsylvania	6	2011	163000
5234	105	Philidelphia	Pennsylvania	7	2011	158163
5235	105	Philidelphia	Pennsylvania	8	2011	155000
5236	105	Philidelphia	Pennsylvania	9	2011	150000
5237	105	Philidelphia	Pennsylvania	10	2011	140000
5238	105	Philidelphia	Pennsylvania	11	2011	137000
5239	105	Philidelphia	Pennsylvania	12	2011	137500
5240	105	Philidelphia	Pennsylvania	1	2012	130000
5241	105	Philidelphia	Pennsylvania	2	2012	133500
5242	105	Philidelphia	Pennsylvania	3	2012	132750
5243	105	Philidelphia	Pennsylvania	4	2012	142500
5244	105	Philidelphia	Pennsylvania	5	2012	157900
5245	105	Philidelphia	Pennsylvania	6	2012	165000
5246	105	Philidelphia	Pennsylvania	7	2012	165000
5247	105	Philidelphia	Pennsylvania	8	2012	166750
5248	105	Philidelphia	Pennsylvania	9	2012	155000
5249	105	Philidelphia	Pennsylvania	10	2012	147000
5250	105	Philidelphia	Pennsylvania	11	2012	149000
5251	105	Philidelphia	Pennsylvania	12	2012	150000
5252	105	Philidelphia	Pennsylvania	1	2013	143250
5253	105	Philidelphia	Pennsylvania	2	2013	135000
5254	105	Philidelphia	Pennsylvania	3	2013	145004
5255	105	Philidelphia	Pennsylvania	4	2013	140000
5256	105	Philidelphia	Pennsylvania	5	2013	159500
5257	105	Philidelphia	Pennsylvania	6	2013	177000
5258	105	Philidelphia	Pennsylvania	7	2013	180000
5259	105	Philidelphia	Pennsylvania	8	2013	169900
5260	105	Philidelphia	Pennsylvania	9	2013	152225
5261	105	Philidelphia	Pennsylvania	10	2013	155000
5262	105	Philidelphia	Pennsylvania	11	2013	146000
5263	105	Philidelphia	Pennsylvania	12	2013	150000
5264	105	Philidelphia	Pennsylvania	1	2014	145000
5265	105	Philidelphia	Pennsylvania	2	2014	140000
5266	105	Philidelphia	Pennsylvania	3	2014	147500
5267	105	Philidelphia	Pennsylvania	4	2014	149000
5268	105	Philidelphia	Pennsylvania	5	2014	155000
5269	105	Philidelphia	Pennsylvania	6	2014	170000
5270	105	Philidelphia	Pennsylvania	7	2014	170000
5271	105	Philidelphia	Pennsylvania	8	2014	169500
5272	105	Philidelphia	Pennsylvania	9	2014	152200
5703	130	Milwaukee	Wisconsin	4	2010	159000
5273	105	Philidelphia	Pennsylvania	10	2014	150000
5274	105	Philidelphia	Pennsylvania	11	2014	147850
5275	105	Philidelphia	Pennsylvania	12	2014	151750
5276	105	Philidelphia	Pennsylvania	1	2015	143000
5277	105	Philidelphia	Pennsylvania	2	2015	137950
5278	105	Philidelphia	Pennsylvania	3	2015	142000
5279	105	Philidelphia	Pennsylvania	4	2015	158000
5280	105	Philidelphia	Pennsylvania	5	2015	163773
5281	105	Philidelphia	Pennsylvania	6	2015	185000
5282	105	Philidelphia	Pennsylvania	7	2015	176000
5283	105	Philidelphia	Pennsylvania	8	2015	175250
5284	105	Philidelphia	Pennsylvania	9	2015	168279
5285	105	Philidelphia	Pennsylvania	10	2015	164900
5286	105	Philidelphia	Pennsylvania	11	2015	150000
5287	105	Philidelphia	Pennsylvania	12	2015	159700
5288	105	Philidelphia	Pennsylvania	1	2016	154062
5289	105	Philidelphia	Pennsylvania	2	2016	150000
5290	105	Philidelphia	Pennsylvania	3	2016	156000
5291	105	Philidelphia	Pennsylvania	4	2016	165000
5292	105	Philidelphia	Pennsylvania	5	2016	185000
5293	105	Philidelphia	Pennsylvania	6	2016	190000
5294	105	Philidelphia	Pennsylvania	7	2016	185575
5295	105	Philidelphia	Pennsylvania	8	2016	180000
5296	105	Philidelphia	Pennsylvania	9	2016	170000
5297	105	Philidelphia	Pennsylvania	10	2016	170000
5298	105	Philidelphia	Pennsylvania	11	2016	170000
5299	105	Philidelphia	Pennsylvania	12	2016	178750
5300	105	Philidelphia	Pennsylvania	1	2017	168400
5301	105	Philidelphia	Pennsylvania	2	2017	160000
5302	105	Philidelphia	Pennsylvania	3	2017	170000
5303	105	Philidelphia	Pennsylvania	4	2017	180000
5304	105	Philidelphia	Pennsylvania	5	2017	194000
5305	105	Philidelphia	Pennsylvania	6	2017	211525
5306	105	Philidelphia	Pennsylvania	7	2017	197000
5307	105	Philidelphia	Pennsylvania	8	2017	198000
5308	105	Philidelphia	Pennsylvania	9	2017	181500
5309	105	Philidelphia	Pennsylvania	10	2017	182500
5310	105	Philidelphia	Pennsylvania	11	2017	185000
5311	105	Philidelphia	Pennsylvania	12	2017	189000
5312	105	Philidelphia	Pennsylvania	1	2018	178750
5313	105	Philidelphia	Pennsylvania	2	2018	180000
5314	105	Philidelphia	Pennsylvania	3	2018	187500
5315	105	Philidelphia	Pennsylvania	4	2018	200000
5316	105	Philidelphia	Pennsylvania	5	2018	202000
5317	105	Philidelphia	Pennsylvania	6	2018	210000
5318	105	Philidelphia	Pennsylvania	7	2018	207000
5319	105	Philidelphia	Pennsylvania	8	2018	205000
5320	105	Philidelphia	Pennsylvania	9	2018	195000
5321	105	Philidelphia	Pennsylvania	10	2018	196250
5322	105	Philidelphia	Pennsylvania	11	2018	199867
5323	105	Philidelphia	Pennsylvania	12	2018	190000
5324	105	Philidelphia	Pennsylvania	1	2019	0
5325	75	Minneapolis	Minnesota	1	2009	149900
5326	75	Minneapolis	Minnesota	2	2009	149900
5327	75	Minneapolis	Minnesota	3	2009	148763
5328	75	Minneapolis	Minnesota	4	2009	150000
5329	75	Minneapolis	Minnesota	5	2009	165000
5330	75	Minneapolis	Minnesota	6	2009	169000
5331	75	Minneapolis	Minnesota	7	2009	170000
5332	75	Minneapolis	Minnesota	8	2009	170000
5333	75	Minneapolis	Minnesota	9	2009	166000
5334	75	Minneapolis	Minnesota	10	2009	167000
5335	75	Minneapolis	Minnesota	11	2009	165000
5336	75	Minneapolis	Minnesota	12	2009	159900
5337	75	Minneapolis	Minnesota	1	2010	151000
5338	75	Minneapolis	Minnesota	2	2010	159900
5339	75	Minneapolis	Minnesota	3	2010	163950
5340	75	Minneapolis	Minnesota	4	2010	169000
5341	75	Minneapolis	Minnesota	5	2010	172000
5342	75	Minneapolis	Minnesota	6	2010	178000
5343	75	Minneapolis	Minnesota	7	2010	169900
5344	75	Minneapolis	Minnesota	8	2010	170300
5345	75	Minneapolis	Minnesota	9	2010	165000
5346	75	Minneapolis	Minnesota	10	2010	169900
5347	75	Minneapolis	Minnesota	11	2010	164375
5348	75	Minneapolis	Minnesota	12	2010	155000
5349	75	Minneapolis	Minnesota	1	2011	144700
5350	75	Minneapolis	Minnesota	2	2011	140000
5351	75	Minneapolis	Minnesota	3	2011	140000
5352	75	Minneapolis	Minnesota	4	2011	143416
5353	75	Minneapolis	Minnesota	5	2011	152000
5354	75	Minneapolis	Minnesota	6	2011	160000
5355	75	Minneapolis	Minnesota	7	2011	155000
5356	75	Minneapolis	Minnesota	8	2011	154000
5357	75	Minneapolis	Minnesota	9	2011	155000
5358	75	Minneapolis	Minnesota	10	2011	151000
5359	75	Minneapolis	Minnesota	11	2011	145500
5360	75	Minneapolis	Minnesota	12	2011	144500
5361	75	Minneapolis	Minnesota	1	2012	139000
5362	75	Minneapolis	Minnesota	2	2012	136770
5363	75	Minneapolis	Minnesota	3	2012	147200
5364	75	Minneapolis	Minnesota	4	2012	160700
5365	75	Minneapolis	Minnesota	5	2012	165300
5366	75	Minneapolis	Minnesota	6	2012	175000
5367	75	Minneapolis	Minnesota	7	2012	177000
5368	75	Minneapolis	Minnesota	8	2012	175550
5369	75	Minneapolis	Minnesota	9	2012	172000
5370	75	Minneapolis	Minnesota	10	2012	172000
5371	75	Minneapolis	Minnesota	11	2012	170000
5372	75	Minneapolis	Minnesota	12	2012	164900
5373	75	Minneapolis	Minnesota	1	2013	158500
5374	75	Minneapolis	Minnesota	2	2013	158500
5375	75	Minneapolis	Minnesota	3	2013	172481
5376	75	Minneapolis	Minnesota	4	2013	179400
5377	75	Minneapolis	Minnesota	5	2013	185000
5378	75	Minneapolis	Minnesota	6	2013	200400
5379	75	Minneapolis	Minnesota	7	2013	204900
5380	75	Minneapolis	Minnesota	8	2013	203000
5381	75	Minneapolis	Minnesota	9	2013	200000
5382	75	Minneapolis	Minnesota	10	2013	195500
5383	75	Minneapolis	Minnesota	11	2013	192500
5384	75	Minneapolis	Minnesota	12	2013	193000
5385	75	Minneapolis	Minnesota	1	2014	185000
5386	75	Minneapolis	Minnesota	2	2014	180000
5387	75	Minneapolis	Minnesota	3	2014	185000
5388	75	Minneapolis	Minnesota	4	2014	197500
5389	75	Minneapolis	Minnesota	5	2014	201500
5390	75	Minneapolis	Minnesota	6	2014	217379
5391	75	Minneapolis	Minnesota	7	2014	215000
5392	75	Minneapolis	Minnesota	8	2014	216718
5393	75	Minneapolis	Minnesota	9	2014	209900
5394	75	Minneapolis	Minnesota	10	2014	205000
5395	75	Minneapolis	Minnesota	11	2014	205000
5396	75	Minneapolis	Minnesota	12	2014	208600
5397	75	Minneapolis	Minnesota	1	2015	194000
5398	75	Minneapolis	Minnesota	2	2015	198550
5399	75	Minneapolis	Minnesota	3	2015	207790
5400	75	Minneapolis	Minnesota	4	2015	214000
5401	75	Minneapolis	Minnesota	5	2015	221000
5402	75	Minneapolis	Minnesota	6	2015	225744
5403	75	Minneapolis	Minnesota	7	2015	227877
5404	75	Minneapolis	Minnesota	8	2015	225000
5405	75	Minneapolis	Minnesota	9	2015	220000
5406	75	Minneapolis	Minnesota	10	2015	215000
5407	75	Minneapolis	Minnesota	11	2015	222950
5408	75	Minneapolis	Minnesota	12	2015	219900
5409	75	Minneapolis	Minnesota	1	2016	214320
5410	75	Minneapolis	Minnesota	2	2016	214900
5411	75	Minneapolis	Minnesota	3	2016	218000
5412	75	Minneapolis	Minnesota	4	2016	227000
5413	75	Minneapolis	Minnesota	5	2016	234900
5414	75	Minneapolis	Minnesota	6	2016	240000
5415	75	Minneapolis	Minnesota	7	2016	239900
5416	75	Minneapolis	Minnesota	8	2016	239000
5417	75	Minneapolis	Minnesota	9	2016	233399
5418	75	Minneapolis	Minnesota	10	2016	230000
5419	75	Minneapolis	Minnesota	11	2016	232500
5420	75	Minneapolis	Minnesota	12	2016	230000
5421	75	Minneapolis	Minnesota	1	2017	226000
5422	75	Minneapolis	Minnesota	2	2017	223000
5423	75	Minneapolis	Minnesota	3	2017	232250
5424	75	Minneapolis	Minnesota	4	2017	240000
5425	75	Minneapolis	Minnesota	5	2017	247900
5426	75	Minneapolis	Minnesota	6	2017	255000
5427	75	Minneapolis	Minnesota	7	2017	255000
5428	75	Minneapolis	Minnesota	8	2017	254000
5429	75	Minneapolis	Minnesota	9	2017	250000
5430	75	Minneapolis	Minnesota	10	2017	245000
5431	75	Minneapolis	Minnesota	11	2017	246964
5432	75	Minneapolis	Minnesota	12	2017	249000
5433	75	Minneapolis	Minnesota	1	2018	245000
5434	75	Minneapolis	Minnesota	2	2018	246877
5435	75	Minneapolis	Minnesota	3	2018	257277
5436	75	Minneapolis	Minnesota	4	2018	264285
5437	75	Minneapolis	Minnesota	5	2018	270000
5438	75	Minneapolis	Minnesota	6	2018	269900
5439	75	Minneapolis	Minnesota	7	2018	267500
5440	75	Minneapolis	Minnesota	8	2018	267000
5441	75	Minneapolis	Minnesota	9	2018	264900
5442	75	Minneapolis	Minnesota	10	2018	266250
5443	75	Minneapolis	Minnesota	11	2018	266000
5444	75	Minneapolis	Minnesota	12	2018	256925
5445	75	Minneapolis	Minnesota	1	2019	0
5446	104	Harrisburg	Pennsylvania	1	2009	160950
5447	104	Harrisburg	Pennsylvania	2	2009	178000
5448	104	Harrisburg	Pennsylvania	3	2009	169900
5449	104	Harrisburg	Pennsylvania	4	2009	172400
5450	104	Harrisburg	Pennsylvania	5	2009	172000
5451	104	Harrisburg	Pennsylvania	6	2009	173500
5452	104	Harrisburg	Pennsylvania	7	2009	176000
5453	104	Harrisburg	Pennsylvania	8	2009	169000
5454	104	Harrisburg	Pennsylvania	9	2009	165000
5455	104	Harrisburg	Pennsylvania	10	2009	164900
5456	104	Harrisburg	Pennsylvania	11	2009	164900
5457	104	Harrisburg	Pennsylvania	12	2009	164900
5458	104	Harrisburg	Pennsylvania	1	2010	174500
5459	104	Harrisburg	Pennsylvania	2	2010	169000
5460	104	Harrisburg	Pennsylvania	3	2010	169000
5461	104	Harrisburg	Pennsylvania	4	2010	169450
5462	104	Harrisburg	Pennsylvania	5	2010	164173
5463	104	Harrisburg	Pennsylvania	6	2010	180000
5464	104	Harrisburg	Pennsylvania	7	2010	185000
5465	104	Harrisburg	Pennsylvania	8	2010	182450
5466	104	Harrisburg	Pennsylvania	9	2010	172940
5467	104	Harrisburg	Pennsylvania	10	2010	165900
5468	104	Harrisburg	Pennsylvania	11	2010	174900
5469	104	Harrisburg	Pennsylvania	12	2010	159500
5470	104	Harrisburg	Pennsylvania	1	2011	159450
5471	104	Harrisburg	Pennsylvania	2	2011	175950
5472	104	Harrisburg	Pennsylvania	3	2011	159500
5473	104	Harrisburg	Pennsylvania	4	2011	167000
5474	104	Harrisburg	Pennsylvania	5	2011	176500
5475	104	Harrisburg	Pennsylvania	6	2011	173645
5476	104	Harrisburg	Pennsylvania	7	2011	162343
5477	104	Harrisburg	Pennsylvania	8	2011	165000
5478	104	Harrisburg	Pennsylvania	9	2011	174250
5479	104	Harrisburg	Pennsylvania	10	2011	173000
5480	104	Harrisburg	Pennsylvania	11	2011	162500
5481	104	Harrisburg	Pennsylvania	12	2011	157500
5482	104	Harrisburg	Pennsylvania	1	2012	162000
5483	104	Harrisburg	Pennsylvania	2	2012	160000
5484	104	Harrisburg	Pennsylvania	3	2012	159950
5485	104	Harrisburg	Pennsylvania	4	2012	163000
5486	104	Harrisburg	Pennsylvania	5	2012	173000
5487	104	Harrisburg	Pennsylvania	6	2012	170000
5488	104	Harrisburg	Pennsylvania	7	2012	171900
5489	104	Harrisburg	Pennsylvania	8	2012	166500
5490	104	Harrisburg	Pennsylvania	9	2012	192900
5491	104	Harrisburg	Pennsylvania	10	2012	169000
5492	104	Harrisburg	Pennsylvania	11	2012	173000
5493	104	Harrisburg	Pennsylvania	12	2012	188500
5494	104	Harrisburg	Pennsylvania	1	2013	159000
5495	104	Harrisburg	Pennsylvania	2	2013	151000
5496	104	Harrisburg	Pennsylvania	3	2013	154900
5497	104	Harrisburg	Pennsylvania	4	2013	174450
5498	104	Harrisburg	Pennsylvania	5	2013	161000
5499	104	Harrisburg	Pennsylvania	6	2013	168700
5500	104	Harrisburg	Pennsylvania	7	2013	184900
5501	104	Harrisburg	Pennsylvania	8	2013	169500
5502	104	Harrisburg	Pennsylvania	9	2013	154000
5503	104	Harrisburg	Pennsylvania	10	2013	172000
5504	104	Harrisburg	Pennsylvania	11	2013	156900
5505	104	Harrisburg	Pennsylvania	12	2013	168250
5506	104	Harrisburg	Pennsylvania	1	2014	162875
5507	104	Harrisburg	Pennsylvania	2	2014	150000
5508	104	Harrisburg	Pennsylvania	3	2014	174700
5509	104	Harrisburg	Pennsylvania	4	2014	159900
5510	104	Harrisburg	Pennsylvania	5	2014	155000
5511	104	Harrisburg	Pennsylvania	6	2014	175500
5512	104	Harrisburg	Pennsylvania	7	2014	170000
5513	104	Harrisburg	Pennsylvania	8	2014	164900
5514	104	Harrisburg	Pennsylvania	9	2014	164950
5515	104	Harrisburg	Pennsylvania	10	2014	156000
5516	104	Harrisburg	Pennsylvania	11	2014	172000
5517	104	Harrisburg	Pennsylvania	12	2014	173450
5518	104	Harrisburg	Pennsylvania	1	2015	169000
5519	104	Harrisburg	Pennsylvania	2	2015	151450
5520	104	Harrisburg	Pennsylvania	3	2015	167900
5521	104	Harrisburg	Pennsylvania	4	2015	166500
5522	104	Harrisburg	Pennsylvania	5	2015	179000
5523	104	Harrisburg	Pennsylvania	6	2015	178000
5524	104	Harrisburg	Pennsylvania	7	2015	175100
5525	104	Harrisburg	Pennsylvania	8	2015	170000
5526	104	Harrisburg	Pennsylvania	9	2015	165000
5527	104	Harrisburg	Pennsylvania	10	2015	164450
5528	104	Harrisburg	Pennsylvania	11	2015	150000
5529	104	Harrisburg	Pennsylvania	12	2015	160000
5530	104	Harrisburg	Pennsylvania	1	2016	156000
5531	104	Harrisburg	Pennsylvania	2	2016	159300
5532	104	Harrisburg	Pennsylvania	3	2016	164950
5533	104	Harrisburg	Pennsylvania	4	2016	165000
5534	104	Harrisburg	Pennsylvania	5	2016	175000
5535	104	Harrisburg	Pennsylvania	6	2016	180000
5536	104	Harrisburg	Pennsylvania	7	2016	181000
5537	104	Harrisburg	Pennsylvania	8	2016	170000
5538	104	Harrisburg	Pennsylvania	9	2016	166450
5539	104	Harrisburg	Pennsylvania	10	2016	181200
5540	104	Harrisburg	Pennsylvania	11	2016	175000
5541	104	Harrisburg	Pennsylvania	12	2016	175250
5542	104	Harrisburg	Pennsylvania	1	2017	158000
5543	104	Harrisburg	Pennsylvania	2	2017	174000
5544	104	Harrisburg	Pennsylvania	3	2017	163950
5545	104	Harrisburg	Pennsylvania	4	2017	181000
5546	104	Harrisburg	Pennsylvania	5	2017	171000
5547	104	Harrisburg	Pennsylvania	6	2017	182500
5548	104	Harrisburg	Pennsylvania	7	2017	187400
5549	104	Harrisburg	Pennsylvania	8	2017	195000
5550	104	Harrisburg	Pennsylvania	9	2017	187000
5551	104	Harrisburg	Pennsylvania	10	2017	179900
5552	104	Harrisburg	Pennsylvania	11	2017	174950
5553	104	Harrisburg	Pennsylvania	12	2017	195000
5554	104	Harrisburg	Pennsylvania	1	2018	172000
5555	104	Harrisburg	Pennsylvania	2	2018	160000
5556	104	Harrisburg	Pennsylvania	3	2018	176900
5557	104	Harrisburg	Pennsylvania	4	2018	169000
5558	104	Harrisburg	Pennsylvania	5	2018	180000
5559	104	Harrisburg	Pennsylvania	6	2018	187000
5560	104	Harrisburg	Pennsylvania	7	2018	190000
5561	104	Harrisburg	Pennsylvania	8	2018	188500
5562	104	Harrisburg	Pennsylvania	9	2018	171500
5563	104	Harrisburg	Pennsylvania	10	2018	177500
5564	104	Harrisburg	Pennsylvania	11	2018	173000
5565	104	Harrisburg	Pennsylvania	12	2018	182500
5566	104	Harrisburg	Pennsylvania	1	2019	0
5567	137	Bismarck	North Dakota	1	2009	0
5568	137	Bismarck	North Dakota	2	2009	165200
5569	137	Bismarck	North Dakota	3	2009	165400
5570	137	Bismarck	North Dakota	4	2009	166700
5571	137	Bismarck	North Dakota	5	2009	168500
5572	137	Bismarck	North Dakota	6	2009	169100
5573	137	Bismarck	North Dakota	7	2009	168700
5574	137	Bismarck	North Dakota	8	2009	168800
5575	137	Bismarck	North Dakota	9	2009	169700
5576	137	Bismarck	North Dakota	10	2009	170600
5577	137	Bismarck	North Dakota	11	2009	171300
5578	137	Bismarck	North Dakota	12	2009	171700
5579	137	Bismarck	North Dakota	1	2010	171800
5580	137	Bismarck	North Dakota	2	2010	171800
5581	137	Bismarck	North Dakota	3	2010	172100
5582	137	Bismarck	North Dakota	4	2010	172200
5583	137	Bismarck	North Dakota	5	2010	172000
5584	137	Bismarck	North Dakota	6	2010	171700
5585	137	Bismarck	North Dakota	7	2010	171600
5586	137	Bismarck	North Dakota	8	2010	171700
5587	137	Bismarck	North Dakota	9	2010	171800
5588	137	Bismarck	North Dakota	10	2010	172100
5589	137	Bismarck	North Dakota	11	2010	172800
5590	137	Bismarck	North Dakota	12	2010	174200
5591	137	Bismarck	North Dakota	1	2011	176100
5592	137	Bismarck	North Dakota	2	2011	178000
5593	137	Bismarck	North Dakota	3	2011	178700
5594	137	Bismarck	North Dakota	4	2011	178300
5595	137	Bismarck	North Dakota	5	2011	177700
5596	137	Bismarck	North Dakota	6	2011	177800
5597	137	Bismarck	North Dakota	7	2011	178800
5598	137	Bismarck	North Dakota	8	2011	179800
5599	137	Bismarck	North Dakota	9	2011	180600
5600	137	Bismarck	North Dakota	10	2011	181200
5601	137	Bismarck	North Dakota	11	2011	181900
5602	137	Bismarck	North Dakota	12	2011	182700
5603	137	Bismarck	North Dakota	1	2012	183500
5604	137	Bismarck	North Dakota	2	2012	184300
5605	137	Bismarck	North Dakota	3	2012	185700
5606	137	Bismarck	North Dakota	4	2012	187000
5607	137	Bismarck	North Dakota	5	2012	188700
5608	137	Bismarck	North Dakota	6	2012	191200
5609	137	Bismarck	North Dakota	7	2012	193800
5610	137	Bismarck	North Dakota	8	2012	195700
5611	137	Bismarck	North Dakota	9	2012	198300
5612	137	Bismarck	North Dakota	10	2012	202000
5613	137	Bismarck	North Dakota	11	2012	206200
5614	137	Bismarck	North Dakota	12	2012	209600
5615	137	Bismarck	North Dakota	1	2013	212400
5616	137	Bismarck	North Dakota	2	2013	215400
5617	137	Bismarck	North Dakota	3	2013	217900
5618	137	Bismarck	North Dakota	4	2013	220200
5619	137	Bismarck	North Dakota	5	2013	222800
5620	137	Bismarck	North Dakota	6	2013	225900
5621	137	Bismarck	North Dakota	7	2013	228800
5622	137	Bismarck	North Dakota	8	2013	231300
5623	137	Bismarck	North Dakota	9	2013	233000
5624	137	Bismarck	North Dakota	10	2013	234400
5625	137	Bismarck	North Dakota	11	2013	235300
5626	137	Bismarck	North Dakota	12	2013	236300
5627	137	Bismarck	North Dakota	1	2014	237800
5628	137	Bismarck	North Dakota	2	2014	239800
5629	137	Bismarck	North Dakota	3	2014	241700
5630	137	Bismarck	North Dakota	4	2014	244200
5631	137	Bismarck	North Dakota	5	2014	247000
5632	137	Bismarck	North Dakota	6	2014	249100
5633	137	Bismarck	North Dakota	7	2014	250300
5634	137	Bismarck	North Dakota	8	2014	251700
5635	137	Bismarck	North Dakota	9	2014	252700
5636	137	Bismarck	North Dakota	10	2014	253500
5637	137	Bismarck	North Dakota	11	2014	254900
5638	137	Bismarck	North Dakota	12	2014	256200
5639	137	Bismarck	North Dakota	1	2015	256800
5640	137	Bismarck	North Dakota	2	2015	257200
5641	137	Bismarck	North Dakota	3	2015	258200
5642	137	Bismarck	North Dakota	4	2015	260000
5643	137	Bismarck	North Dakota	5	2015	262100
5644	137	Bismarck	North Dakota	6	2015	263300
5645	137	Bismarck	North Dakota	7	2015	264300
5646	137	Bismarck	North Dakota	8	2015	265800
5647	137	Bismarck	North Dakota	9	2015	267500
5648	137	Bismarck	North Dakota	10	2015	267100
5649	137	Bismarck	North Dakota	11	2015	264800
5650	137	Bismarck	North Dakota	12	2015	263600
5651	137	Bismarck	North Dakota	1	2016	263800
5652	137	Bismarck	North Dakota	2	2016	264200
5653	137	Bismarck	North Dakota	3	2016	265500
5654	137	Bismarck	North Dakota	4	2016	267800
5655	137	Bismarck	North Dakota	5	2016	269400
5656	137	Bismarck	North Dakota	6	2016	270200
5657	137	Bismarck	North Dakota	7	2016	269900
5658	137	Bismarck	North Dakota	8	2016	268600
5659	137	Bismarck	North Dakota	9	2016	267500
5660	137	Bismarck	North Dakota	10	2016	267300
5661	137	Bismarck	North Dakota	11	2016	267900
5662	137	Bismarck	North Dakota	12	2016	267800
5663	137	Bismarck	North Dakota	1	2017	267500
5664	137	Bismarck	North Dakota	2	2017	267500
5665	137	Bismarck	North Dakota	3	2017	267800
5666	137	Bismarck	North Dakota	4	2017	268000
5667	137	Bismarck	North Dakota	5	2017	267900
5668	137	Bismarck	North Dakota	6	2017	268100
5669	137	Bismarck	North Dakota	7	2017	268300
5670	137	Bismarck	North Dakota	8	2017	267900
5671	137	Bismarck	North Dakota	9	2017	267000
5672	137	Bismarck	North Dakota	10	2017	267200
5673	137	Bismarck	North Dakota	11	2017	268200
5674	137	Bismarck	North Dakota	12	2017	269100
5675	137	Bismarck	North Dakota	1	2018	269300
5676	137	Bismarck	North Dakota	2	2018	269100
5677	137	Bismarck	North Dakota	3	2018	268400
5678	137	Bismarck	North Dakota	4	2018	268800
5679	137	Bismarck	North Dakota	5	2018	270200
5680	137	Bismarck	North Dakota	6	2018	271200
5681	137	Bismarck	North Dakota	7	2018	271300
5682	137	Bismarck	North Dakota	8	2018	271000
5683	137	Bismarck	North Dakota	9	2018	269500
5684	137	Bismarck	North Dakota	10	2018	266800
5685	137	Bismarck	North Dakota	11	2018	264300
5686	137	Bismarck	North Dakota	12	2018	262700
5687	137	Bismarck	North Dakota	1	2019	261700
5688	130	Milwaukee	Wisconsin	1	2009	134000
5689	130	Milwaukee	Wisconsin	2	2009	146500
5690	130	Milwaukee	Wisconsin	3	2009	150000
5691	130	Milwaukee	Wisconsin	4	2009	155000
5692	130	Milwaukee	Wisconsin	5	2009	160000
5693	130	Milwaukee	Wisconsin	6	2009	170000
5694	130	Milwaukee	Wisconsin	7	2009	178000
5695	130	Milwaukee	Wisconsin	8	2009	167450
5696	130	Milwaukee	Wisconsin	9	2009	165000
5697	130	Milwaukee	Wisconsin	10	2009	164850
5698	130	Milwaukee	Wisconsin	11	2009	160000
5699	130	Milwaukee	Wisconsin	12	2009	156000
5700	130	Milwaukee	Wisconsin	1	2010	153000
5701	130	Milwaukee	Wisconsin	2	2010	148000
5702	130	Milwaukee	Wisconsin	3	2010	160000
5704	130	Milwaukee	Wisconsin	5	2010	167000
5705	130	Milwaukee	Wisconsin	6	2010	177000
5706	130	Milwaukee	Wisconsin	7	2010	175000
5707	130	Milwaukee	Wisconsin	8	2010	172000
5708	130	Milwaukee	Wisconsin	9	2010	158500
5709	130	Milwaukee	Wisconsin	10	2010	165000
5710	130	Milwaukee	Wisconsin	11	2010	159950
5711	130	Milwaukee	Wisconsin	12	2010	162000
5712	130	Milwaukee	Wisconsin	1	2011	143000
5713	130	Milwaukee	Wisconsin	2	2011	132450
5714	130	Milwaukee	Wisconsin	3	2011	138000
5715	130	Milwaukee	Wisconsin	4	2011	144000
5716	130	Milwaukee	Wisconsin	5	2011	155000
5717	130	Milwaukee	Wisconsin	6	2011	163900
5718	130	Milwaukee	Wisconsin	7	2011	163000
5719	130	Milwaukee	Wisconsin	8	2011	160000
5720	130	Milwaukee	Wisconsin	9	2011	160000
5721	130	Milwaukee	Wisconsin	10	2011	145000
5722	130	Milwaukee	Wisconsin	11	2011	146600
5723	130	Milwaukee	Wisconsin	12	2011	145000
5724	130	Milwaukee	Wisconsin	1	2012	125750
5725	130	Milwaukee	Wisconsin	2	2012	127500
5726	130	Milwaukee	Wisconsin	3	2012	137500
5727	130	Milwaukee	Wisconsin	4	2012	140000
5728	130	Milwaukee	Wisconsin	5	2012	153000
5729	130	Milwaukee	Wisconsin	6	2012	162000
5730	130	Milwaukee	Wisconsin	7	2012	165000
5731	130	Milwaukee	Wisconsin	8	2012	164963
5732	130	Milwaukee	Wisconsin	9	2012	154500
5733	130	Milwaukee	Wisconsin	10	2012	155000
5734	130	Milwaukee	Wisconsin	11	2012	146000
5735	130	Milwaukee	Wisconsin	12	2012	139000
5736	130	Milwaukee	Wisconsin	1	2013	129000
5737	130	Milwaukee	Wisconsin	2	2013	133600
5738	130	Milwaukee	Wisconsin	3	2013	148000
5739	130	Milwaukee	Wisconsin	4	2013	155000
5740	130	Milwaukee	Wisconsin	5	2013	165000
5741	130	Milwaukee	Wisconsin	6	2013	180625
5742	130	Milwaukee	Wisconsin	7	2013	176000
5743	130	Milwaukee	Wisconsin	8	2013	174500
5744	130	Milwaukee	Wisconsin	9	2013	161750
5745	130	Milwaukee	Wisconsin	10	2013	160000
5746	130	Milwaukee	Wisconsin	11	2013	151700
5747	130	Milwaukee	Wisconsin	12	2013	155000
5748	130	Milwaukee	Wisconsin	1	2014	145900
5749	130	Milwaukee	Wisconsin	2	2014	134900
5750	130	Milwaukee	Wisconsin	3	2014	156250
5751	130	Milwaukee	Wisconsin	4	2014	153500
5752	130	Milwaukee	Wisconsin	5	2014	165000
5753	130	Milwaukee	Wisconsin	6	2014	181000
5754	130	Milwaukee	Wisconsin	7	2014	185000
5755	130	Milwaukee	Wisconsin	8	2014	185000
5756	130	Milwaukee	Wisconsin	9	2014	170000
5757	130	Milwaukee	Wisconsin	10	2014	173000
5758	130	Milwaukee	Wisconsin	11	2014	172000
5759	130	Milwaukee	Wisconsin	12	2014	160000
5760	130	Milwaukee	Wisconsin	1	2015	154500
5761	130	Milwaukee	Wisconsin	2	2015	148000
5762	130	Milwaukee	Wisconsin	3	2015	160000
5763	130	Milwaukee	Wisconsin	4	2015	178750
5764	130	Milwaukee	Wisconsin	5	2015	180000
5765	130	Milwaukee	Wisconsin	6	2015	200000
5766	130	Milwaukee	Wisconsin	7	2015	187375
5767	130	Milwaukee	Wisconsin	8	2015	185000
5768	130	Milwaukee	Wisconsin	9	2015	175000
5769	130	Milwaukee	Wisconsin	10	2015	181500
5770	130	Milwaukee	Wisconsin	11	2015	178500
5771	130	Milwaukee	Wisconsin	12	2015	170000
5772	130	Milwaukee	Wisconsin	1	2016	163000
5773	130	Milwaukee	Wisconsin	2	2016	157750
5774	130	Milwaukee	Wisconsin	3	2016	174000
5775	130	Milwaukee	Wisconsin	4	2016	175000
5776	130	Milwaukee	Wisconsin	5	2016	185000
5777	130	Milwaukee	Wisconsin	6	2016	196500
5778	130	Milwaukee	Wisconsin	7	2016	191000
5779	130	Milwaukee	Wisconsin	8	2016	192500
5780	130	Milwaukee	Wisconsin	9	2016	191500
5781	130	Milwaukee	Wisconsin	10	2016	200000
5782	130	Milwaukee	Wisconsin	11	2016	185000
5783	130	Milwaukee	Wisconsin	12	2016	176000
5784	130	Milwaukee	Wisconsin	1	2017	184900
5785	130	Milwaukee	Wisconsin	2	2017	160125
5786	130	Milwaukee	Wisconsin	3	2017	185000
5787	130	Milwaukee	Wisconsin	4	2017	200800
5788	130	Milwaukee	Wisconsin	5	2017	196050
5789	130	Milwaukee	Wisconsin	6	2017	214600
5790	130	Milwaukee	Wisconsin	7	2017	212000
5791	130	Milwaukee	Wisconsin	8	2017	208500
5792	130	Milwaukee	Wisconsin	9	2017	197500
5793	130	Milwaukee	Wisconsin	10	2017	204950
5794	130	Milwaukee	Wisconsin	11	2017	192000
5795	130	Milwaukee	Wisconsin	12	2017	185000
5796	130	Milwaukee	Wisconsin	1	2018	183250
5797	130	Milwaukee	Wisconsin	2	2018	170000
5798	130	Milwaukee	Wisconsin	3	2018	187100
5799	130	Milwaukee	Wisconsin	4	2018	203000
5800	130	Milwaukee	Wisconsin	5	2018	207000
5801	130	Milwaukee	Wisconsin	6	2018	225250
5802	130	Milwaukee	Wisconsin	7	2018	230000
5803	130	Milwaukee	Wisconsin	8	2018	216500
5804	130	Milwaukee	Wisconsin	9	2018	215000
5805	130	Milwaukee	Wisconsin	10	2018	215000
5806	130	Milwaukee	Wisconsin	11	2018	200000
5807	130	Milwaukee	Wisconsin	12	2018	198000
5808	130	Milwaukee	Wisconsin	1	2019	0
5809	13	Riverside	California	1	2009	180000
5810	13	Riverside	California	2	2009	175000
5811	13	Riverside	California	3	2009	170000
5812	13	Riverside	California	4	2009	163000
5813	13	Riverside	California	5	2009	161000
5814	13	Riverside	California	6	2009	165000
5815	13	Riverside	California	7	2009	165000
5816	13	Riverside	California	8	2009	167000
5817	13	Riverside	California	9	2009	172000
5818	13	Riverside	California	10	2009	173000
5819	13	Riverside	California	11	2009	180000
5820	13	Riverside	California	12	2009	180000
5821	13	Riverside	California	1	2010	180000
5822	13	Riverside	California	2	2010	180000
5823	13	Riverside	California	3	2010	185000
5824	13	Riverside	California	4	2010	183250
5825	13	Riverside	California	5	2010	190000
5826	13	Riverside	California	6	2010	190000
5827	13	Riverside	California	7	2010	186000
5828	13	Riverside	California	8	2010	185000
5829	13	Riverside	California	9	2010	185000
5830	13	Riverside	California	10	2010	180000
5831	13	Riverside	California	11	2010	180000
5832	13	Riverside	California	12	2010	185000
5833	13	Riverside	California	1	2011	180000
5834	13	Riverside	California	2	2011	181000
5835	13	Riverside	California	3	2011	183500
5836	13	Riverside	California	4	2011	179250
5837	13	Riverside	California	5	2011	180000
5838	13	Riverside	California	6	2011	180000
5839	13	Riverside	California	7	2011	180000
5840	13	Riverside	California	8	2011	178000
5841	13	Riverside	California	9	2011	180000
5842	13	Riverside	California	10	2011	177000
5843	13	Riverside	California	11	2011	180000
5844	13	Riverside	California	12	2011	178250
5845	13	Riverside	California	1	2012	176000
5846	13	Riverside	California	2	2012	178000
5847	13	Riverside	California	3	2012	185000
5848	13	Riverside	California	4	2012	190000
5849	13	Riverside	California	5	2012	190000
5850	13	Riverside	California	6	2012	190500
5851	13	Riverside	California	7	2012	198000
5852	13	Riverside	California	8	2012	196000
5853	13	Riverside	California	9	2012	200000
5854	13	Riverside	California	10	2012	203000
5855	13	Riverside	California	11	2012	213500
5856	13	Riverside	California	12	2012	220000
5857	13	Riverside	California	1	2013	215000
5858	13	Riverside	California	2	2013	215000
5859	13	Riverside	California	3	2013	230000
5860	13	Riverside	California	4	2013	235000
5861	13	Riverside	California	5	2013	240000
5862	13	Riverside	California	6	2013	250000
5863	13	Riverside	California	7	2013	251000
5864	13	Riverside	California	8	2013	250000
5865	13	Riverside	California	9	2013	256000
5866	13	Riverside	California	10	2013	260000
5867	13	Riverside	California	11	2013	260000
5868	13	Riverside	California	12	2013	270000
5869	13	Riverside	California	1	2014	260000
5870	13	Riverside	California	2	2014	265000
5871	13	Riverside	California	3	2014	275000
5872	13	Riverside	California	4	2014	275000
5873	13	Riverside	California	5	2014	280000
5874	13	Riverside	California	6	2014	285000
5875	13	Riverside	California	7	2014	280000
5876	13	Riverside	California	8	2014	285000
5877	13	Riverside	California	9	2014	275000
5878	13	Riverside	California	10	2014	279000
5879	13	Riverside	California	11	2014	282000
5880	13	Riverside	California	12	2014	289000
5881	13	Riverside	California	1	2015	271000
5882	13	Riverside	California	2	2015	285000
5883	13	Riverside	California	3	2015	294000
5884	13	Riverside	California	4	2015	295000
5885	13	Riverside	California	5	2015	295000
5886	13	Riverside	California	6	2015	300000
5887	13	Riverside	California	7	2015	301000
5888	13	Riverside	California	8	2015	302000
5889	13	Riverside	California	9	2015	300000
5890	13	Riverside	California	10	2015	298000
5891	13	Riverside	California	11	2015	300000
5892	13	Riverside	California	12	2015	305000
5893	13	Riverside	California	1	2016	295000
5894	13	Riverside	California	2	2016	300000
5895	13	Riverside	California	3	2016	311000
5896	13	Riverside	California	4	2016	315000
5897	13	Riverside	California	5	2016	315000
5898	13	Riverside	California	6	2016	319000
5899	13	Riverside	California	7	2016	320000
5900	13	Riverside	California	8	2016	320000
5901	13	Riverside	California	9	2016	325000
5902	13	Riverside	California	10	2016	319000
5903	13	Riverside	California	11	2016	320000
5904	13	Riverside	California	12	2016	325000
5905	13	Riverside	California	1	2017	315000
5906	13	Riverside	California	2	2017	324772
5907	13	Riverside	California	3	2017	332000
5908	13	Riverside	California	4	2017	335000
5909	13	Riverside	California	5	2017	340000
5910	13	Riverside	California	6	2017	345000
5911	13	Riverside	California	7	2017	347750
5912	13	Riverside	California	8	2017	339750
5913	13	Riverside	California	9	2017	340000
5914	13	Riverside	California	10	2017	340500
5915	13	Riverside	California	11	2017	337500
5916	13	Riverside	California	12	2017	349000
5917	13	Riverside	California	1	2018	350000
5918	13	Riverside	California	2	2018	353500
5919	13	Riverside	California	3	2018	355000
5920	13	Riverside	California	4	2018	360000
5921	13	Riverside	California	5	2018	361500
5922	13	Riverside	California	6	2018	365000
5923	13	Riverside	California	7	2018	366000
5924	13	Riverside	California	8	2018	360000
5925	13	Riverside	California	9	2018	366250
5926	13	Riverside	California	10	2018	362000
5927	13	Riverside	California	11	2018	360000
5928	13	Riverside	California	12	2018	358880
5929	13	Riverside	California	1	2019	0
5930	116	Dallas	Texas	1	2009	140000
5931	116	Dallas	Texas	2	2009	152728
5932	116	Dallas	Texas	3	2009	154000
5933	116	Dallas	Texas	4	2009	152900
5934	116	Dallas	Texas	5	2009	169900
5935	116	Dallas	Texas	6	2009	169900
5936	116	Dallas	Texas	7	2009	168900
5937	116	Dallas	Texas	8	2009	164999
5938	116	Dallas	Texas	9	2009	159900
5939	116	Dallas	Texas	10	2009	155913
5940	116	Dallas	Texas	11	2009	154900
5941	116	Dallas	Texas	12	2009	155000
5942	116	Dallas	Texas	1	2010	145000
5943	116	Dallas	Texas	2	2010	154900
5944	116	Dallas	Texas	3	2010	160000
5945	116	Dallas	Texas	4	2010	165000
5946	116	Dallas	Texas	5	2010	165000
5947	116	Dallas	Texas	6	2010	173625
5948	116	Dallas	Texas	7	2010	175000
5949	116	Dallas	Texas	8	2010	169980
5950	116	Dallas	Texas	9	2010	159990
5951	116	Dallas	Texas	10	2010	159900
5952	116	Dallas	Texas	11	2010	159945
5953	116	Dallas	Texas	12	2010	169900
5954	116	Dallas	Texas	1	2011	155000
5955	116	Dallas	Texas	2	2011	161800
5956	116	Dallas	Texas	3	2011	159500
5957	116	Dallas	Texas	4	2011	164900
5958	116	Dallas	Texas	5	2011	169900
5959	116	Dallas	Texas	6	2011	169900
5960	116	Dallas	Texas	7	2011	169900
5961	116	Dallas	Texas	8	2011	169900
5962	116	Dallas	Texas	9	2011	164000
5963	116	Dallas	Texas	10	2011	159929
5964	116	Dallas	Texas	11	2011	155700
5965	116	Dallas	Texas	12	2011	165000
5966	116	Dallas	Texas	1	2012	159000
5967	116	Dallas	Texas	2	2012	164900
5968	116	Dallas	Texas	3	2012	172690
5969	116	Dallas	Texas	4	2012	174900
5970	116	Dallas	Texas	5	2012	180000
5971	116	Dallas	Texas	6	2012	184900
5972	116	Dallas	Texas	7	2012	182250
5973	116	Dallas	Texas	8	2012	179900
5974	116	Dallas	Texas	9	2012	179900
5975	116	Dallas	Texas	10	2012	172900
5976	116	Dallas	Texas	11	2012	175000
5977	116	Dallas	Texas	12	2012	184900
5978	116	Dallas	Texas	1	2013	169900
5979	116	Dallas	Texas	2	2013	174900
5980	116	Dallas	Texas	3	2013	186950
5981	116	Dallas	Texas	4	2013	199000
5982	116	Dallas	Texas	5	2013	201090
5983	116	Dallas	Texas	6	2013	209000
5984	116	Dallas	Texas	7	2013	204900
5985	116	Dallas	Texas	8	2013	204900
5986	116	Dallas	Texas	9	2013	196500
5987	116	Dallas	Texas	10	2013	195000
5988	116	Dallas	Texas	11	2013	193995
5989	116	Dallas	Texas	12	2013	199900
5990	116	Dallas	Texas	1	2014	185000
5991	116	Dallas	Texas	2	2014	199900
5992	116	Dallas	Texas	3	2014	205000
5993	116	Dallas	Texas	4	2014	209900
5994	116	Dallas	Texas	5	2014	215635
5995	116	Dallas	Texas	6	2014	220900
5996	116	Dallas	Texas	7	2014	220000
5997	116	Dallas	Texas	8	2014	215000
5998	116	Dallas	Texas	9	2014	211500
5999	116	Dallas	Texas	10	2014	209900
6000	116	Dallas	Texas	11	2014	210000
6001	116	Dallas	Texas	12	2014	225000
6002	116	Dallas	Texas	1	2015	209250
6003	116	Dallas	Texas	2	2015	220000
6004	116	Dallas	Texas	3	2015	229900
6005	116	Dallas	Texas	4	2015	235000
6006	116	Dallas	Texas	5	2015	245000
6007	116	Dallas	Texas	6	2015	246995
6008	116	Dallas	Texas	7	2015	236051
6009	116	Dallas	Texas	8	2015	234900
6010	116	Dallas	Texas	9	2015	225000
6011	116	Dallas	Texas	10	2015	230000
6012	116	Dallas	Texas	11	2015	230000
6013	116	Dallas	Texas	12	2015	239999
6014	116	Dallas	Texas	1	2016	225000
6015	116	Dallas	Texas	2	2016	234900
6016	116	Dallas	Texas	3	2016	249000
6017	116	Dallas	Texas	4	2016	250000
6018	116	Dallas	Texas	5	2016	265000
6019	116	Dallas	Texas	6	2016	269900
6020	116	Dallas	Texas	7	2016	259605
6021	116	Dallas	Texas	8	2016	259000
6022	116	Dallas	Texas	9	2016	252900
6023	116	Dallas	Texas	10	2016	259000
6024	116	Dallas	Texas	11	2016	264937
6025	116	Dallas	Texas	12	2016	261920
6026	116	Dallas	Texas	1	2017	255000
6027	116	Dallas	Texas	2	2017	270000
6028	116	Dallas	Texas	3	2017	279000
6029	116	Dallas	Texas	4	2017	279990
6030	116	Dallas	Texas	5	2017	294250
6031	116	Dallas	Texas	6	2017	295000
6032	116	Dallas	Texas	7	2017	285000
6033	116	Dallas	Texas	8	2017	280000
6034	116	Dallas	Texas	9	2017	275000
6035	116	Dallas	Texas	10	2017	279900
6036	116	Dallas	Texas	11	2017	282000
6037	116	Dallas	Texas	12	2017	285000
6038	116	Dallas	Texas	1	2018	269990
6039	116	Dallas	Texas	2	2018	286000
6040	116	Dallas	Texas	3	2018	294900
6041	116	Dallas	Texas	4	2018	289900
6042	116	Dallas	Texas	5	2018	299000
6043	116	Dallas	Texas	6	2018	304085
6044	116	Dallas	Texas	7	2018	299500
6045	116	Dallas	Texas	8	2018	293937
6046	116	Dallas	Texas	9	2018	288000
6047	116	Dallas	Texas	10	2018	279999
6048	116	Dallas	Texas	11	2018	289900
6049	116	Dallas	Texas	12	2018	296680
6050	116	Dallas	Texas	1	2019	0
6051	100	Albany	Oregon	1	2009	145750
6052	100	Albany	Oregon	2	2009	175650
6053	100	Albany	Oregon	3	2009	148050
6054	100	Albany	Oregon	4	2009	169000
6055	100	Albany	Oregon	5	2009	167400
6056	100	Albany	Oregon	6	2009	155000
6057	100	Albany	Oregon	7	2009	168950
6058	100	Albany	Oregon	8	2009	164700
6059	100	Albany	Oregon	9	2009	165103
6060	100	Albany	Oregon	10	2009	154450
6061	100	Albany	Oregon	11	2009	162500
6062	100	Albany	Oregon	12	2009	148288
6063	100	Albany	Oregon	1	2010	149625
6064	100	Albany	Oregon	2	2010	143000
6065	100	Albany	Oregon	3	2010	153125
6066	100	Albany	Oregon	4	2010	156000
6067	100	Albany	Oregon	5	2010	159950
6068	100	Albany	Oregon	6	2010	151113
6069	100	Albany	Oregon	7	2010	155000
6070	100	Albany	Oregon	8	2010	150819
6071	100	Albany	Oregon	9	2010	166000
6072	100	Albany	Oregon	10	2010	144800
6073	100	Albany	Oregon	11	2010	130000
6074	100	Albany	Oregon	12	2010	153000
6075	100	Albany	Oregon	1	2011	129900
6076	100	Albany	Oregon	2	2011	126000
6077	100	Albany	Oregon	3	2011	145000
6078	100	Albany	Oregon	4	2011	140000
6079	100	Albany	Oregon	5	2011	130000
6080	100	Albany	Oregon	6	2011	142000
6081	100	Albany	Oregon	7	2011	132000
6082	100	Albany	Oregon	8	2011	128720
6083	100	Albany	Oregon	9	2011	146205
6084	100	Albany	Oregon	10	2011	133250
6085	100	Albany	Oregon	11	2011	149990
6086	100	Albany	Oregon	12	2011	147000
6087	100	Albany	Oregon	1	2012	115500
6088	100	Albany	Oregon	2	2012	133900
6089	100	Albany	Oregon	3	2012	140500
6090	100	Albany	Oregon	4	2012	145000
6091	100	Albany	Oregon	5	2012	151500
6092	100	Albany	Oregon	6	2012	139900
6093	100	Albany	Oregon	7	2012	155075
6094	100	Albany	Oregon	8	2012	152625
6095	100	Albany	Oregon	9	2012	146000
6096	100	Albany	Oregon	10	2012	161123
6097	100	Albany	Oregon	11	2012	150000
6098	100	Albany	Oregon	12	2012	129900
6099	100	Albany	Oregon	1	2013	142500
6100	100	Albany	Oregon	2	2013	137500
6101	100	Albany	Oregon	3	2013	145000
6102	100	Albany	Oregon	4	2013	139900
6103	100	Albany	Oregon	5	2013	155200
6104	100	Albany	Oregon	6	2013	159950
6105	100	Albany	Oregon	7	2013	168188
6106	100	Albany	Oregon	8	2013	169000
6107	100	Albany	Oregon	9	2013	165000
6108	100	Albany	Oregon	10	2013	157000
6109	100	Albany	Oregon	11	2013	157500
6110	100	Albany	Oregon	12	2013	155000
6111	100	Albany	Oregon	1	2014	148000
6112	100	Albany	Oregon	2	2014	148900
6113	100	Albany	Oregon	3	2014	160575
6114	100	Albany	Oregon	4	2014	156950
6115	100	Albany	Oregon	5	2014	161350
6116	100	Albany	Oregon	6	2014	174450
6117	100	Albany	Oregon	7	2014	168000
6118	100	Albany	Oregon	8	2014	175000
6119	100	Albany	Oregon	9	2014	176750
6120	100	Albany	Oregon	10	2014	170000
6121	100	Albany	Oregon	11	2014	163000
6122	100	Albany	Oregon	12	2014	174900
6123	100	Albany	Oregon	1	2015	154500
6124	100	Albany	Oregon	2	2015	163000
6125	100	Albany	Oregon	3	2015	164975
6126	100	Albany	Oregon	4	2015	178500
6127	100	Albany	Oregon	5	2015	169800
6128	100	Albany	Oregon	6	2015	180000
6129	100	Albany	Oregon	7	2015	179900
6130	100	Albany	Oregon	8	2015	179575
6131	100	Albany	Oregon	9	2015	190000
6132	100	Albany	Oregon	10	2015	181400
6133	100	Albany	Oregon	11	2015	187000
6134	100	Albany	Oregon	12	2015	174500
6135	100	Albany	Oregon	1	2016	177250
6136	100	Albany	Oregon	2	2016	170500
6137	100	Albany	Oregon	3	2016	179950
6138	100	Albany	Oregon	4	2016	195000
6139	100	Albany	Oregon	5	2016	191250
6140	100	Albany	Oregon	6	2016	195000
6141	100	Albany	Oregon	7	2016	189450
6142	100	Albany	Oregon	8	2016	200000
6143	100	Albany	Oregon	9	2016	204000
6144	100	Albany	Oregon	10	2016	204450
6145	100	Albany	Oregon	11	2016	200000
6146	100	Albany	Oregon	12	2016	184000
6147	100	Albany	Oregon	1	2017	199000
6148	100	Albany	Oregon	2	2017	197000
6149	100	Albany	Oregon	3	2017	220000
6150	100	Albany	Oregon	4	2017	213300
6151	100	Albany	Oregon	5	2017	223375
6152	100	Albany	Oregon	6	2017	227700
6153	100	Albany	Oregon	7	2017	236000
6154	100	Albany	Oregon	8	2017	230000
6155	100	Albany	Oregon	9	2017	225000
6156	100	Albany	Oregon	10	2017	222500
6157	100	Albany	Oregon	11	2017	230000
6158	100	Albany	Oregon	12	2017	234900
6159	100	Albany	Oregon	1	2018	230000
6160	100	Albany	Oregon	2	2018	245000
6161	100	Albany	Oregon	3	2018	250000
6162	100	Albany	Oregon	4	2018	250000
6163	100	Albany	Oregon	5	2018	250000
6164	100	Albany	Oregon	6	2018	258500
6165	100	Albany	Oregon	7	2018	257000
6166	100	Albany	Oregon	8	2018	257000
6167	100	Albany	Oregon	9	2018	262450
6168	100	Albany	Oregon	10	2018	260000
6169	100	Albany	Oregon	11	2018	260000
6170	100	Albany	Oregon	12	2018	248250
6171	100	Albany	Oregon	1	2019	0
6172	142	Tallahassee	Florida	1	2009	0
6173	142	Tallahassee	Florida	2	2009	168900
6174	142	Tallahassee	Florida	3	2009	167200
6175	142	Tallahassee	Florida	4	2009	165500
6176	142	Tallahassee	Florida	5	2009	164000
6177	142	Tallahassee	Florida	6	2009	162500
6178	142	Tallahassee	Florida	7	2009	161500
6179	142	Tallahassee	Florida	8	2009	160800
6180	142	Tallahassee	Florida	9	2009	160100
6181	142	Tallahassee	Florida	10	2009	159700
6182	142	Tallahassee	Florida	11	2009	159700
6183	142	Tallahassee	Florida	12	2009	160600
6184	142	Tallahassee	Florida	1	2010	160700
6185	142	Tallahassee	Florida	2	2010	160100
6186	142	Tallahassee	Florida	3	2010	159000
6187	142	Tallahassee	Florida	4	2010	157900
6188	142	Tallahassee	Florida	5	2010	156700
6189	142	Tallahassee	Florida	6	2010	155900
6190	142	Tallahassee	Florida	7	2010	154000
6191	142	Tallahassee	Florida	8	2010	152700
6192	142	Tallahassee	Florida	9	2010	152600
6193	142	Tallahassee	Florida	10	2010	152200
6194	142	Tallahassee	Florida	11	2010	150200
6195	142	Tallahassee	Florida	12	2010	146800
6196	142	Tallahassee	Florida	1	2011	143800
6197	142	Tallahassee	Florida	2	2011	143000
6198	142	Tallahassee	Florida	3	2011	142800
6199	142	Tallahassee	Florida	4	2011	141900
6200	142	Tallahassee	Florida	5	2011	141200
6201	142	Tallahassee	Florida	6	2011	141300
6202	142	Tallahassee	Florida	7	2011	141400
6203	142	Tallahassee	Florida	8	2011	141100
6204	142	Tallahassee	Florida	9	2011	140100
6205	142	Tallahassee	Florida	10	2011	138900
6206	142	Tallahassee	Florida	11	2011	138400
6207	142	Tallahassee	Florida	12	2011	138800
6208	142	Tallahassee	Florida	1	2012	139200
6209	142	Tallahassee	Florida	2	2012	139400
6210	142	Tallahassee	Florida	3	2012	139500
6211	142	Tallahassee	Florida	4	2012	139000
6212	142	Tallahassee	Florida	5	2012	138200
6213	142	Tallahassee	Florida	6	2012	137800
6214	142	Tallahassee	Florida	7	2012	137800
6215	142	Tallahassee	Florida	8	2012	137200
6216	142	Tallahassee	Florida	9	2012	136700
6217	142	Tallahassee	Florida	10	2012	137000
6218	142	Tallahassee	Florida	11	2012	137900
6219	142	Tallahassee	Florida	12	2012	138700
6220	142	Tallahassee	Florida	1	2013	139800
6221	142	Tallahassee	Florida	2	2013	140200
6222	142	Tallahassee	Florida	3	2013	141100
6223	142	Tallahassee	Florida	4	2013	142600
6224	142	Tallahassee	Florida	5	2013	143700
6225	142	Tallahassee	Florida	6	2013	143200
6226	142	Tallahassee	Florida	7	2013	143000
6227	142	Tallahassee	Florida	8	2013	143900
6228	142	Tallahassee	Florida	9	2013	145000
6229	142	Tallahassee	Florida	10	2013	145800
6230	142	Tallahassee	Florida	11	2013	146100
6231	142	Tallahassee	Florida	12	2013	145800
6232	142	Tallahassee	Florida	1	2014	145600
6233	142	Tallahassee	Florida	2	2014	146300
6234	142	Tallahassee	Florida	3	2014	147400
6235	142	Tallahassee	Florida	4	2014	148200
6236	142	Tallahassee	Florida	5	2014	148800
6237	142	Tallahassee	Florida	6	2014	149200
6238	142	Tallahassee	Florida	7	2014	149400
6239	142	Tallahassee	Florida	8	2014	149500
6240	142	Tallahassee	Florida	9	2014	149400
6241	142	Tallahassee	Florida	10	2014	149300
6242	142	Tallahassee	Florida	11	2014	149400
6243	142	Tallahassee	Florida	12	2014	149700
6244	142	Tallahassee	Florida	1	2015	149600
6245	142	Tallahassee	Florida	2	2015	149000
6246	142	Tallahassee	Florida	3	2015	148400
6247	142	Tallahassee	Florida	4	2015	148500
6248	142	Tallahassee	Florida	5	2015	148900
6249	142	Tallahassee	Florida	6	2015	149200
6250	142	Tallahassee	Florida	7	2015	149600
6251	142	Tallahassee	Florida	8	2015	150400
6252	142	Tallahassee	Florida	9	2015	151500
6253	142	Tallahassee	Florida	10	2015	152300
6254	142	Tallahassee	Florida	11	2015	153100
6255	142	Tallahassee	Florida	12	2015	153900
6256	142	Tallahassee	Florida	1	2016	155000
6257	142	Tallahassee	Florida	2	2016	155800
6258	142	Tallahassee	Florida	3	2016	155900
6259	142	Tallahassee	Florida	4	2016	156300
6260	142	Tallahassee	Florida	5	2016	157000
6261	142	Tallahassee	Florida	6	2016	157600
6262	142	Tallahassee	Florida	7	2016	157900
6263	142	Tallahassee	Florida	8	2016	158400
6264	142	Tallahassee	Florida	9	2016	158700
6265	142	Tallahassee	Florida	10	2016	159100
6266	142	Tallahassee	Florida	11	2016	159700
6267	142	Tallahassee	Florida	12	2016	160700
6268	142	Tallahassee	Florida	1	2017	161100
6269	142	Tallahassee	Florida	2	2017	161200
6270	142	Tallahassee	Florida	3	2017	161500
6271	142	Tallahassee	Florida	4	2017	162200
6272	142	Tallahassee	Florida	5	2017	163700
6273	142	Tallahassee	Florida	6	2017	165800
6274	142	Tallahassee	Florida	7	2017	167400
6275	142	Tallahassee	Florida	8	2017	167900
6276	142	Tallahassee	Florida	9	2017	167600
6277	142	Tallahassee	Florida	10	2017	166900
6278	142	Tallahassee	Florida	11	2017	166600
6279	142	Tallahassee	Florida	12	2017	166800
6280	142	Tallahassee	Florida	1	2018	167800
6281	142	Tallahassee	Florida	2	2018	169500
6282	142	Tallahassee	Florida	3	2018	171100
6283	142	Tallahassee	Florida	4	2018	172100
6284	142	Tallahassee	Florida	5	2018	172900
6285	142	Tallahassee	Florida	6	2018	173500
6286	142	Tallahassee	Florida	7	2018	174600
6287	142	Tallahassee	Florida	8	2018	175800
6288	142	Tallahassee	Florida	9	2018	177400
6289	142	Tallahassee	Florida	10	2018	179700
6290	142	Tallahassee	Florida	11	2018	181700
6291	142	Tallahassee	Florida	12	2018	183000
6292	142	Tallahassee	Florida	1	2019	184100
6293	118	Houston	Texas	1	2009	130100
6294	118	Houston	Texas	2	2009	139348
6295	118	Houston	Texas	3	2009	148000
6296	118	Houston	Texas	4	2009	150000
6297	118	Houston	Texas	5	2009	157000
6298	118	Houston	Texas	6	2009	163925
6299	118	Houston	Texas	7	2009	162000
6300	118	Houston	Texas	8	2009	160000
6301	118	Houston	Texas	9	2009	155500
6302	118	Houston	Texas	10	2009	147900
6303	118	Houston	Texas	11	2009	150000
6304	118	Houston	Texas	12	2009	152550
6305	118	Houston	Texas	1	2010	141750
6306	118	Houston	Texas	2	2010	147000
6307	118	Houston	Texas	3	2010	153500
6308	118	Houston	Texas	4	2010	152500
6309	118	Houston	Texas	5	2010	153000
6310	118	Houston	Texas	6	2010	157500
6311	118	Houston	Texas	7	2010	159000
6312	118	Houston	Texas	8	2010	159866
6313	118	Houston	Texas	9	2010	155000
6314	118	Houston	Texas	10	2010	149500
6315	118	Houston	Texas	11	2010	153000
6316	118	Houston	Texas	12	2010	158000
6317	118	Houston	Texas	1	2011	137473
6318	118	Houston	Texas	2	2011	151900
6319	118	Houston	Texas	3	2011	150000
6320	118	Houston	Texas	4	2011	149783
6321	118	Houston	Texas	5	2011	156000
6322	118	Houston	Texas	6	2011	162000
6323	118	Houston	Texas	7	2011	160000
6324	118	Houston	Texas	8	2011	160000
6325	118	Houston	Texas	9	2011	155000
6326	118	Houston	Texas	10	2011	150000
6327	118	Houston	Texas	11	2011	155000
6328	118	Houston	Texas	12	2011	161000
6329	118	Houston	Texas	1	2012	140000
6330	118	Houston	Texas	2	2012	150000
6331	118	Houston	Texas	3	2012	164833
6332	118	Houston	Texas	4	2012	163500
6333	118	Houston	Texas	5	2012	169900
6334	118	Houston	Texas	6	2012	171400
6335	118	Houston	Texas	7	2012	170000
6336	118	Houston	Texas	8	2012	165500
6337	118	Houston	Texas	9	2012	165000
6338	118	Houston	Texas	10	2012	164500
6339	118	Houston	Texas	11	2012	169495
6340	118	Houston	Texas	12	2012	173000
6341	118	Houston	Texas	1	2013	152300
6342	118	Houston	Texas	2	2013	164500
6343	118	Houston	Texas	3	2013	174070
6344	118	Houston	Texas	4	2013	185000
6345	118	Houston	Texas	5	2013	187500
6346	118	Houston	Texas	6	2013	193450
6347	118	Houston	Texas	7	2013	189900
6348	118	Houston	Texas	8	2013	187642
6349	118	Houston	Texas	9	2013	181657
6350	118	Houston	Texas	10	2013	178000
6351	118	Houston	Texas	11	2013	183950
6352	118	Houston	Texas	12	2013	189900
6353	118	Houston	Texas	1	2014	176000
6354	118	Houston	Texas	2	2014	183000
6355	118	Houston	Texas	3	2014	192500
6356	118	Houston	Texas	4	2014	196000
6357	118	Houston	Texas	5	2014	200000
6358	118	Houston	Texas	6	2014	212809
6359	118	Houston	Texas	7	2014	202000
6360	118	Houston	Texas	8	2014	204995
6361	118	Houston	Texas	9	2014	197500
6362	118	Houston	Texas	10	2014	192176
6363	118	Houston	Texas	11	2014	197900
6364	118	Houston	Texas	12	2014	210000
6365	118	Houston	Texas	1	2015	190000
6366	118	Houston	Texas	2	2015	199000
6367	118	Houston	Texas	3	2015	209000
6368	118	Houston	Texas	4	2015	208000
6369	118	Houston	Texas	5	2015	220000
6370	118	Houston	Texas	6	2015	224900
6371	118	Houston	Texas	7	2015	220000
6372	118	Houston	Texas	8	2015	215300
6373	118	Houston	Texas	9	2015	208000
6374	118	Houston	Texas	10	2015	205000
6375	118	Houston	Texas	11	2015	202950
6376	118	Houston	Texas	12	2015	218188
6377	118	Houston	Texas	1	2016	200000
6378	118	Houston	Texas	2	2016	203900
6379	118	Houston	Texas	3	2016	213000
6380	118	Houston	Texas	4	2016	218000
6381	118	Houston	Texas	5	2016	225000
6382	118	Houston	Texas	6	2016	230000
6383	118	Houston	Texas	7	2016	230000
6384	118	Houston	Texas	8	2016	225000
6385	118	Houston	Texas	9	2016	218000
6386	118	Houston	Texas	10	2016	218000
6387	118	Houston	Texas	11	2016	225000
6388	118	Houston	Texas	12	2016	227000
6389	118	Houston	Texas	1	2017	210000
6390	118	Houston	Texas	2	2017	223000
6391	118	Houston	Texas	3	2017	227500
6392	118	Houston	Texas	4	2017	229000
6393	118	Houston	Texas	5	2017	235000
6394	118	Houston	Texas	6	2017	239500
6395	118	Houston	Texas	7	2017	230000
6396	118	Houston	Texas	8	2017	233000
6397	118	Houston	Texas	9	2017	232000
6398	118	Houston	Texas	10	2017	227000
6399	118	Houston	Texas	11	2017	226000
6400	118	Houston	Texas	12	2017	231000
6401	118	Houston	Texas	1	2018	219345
6402	118	Houston	Texas	2	2018	225700
6403	118	Houston	Texas	3	2018	234000
6404	118	Houston	Texas	4	2018	240000
6405	118	Houston	Texas	5	2018	243000
6406	118	Houston	Texas	6	2018	244000
6407	118	Houston	Texas	7	2018	243900
6408	118	Houston	Texas	8	2018	238990
6409	118	Houston	Texas	9	2018	232000
6410	118	Houston	Texas	10	2018	235000
6411	118	Houston	Texas	11	2018	235000
6412	118	Houston	Texas	12	2018	240000
6413	118	Houston	Texas	1	2019	0
6414	138	Rapid City	South Dakota	1	2009	0
6415	138	Rapid City	South Dakota	2	2009	160600
6416	138	Rapid City	South Dakota	3	2009	160700
6417	138	Rapid City	South Dakota	4	2009	160600
6418	138	Rapid City	South Dakota	5	2009	160400
6419	138	Rapid City	South Dakota	6	2009	160100
6420	138	Rapid City	South Dakota	7	2009	160000
6421	138	Rapid City	South Dakota	8	2009	160000
6422	138	Rapid City	South Dakota	9	2009	160100
6423	138	Rapid City	South Dakota	10	2009	160200
6424	138	Rapid City	South Dakota	11	2009	160500
6425	138	Rapid City	South Dakota	12	2009	160800
6426	138	Rapid City	South Dakota	1	2010	161100
6427	138	Rapid City	South Dakota	2	2010	161300
6428	138	Rapid City	South Dakota	3	2010	162000
6429	138	Rapid City	South Dakota	4	2010	163300
6430	138	Rapid City	South Dakota	5	2010	164600
6431	138	Rapid City	South Dakota	6	2010	165500
6432	138	Rapid City	South Dakota	7	2010	166000
6433	138	Rapid City	South Dakota	8	2010	166400
6434	138	Rapid City	South Dakota	9	2010	166700
6435	138	Rapid City	South Dakota	10	2010	166900
6436	138	Rapid City	South Dakota	11	2010	166600
6437	138	Rapid City	South Dakota	12	2010	166200
6438	138	Rapid City	South Dakota	1	2011	165700
6439	138	Rapid City	South Dakota	2	2011	165300
6440	138	Rapid City	South Dakota	3	2011	164700
6441	138	Rapid City	South Dakota	4	2011	164000
6442	138	Rapid City	South Dakota	5	2011	163500
6443	138	Rapid City	South Dakota	6	2011	163600
6444	138	Rapid City	South Dakota	7	2011	163600
6445	138	Rapid City	South Dakota	8	2011	163600
6446	138	Rapid City	South Dakota	9	2011	163600
6447	138	Rapid City	South Dakota	10	2011	163600
6448	138	Rapid City	South Dakota	11	2011	163500
6449	138	Rapid City	South Dakota	12	2011	163600
6450	138	Rapid City	South Dakota	1	2012	164000
6451	138	Rapid City	South Dakota	2	2012	164200
6452	138	Rapid City	South Dakota	3	2012	164200
6453	138	Rapid City	South Dakota	4	2012	164200
6454	138	Rapid City	South Dakota	5	2012	164000
6455	138	Rapid City	South Dakota	6	2012	163700
6456	138	Rapid City	South Dakota	7	2012	163700
6457	138	Rapid City	South Dakota	8	2012	164000
6458	138	Rapid City	South Dakota	9	2012	164300
6459	138	Rapid City	South Dakota	10	2012	164700
6460	138	Rapid City	South Dakota	11	2012	165100
6461	138	Rapid City	South Dakota	12	2012	165500
6462	138	Rapid City	South Dakota	1	2013	165700
6463	138	Rapid City	South Dakota	2	2013	165800
6464	138	Rapid City	South Dakota	3	2013	166000
6465	138	Rapid City	South Dakota	4	2013	166300
6466	138	Rapid City	South Dakota	5	2013	166700
6467	138	Rapid City	South Dakota	6	2013	167200
6468	138	Rapid City	South Dakota	7	2013	167700
6469	138	Rapid City	South Dakota	8	2013	167900
6470	138	Rapid City	South Dakota	9	2013	168200
6471	138	Rapid City	South Dakota	10	2013	168600
6472	138	Rapid City	South Dakota	11	2013	168800
6473	138	Rapid City	South Dakota	12	2013	168900
6474	138	Rapid City	South Dakota	1	2014	169100
6475	138	Rapid City	South Dakota	2	2014	169500
6476	138	Rapid City	South Dakota	3	2014	170100
6477	138	Rapid City	South Dakota	4	2014	170800
6478	138	Rapid City	South Dakota	5	2014	171600
6479	138	Rapid City	South Dakota	6	2014	172100
6480	138	Rapid City	South Dakota	7	2014	172400
6481	138	Rapid City	South Dakota	8	2014	172600
6482	138	Rapid City	South Dakota	9	2014	172600
6483	138	Rapid City	South Dakota	10	2014	172600
6484	138	Rapid City	South Dakota	11	2014	172700
6485	138	Rapid City	South Dakota	12	2014	172600
6486	138	Rapid City	South Dakota	1	2015	172600
6487	138	Rapid City	South Dakota	2	2015	173200
6488	138	Rapid City	South Dakota	3	2015	173700
6489	138	Rapid City	South Dakota	4	2015	174000
6490	138	Rapid City	South Dakota	5	2015	174000
6491	138	Rapid City	South Dakota	6	2015	174200
6492	138	Rapid City	South Dakota	7	2015	174600
6493	138	Rapid City	South Dakota	8	2015	175300
6494	138	Rapid City	South Dakota	9	2015	175900
6495	138	Rapid City	South Dakota	10	2015	176300
6496	138	Rapid City	South Dakota	11	2015	176600
6497	138	Rapid City	South Dakota	12	2015	176900
6498	138	Rapid City	South Dakota	1	2016	177500
6499	138	Rapid City	South Dakota	2	2016	178100
6500	138	Rapid City	South Dakota	3	2016	178600
6501	138	Rapid City	South Dakota	4	2016	179100
6502	138	Rapid City	South Dakota	5	2016	180000
6503	138	Rapid City	South Dakota	6	2016	180700
6504	138	Rapid City	South Dakota	7	2016	181300
6505	138	Rapid City	South Dakota	8	2016	181900
6506	138	Rapid City	South Dakota	9	2016	182500
6507	138	Rapid City	South Dakota	10	2016	182900
6508	138	Rapid City	South Dakota	11	2016	183400
6509	138	Rapid City	South Dakota	12	2016	183900
6510	138	Rapid City	South Dakota	1	2017	184500
6511	138	Rapid City	South Dakota	2	2017	185200
6512	138	Rapid City	South Dakota	3	2017	186200
6513	138	Rapid City	South Dakota	4	2017	187000
6514	138	Rapid City	South Dakota	5	2017	187700
6515	138	Rapid City	South Dakota	6	2017	188200
6516	138	Rapid City	South Dakota	7	2017	188800
6517	138	Rapid City	South Dakota	8	2017	189500
6518	138	Rapid City	South Dakota	9	2017	190000
6519	138	Rapid City	South Dakota	10	2017	190600
6520	138	Rapid City	South Dakota	11	2017	191300
6521	138	Rapid City	South Dakota	12	2017	192300
6522	138	Rapid City	South Dakota	1	2018	193300
6523	138	Rapid City	South Dakota	2	2018	194200
6524	138	Rapid City	South Dakota	3	2018	195000
6525	138	Rapid City	South Dakota	4	2018	195500
6526	138	Rapid City	South Dakota	5	2018	196100
6527	138	Rapid City	South Dakota	6	2018	196700
6528	138	Rapid City	South Dakota	7	2018	196900
6529	138	Rapid City	South Dakota	8	2018	196900
6530	138	Rapid City	South Dakota	9	2018	196900
6531	138	Rapid City	South Dakota	10	2018	198100
6532	138	Rapid City	South Dakota	11	2018	200100
6533	138	Rapid City	South Dakota	12	2018	202300
6534	138	Rapid City	South Dakota	1	2019	203500
6535	79	Kansas City	Missouri	1	2009	129900
6536	79	Kansas City	Missouri	2	2009	145000
6537	79	Kansas City	Missouri	3	2009	148500
6538	79	Kansas City	Missouri	4	2009	149950
6539	79	Kansas City	Missouri	5	2009	158900
6540	79	Kansas City	Missouri	6	2009	160000
6541	79	Kansas City	Missouri	7	2009	159900
6542	79	Kansas City	Missouri	8	2009	159900
6543	79	Kansas City	Missouri	9	2009	150250
6544	79	Kansas City	Missouri	10	2009	150000
6545	79	Kansas City	Missouri	11	2009	150000
6546	79	Kansas City	Missouri	12	2009	139900
6547	79	Kansas City	Missouri	1	2010	129900
6548	79	Kansas City	Missouri	2	2010	129900
6549	79	Kansas City	Missouri	3	2010	145000
6550	79	Kansas City	Missouri	4	2010	149900
6551	79	Kansas City	Missouri	5	2010	150000
6552	79	Kansas City	Missouri	6	2010	162950
6553	79	Kansas City	Missouri	7	2010	152250
6554	79	Kansas City	Missouri	8	2010	149900
6555	79	Kansas City	Missouri	9	2010	145000
6556	79	Kansas City	Missouri	10	2010	139900
6557	79	Kansas City	Missouri	11	2010	140000
6558	79	Kansas City	Missouri	12	2010	135000
6559	79	Kansas City	Missouri	1	2011	125000
6560	79	Kansas City	Missouri	2	2011	124925
6561	79	Kansas City	Missouri	3	2011	134900
6562	79	Kansas City	Missouri	4	2011	130000
6563	79	Kansas City	Missouri	5	2011	139900
6564	79	Kansas City	Missouri	6	2011	152248
6565	79	Kansas City	Missouri	7	2011	145000
6566	79	Kansas City	Missouri	8	2011	140000
6567	79	Kansas City	Missouri	9	2011	135000
6568	79	Kansas City	Missouri	10	2011	138900
6569	79	Kansas City	Missouri	11	2011	139900
6570	79	Kansas City	Missouri	12	2011	129900
6571	79	Kansas City	Missouri	1	2012	125000
6572	79	Kansas City	Missouri	2	2012	125000
6573	79	Kansas City	Missouri	3	2012	134900
6574	79	Kansas City	Missouri	4	2012	144900
6575	79	Kansas City	Missouri	5	2012	155000
6576	79	Kansas City	Missouri	6	2012	157500
6577	79	Kansas City	Missouri	7	2012	155000
6578	79	Kansas City	Missouri	8	2012	154000
6579	79	Kansas City	Missouri	9	2012	150000
6580	79	Kansas City	Missouri	10	2012	148250
6581	79	Kansas City	Missouri	11	2012	145000
6582	79	Kansas City	Missouri	12	2012	150000
6583	79	Kansas City	Missouri	1	2013	130000
6584	79	Kansas City	Missouri	2	2013	135000
6585	79	Kansas City	Missouri	3	2013	145000
6586	79	Kansas City	Missouri	4	2013	149500
6587	79	Kansas City	Missouri	5	2013	168500
6588	79	Kansas City	Missouri	6	2013	174950
6589	79	Kansas City	Missouri	7	2013	174900
6590	79	Kansas City	Missouri	8	2013	164900
6591	79	Kansas City	Missouri	9	2013	159900
6592	79	Kansas City	Missouri	10	2013	159950
6593	79	Kansas City	Missouri	11	2013	159900
6594	79	Kansas City	Missouri	12	2013	160000
6595	79	Kansas City	Missouri	1	2014	150000
6596	79	Kansas City	Missouri	2	2014	144950
6597	79	Kansas City	Missouri	3	2014	147000
6598	79	Kansas City	Missouri	4	2014	164500
6599	79	Kansas City	Missouri	5	2014	171000
6600	79	Kansas City	Missouri	6	2014	175000
6601	79	Kansas City	Missouri	7	2014	179900
6602	79	Kansas City	Missouri	8	2014	170500
6603	79	Kansas City	Missouri	9	2014	169000
6604	79	Kansas City	Missouri	10	2014	160850
6605	79	Kansas City	Missouri	11	2014	164900
6606	79	Kansas City	Missouri	12	2014	165000
6607	79	Kansas City	Missouri	1	2015	155000
6608	79	Kansas City	Missouri	2	2015	155000
6609	79	Kansas City	Missouri	3	2015	165000
6610	79	Kansas City	Missouri	4	2015	175750
6611	79	Kansas City	Missouri	5	2015	185000
6612	79	Kansas City	Missouri	6	2015	185000
6613	79	Kansas City	Missouri	7	2015	183500
6614	79	Kansas City	Missouri	8	2015	179950
6615	79	Kansas City	Missouri	9	2015	169000
6616	79	Kansas City	Missouri	10	2015	175000
6617	79	Kansas City	Missouri	11	2015	169900
6618	79	Kansas City	Missouri	12	2015	170000
6619	79	Kansas City	Missouri	1	2016	167750
6620	79	Kansas City	Missouri	2	2016	164950
6621	79	Kansas City	Missouri	3	2016	174025
6622	79	Kansas City	Missouri	4	2016	184900
6623	79	Kansas City	Missouri	5	2016	190000
6624	79	Kansas City	Missouri	6	2016	198500
6625	79	Kansas City	Missouri	7	2016	195000
6626	79	Kansas City	Missouri	8	2016	189950
6627	79	Kansas City	Missouri	9	2016	186500
6628	79	Kansas City	Missouri	10	2016	185000
6629	79	Kansas City	Missouri	11	2016	179900
6630	79	Kansas City	Missouri	12	2016	180000
6631	79	Kansas City	Missouri	1	2017	179500
6632	79	Kansas City	Missouri	2	2017	180000
6633	79	Kansas City	Missouri	3	2017	185900
6634	79	Kansas City	Missouri	4	2017	190000
6635	79	Kansas City	Missouri	5	2017	203000
6636	79	Kansas City	Missouri	6	2017	210000
6637	79	Kansas City	Missouri	7	2017	200000
6638	79	Kansas City	Missouri	8	2017	199750
6639	79	Kansas City	Missouri	9	2017	195000
6640	79	Kansas City	Missouri	10	2017	190000
6641	79	Kansas City	Missouri	11	2017	195000
6642	79	Kansas City	Missouri	12	2017	194900
6643	79	Kansas City	Missouri	1	2018	194000
6644	79	Kansas City	Missouri	2	2018	190000
6645	79	Kansas City	Missouri	3	2018	205250
6646	79	Kansas City	Missouri	4	2018	209950
6647	79	Kansas City	Missouri	5	2018	215000
6648	79	Kansas City	Missouri	6	2018	219825
6649	79	Kansas City	Missouri	7	2018	215000
6650	79	Kansas City	Missouri	8	2018	205000
6651	79	Kansas City	Missouri	9	2018	200000
6652	79	Kansas City	Missouri	10	2018	209900
6653	79	Kansas City	Missouri	11	2018	210000
6654	79	Kansas City	Missouri	12	2018	204900
6655	79	Kansas City	Missouri	1	2019	0
6656	136	Fargo	North Dakota	1	2009	0
6657	136	Fargo	North Dakota	2	2009	157700
6658	136	Fargo	North Dakota	3	2009	157700
6659	136	Fargo	North Dakota	4	2009	157400
6660	136	Fargo	North Dakota	5	2009	157000
6661	136	Fargo	North Dakota	6	2009	156800
6662	136	Fargo	North Dakota	7	2009	157600
6663	136	Fargo	North Dakota	8	2009	157900
6664	136	Fargo	North Dakota	9	2009	156700
6665	136	Fargo	North Dakota	10	2009	155100
6666	136	Fargo	North Dakota	11	2009	154700
6667	136	Fargo	North Dakota	12	2009	154700
6668	136	Fargo	North Dakota	1	2010	154800
6669	136	Fargo	North Dakota	2	2010	154800
6670	136	Fargo	North Dakota	3	2010	155100
6671	136	Fargo	North Dakota	4	2010	155800
6672	136	Fargo	North Dakota	5	2010	156500
6673	136	Fargo	North Dakota	6	2010	156800
6674	136	Fargo	North Dakota	7	2010	156600
6675	136	Fargo	North Dakota	8	2010	156800
6676	136	Fargo	North Dakota	9	2010	157800
6677	136	Fargo	North Dakota	10	2010	159000
6678	136	Fargo	North Dakota	11	2010	159700
6679	136	Fargo	North Dakota	12	2010	160200
6680	136	Fargo	North Dakota	1	2011	160400
6681	136	Fargo	North Dakota	2	2011	160500
6682	136	Fargo	North Dakota	3	2011	160200
6683	136	Fargo	North Dakota	4	2011	160400
6684	136	Fargo	North Dakota	5	2011	161800
6685	136	Fargo	North Dakota	6	2011	163300
6686	136	Fargo	North Dakota	7	2011	164000
6687	136	Fargo	North Dakota	8	2011	163400
6688	136	Fargo	North Dakota	9	2011	161300
6689	136	Fargo	North Dakota	10	2011	158800
6690	136	Fargo	North Dakota	11	2011	157300
6691	136	Fargo	North Dakota	12	2011	156100
6692	136	Fargo	North Dakota	1	2012	155400
6693	136	Fargo	North Dakota	2	2012	154700
6694	136	Fargo	North Dakota	3	2012	154200
6695	136	Fargo	North Dakota	4	2012	153900
6696	136	Fargo	North Dakota	5	2012	153600
6697	136	Fargo	North Dakota	6	2012	152900
6698	136	Fargo	North Dakota	7	2012	152300
6699	136	Fargo	North Dakota	8	2012	152100
6700	136	Fargo	North Dakota	9	2012	152400
6701	136	Fargo	North Dakota	10	2012	153300
6702	136	Fargo	North Dakota	11	2012	154400
6703	136	Fargo	North Dakota	12	2012	155600
6704	136	Fargo	North Dakota	1	2013	156600
6705	136	Fargo	North Dakota	2	2013	157700
6706	136	Fargo	North Dakota	3	2013	158800
6707	136	Fargo	North Dakota	4	2013	159200
6708	136	Fargo	North Dakota	5	2013	159300
6709	136	Fargo	North Dakota	6	2013	159900
6710	136	Fargo	North Dakota	7	2013	161000
6711	136	Fargo	North Dakota	8	2013	162700
6712	136	Fargo	North Dakota	9	2013	164600
6713	136	Fargo	North Dakota	10	2013	166300
6714	136	Fargo	North Dakota	11	2013	167800
6715	136	Fargo	North Dakota	12	2013	169400
6716	136	Fargo	North Dakota	1	2014	170800
6717	136	Fargo	North Dakota	2	2014	171900
6718	136	Fargo	North Dakota	3	2014	173200
6719	136	Fargo	North Dakota	4	2014	174500
6720	136	Fargo	North Dakota	5	2014	175800
6721	136	Fargo	North Dakota	6	2014	176900
6722	136	Fargo	North Dakota	7	2014	178000
6723	136	Fargo	North Dakota	8	2014	179200
6724	136	Fargo	North Dakota	9	2014	180700
6725	136	Fargo	North Dakota	10	2014	182200
6726	136	Fargo	North Dakota	11	2014	183000
6727	136	Fargo	North Dakota	12	2014	183700
6728	136	Fargo	North Dakota	1	2015	184600
6729	136	Fargo	North Dakota	2	2015	185600
6730	136	Fargo	North Dakota	3	2015	186500
6731	136	Fargo	North Dakota	4	2015	187800
6732	136	Fargo	North Dakota	5	2015	189100
6733	136	Fargo	North Dakota	6	2015	190100
6734	136	Fargo	North Dakota	7	2015	190600
6735	136	Fargo	North Dakota	8	2015	191100
6736	136	Fargo	North Dakota	9	2015	191800
6737	136	Fargo	North Dakota	10	2015	192900
6738	136	Fargo	North Dakota	11	2015	194200
6739	136	Fargo	North Dakota	12	2015	195400
6740	136	Fargo	North Dakota	1	2016	196300
6741	136	Fargo	North Dakota	2	2016	197200
6742	136	Fargo	North Dakota	3	2016	198500
6743	136	Fargo	North Dakota	4	2016	199500
6744	136	Fargo	North Dakota	5	2016	200700
6745	136	Fargo	North Dakota	6	2016	202700
6746	136	Fargo	North Dakota	7	2016	204700
6747	136	Fargo	North Dakota	8	2016	207300
6748	136	Fargo	North Dakota	9	2016	210900
6749	136	Fargo	North Dakota	10	2016	213900
6750	136	Fargo	North Dakota	11	2016	215700
6751	136	Fargo	North Dakota	12	2016	216900
6752	136	Fargo	North Dakota	1	2017	218000
6753	136	Fargo	North Dakota	2	2017	218900
6754	136	Fargo	North Dakota	3	2017	219200
6755	136	Fargo	North Dakota	4	2017	219300
6756	136	Fargo	North Dakota	5	2017	219600
6757	136	Fargo	North Dakota	6	2017	219700
6758	136	Fargo	North Dakota	7	2017	219600
6759	136	Fargo	North Dakota	8	2017	219500
6760	136	Fargo	North Dakota	9	2017	219600
6761	136	Fargo	North Dakota	10	2017	220000
6762	136	Fargo	North Dakota	11	2017	221000
6763	136	Fargo	North Dakota	12	2017	221900
6764	136	Fargo	North Dakota	1	2018	222400
6765	136	Fargo	North Dakota	2	2018	223000
6766	136	Fargo	North Dakota	3	2018	223800
6767	136	Fargo	North Dakota	4	2018	224600
6768	136	Fargo	North Dakota	5	2018	225200
6769	136	Fargo	North Dakota	6	2018	225800
6770	136	Fargo	North Dakota	7	2018	226500
6771	136	Fargo	North Dakota	8	2018	226600
6772	136	Fargo	North Dakota	9	2018	225900
6773	136	Fargo	North Dakota	10	2018	225200
6774	136	Fargo	North Dakota	11	2018	223900
6775	136	Fargo	North Dakota	12	2018	222400
6776	136	Fargo	North Dakota	1	2019	221700
6777	56	Des Moines	Iowa	1	2009	153500
6778	56	Des Moines	Iowa	2	2009	152304
6779	56	Des Moines	Iowa	3	2009	148750
6780	56	Des Moines	Iowa	4	2009	149900
6781	56	Des Moines	Iowa	5	2009	157500
6782	56	Des Moines	Iowa	6	2009	163200
6783	56	Des Moines	Iowa	7	2009	159000
6784	56	Des Moines	Iowa	8	2009	155489
6785	56	Des Moines	Iowa	9	2009	155000
6786	56	Des Moines	Iowa	10	2009	145000
6787	56	Des Moines	Iowa	11	2009	147000
6788	56	Des Moines	Iowa	12	2009	145000
6789	56	Des Moines	Iowa	1	2010	140000
6790	56	Des Moines	Iowa	2	2010	145500
6791	56	Des Moines	Iowa	3	2010	139900
6792	56	Des Moines	Iowa	4	2010	155450
6793	56	Des Moines	Iowa	5	2010	153825
6794	56	Des Moines	Iowa	6	2010	149250
6795	56	Des Moines	Iowa	7	2010	149700
6796	56	Des Moines	Iowa	8	2010	161000
6797	56	Des Moines	Iowa	9	2010	149725
6798	56	Des Moines	Iowa	10	2010	152800
6799	56	Des Moines	Iowa	11	2010	145725
6800	56	Des Moines	Iowa	12	2010	150250
6801	56	Des Moines	Iowa	1	2011	140000
6802	56	Des Moines	Iowa	2	2011	132000
6803	56	Des Moines	Iowa	3	2011	137700
6804	56	Des Moines	Iowa	4	2011	145000
6805	56	Des Moines	Iowa	5	2011	144000
6806	56	Des Moines	Iowa	6	2011	163500
6807	56	Des Moines	Iowa	7	2011	159100
6808	56	Des Moines	Iowa	8	2011	157000
6809	56	Des Moines	Iowa	9	2011	149450
6810	56	Des Moines	Iowa	10	2011	155900
6811	56	Des Moines	Iowa	11	2011	151750
6812	56	Des Moines	Iowa	12	2011	142000
6813	56	Des Moines	Iowa	1	2012	132750
6814	56	Des Moines	Iowa	2	2012	125750
6815	56	Des Moines	Iowa	3	2012	148000
6816	56	Des Moines	Iowa	4	2012	156500
6817	56	Des Moines	Iowa	5	2012	160800
6818	56	Des Moines	Iowa	6	2012	159250
6819	56	Des Moines	Iowa	7	2012	155000
6820	56	Des Moines	Iowa	8	2012	161500
6821	56	Des Moines	Iowa	9	2012	158000
6822	56	Des Moines	Iowa	10	2012	151400
6823	56	Des Moines	Iowa	11	2012	149000
6824	56	Des Moines	Iowa	12	2012	155710
6825	56	Des Moines	Iowa	1	2013	138900
6826	56	Des Moines	Iowa	2	2013	165000
6827	56	Des Moines	Iowa	3	2013	153000
6828	56	Des Moines	Iowa	4	2013	159900
6829	56	Des Moines	Iowa	5	2013	165000
6830	56	Des Moines	Iowa	6	2013	176000
6831	56	Des Moines	Iowa	7	2013	170000
6832	56	Des Moines	Iowa	8	2013	167000
6833	56	Des Moines	Iowa	9	2013	167000
6834	56	Des Moines	Iowa	10	2013	160000
6835	56	Des Moines	Iowa	11	2013	158750
6836	56	Des Moines	Iowa	12	2013	155000
6837	56	Des Moines	Iowa	1	2014	137850
6838	56	Des Moines	Iowa	2	2014	149450
6839	56	Des Moines	Iowa	3	2014	153000
6840	56	Des Moines	Iowa	4	2014	160000
6841	56	Des Moines	Iowa	5	2014	164000
6842	56	Des Moines	Iowa	6	2014	175500
6843	56	Des Moines	Iowa	7	2014	179587
6844	56	Des Moines	Iowa	8	2014	160950
6845	56	Des Moines	Iowa	9	2014	165062
6846	56	Des Moines	Iowa	10	2014	162500
6847	56	Des Moines	Iowa	11	2014	165365
6848	56	Des Moines	Iowa	12	2014	158000
6849	56	Des Moines	Iowa	1	2015	156000
6850	56	Des Moines	Iowa	2	2015	153000
6851	56	Des Moines	Iowa	3	2015	167900
6852	56	Des Moines	Iowa	4	2015	165000
6853	56	Des Moines	Iowa	5	2015	181000
6854	56	Des Moines	Iowa	6	2015	178500
6855	56	Des Moines	Iowa	7	2015	176000
6856	56	Des Moines	Iowa	8	2015	180000
6857	56	Des Moines	Iowa	9	2015	174950
6858	56	Des Moines	Iowa	10	2015	178000
6859	56	Des Moines	Iowa	11	2015	179500
6860	56	Des Moines	Iowa	12	2015	184350
6861	56	Des Moines	Iowa	1	2016	177000
6862	56	Des Moines	Iowa	2	2016	175000
6863	56	Des Moines	Iowa	3	2016	170000
6864	56	Des Moines	Iowa	4	2016	182900
6865	56	Des Moines	Iowa	5	2016	184000
6866	56	Des Moines	Iowa	6	2016	185000
6867	56	Des Moines	Iowa	7	2016	185000
6868	56	Des Moines	Iowa	8	2016	185000
6869	56	Des Moines	Iowa	9	2016	175000
6870	56	Des Moines	Iowa	10	2016	178000
6871	56	Des Moines	Iowa	11	2016	172500
6872	56	Des Moines	Iowa	12	2016	182000
6873	56	Des Moines	Iowa	1	2017	182500
6874	56	Des Moines	Iowa	2	2017	166000
6875	56	Des Moines	Iowa	3	2017	177000
6876	56	Des Moines	Iowa	4	2017	176000
6877	56	Des Moines	Iowa	5	2017	177000
6878	56	Des Moines	Iowa	6	2017	190000
6879	56	Des Moines	Iowa	7	2017	189500
6880	56	Des Moines	Iowa	8	2017	180000
6881	56	Des Moines	Iowa	9	2017	186000
6882	56	Des Moines	Iowa	10	2017	189000
6883	56	Des Moines	Iowa	11	2017	188000
6884	56	Des Moines	Iowa	12	2017	191300
6885	56	Des Moines	Iowa	1	2018	183000
6886	56	Des Moines	Iowa	2	2018	190000
6887	56	Des Moines	Iowa	3	2018	192250
6888	56	Des Moines	Iowa	4	2018	198000
6889	56	Des Moines	Iowa	5	2018	207000
6890	56	Des Moines	Iowa	6	2018	213000
6891	56	Des Moines	Iowa	7	2018	205000
6892	56	Des Moines	Iowa	8	2018	208500
6893	56	Des Moines	Iowa	9	2018	199900
6894	56	Des Moines	Iowa	10	2018	192000
6895	56	Des Moines	Iowa	11	2018	195500
6896	56	Des Moines	Iowa	12	2018	191250
6897	56	Des Moines	Iowa	1	2019	0
6898	45	Boise	Idaho	1	2009	165000
6899	45	Boise	Idaho	2	2009	161750
6900	45	Boise	Idaho	3	2009	157750
6901	45	Boise	Idaho	4	2009	159000
6902	45	Boise	Idaho	5	2009	150000
6903	45	Boise	Idaho	6	2009	158000
6904	45	Boise	Idaho	7	2009	150000
6905	45	Boise	Idaho	8	2009	150250
6906	45	Boise	Idaho	9	2009	146000
6907	45	Boise	Idaho	10	2009	138500
6908	45	Boise	Idaho	11	2009	137000
6909	45	Boise	Idaho	12	2009	143538
6910	45	Boise	Idaho	1	2010	140000
6911	45	Boise	Idaho	2	2010	137500
6912	45	Boise	Idaho	3	2010	137844
6913	45	Boise	Idaho	4	2010	132500
6914	45	Boise	Idaho	5	2010	139700
6915	45	Boise	Idaho	6	2010	134973
6916	45	Boise	Idaho	7	2010	130000
6917	45	Boise	Idaho	8	2010	130000
6918	45	Boise	Idaho	9	2010	129625
6919	45	Boise	Idaho	10	2010	128000
6920	45	Boise	Idaho	11	2010	122455
6921	45	Boise	Idaho	12	2010	117500
6922	45	Boise	Idaho	1	2011	112450
6923	45	Boise	Idaho	2	2011	116000
6924	45	Boise	Idaho	3	2011	109000
6925	45	Boise	Idaho	4	2011	112500
6926	45	Boise	Idaho	5	2011	113500
6927	45	Boise	Idaho	6	2011	121087
6928	45	Boise	Idaho	7	2011	115000
6929	45	Boise	Idaho	8	2011	122500
6930	45	Boise	Idaho	9	2011	123500
6931	45	Boise	Idaho	10	2011	118000
6932	45	Boise	Idaho	11	2011	124700
6933	45	Boise	Idaho	12	2011	116850
6934	45	Boise	Idaho	1	2012	116000
6935	45	Boise	Idaho	2	2012	125000
6936	45	Boise	Idaho	3	2012	125000
6937	45	Boise	Idaho	4	2012	133500
6938	45	Boise	Idaho	5	2012	140000
6939	45	Boise	Idaho	6	2012	145500
6940	45	Boise	Idaho	7	2012	147300
6941	45	Boise	Idaho	8	2012	153750
6942	45	Boise	Idaho	9	2012	141900
6943	45	Boise	Idaho	10	2012	149402
6944	45	Boise	Idaho	11	2012	148000
6945	45	Boise	Idaho	12	2012	148780
6946	45	Boise	Idaho	1	2013	145000
6947	45	Boise	Idaho	2	2013	145000
6948	45	Boise	Idaho	3	2013	153000
6949	45	Boise	Idaho	4	2013	162000
6950	45	Boise	Idaho	5	2013	164900
6951	45	Boise	Idaho	6	2013	174900
6952	45	Boise	Idaho	7	2013	170000
6953	45	Boise	Idaho	8	2013	171500
6954	45	Boise	Idaho	9	2013	170000
6955	45	Boise	Idaho	10	2013	177000
6956	45	Boise	Idaho	11	2013	174900
6957	45	Boise	Idaho	12	2013	175000
6958	45	Boise	Idaho	1	2014	174450
6959	45	Boise	Idaho	2	2014	162500
6960	45	Boise	Idaho	3	2014	167100
6961	45	Boise	Idaho	4	2014	174685
6962	45	Boise	Idaho	5	2014	182900
6963	45	Boise	Idaho	6	2014	184000
6964	45	Boise	Idaho	7	2014	184688
6965	45	Boise	Idaho	8	2014	184000
6966	45	Boise	Idaho	9	2014	174950
6967	45	Boise	Idaho	10	2014	178529
6968	45	Boise	Idaho	11	2014	184000
6969	45	Boise	Idaho	12	2014	184500
6970	45	Boise	Idaho	1	2015	174900
6971	45	Boise	Idaho	2	2015	175900
6972	45	Boise	Idaho	3	2015	186140
6973	45	Boise	Idaho	4	2015	184300
6974	45	Boise	Idaho	5	2015	195000
6975	45	Boise	Idaho	6	2015	194900
6976	45	Boise	Idaho	7	2015	199684
6977	45	Boise	Idaho	8	2015	197500
6978	45	Boise	Idaho	9	2015	192000
6979	45	Boise	Idaho	10	2015	199091
6980	45	Boise	Idaho	11	2015	196596
6981	45	Boise	Idaho	12	2015	203000
6982	45	Boise	Idaho	1	2016	190673
6983	45	Boise	Idaho	2	2016	199200
6984	45	Boise	Idaho	3	2016	196500
6985	45	Boise	Idaho	4	2016	206000
6986	45	Boise	Idaho	5	2016	214000
6987	45	Boise	Idaho	6	2016	215000
6988	45	Boise	Idaho	7	2016	218321
6989	45	Boise	Idaho	8	2016	217900
6990	45	Boise	Idaho	9	2016	220000
6991	45	Boise	Idaho	10	2016	216150
6992	45	Boise	Idaho	11	2016	217038
6993	45	Boise	Idaho	12	2016	219900
6994	45	Boise	Idaho	1	2017	212945
6995	45	Boise	Idaho	2	2017	224700
6996	45	Boise	Idaho	3	2017	224900
6997	45	Boise	Idaho	4	2017	225000
6998	45	Boise	Idaho	5	2017	229900
6999	45	Boise	Idaho	6	2017	240000
7000	45	Boise	Idaho	7	2017	237000
7001	45	Boise	Idaho	8	2017	240000
7002	45	Boise	Idaho	9	2017	239900
7003	45	Boise	Idaho	10	2017	239000
7004	45	Boise	Idaho	11	2017	239900
7005	45	Boise	Idaho	12	2017	245000
7006	45	Boise	Idaho	1	2018	250000
7007	45	Boise	Idaho	2	2018	250000
7008	45	Boise	Idaho	3	2018	266500
7009	45	Boise	Idaho	4	2018	259900
7010	45	Boise	Idaho	5	2018	267000
7011	45	Boise	Idaho	6	2018	278495
7012	45	Boise	Idaho	7	2018	280000
7013	45	Boise	Idaho	8	2018	278995
7014	45	Boise	Idaho	9	2018	275000
7015	45	Boise	Idaho	10	2018	270000
7016	45	Boise	Idaho	11	2018	265000
7017	45	Boise	Idaho	12	2018	269900
7018	45	Boise	Idaho	1	2019	0
7019	32	Miami	Florida	1	2009	162000
7020	32	Miami	Florida	2	2009	168500
7021	32	Miami	Florida	3	2009	170000
7022	32	Miami	Florida	4	2009	149000
7023	32	Miami	Florida	5	2009	147000
7024	32	Miami	Florida	6	2009	154750
7025	32	Miami	Florida	7	2009	155000
7026	32	Miami	Florida	8	2009	150000
7027	32	Miami	Florida	9	2009	155000
7028	32	Miami	Florida	10	2009	145000
7029	32	Miami	Florida	11	2009	159450
7030	32	Miami	Florida	12	2009	159875
7031	32	Miami	Florida	1	2010	145000
7032	32	Miami	Florida	2	2010	140350
7033	32	Miami	Florida	3	2010	150000
7034	32	Miami	Florida	4	2010	150000
7035	32	Miami	Florida	5	2010	160000
7036	32	Miami	Florida	6	2010	150000
7037	32	Miami	Florida	7	2010	142000
7038	32	Miami	Florida	8	2010	130000
7039	32	Miami	Florida	9	2010	125000
7040	32	Miami	Florida	10	2010	128000
7041	32	Miami	Florida	11	2010	135000
7042	32	Miami	Florida	12	2010	130000
7043	32	Miami	Florida	1	2011	115900
7044	32	Miami	Florida	2	2011	120000
7045	32	Miami	Florida	3	2011	119500
7046	32	Miami	Florida	4	2011	130000
7047	32	Miami	Florida	5	2011	140000
7048	32	Miami	Florida	6	2011	140000
7049	32	Miami	Florida	7	2011	145000
7050	32	Miami	Florida	8	2011	145000
7051	32	Miami	Florida	9	2011	140000
7052	32	Miami	Florida	10	2011	139000
7053	32	Miami	Florida	11	2011	140000
7054	32	Miami	Florida	12	2011	145000
7055	32	Miami	Florida	1	2012	141600
7056	32	Miami	Florida	2	2012	142500
7057	32	Miami	Florida	3	2012	150000
7058	32	Miami	Florida	4	2012	163000
7059	32	Miami	Florida	5	2012	162000
7060	32	Miami	Florida	6	2012	170000
7061	32	Miami	Florida	7	2012	160000
7062	32	Miami	Florida	8	2012	161000
7063	32	Miami	Florida	9	2012	168000
7064	32	Miami	Florida	10	2012	162500
7065	32	Miami	Florida	11	2012	167000
7066	32	Miami	Florida	12	2012	185000
7067	32	Miami	Florida	1	2013	175000
7068	32	Miami	Florida	2	2013	172800
7069	32	Miami	Florida	3	2013	182000
7070	32	Miami	Florida	4	2013	194000
7071	32	Miami	Florida	5	2013	197000
7072	32	Miami	Florida	6	2013	205000
7073	32	Miami	Florida	7	2013	200000
7074	32	Miami	Florida	8	2013	210000
7075	32	Miami	Florida	9	2013	209000
7076	32	Miami	Florida	10	2013	190000
7077	32	Miami	Florida	11	2013	202500
7078	32	Miami	Florida	12	2013	200000
7079	32	Miami	Florida	1	2014	200000
7080	32	Miami	Florida	2	2014	190000
7081	32	Miami	Florida	3	2014	215000
7082	32	Miami	Florida	4	2014	215000
7083	32	Miami	Florida	5	2014	224000
7084	32	Miami	Florida	6	2014	211000
7085	32	Miami	Florida	7	2014	225000
7086	32	Miami	Florida	8	2014	212000
7087	32	Miami	Florida	9	2014	220000
7088	32	Miami	Florida	10	2014	218650
7089	32	Miami	Florida	11	2014	215000
7090	32	Miami	Florida	12	2014	220000
7091	32	Miami	Florida	1	2015	215000
7092	32	Miami	Florida	2	2015	217500
7093	32	Miami	Florida	3	2015	225000
7094	32	Miami	Florida	4	2015	230000
7095	32	Miami	Florida	5	2015	245000
7096	32	Miami	Florida	6	2015	245000
7097	32	Miami	Florida	7	2015	237000
7098	32	Miami	Florida	8	2015	230000
7099	32	Miami	Florida	9	2015	240000
7100	32	Miami	Florida	10	2015	234400
7101	32	Miami	Florida	11	2015	225000
7102	32	Miami	Florida	12	2015	245000
7103	32	Miami	Florida	1	2016	238250
7104	32	Miami	Florida	2	2016	240000
7105	32	Miami	Florida	3	2016	238875
7106	32	Miami	Florida	4	2016	250000
7107	32	Miami	Florida	5	2016	250000
7108	32	Miami	Florida	6	2016	260000
7109	32	Miami	Florida	7	2016	265000
7110	32	Miami	Florida	8	2016	259950
7111	32	Miami	Florida	9	2016	263250
7112	32	Miami	Florida	10	2016	260000
7113	32	Miami	Florida	11	2016	260000
7114	32	Miami	Florida	12	2016	255000
7115	32	Miami	Florida	1	2017	262500
7116	32	Miami	Florida	2	2017	265000
7117	32	Miami	Florida	3	2017	270000
7118	32	Miami	Florida	4	2017	280000
7119	32	Miami	Florida	5	2017	270000
7120	32	Miami	Florida	6	2017	285000
7121	32	Miami	Florida	7	2017	275000
7122	32	Miami	Florida	8	2017	285000
7123	32	Miami	Florida	9	2017	282500
7124	32	Miami	Florida	10	2017	280000
7125	32	Miami	Florida	11	2017	278250
7126	32	Miami	Florida	12	2017	276000
7127	32	Miami	Florida	1	2018	285000
7128	32	Miami	Florida	2	2018	280000
7129	32	Miami	Florida	3	2018	295000
7130	32	Miami	Florida	4	2018	287750
7131	32	Miami	Florida	5	2018	300000
7132	32	Miami	Florida	6	2018	295000
7133	32	Miami	Florida	7	2018	293850
7134	32	Miami	Florida	8	2018	292000
7135	32	Miami	Florida	9	2018	295000
7136	32	Miami	Florida	10	2018	290000
7137	32	Miami	Florida	11	2018	290000
7138	32	Miami	Florida	12	2018	295000
7139	32	Miami	Florida	1	2019	0
7140	30	Jacksonville	Florida	1	2009	152950
7141	30	Jacksonville	Florida	2	2009	155500
7142	30	Jacksonville	Florida	3	2009	155000
7143	30	Jacksonville	Florida	4	2009	149470
7144	30	Jacksonville	Florida	5	2009	164500
7145	30	Jacksonville	Florida	6	2009	160000
7146	30	Jacksonville	Florida	7	2009	158500
7147	30	Jacksonville	Florida	8	2009	149900
7148	30	Jacksonville	Florida	9	2009	145000
7149	30	Jacksonville	Florida	10	2009	149000
7150	30	Jacksonville	Florida	11	2009	147400
7151	30	Jacksonville	Florida	12	2009	141500
7152	30	Jacksonville	Florida	1	2010	133000
7153	30	Jacksonville	Florida	2	2010	135000
7154	30	Jacksonville	Florida	3	2010	138000
7155	30	Jacksonville	Florida	4	2010	135500
7156	30	Jacksonville	Florida	5	2010	139995
7157	30	Jacksonville	Florida	6	2010	145000
7158	30	Jacksonville	Florida	7	2010	138000
7159	30	Jacksonville	Florida	8	2010	134900
7160	30	Jacksonville	Florida	9	2010	130000
7161	30	Jacksonville	Florida	10	2010	135575
7162	30	Jacksonville	Florida	11	2010	140000
7163	30	Jacksonville	Florida	12	2010	130000
7164	30	Jacksonville	Florida	1	2011	120870
7165	30	Jacksonville	Florida	2	2011	120000
7166	30	Jacksonville	Florida	3	2011	125000
7167	30	Jacksonville	Florida	4	2011	125000
7168	30	Jacksonville	Florida	5	2011	132000
7169	30	Jacksonville	Florida	6	2011	139450
7170	30	Jacksonville	Florida	7	2011	132500
7171	30	Jacksonville	Florida	8	2011	138000
7172	30	Jacksonville	Florida	9	2011	125000
7173	30	Jacksonville	Florida	10	2011	130000
7174	30	Jacksonville	Florida	11	2011	135000
7175	30	Jacksonville	Florida	12	2011	125000
7176	30	Jacksonville	Florida	1	2012	116600
7177	30	Jacksonville	Florida	2	2012	124750
7178	30	Jacksonville	Florida	3	2012	131500
7179	30	Jacksonville	Florida	4	2012	140000
7180	30	Jacksonville	Florida	5	2012	139900
7181	30	Jacksonville	Florida	6	2012	150000
7182	30	Jacksonville	Florida	7	2012	145000
7183	30	Jacksonville	Florida	8	2012	140500
7184	30	Jacksonville	Florida	9	2012	143000
7185	30	Jacksonville	Florida	10	2012	140038
7186	30	Jacksonville	Florida	11	2012	135000
7187	30	Jacksonville	Florida	12	2012	145000
7188	30	Jacksonville	Florida	1	2013	145000
7189	30	Jacksonville	Florida	2	2013	145000
7190	30	Jacksonville	Florida	3	2013	149000
7191	30	Jacksonville	Florida	4	2013	158000
7192	30	Jacksonville	Florida	5	2013	161000
7193	30	Jacksonville	Florida	6	2013	165000
7194	30	Jacksonville	Florida	7	2013	172500
7195	30	Jacksonville	Florida	8	2013	175000
7196	30	Jacksonville	Florida	9	2013	164125
7197	30	Jacksonville	Florida	10	2013	160000
7198	30	Jacksonville	Florida	11	2013	164500
7199	30	Jacksonville	Florida	12	2013	162000
7200	30	Jacksonville	Florida	1	2014	137729
7201	30	Jacksonville	Florida	2	2014	149900
7202	30	Jacksonville	Florida	3	2014	165000
7203	30	Jacksonville	Florida	4	2014	164950
7204	30	Jacksonville	Florida	5	2014	165000
7205	30	Jacksonville	Florida	6	2014	175000
7206	30	Jacksonville	Florida	7	2014	175000
7207	30	Jacksonville	Florida	8	2014	168000
7208	30	Jacksonville	Florida	9	2014	173000
7209	30	Jacksonville	Florida	10	2014	167000
7210	30	Jacksonville	Florida	11	2014	169000
7211	30	Jacksonville	Florida	12	2014	175000
7212	30	Jacksonville	Florida	1	2015	162000
7213	30	Jacksonville	Florida	2	2015	163000
7214	30	Jacksonville	Florida	3	2015	166708
7215	30	Jacksonville	Florida	4	2015	177500
7216	30	Jacksonville	Florida	5	2015	182945
7217	30	Jacksonville	Florida	6	2015	187500
7218	30	Jacksonville	Florida	7	2015	184000
7219	30	Jacksonville	Florida	8	2015	182000
7220	30	Jacksonville	Florida	9	2015	185000
7221	30	Jacksonville	Florida	10	2015	175000
7222	30	Jacksonville	Florida	11	2015	175000
7223	30	Jacksonville	Florida	12	2015	180000
7224	30	Jacksonville	Florida	1	2016	172500
7225	30	Jacksonville	Florida	2	2016	172000
7226	30	Jacksonville	Florida	3	2016	188000
7227	30	Jacksonville	Florida	4	2016	186500
7228	30	Jacksonville	Florida	5	2016	194995
7229	30	Jacksonville	Florida	6	2016	200000
7230	30	Jacksonville	Florida	7	2016	201349
7231	30	Jacksonville	Florida	8	2016	200000
7232	30	Jacksonville	Florida	9	2016	195000
7233	30	Jacksonville	Florida	10	2016	199000
7234	30	Jacksonville	Florida	11	2016	190000
7235	30	Jacksonville	Florida	12	2016	195750
7236	30	Jacksonville	Florida	1	2017	185000
7237	30	Jacksonville	Florida	2	2017	193000
7238	30	Jacksonville	Florida	3	2017	200000
7239	30	Jacksonville	Florida	4	2017	204000
7240	30	Jacksonville	Florida	5	2017	216000
7241	30	Jacksonville	Florida	6	2017	220000
7242	30	Jacksonville	Florida	7	2017	223000
7243	30	Jacksonville	Florida	8	2017	210000
7244	30	Jacksonville	Florida	9	2017	215000
7245	30	Jacksonville	Florida	10	2017	205000
7246	30	Jacksonville	Florida	11	2017	210350
7247	30	Jacksonville	Florida	12	2017	215000
7248	30	Jacksonville	Florida	1	2018	208990
7249	30	Jacksonville	Florida	2	2018	220000
7250	30	Jacksonville	Florida	3	2018	225000
7251	30	Jacksonville	Florida	4	2018	224107
7252	30	Jacksonville	Florida	5	2018	227000
7253	30	Jacksonville	Florida	6	2018	240000
7254	30	Jacksonville	Florida	7	2018	230000
7255	30	Jacksonville	Florida	8	2018	225000
7256	30	Jacksonville	Florida	9	2018	218000
7257	30	Jacksonville	Florida	10	2018	215000
7258	30	Jacksonville	Florida	11	2018	225000
7259	30	Jacksonville	Florida	12	2018	225000
7260	30	Jacksonville	Florida	1	2019	0
7261	156	Baton Rouge	Louisiana	1	2009	149200
7262	156	Baton Rouge	Louisiana	2	2009	149000
7263	156	Baton Rouge	Louisiana	3	2009	148800
7264	156	Baton Rouge	Louisiana	4	2009	148400
7265	156	Baton Rouge	Louisiana	5	2009	148200
7266	156	Baton Rouge	Louisiana	6	2009	148200
7267	156	Baton Rouge	Louisiana	7	2009	148400
7268	156	Baton Rouge	Louisiana	8	2009	148700
7269	156	Baton Rouge	Louisiana	9	2009	149000
7270	156	Baton Rouge	Louisiana	10	2009	149200
7271	156	Baton Rouge	Louisiana	11	2009	149500
7272	156	Baton Rouge	Louisiana	12	2009	149700
7273	156	Baton Rouge	Louisiana	1	2010	149900
7274	156	Baton Rouge	Louisiana	2	2010	150200
7275	156	Baton Rouge	Louisiana	3	2010	150400
7276	156	Baton Rouge	Louisiana	4	2010	150300
7277	156	Baton Rouge	Louisiana	5	2010	149800
7278	156	Baton Rouge	Louisiana	6	2010	149000
7279	156	Baton Rouge	Louisiana	7	2010	148100
7280	156	Baton Rouge	Louisiana	8	2010	147600
7281	156	Baton Rouge	Louisiana	9	2010	147400
7282	156	Baton Rouge	Louisiana	10	2010	147200
7283	156	Baton Rouge	Louisiana	11	2010	146800
7284	156	Baton Rouge	Louisiana	12	2010	146300
7285	156	Baton Rouge	Louisiana	1	2011	145400
7286	156	Baton Rouge	Louisiana	2	2011	144500
7287	156	Baton Rouge	Louisiana	3	2011	144000
7288	156	Baton Rouge	Louisiana	4	2011	143600
7289	156	Baton Rouge	Louisiana	5	2011	143100
7290	156	Baton Rouge	Louisiana	6	2011	142700
7291	156	Baton Rouge	Louisiana	7	2011	142000
7292	156	Baton Rouge	Louisiana	8	2011	141000
7293	156	Baton Rouge	Louisiana	9	2011	140200
7294	156	Baton Rouge	Louisiana	10	2011	139800
7295	156	Baton Rouge	Louisiana	11	2011	139700
7296	156	Baton Rouge	Louisiana	12	2011	139800
7297	156	Baton Rouge	Louisiana	1	2012	139600
7298	156	Baton Rouge	Louisiana	2	2012	139200
7299	156	Baton Rouge	Louisiana	3	2012	138800
7300	156	Baton Rouge	Louisiana	4	2012	138500
7301	156	Baton Rouge	Louisiana	5	2012	138500
7302	156	Baton Rouge	Louisiana	6	2012	138900
7303	156	Baton Rouge	Louisiana	7	2012	139400
7304	156	Baton Rouge	Louisiana	8	2012	140000
7305	156	Baton Rouge	Louisiana	9	2012	140700
7306	156	Baton Rouge	Louisiana	10	2012	141200
7307	156	Baton Rouge	Louisiana	11	2012	141100
7308	156	Baton Rouge	Louisiana	12	2012	140600
7309	156	Baton Rouge	Louisiana	1	2013	140200
7310	156	Baton Rouge	Louisiana	2	2013	140300
7311	156	Baton Rouge	Louisiana	3	2013	140200
7312	156	Baton Rouge	Louisiana	4	2013	140200
7313	156	Baton Rouge	Louisiana	5	2013	140200
7314	156	Baton Rouge	Louisiana	6	2013	139900
7315	156	Baton Rouge	Louisiana	7	2013	139400
7316	156	Baton Rouge	Louisiana	8	2013	139200
7317	156	Baton Rouge	Louisiana	9	2013	139100
7318	156	Baton Rouge	Louisiana	10	2013	139300
7319	156	Baton Rouge	Louisiana	11	2013	139700
7320	156	Baton Rouge	Louisiana	12	2013	140100
7321	156	Baton Rouge	Louisiana	1	2014	140400
7322	156	Baton Rouge	Louisiana	2	2014	140300
7323	156	Baton Rouge	Louisiana	3	2014	140000
7324	156	Baton Rouge	Louisiana	4	2014	139900
7325	156	Baton Rouge	Louisiana	5	2014	140000
7326	156	Baton Rouge	Louisiana	6	2014	140200
7327	156	Baton Rouge	Louisiana	7	2014	140800
7328	156	Baton Rouge	Louisiana	8	2014	141100
7329	156	Baton Rouge	Louisiana	9	2014	141000
7330	156	Baton Rouge	Louisiana	10	2014	140700
7331	156	Baton Rouge	Louisiana	11	2014	0
7332	156	Baton Rouge	Louisiana	12	2014	0
7333	156	Baton Rouge	Louisiana	1	2015	0
7334	156	Baton Rouge	Louisiana	2	2015	0
7335	156	Baton Rouge	Louisiana	3	2015	0
7336	156	Baton Rouge	Louisiana	4	2015	0
7337	156	Baton Rouge	Louisiana	5	2015	0
7338	156	Baton Rouge	Louisiana	6	2015	0
7339	156	Baton Rouge	Louisiana	7	2015	0
7340	156	Baton Rouge	Louisiana	8	2015	0
7341	156	Baton Rouge	Louisiana	9	2015	0
7342	156	Baton Rouge	Louisiana	10	2015	0
7343	156	Baton Rouge	Louisiana	11	2015	0
7344	156	Baton Rouge	Louisiana	12	2015	0
7345	156	Baton Rouge	Louisiana	1	2016	0
7346	156	Baton Rouge	Louisiana	2	2016	0
7347	156	Baton Rouge	Louisiana	3	2016	0
7348	156	Baton Rouge	Louisiana	4	2016	0
7349	156	Baton Rouge	Louisiana	5	2016	0
7350	156	Baton Rouge	Louisiana	6	2016	0
7351	156	Baton Rouge	Louisiana	7	2016	0
7352	156	Baton Rouge	Louisiana	8	2016	0
7353	156	Baton Rouge	Louisiana	9	2016	0
7354	156	Baton Rouge	Louisiana	10	2016	0
7355	156	Baton Rouge	Louisiana	11	2016	0
7356	156	Baton Rouge	Louisiana	12	2016	0
7357	156	Baton Rouge	Louisiana	1	2017	0
7358	156	Baton Rouge	Louisiana	2	2017	0
7359	156	Baton Rouge	Louisiana	3	2017	0
7360	156	Baton Rouge	Louisiana	4	2017	0
7361	156	Baton Rouge	Louisiana	5	2017	0
7362	156	Baton Rouge	Louisiana	6	2017	0
7363	156	Baton Rouge	Louisiana	7	2017	0
7364	156	Baton Rouge	Louisiana	8	2017	0
7365	156	Baton Rouge	Louisiana	9	2017	0
7366	156	Baton Rouge	Louisiana	10	2017	0
7367	156	Baton Rouge	Louisiana	11	2017	0
7368	156	Baton Rouge	Louisiana	12	2017	0
7369	156	Baton Rouge	Louisiana	1	2018	0
7370	156	Baton Rouge	Louisiana	2	2018	0
7371	156	Baton Rouge	Louisiana	3	2018	0
7372	156	Baton Rouge	Louisiana	4	2018	0
7373	156	Baton Rouge	Louisiana	5	2018	0
7374	156	Baton Rouge	Louisiana	6	2018	0
7375	156	Baton Rouge	Louisiana	7	2018	0
7376	156	Baton Rouge	Louisiana	8	2018	0
7377	156	Baton Rouge	Louisiana	9	2018	0
7378	156	Baton Rouge	Louisiana	10	2018	0
7379	156	Baton Rouge	Louisiana	11	2018	0
7380	156	Baton Rouge	Louisiana	12	2018	0
7381	156	Baton Rouge	Louisiana	1	2019	0
7382	97	Columbus	Ohio	1	2009	117250
7383	97	Columbus	Ohio	2	2009	115000
7384	97	Columbus	Ohio	3	2009	127000
7385	97	Columbus	Ohio	4	2009	128700
7386	97	Columbus	Ohio	5	2009	138900
7387	97	Columbus	Ohio	6	2009	145500
7388	97	Columbus	Ohio	7	2009	148000
7389	97	Columbus	Ohio	8	2009	145000
7390	97	Columbus	Ohio	9	2009	142500
7391	97	Columbus	Ohio	10	2009	141325
7392	97	Columbus	Ohio	11	2009	132500
7393	97	Columbus	Ohio	12	2009	127650
7394	97	Columbus	Ohio	1	2010	117250
7395	97	Columbus	Ohio	2	2010	128000
7396	97	Columbus	Ohio	3	2010	134900
7397	97	Columbus	Ohio	4	2010	139900
7398	97	Columbus	Ohio	5	2010	148000
7399	97	Columbus	Ohio	6	2010	146000
7400	97	Columbus	Ohio	7	2010	140000
7401	97	Columbus	Ohio	8	2010	144500
7402	97	Columbus	Ohio	9	2010	132900
7403	97	Columbus	Ohio	10	2010	135000
7404	97	Columbus	Ohio	11	2010	134830
7405	97	Columbus	Ohio	12	2010	125000
7406	97	Columbus	Ohio	1	2011	128800
7407	97	Columbus	Ohio	2	2011	117999
7408	97	Columbus	Ohio	3	2011	125000
7409	97	Columbus	Ohio	4	2011	129900
7410	97	Columbus	Ohio	5	2011	133775
7411	97	Columbus	Ohio	6	2011	139900
7412	97	Columbus	Ohio	7	2011	144496
7413	97	Columbus	Ohio	8	2011	135927
7414	97	Columbus	Ohio	9	2011	130000
7415	97	Columbus	Ohio	10	2011	125000
7416	97	Columbus	Ohio	11	2011	129900
7417	97	Columbus	Ohio	12	2011	125000
7418	97	Columbus	Ohio	1	2012	121900
7419	97	Columbus	Ohio	2	2012	123000
7420	97	Columbus	Ohio	3	2012	130000
7421	97	Columbus	Ohio	4	2012	144000
7422	97	Columbus	Ohio	5	2012	141449
7423	97	Columbus	Ohio	6	2012	157000
7424	97	Columbus	Ohio	7	2012	158000
7425	97	Columbus	Ohio	8	2012	149900
7426	97	Columbus	Ohio	9	2012	145000
7427	97	Columbus	Ohio	10	2012	135000
7428	97	Columbus	Ohio	11	2012	139900
7429	97	Columbus	Ohio	12	2012	135950
7430	97	Columbus	Ohio	1	2013	122900
7431	97	Columbus	Ohio	2	2013	123375
7432	97	Columbus	Ohio	3	2013	138000
7433	97	Columbus	Ohio	4	2013	139500
7434	97	Columbus	Ohio	5	2013	153000
7435	97	Columbus	Ohio	6	2013	165000
7436	97	Columbus	Ohio	7	2013	162000
7437	97	Columbus	Ohio	8	2013	159000
7438	97	Columbus	Ohio	9	2013	150000
7439	97	Columbus	Ohio	10	2013	144009
7440	97	Columbus	Ohio	11	2013	142250
7441	97	Columbus	Ohio	12	2013	143750
7442	97	Columbus	Ohio	1	2014	131500
7443	97	Columbus	Ohio	2	2014	138000
7444	97	Columbus	Ohio	3	2014	148000
7445	97	Columbus	Ohio	4	2014	153000
7446	97	Columbus	Ohio	5	2014	158000
7447	97	Columbus	Ohio	6	2014	170000
7448	97	Columbus	Ohio	7	2014	167600
7449	97	Columbus	Ohio	8	2014	165550
7450	97	Columbus	Ohio	9	2014	155000
7451	97	Columbus	Ohio	10	2014	155000
7452	97	Columbus	Ohio	11	2014	153000
7453	97	Columbus	Ohio	12	2014	152900
7454	97	Columbus	Ohio	1	2015	141125
7455	97	Columbus	Ohio	2	2015	143100
7456	97	Columbus	Ohio	3	2015	156000
7457	97	Columbus	Ohio	4	2015	157297
7458	97	Columbus	Ohio	5	2015	169900
7459	97	Columbus	Ohio	6	2015	174900
7460	97	Columbus	Ohio	7	2015	172900
7461	97	Columbus	Ohio	8	2015	169000
7462	97	Columbus	Ohio	9	2015	173500
7463	97	Columbus	Ohio	10	2015	159500
7464	97	Columbus	Ohio	11	2015	159500
7465	97	Columbus	Ohio	12	2015	159500
7466	97	Columbus	Ohio	1	2016	153500
7467	97	Columbus	Ohio	2	2016	156000
7468	97	Columbus	Ohio	3	2016	166500
7469	97	Columbus	Ohio	4	2016	165000
7470	97	Columbus	Ohio	5	2016	181000
7471	97	Columbus	Ohio	6	2016	182838
7472	97	Columbus	Ohio	7	2016	185000
7473	97	Columbus	Ohio	8	2016	180200
7474	97	Columbus	Ohio	9	2016	178000
7475	97	Columbus	Ohio	10	2016	174000
7476	97	Columbus	Ohio	11	2016	175000
7477	97	Columbus	Ohio	12	2016	170000
7478	97	Columbus	Ohio	1	2017	164000
7479	97	Columbus	Ohio	2	2017	164800
7480	97	Columbus	Ohio	3	2017	172900
7481	97	Columbus	Ohio	4	2017	182500
7482	97	Columbus	Ohio	5	2017	194000
7483	97	Columbus	Ohio	6	2017	197900
7484	97	Columbus	Ohio	7	2017	197755
7485	97	Columbus	Ohio	8	2017	194700
7486	97	Columbus	Ohio	9	2017	185800
7487	97	Columbus	Ohio	10	2017	189900
7488	97	Columbus	Ohio	11	2017	185000
7489	97	Columbus	Ohio	12	2017	194000
7490	97	Columbus	Ohio	1	2018	181700
7491	97	Columbus	Ohio	2	2018	179900
7492	97	Columbus	Ohio	3	2018	185100
7493	97	Columbus	Ohio	4	2018	200000
7494	97	Columbus	Ohio	5	2018	209900
7495	97	Columbus	Ohio	6	2018	219900
7496	97	Columbus	Ohio	7	2018	210000
7497	97	Columbus	Ohio	8	2018	210000
7498	97	Columbus	Ohio	9	2018	205000
7499	97	Columbus	Ohio	10	2018	200000
7500	97	Columbus	Ohio	11	2018	197000
7501	97	Columbus	Ohio	12	2018	197950
7502	97	Columbus	Ohio	1	2019	0
7503	82	Omaha	Nebraska	1	2009	127900
7504	82	Omaha	Nebraska	2	2009	125900
7505	82	Omaha	Nebraska	3	2009	135000
7506	82	Omaha	Nebraska	4	2009	133000
7507	82	Omaha	Nebraska	5	2009	139900
7508	82	Omaha	Nebraska	6	2009	139000
7509	82	Omaha	Nebraska	7	2009	141000
7510	82	Omaha	Nebraska	8	2009	143675
7511	82	Omaha	Nebraska	9	2009	140000
7512	82	Omaha	Nebraska	10	2009	134000
7513	82	Omaha	Nebraska	11	2009	130450
7514	82	Omaha	Nebraska	12	2009	136556
7515	82	Omaha	Nebraska	1	2010	134000
7516	82	Omaha	Nebraska	2	2010	135000
7517	82	Omaha	Nebraska	3	2010	135000
7518	82	Omaha	Nebraska	4	2010	137500
7519	82	Omaha	Nebraska	5	2010	139973
7520	82	Omaha	Nebraska	6	2010	148000
7521	82	Omaha	Nebraska	7	2010	151000
7522	82	Omaha	Nebraska	8	2010	144000
7523	82	Omaha	Nebraska	9	2010	135000
7524	82	Omaha	Nebraska	10	2010	135000
7525	82	Omaha	Nebraska	11	2010	146400
7526	82	Omaha	Nebraska	12	2010	143000
7527	82	Omaha	Nebraska	1	2011	135450
7528	82	Omaha	Nebraska	2	2011	125000
7529	82	Omaha	Nebraska	3	2011	130000
7530	82	Omaha	Nebraska	4	2011	135000
7531	82	Omaha	Nebraska	5	2011	143000
7532	82	Omaha	Nebraska	6	2011	145700
7533	82	Omaha	Nebraska	7	2011	143250
7534	82	Omaha	Nebraska	8	2011	142000
7535	82	Omaha	Nebraska	9	2011	136000
7536	82	Omaha	Nebraska	10	2011	140825
7537	82	Omaha	Nebraska	11	2011	136000
7538	82	Omaha	Nebraska	12	2011	132000
7539	82	Omaha	Nebraska	1	2012	126500
7540	82	Omaha	Nebraska	2	2012	130500
7541	82	Omaha	Nebraska	3	2012	137500
7542	82	Omaha	Nebraska	4	2012	137000
7543	82	Omaha	Nebraska	5	2012	145000
7544	82	Omaha	Nebraska	6	2012	150000
7545	82	Omaha	Nebraska	7	2012	152875
7546	82	Omaha	Nebraska	8	2012	150000
7547	82	Omaha	Nebraska	9	2012	148000
7548	82	Omaha	Nebraska	10	2012	142000
7549	82	Omaha	Nebraska	11	2012	137250
7550	82	Omaha	Nebraska	12	2012	148000
7551	82	Omaha	Nebraska	1	2013	136500
7552	82	Omaha	Nebraska	2	2013	138000
7553	82	Omaha	Nebraska	3	2013	137000
7554	82	Omaha	Nebraska	4	2013	140000
7555	82	Omaha	Nebraska	5	2013	154450
7556	82	Omaha	Nebraska	6	2013	160000
7557	82	Omaha	Nebraska	7	2013	161500
7558	82	Omaha	Nebraska	8	2013	152500
7559	82	Omaha	Nebraska	9	2013	151950
7560	82	Omaha	Nebraska	10	2013	155000
7561	82	Omaha	Nebraska	11	2013	145000
7562	82	Omaha	Nebraska	12	2013	145000
7563	82	Omaha	Nebraska	1	2014	139000
7564	82	Omaha	Nebraska	2	2014	145000
7565	82	Omaha	Nebraska	3	2014	146000
7566	82	Omaha	Nebraska	4	2014	147000
7567	82	Omaha	Nebraska	5	2014	155000
7568	82	Omaha	Nebraska	6	2014	162000
7569	82	Omaha	Nebraska	7	2014	160000
7570	82	Omaha	Nebraska	8	2014	165000
7571	82	Omaha	Nebraska	9	2014	157000
7572	82	Omaha	Nebraska	10	2014	155000
7573	82	Omaha	Nebraska	11	2014	157000
7574	82	Omaha	Nebraska	12	2014	152000
7575	82	Omaha	Nebraska	1	2015	148000
7576	82	Omaha	Nebraska	2	2015	150000
7577	82	Omaha	Nebraska	3	2015	158000
7578	82	Omaha	Nebraska	4	2015	159000
7579	82	Omaha	Nebraska	5	2015	169000
7580	82	Omaha	Nebraska	6	2015	179000
7581	82	Omaha	Nebraska	7	2015	173000
7582	82	Omaha	Nebraska	8	2015	168500
7583	82	Omaha	Nebraska	9	2015	162000
7584	82	Omaha	Nebraska	10	2015	162000
7585	82	Omaha	Nebraska	11	2015	165000
7586	82	Omaha	Nebraska	12	2015	166500
7587	82	Omaha	Nebraska	1	2016	161000
7588	82	Omaha	Nebraska	2	2016	162000
7589	82	Omaha	Nebraska	3	2016	165000
7590	82	Omaha	Nebraska	4	2016	162000
7591	82	Omaha	Nebraska	5	2016	172000
7592	82	Omaha	Nebraska	6	2016	185000
7593	82	Omaha	Nebraska	7	2016	185000
7594	82	Omaha	Nebraska	8	2016	180000
7595	82	Omaha	Nebraska	9	2016	172000
7596	82	Omaha	Nebraska	10	2016	170000
7597	82	Omaha	Nebraska	11	2016	179000
7598	82	Omaha	Nebraska	12	2016	172000
7599	82	Omaha	Nebraska	1	2017	170000
7600	82	Omaha	Nebraska	2	2017	159000
7601	82	Omaha	Nebraska	3	2017	169000
7602	82	Omaha	Nebraska	4	2017	178000
7603	82	Omaha	Nebraska	5	2017	187000
7604	82	Omaha	Nebraska	6	2017	189000
7605	82	Omaha	Nebraska	7	2017	183000
7606	82	Omaha	Nebraska	8	2017	185000
7607	82	Omaha	Nebraska	9	2017	182000
7608	82	Omaha	Nebraska	10	2017	175000
7609	82	Omaha	Nebraska	11	2017	180000
7610	82	Omaha	Nebraska	12	2017	177000
7611	82	Omaha	Nebraska	1	2018	181500
7612	82	Omaha	Nebraska	2	2018	180000
7613	82	Omaha	Nebraska	3	2018	183000
7614	82	Omaha	Nebraska	4	2018	189000
7615	82	Omaha	Nebraska	5	2018	203000
7616	82	Omaha	Nebraska	6	2018	205000
7617	82	Omaha	Nebraska	7	2018	207000
7618	82	Omaha	Nebraska	8	2018	199576
7619	82	Omaha	Nebraska	9	2018	189000
7620	82	Omaha	Nebraska	10	2018	193000
7621	82	Omaha	Nebraska	11	2018	195000
7622	82	Omaha	Nebraska	12	2018	188500
7623	82	Omaha	Nebraska	1	2019	0
7624	158	Jefferson City	Missouri	1	2009	0
7625	158	Jefferson City	Missouri	2	2009	141400
7626	158	Jefferson City	Missouri	3	2009	140600
7627	158	Jefferson City	Missouri	4	2009	140400
7628	158	Jefferson City	Missouri	5	2009	141000
7629	158	Jefferson City	Missouri	6	2009	141400
7630	158	Jefferson City	Missouri	7	2009	141300
7631	158	Jefferson City	Missouri	8	2009	141200
7632	158	Jefferson City	Missouri	9	2009	141200
7633	158	Jefferson City	Missouri	10	2009	141200
7634	158	Jefferson City	Missouri	11	2009	141100
7635	158	Jefferson City	Missouri	12	2009	141100
7636	158	Jefferson City	Missouri	1	2010	141400
7637	158	Jefferson City	Missouri	2	2010	140900
7638	158	Jefferson City	Missouri	3	2010	139800
7639	158	Jefferson City	Missouri	4	2010	138200
7640	158	Jefferson City	Missouri	5	2010	135900
7641	158	Jefferson City	Missouri	6	2010	133500
7642	158	Jefferson City	Missouri	7	2010	132100
7643	158	Jefferson City	Missouri	8	2010	131300
7644	158	Jefferson City	Missouri	9	2010	130800
7645	158	Jefferson City	Missouri	10	2010	130700
7646	158	Jefferson City	Missouri	11	2010	130200
7647	158	Jefferson City	Missouri	12	2010	129200
7648	158	Jefferson City	Missouri	1	2011	128100
7649	158	Jefferson City	Missouri	2	2011	126900
7650	158	Jefferson City	Missouri	3	2011	125500
7651	158	Jefferson City	Missouri	4	2011	124800
7652	158	Jefferson City	Missouri	5	2011	125100
7653	158	Jefferson City	Missouri	6	2011	125300
7654	158	Jefferson City	Missouri	7	2011	125700
7655	158	Jefferson City	Missouri	8	2011	126400
7656	158	Jefferson City	Missouri	9	2011	126900
7657	158	Jefferson City	Missouri	10	2011	127000
7658	158	Jefferson City	Missouri	11	2011	127000
7659	158	Jefferson City	Missouri	12	2011	127100
7660	158	Jefferson City	Missouri	1	2012	126400
7661	158	Jefferson City	Missouri	2	2012	129300
7662	158	Jefferson City	Missouri	3	2012	135200
7663	158	Jefferson City	Missouri	4	2012	137000
7664	158	Jefferson City	Missouri	5	2012	133600
7665	158	Jefferson City	Missouri	6	2012	131600
7666	158	Jefferson City	Missouri	7	2012	131100
7667	158	Jefferson City	Missouri	8	2012	130900
7668	158	Jefferson City	Missouri	9	2012	130200
7669	158	Jefferson City	Missouri	10	2012	129300
7670	158	Jefferson City	Missouri	11	2012	128700
7671	158	Jefferson City	Missouri	12	2012	128400
7672	158	Jefferson City	Missouri	1	2013	128500
7673	158	Jefferson City	Missouri	2	2013	128200
7674	158	Jefferson City	Missouri	3	2013	127700
7675	158	Jefferson City	Missouri	4	2013	128000
7676	158	Jefferson City	Missouri	5	2013	129100
7677	158	Jefferson City	Missouri	6	2013	130100
7678	158	Jefferson City	Missouri	7	2013	130100
7679	158	Jefferson City	Missouri	8	2013	129600
7680	158	Jefferson City	Missouri	9	2013	129000
7681	158	Jefferson City	Missouri	10	2013	128900
7682	158	Jefferson City	Missouri	11	2013	129000
7683	158	Jefferson City	Missouri	12	2013	128800
7684	158	Jefferson City	Missouri	1	2014	128700
7685	158	Jefferson City	Missouri	2	2014	128600
7686	158	Jefferson City	Missouri	3	2014	128400
7687	158	Jefferson City	Missouri	4	2014	128700
7688	158	Jefferson City	Missouri	5	2014	129800
7689	158	Jefferson City	Missouri	6	2014	130900
7690	158	Jefferson City	Missouri	7	2014	131600
7691	158	Jefferson City	Missouri	8	2014	131900
7692	158	Jefferson City	Missouri	9	2014	132000
7693	158	Jefferson City	Missouri	10	2014	132200
7694	158	Jefferson City	Missouri	11	2014	132600
7695	158	Jefferson City	Missouri	12	2014	133200
7696	158	Jefferson City	Missouri	1	2015	133900
7697	158	Jefferson City	Missouri	2	2015	133700
7698	158	Jefferson City	Missouri	3	2015	133200
7699	158	Jefferson City	Missouri	4	2015	133400
7700	158	Jefferson City	Missouri	5	2015	134300
7701	158	Jefferson City	Missouri	6	2015	134900
7702	158	Jefferson City	Missouri	7	2015	135200
7703	158	Jefferson City	Missouri	8	2015	135700
7704	158	Jefferson City	Missouri	9	2015	136600
7705	158	Jefferson City	Missouri	10	2015	137500
7706	158	Jefferson City	Missouri	11	2015	138200
7707	158	Jefferson City	Missouri	12	2015	138700
7708	158	Jefferson City	Missouri	1	2016	139400
7709	158	Jefferson City	Missouri	2	2016	139700
7710	158	Jefferson City	Missouri	3	2016	139700
7711	158	Jefferson City	Missouri	4	2016	140000
7712	158	Jefferson City	Missouri	5	2016	141000
7713	158	Jefferson City	Missouri	6	2016	141700
7714	158	Jefferson City	Missouri	7	2016	142300
7715	158	Jefferson City	Missouri	8	2016	142600
7716	158	Jefferson City	Missouri	9	2016	143100
7717	158	Jefferson City	Missouri	10	2016	143500
7718	158	Jefferson City	Missouri	11	2016	143700
7719	158	Jefferson City	Missouri	12	2016	144100
7720	158	Jefferson City	Missouri	1	2017	144800
7721	158	Jefferson City	Missouri	2	2017	145400
7722	158	Jefferson City	Missouri	3	2017	145700
7723	158	Jefferson City	Missouri	4	2017	146200
7724	158	Jefferson City	Missouri	5	2017	146900
7725	158	Jefferson City	Missouri	6	2017	147400
7726	158	Jefferson City	Missouri	7	2017	147600
7727	158	Jefferson City	Missouri	8	2017	147800
7728	158	Jefferson City	Missouri	9	2017	147700
7729	158	Jefferson City	Missouri	10	2017	148000
7730	158	Jefferson City	Missouri	11	2017	148900
7731	158	Jefferson City	Missouri	12	2017	150300
7732	158	Jefferson City	Missouri	1	2018	151100
7733	158	Jefferson City	Missouri	2	2018	150400
7734	158	Jefferson City	Missouri	3	2018	148700
7735	158	Jefferson City	Missouri	4	2018	148800
7736	158	Jefferson City	Missouri	5	2018	150900
7737	158	Jefferson City	Missouri	6	2018	152900
7738	158	Jefferson City	Missouri	7	2018	154100
7739	158	Jefferson City	Missouri	8	2018	155100
7740	158	Jefferson City	Missouri	9	2018	155800
7741	158	Jefferson City	Missouri	10	2018	156400
7742	158	Jefferson City	Missouri	11	2018	156900
7743	158	Jefferson City	Missouri	12	2018	157200
7744	158	Jefferson City	Missouri	1	2019	157300
7745	59	Louisville	Kentucky	1	2009	117000
7746	59	Louisville	Kentucky	2	2009	124000
7747	59	Louisville	Kentucky	3	2009	128000
7748	59	Louisville	Kentucky	4	2009	131825
7749	59	Louisville	Kentucky	5	2009	138700
7750	59	Louisville	Kentucky	6	2009	139950
7751	59	Louisville	Kentucky	7	2009	144900
7752	59	Louisville	Kentucky	8	2009	140000
7753	59	Louisville	Kentucky	9	2009	137000
7754	59	Louisville	Kentucky	10	2009	135500
7755	59	Louisville	Kentucky	11	2009	134000
7756	59	Louisville	Kentucky	12	2009	130000
7757	59	Louisville	Kentucky	1	2010	131500
7758	59	Louisville	Kentucky	2	2010	129900
7759	59	Louisville	Kentucky	3	2010	134000
7760	59	Louisville	Kentucky	4	2010	135000
7761	59	Louisville	Kentucky	5	2010	142500
7762	59	Louisville	Kentucky	6	2010	141475
7763	59	Louisville	Kentucky	7	2010	145000
7764	59	Louisville	Kentucky	8	2010	150000
7765	59	Louisville	Kentucky	9	2010	138600
7766	59	Louisville	Kentucky	10	2010	136551
7767	59	Louisville	Kentucky	11	2010	143000
7768	59	Louisville	Kentucky	12	2010	145000
7769	59	Louisville	Kentucky	1	2011	130250
7770	59	Louisville	Kentucky	2	2011	130000
7771	59	Louisville	Kentucky	3	2011	130000
7772	59	Louisville	Kentucky	4	2011	130000
7773	59	Louisville	Kentucky	5	2011	134950
7774	59	Louisville	Kentucky	6	2011	144782
7775	59	Louisville	Kentucky	7	2011	147500
7776	59	Louisville	Kentucky	8	2011	140000
7777	59	Louisville	Kentucky	9	2011	136000
7778	59	Louisville	Kentucky	10	2011	135000
7779	59	Louisville	Kentucky	11	2011	134950
7780	59	Louisville	Kentucky	12	2011	132000
7781	59	Louisville	Kentucky	1	2012	125000
7782	59	Louisville	Kentucky	2	2012	129900
7783	59	Louisville	Kentucky	3	2012	142000
7784	59	Louisville	Kentucky	4	2012	144000
7785	59	Louisville	Kentucky	5	2012	144750
7786	59	Louisville	Kentucky	6	2012	150000
7787	59	Louisville	Kentucky	7	2012	146000
7788	59	Louisville	Kentucky	8	2012	143950
7789	59	Louisville	Kentucky	9	2012	145000
7790	59	Louisville	Kentucky	10	2012	145000
7791	59	Louisville	Kentucky	11	2012	144900
7792	59	Louisville	Kentucky	12	2012	143000
7793	59	Louisville	Kentucky	1	2013	135000
7794	59	Louisville	Kentucky	2	2013	132900
7795	59	Louisville	Kentucky	3	2013	142250
7796	59	Louisville	Kentucky	4	2013	137320
7797	59	Louisville	Kentucky	5	2013	153000
7798	59	Louisville	Kentucky	6	2013	162265
7799	59	Louisville	Kentucky	7	2013	155000
7800	59	Louisville	Kentucky	8	2013	150000
7801	59	Louisville	Kentucky	9	2013	148000
7802	59	Louisville	Kentucky	10	2013	142500
7803	59	Louisville	Kentucky	11	2013	148250
7804	59	Louisville	Kentucky	12	2013	139298
7805	59	Louisville	Kentucky	1	2014	130000
7806	59	Louisville	Kentucky	2	2014	135000
7807	59	Louisville	Kentucky	3	2014	139500
7808	59	Louisville	Kentucky	4	2014	144000
7809	59	Louisville	Kentucky	5	2014	150000
7810	59	Louisville	Kentucky	6	2014	160000
7811	59	Louisville	Kentucky	7	2014	162500
7812	59	Louisville	Kentucky	8	2014	164250
7813	59	Louisville	Kentucky	9	2014	151000
7814	59	Louisville	Kentucky	10	2014	153750
7815	59	Louisville	Kentucky	11	2014	148000
7816	59	Louisville	Kentucky	12	2014	153000
7817	59	Louisville	Kentucky	1	2015	137500
7818	59	Louisville	Kentucky	2	2015	143000
7819	59	Louisville	Kentucky	3	2015	152000
7820	59	Louisville	Kentucky	4	2015	152500
7821	59	Louisville	Kentucky	5	2015	164900
7822	59	Louisville	Kentucky	6	2015	175000
7823	59	Louisville	Kentucky	7	2015	165550
7824	59	Louisville	Kentucky	8	2015	164000
7825	59	Louisville	Kentucky	9	2015	157800
7826	59	Louisville	Kentucky	10	2015	159945
7827	59	Louisville	Kentucky	11	2015	152900
7828	59	Louisville	Kentucky	12	2015	164000
7829	59	Louisville	Kentucky	1	2016	159000
7830	59	Louisville	Kentucky	2	2016	145000
7831	59	Louisville	Kentucky	3	2016	154000
7832	59	Louisville	Kentucky	4	2016	160000
7833	59	Louisville	Kentucky	5	2016	169500
7834	59	Louisville	Kentucky	6	2016	175000
7835	59	Louisville	Kentucky	7	2016	182000
7836	59	Louisville	Kentucky	8	2016	175000
7837	59	Louisville	Kentucky	9	2016	173000
7838	59	Louisville	Kentucky	10	2016	170000
7839	59	Louisville	Kentucky	11	2016	169900
7840	59	Louisville	Kentucky	12	2016	169900
7841	59	Louisville	Kentucky	1	2017	168000
7842	59	Louisville	Kentucky	2	2017	159950
7843	59	Louisville	Kentucky	3	2017	164000
7844	59	Louisville	Kentucky	4	2017	173000
7845	59	Louisville	Kentucky	5	2017	184750
7846	59	Louisville	Kentucky	6	2017	188250
7847	59	Louisville	Kentucky	7	2017	186000
7848	59	Louisville	Kentucky	8	2017	178500
7849	59	Louisville	Kentucky	9	2017	175700
7850	59	Louisville	Kentucky	10	2017	175300
7851	59	Louisville	Kentucky	11	2017	180000
7852	59	Louisville	Kentucky	12	2017	179448
7853	59	Louisville	Kentucky	1	2018	176525
7854	59	Louisville	Kentucky	2	2018	170000
7855	59	Louisville	Kentucky	3	2018	173765
7856	59	Louisville	Kentucky	4	2018	181500
7857	59	Louisville	Kentucky	5	2018	190500
7858	59	Louisville	Kentucky	6	2018	199000
7859	59	Louisville	Kentucky	7	2018	207700
7860	59	Louisville	Kentucky	8	2018	195000
7861	59	Louisville	Kentucky	9	2018	180250
7862	59	Louisville	Kentucky	10	2018	183250
7863	59	Louisville	Kentucky	11	2018	185000
7864	59	Louisville	Kentucky	12	2018	184950
7865	59	Louisville	Kentucky	1	2019	0
7866	117	Fort Worth	Texas	1	2009	124900
7867	117	Fort Worth	Texas	2	2009	133450
7868	117	Fort Worth	Texas	3	2009	127900
7869	117	Fort Worth	Texas	4	2009	132500
7870	117	Fort Worth	Texas	5	2009	134900
7871	117	Fort Worth	Texas	6	2009	140000
7872	117	Fort Worth	Texas	7	2009	139000
7873	117	Fort Worth	Texas	8	2009	139900
7874	117	Fort Worth	Texas	9	2009	130000
7875	117	Fort Worth	Texas	10	2009	130000
7876	117	Fort Worth	Texas	11	2009	129900
7877	117	Fort Worth	Texas	12	2009	132500
7878	117	Fort Worth	Texas	1	2010	125000
7879	117	Fort Worth	Texas	2	2010	130900
7880	117	Fort Worth	Texas	3	2010	133640
7881	117	Fort Worth	Texas	4	2010	134900
7882	117	Fort Worth	Texas	5	2010	139000
7883	117	Fort Worth	Texas	6	2010	139500
7884	117	Fort Worth	Texas	7	2010	141000
7885	117	Fort Worth	Texas	8	2010	143990
7886	117	Fort Worth	Texas	9	2010	135000
7887	117	Fort Worth	Texas	10	2010	135000
7888	117	Fort Worth	Texas	11	2010	134900
7889	117	Fort Worth	Texas	12	2010	140000
7890	117	Fort Worth	Texas	1	2011	129900
7891	117	Fort Worth	Texas	2	2011	129900
7892	117	Fort Worth	Texas	3	2011	129900
7893	117	Fort Worth	Texas	4	2011	129900
7894	117	Fort Worth	Texas	5	2011	135450
7895	117	Fort Worth	Texas	6	2011	138500
7896	117	Fort Worth	Texas	7	2011	136750
7897	117	Fort Worth	Texas	8	2011	142908
7898	117	Fort Worth	Texas	9	2011	137500
7899	117	Fort Worth	Texas	10	2011	135000
7900	117	Fort Worth	Texas	11	2011	135000
7901	117	Fort Worth	Texas	12	2011	136900
7902	117	Fort Worth	Texas	1	2012	129900
7903	117	Fort Worth	Texas	2	2012	132900
7904	117	Fort Worth	Texas	3	2012	139900
7905	117	Fort Worth	Texas	4	2012	142500
7906	117	Fort Worth	Texas	5	2012	145000
7907	117	Fort Worth	Texas	6	2012	150000
7908	117	Fort Worth	Texas	7	2012	149900
7909	117	Fort Worth	Texas	8	2012	147225
7910	117	Fort Worth	Texas	9	2012	145000
7911	117	Fort Worth	Texas	10	2012	139900
7912	117	Fort Worth	Texas	11	2012	139900
7913	117	Fort Worth	Texas	12	2012	145000
7914	117	Fort Worth	Texas	1	2013	135000
7915	117	Fort Worth	Texas	2	2013	145745
7916	117	Fort Worth	Texas	3	2013	150000
7917	117	Fort Worth	Texas	4	2013	153000
7918	117	Fort Worth	Texas	5	2013	159000
7919	117	Fort Worth	Texas	6	2013	159900
7920	117	Fort Worth	Texas	7	2013	164950
7921	117	Fort Worth	Texas	8	2013	159900
7922	117	Fort Worth	Texas	9	2013	155000
7923	117	Fort Worth	Texas	10	2013	154900
7924	117	Fort Worth	Texas	11	2013	154900
7925	117	Fort Worth	Texas	12	2013	159000
7926	117	Fort Worth	Texas	1	2014	146000
7927	117	Fort Worth	Texas	2	2014	152500
7928	117	Fort Worth	Texas	3	2014	158200
7929	117	Fort Worth	Texas	4	2014	160208
7930	117	Fort Worth	Texas	5	2014	165000
7931	117	Fort Worth	Texas	6	2014	170000
7932	117	Fort Worth	Texas	7	2014	172700
7933	117	Fort Worth	Texas	8	2014	174500
7934	117	Fort Worth	Texas	9	2014	164900
7935	117	Fort Worth	Texas	10	2014	165000
7936	117	Fort Worth	Texas	11	2014	165900
7937	117	Fort Worth	Texas	12	2014	170000
7938	117	Fort Worth	Texas	1	2015	165000
7939	117	Fort Worth	Texas	2	2015	169900
7940	117	Fort Worth	Texas	3	2015	170000
7941	117	Fort Worth	Texas	4	2015	175000
7942	117	Fort Worth	Texas	5	2015	182900
7943	117	Fort Worth	Texas	6	2015	189900
7944	117	Fort Worth	Texas	7	2015	188000
7945	117	Fort Worth	Texas	8	2015	185000
7946	117	Fort Worth	Texas	9	2015	179500
7947	117	Fort Worth	Texas	10	2015	175000
7948	117	Fort Worth	Texas	11	2015	175000
7949	117	Fort Worth	Texas	12	2015	184900
7950	117	Fort Worth	Texas	1	2016	177450
7951	117	Fort Worth	Texas	2	2016	185000
7952	117	Fort Worth	Texas	3	2016	189000
7953	117	Fort Worth	Texas	4	2016	189999
7954	117	Fort Worth	Texas	5	2016	199900
7955	117	Fort Worth	Texas	6	2016	199900
7956	117	Fort Worth	Texas	7	2016	200000
7957	117	Fort Worth	Texas	8	2016	200000
7958	117	Fort Worth	Texas	9	2016	199500
7959	117	Fort Worth	Texas	10	2016	199900
7960	117	Fort Worth	Texas	11	2016	199900
7961	117	Fort Worth	Texas	12	2016	210000
7962	117	Fort Worth	Texas	1	2017	200000
7963	117	Fort Worth	Texas	2	2017	214700
7964	117	Fort Worth	Texas	3	2017	215000
7965	117	Fort Worth	Texas	4	2017	222000
7966	117	Fort Worth	Texas	5	2017	225000
7967	117	Fort Worth	Texas	6	2017	225000
7968	117	Fort Worth	Texas	7	2017	225995
7969	117	Fort Worth	Texas	8	2017	225900
7970	117	Fort Worth	Texas	9	2017	219900
7971	117	Fort Worth	Texas	10	2017	219900
7972	117	Fort Worth	Texas	11	2017	220693
7973	117	Fort Worth	Texas	12	2017	229900
7974	117	Fort Worth	Texas	1	2018	219000
7975	117	Fort Worth	Texas	2	2018	225000
7976	117	Fort Worth	Texas	3	2018	232512
7977	117	Fort Worth	Texas	4	2018	235280
7978	117	Fort Worth	Texas	5	2018	244900
7979	117	Fort Worth	Texas	6	2018	249000
7980	117	Fort Worth	Texas	7	2018	244500
7981	117	Fort Worth	Texas	8	2018	240000
7982	117	Fort Worth	Texas	9	2018	235000
7983	117	Fort Worth	Texas	10	2018	234900
7984	117	Fort Worth	Texas	11	2018	229900
7985	117	Fort Worth	Texas	12	2018	237500
7986	117	Fort Worth	Texas	1	2019	0
7987	139	Sioux Falls	South Dakota	1	2009	0
7988	139	Sioux Falls	South Dakota	2	2009	139900
7989	139	Sioux Falls	South Dakota	3	2009	139800
7990	139	Sioux Falls	South Dakota	4	2009	139900
7991	139	Sioux Falls	South Dakota	5	2009	139900
7992	139	Sioux Falls	South Dakota	6	2009	139700
7993	139	Sioux Falls	South Dakota	7	2009	139300
7994	139	Sioux Falls	South Dakota	8	2009	138800
7995	139	Sioux Falls	South Dakota	9	2009	138300
7996	139	Sioux Falls	South Dakota	10	2009	137800
7997	139	Sioux Falls	South Dakota	11	2009	137300
7998	139	Sioux Falls	South Dakota	12	2009	136600
7999	139	Sioux Falls	South Dakota	1	2010	136100
8000	139	Sioux Falls	South Dakota	2	2010	136300
8001	139	Sioux Falls	South Dakota	3	2010	135900
8002	139	Sioux Falls	South Dakota	4	2010	135000
8003	139	Sioux Falls	South Dakota	5	2010	134800
8004	139	Sioux Falls	South Dakota	6	2010	135100
8005	139	Sioux Falls	South Dakota	7	2010	134900
8006	139	Sioux Falls	South Dakota	8	2010	134600
8007	139	Sioux Falls	South Dakota	9	2010	134300
8008	139	Sioux Falls	South Dakota	10	2010	133800
8009	139	Sioux Falls	South Dakota	11	2010	133400
8010	139	Sioux Falls	South Dakota	12	2010	133100
8011	139	Sioux Falls	South Dakota	1	2011	132800
8012	139	Sioux Falls	South Dakota	2	2011	132200
8013	139	Sioux Falls	South Dakota	3	2011	131800
8014	139	Sioux Falls	South Dakota	4	2011	131700
8015	139	Sioux Falls	South Dakota	5	2011	131900
8016	139	Sioux Falls	South Dakota	6	2011	132500
8017	139	Sioux Falls	South Dakota	7	2011	133100
8018	139	Sioux Falls	South Dakota	8	2011	133400
8019	139	Sioux Falls	South Dakota	9	2011	133800
8020	139	Sioux Falls	South Dakota	10	2011	134100
8021	139	Sioux Falls	South Dakota	11	2011	134400
8022	139	Sioux Falls	South Dakota	12	2011	134600
8023	139	Sioux Falls	South Dakota	1	2012	135000
8024	139	Sioux Falls	South Dakota	2	2012	135400
8025	139	Sioux Falls	South Dakota	3	2012	136100
8026	139	Sioux Falls	South Dakota	4	2012	136200
8027	139	Sioux Falls	South Dakota	5	2012	135200
8028	139	Sioux Falls	South Dakota	6	2012	134400
8029	139	Sioux Falls	South Dakota	7	2012	134500
8030	139	Sioux Falls	South Dakota	8	2012	135300
8031	139	Sioux Falls	South Dakota	9	2012	136200
8032	139	Sioux Falls	South Dakota	10	2012	136900
8033	139	Sioux Falls	South Dakota	11	2012	137300
8034	139	Sioux Falls	South Dakota	12	2012	137700
8035	139	Sioux Falls	South Dakota	1	2013	138300
8036	139	Sioux Falls	South Dakota	2	2013	138700
8037	139	Sioux Falls	South Dakota	3	2013	139100
8038	139	Sioux Falls	South Dakota	4	2013	139800
8039	139	Sioux Falls	South Dakota	5	2013	140800
8040	139	Sioux Falls	South Dakota	6	2013	141700
8041	139	Sioux Falls	South Dakota	7	2013	142500
8042	139	Sioux Falls	South Dakota	8	2013	142800
8043	139	Sioux Falls	South Dakota	9	2013	142600
8044	139	Sioux Falls	South Dakota	10	2013	142300
8045	139	Sioux Falls	South Dakota	11	2013	142400
8046	139	Sioux Falls	South Dakota	12	2013	142600
8047	139	Sioux Falls	South Dakota	1	2014	142600
8048	139	Sioux Falls	South Dakota	2	2014	142700
8049	139	Sioux Falls	South Dakota	3	2014	142900
8050	139	Sioux Falls	South Dakota	4	2014	143400
8051	139	Sioux Falls	South Dakota	5	2014	144000
8052	139	Sioux Falls	South Dakota	6	2014	144300
8053	139	Sioux Falls	South Dakota	7	2014	144400
8054	139	Sioux Falls	South Dakota	8	2014	144800
8055	139	Sioux Falls	South Dakota	9	2014	145300
8056	139	Sioux Falls	South Dakota	10	2014	146000
8057	139	Sioux Falls	South Dakota	11	2014	147100
8058	139	Sioux Falls	South Dakota	12	2014	148000
8059	139	Sioux Falls	South Dakota	1	2015	148800
8060	139	Sioux Falls	South Dakota	2	2015	149800
8061	139	Sioux Falls	South Dakota	3	2015	150900
8062	139	Sioux Falls	South Dakota	4	2015	152100
8063	139	Sioux Falls	South Dakota	5	2015	153000
8064	139	Sioux Falls	South Dakota	6	2015	153600
8065	139	Sioux Falls	South Dakota	7	2015	154000
8066	139	Sioux Falls	South Dakota	8	2015	154300
8067	139	Sioux Falls	South Dakota	9	2015	154800
8068	139	Sioux Falls	South Dakota	10	2015	155200
8069	139	Sioux Falls	South Dakota	11	2015	156100
8070	139	Sioux Falls	South Dakota	12	2015	157500
8071	139	Sioux Falls	South Dakota	1	2016	158500
8072	139	Sioux Falls	South Dakota	2	2016	158700
8073	139	Sioux Falls	South Dakota	3	2016	158700
8074	139	Sioux Falls	South Dakota	4	2016	159100
8075	139	Sioux Falls	South Dakota	5	2016	160100
8076	139	Sioux Falls	South Dakota	6	2016	161200
8077	139	Sioux Falls	South Dakota	7	2016	161600
8078	139	Sioux Falls	South Dakota	8	2016	162300
8079	139	Sioux Falls	South Dakota	9	2016	163500
8080	139	Sioux Falls	South Dakota	10	2016	164700
8081	139	Sioux Falls	South Dakota	11	2016	165400
8082	139	Sioux Falls	South Dakota	12	2016	166000
8083	139	Sioux Falls	South Dakota	1	2017	166700
8084	139	Sioux Falls	South Dakota	2	2017	167300
8085	139	Sioux Falls	South Dakota	3	2017	167900
8086	139	Sioux Falls	South Dakota	4	2017	168800
8087	139	Sioux Falls	South Dakota	5	2017	169700
8088	139	Sioux Falls	South Dakota	6	2017	171000
8089	139	Sioux Falls	South Dakota	7	2017	172300
8090	139	Sioux Falls	South Dakota	8	2017	173100
8091	139	Sioux Falls	South Dakota	9	2017	174000
8092	139	Sioux Falls	South Dakota	10	2017	175400
8093	139	Sioux Falls	South Dakota	11	2017	176100
8094	139	Sioux Falls	South Dakota	12	2017	176400
8095	139	Sioux Falls	South Dakota	1	2018	177100
8096	139	Sioux Falls	South Dakota	2	2018	178700
8097	139	Sioux Falls	South Dakota	3	2018	180700
8098	139	Sioux Falls	South Dakota	4	2018	181900
8099	139	Sioux Falls	South Dakota	5	2018	182400
8100	139	Sioux Falls	South Dakota	6	2018	182800
8101	139	Sioux Falls	South Dakota	7	2018	183700
8102	139	Sioux Falls	South Dakota	8	2018	184500
8103	139	Sioux Falls	South Dakota	9	2018	185300
8104	139	Sioux Falls	South Dakota	10	2018	186000
8105	139	Sioux Falls	South Dakota	11	2018	187000
8106	139	Sioux Falls	South Dakota	12	2018	188100
8107	139	Sioux Falls	South Dakota	1	2019	189100
8108	39	Atlanta	Georgia	1	2009	117900
8109	39	Atlanta	Georgia	2	2009	120000
8110	39	Atlanta	Georgia	3	2009	117000
8111	39	Atlanta	Georgia	4	2009	116500
8112	39	Atlanta	Georgia	5	2009	124500
8113	39	Atlanta	Georgia	6	2009	130150
8114	39	Atlanta	Georgia	7	2009	139000
8115	39	Atlanta	Georgia	8	2009	135000
8116	39	Atlanta	Georgia	9	2009	130000
8117	39	Atlanta	Georgia	10	2009	135000
8118	39	Atlanta	Georgia	11	2009	130000
8119	39	Atlanta	Georgia	12	2009	127000
8120	39	Atlanta	Georgia	1	2010	117000
8121	39	Atlanta	Georgia	2	2010	116000
8122	39	Atlanta	Georgia	3	2010	122900
8123	39	Atlanta	Georgia	4	2010	127000
8124	39	Atlanta	Georgia	5	2010	130000
8125	39	Atlanta	Georgia	6	2010	126000
8126	39	Atlanta	Georgia	7	2010	125000
8127	39	Atlanta	Georgia	8	2010	114000
8128	39	Atlanta	Georgia	9	2010	110000
8129	39	Atlanta	Georgia	10	2010	112000
8130	39	Atlanta	Georgia	11	2010	109000
8131	39	Atlanta	Georgia	12	2010	115000
8132	39	Atlanta	Georgia	1	2011	107000
8133	39	Atlanta	Georgia	2	2011	97000
8134	39	Atlanta	Georgia	3	2011	99900
8135	39	Atlanta	Georgia	4	2011	104000
8136	39	Atlanta	Georgia	5	2011	100000
8137	39	Atlanta	Georgia	6	2011	106250
8138	39	Atlanta	Georgia	7	2011	107000
8139	39	Atlanta	Georgia	8	2011	106500
8140	39	Atlanta	Georgia	9	2011	95000
8141	39	Atlanta	Georgia	10	2011	95000
8142	39	Atlanta	Georgia	11	2011	95000
8143	39	Atlanta	Georgia	12	2011	97500
8144	39	Atlanta	Georgia	1	2012	90000
8145	39	Atlanta	Georgia	2	2012	81800
8146	39	Atlanta	Georgia	3	2012	95000
8147	39	Atlanta	Georgia	4	2012	100000
8148	39	Atlanta	Georgia	5	2012	112000
8149	39	Atlanta	Georgia	6	2012	112650
8150	39	Atlanta	Georgia	7	2012	119900
8151	39	Atlanta	Georgia	8	2012	117900
8152	39	Atlanta	Georgia	9	2012	115000
8153	39	Atlanta	Georgia	10	2012	115000
8154	39	Atlanta	Georgia	11	2012	120000
8155	39	Atlanta	Georgia	12	2012	130000
8156	39	Atlanta	Georgia	1	2013	116000
8157	39	Atlanta	Georgia	2	2013	125000
8158	39	Atlanta	Georgia	3	2013	136000
8159	39	Atlanta	Georgia	4	2013	149750
8160	39	Atlanta	Georgia	5	2013	155101
8161	39	Atlanta	Georgia	6	2013	169275
8162	39	Atlanta	Georgia	7	2013	170000
8163	39	Atlanta	Georgia	8	2013	173000
8164	39	Atlanta	Georgia	9	2013	164900
8165	39	Atlanta	Georgia	10	2013	159500
8166	39	Atlanta	Georgia	11	2013	155000
8167	39	Atlanta	Georgia	12	2013	161000
8168	39	Atlanta	Georgia	1	2014	152000
8169	39	Atlanta	Georgia	2	2014	152000
8170	39	Atlanta	Georgia	3	2014	165000
8171	39	Atlanta	Georgia	4	2014	170508
8172	39	Atlanta	Georgia	5	2014	178500
8173	39	Atlanta	Georgia	6	2014	193000
8174	39	Atlanta	Georgia	7	2014	189900
8175	39	Atlanta	Georgia	8	2014	184000
8176	39	Atlanta	Georgia	9	2014	175000
8177	39	Atlanta	Georgia	10	2014	176458
8178	39	Atlanta	Georgia	11	2014	175950
8179	39	Atlanta	Georgia	12	2014	178100
8180	39	Atlanta	Georgia	1	2015	171870
8181	39	Atlanta	Georgia	2	2015	173000
8182	39	Atlanta	Georgia	3	2015	183200
8183	39	Atlanta	Georgia	4	2015	189000
8184	39	Atlanta	Georgia	5	2015	200000
8185	39	Atlanta	Georgia	6	2015	203000
8186	39	Atlanta	Georgia	7	2015	200000
8187	39	Atlanta	Georgia	8	2015	195000
8188	39	Atlanta	Georgia	9	2015	192000
8189	39	Atlanta	Georgia	10	2015	188875
8190	39	Atlanta	Georgia	11	2015	187000
8191	39	Atlanta	Georgia	12	2015	195000
8192	39	Atlanta	Georgia	1	2016	184000
8193	39	Atlanta	Georgia	2	2016	189000
8194	39	Atlanta	Georgia	3	2016	195000
8195	39	Atlanta	Georgia	4	2016	204600
8196	39	Atlanta	Georgia	5	2016	212000
8197	39	Atlanta	Georgia	6	2016	214900
8198	39	Atlanta	Georgia	7	2016	215000
8199	39	Atlanta	Georgia	8	2016	210000
8200	39	Atlanta	Georgia	9	2016	203420
8201	39	Atlanta	Georgia	10	2016	201000
8202	39	Atlanta	Georgia	11	2016	200000
8203	39	Atlanta	Georgia	12	2016	208508
8204	39	Atlanta	Georgia	1	2017	199000
8205	39	Atlanta	Georgia	2	2017	201000
8206	39	Atlanta	Georgia	3	2017	215000
8207	39	Atlanta	Georgia	4	2017	220000
8208	39	Atlanta	Georgia	5	2017	222850
8209	39	Atlanta	Georgia	6	2017	227500
8210	39	Atlanta	Georgia	7	2017	225893
8211	39	Atlanta	Georgia	8	2017	220000
8212	39	Atlanta	Georgia	9	2017	217000
8213	39	Atlanta	Georgia	10	2017	217845
8214	39	Atlanta	Georgia	11	2017	213900
8215	39	Atlanta	Georgia	12	2017	221900
8216	39	Atlanta	Georgia	1	2018	219400
8217	39	Atlanta	Georgia	2	2018	216500
8218	39	Atlanta	Georgia	3	2018	230000
8219	39	Atlanta	Georgia	4	2018	237000
8220	39	Atlanta	Georgia	5	2018	244500
8221	39	Atlanta	Georgia	6	2018	247000
8222	39	Atlanta	Georgia	7	2018	242500
8223	39	Atlanta	Georgia	8	2018	235000
8224	39	Atlanta	Georgia	9	2018	235000
8225	39	Atlanta	Georgia	10	2018	229900
8226	39	Atlanta	Georgia	11	2018	231000
8227	39	Atlanta	Georgia	12	2018	233000
8228	39	Atlanta	Georgia	1	2019	0
8229	38	Tampa	Florida	1	2009	124900
8230	38	Tampa	Florida	2	2009	129700
8231	38	Tampa	Florida	3	2009	135501
8232	38	Tampa	Florida	4	2009	130000
8233	38	Tampa	Florida	5	2009	132250
8234	38	Tampa	Florida	6	2009	135000
8235	38	Tampa	Florida	7	2009	138000
8236	38	Tampa	Florida	8	2009	135000
8237	38	Tampa	Florida	9	2009	130500
8238	38	Tampa	Florida	10	2009	130000
8239	38	Tampa	Florida	11	2009	134000
8240	38	Tampa	Florida	12	2009	130000
8241	38	Tampa	Florida	1	2010	123000
8242	38	Tampa	Florida	2	2010	123000
8243	38	Tampa	Florida	3	2010	125000
8244	38	Tampa	Florida	4	2010	129000
8245	38	Tampa	Florida	5	2010	132880
8246	38	Tampa	Florida	6	2010	134842
8247	38	Tampa	Florida	7	2010	125000
8248	38	Tampa	Florida	8	2010	123800
8249	38	Tampa	Florida	9	2010	120000
8250	38	Tampa	Florida	10	2010	121000
8251	38	Tampa	Florida	11	2010	115000
8252	38	Tampa	Florida	12	2010	115000
8253	38	Tampa	Florida	1	2011	90000
8254	38	Tampa	Florida	2	2011	92000
8255	38	Tampa	Florida	3	2011	100000
8256	38	Tampa	Florida	4	2011	105000
8257	38	Tampa	Florida	5	2011	109900
8258	38	Tampa	Florida	6	2011	115000
8259	38	Tampa	Florida	7	2011	115000
8260	38	Tampa	Florida	8	2011	115000
8261	38	Tampa	Florida	9	2011	113500
8262	38	Tampa	Florida	10	2011	108000
8263	38	Tampa	Florida	11	2011	105500
8264	38	Tampa	Florida	12	2011	112000
8265	38	Tampa	Florida	1	2012	105000
8266	38	Tampa	Florida	2	2012	105995
8267	38	Tampa	Florida	3	2012	111750
8268	38	Tampa	Florida	4	2012	118250
8269	38	Tampa	Florida	5	2012	120000
8270	38	Tampa	Florida	6	2012	125000
8271	38	Tampa	Florida	7	2012	122780
8272	38	Tampa	Florida	8	2012	124900
8273	38	Tampa	Florida	9	2012	124995
8274	38	Tampa	Florida	10	2012	125000
8275	38	Tampa	Florida	11	2012	130000
8276	38	Tampa	Florida	12	2012	130000
8277	38	Tampa	Florida	1	2013	121600
8278	38	Tampa	Florida	2	2013	127000
8279	38	Tampa	Florida	3	2013	133000
8280	38	Tampa	Florida	4	2013	135000
8281	38	Tampa	Florida	5	2013	144900
8282	38	Tampa	Florida	6	2013	150000
8283	38	Tampa	Florida	7	2013	150000
8284	38	Tampa	Florida	8	2013	151000
8285	38	Tampa	Florida	9	2013	145000
8286	38	Tampa	Florida	10	2013	142000
8287	38	Tampa	Florida	11	2013	144000
8288	38	Tampa	Florida	12	2013	146500
8289	38	Tampa	Florida	1	2014	133050
8290	38	Tampa	Florida	2	2014	130000
8291	38	Tampa	Florida	3	2014	140000
8292	38	Tampa	Florida	4	2014	143900
8293	38	Tampa	Florida	5	2014	147000
8294	38	Tampa	Florida	6	2014	154000
8295	38	Tampa	Florida	7	2014	156500
8296	38	Tampa	Florida	8	2014	156000
8297	38	Tampa	Florida	9	2014	151000
8298	38	Tampa	Florida	10	2014	157000
8299	38	Tampa	Florida	11	2014	148800
8300	38	Tampa	Florida	12	2014	154190
8301	38	Tampa	Florida	1	2015	140000
8302	38	Tampa	Florida	2	2015	142351
8303	38	Tampa	Florida	3	2015	155000
8304	38	Tampa	Florida	4	2015	160000
8305	38	Tampa	Florida	5	2015	167000
8306	38	Tampa	Florida	6	2015	168990
8307	38	Tampa	Florida	7	2015	172500
8308	38	Tampa	Florida	8	2015	168000
8309	38	Tampa	Florida	9	2015	165000
8310	38	Tampa	Florida	10	2015	165000
8311	38	Tampa	Florida	11	2015	165000
8312	38	Tampa	Florida	12	2015	174000
8313	38	Tampa	Florida	1	2016	167000
8314	38	Tampa	Florida	2	2016	166454
8315	38	Tampa	Florida	3	2016	176150
8316	38	Tampa	Florida	4	2016	180000
8317	38	Tampa	Florida	5	2016	186500
8318	38	Tampa	Florida	6	2016	194600
8319	38	Tampa	Florida	7	2016	195000
8320	38	Tampa	Florida	8	2016	195000
8321	38	Tampa	Florida	9	2016	190000
8322	38	Tampa	Florida	10	2016	189900
8323	38	Tampa	Florida	11	2016	192750
8324	38	Tampa	Florida	12	2016	199000
8325	38	Tampa	Florida	1	2017	187000
8326	38	Tampa	Florida	2	2017	195000
8327	38	Tampa	Florida	3	2017	199900
8328	38	Tampa	Florida	4	2017	202000
8329	38	Tampa	Florida	5	2017	210000
8330	38	Tampa	Florida	6	2017	215000
8331	38	Tampa	Florida	7	2017	215000
8332	38	Tampa	Florida	8	2017	211250
8333	38	Tampa	Florida	9	2017	215000
8334	38	Tampa	Florida	10	2017	206000
8335	38	Tampa	Florida	11	2017	215000
8336	38	Tampa	Florida	12	2017	215000
8337	38	Tampa	Florida	1	2018	207000
8338	38	Tampa	Florida	2	2018	210000
8339	38	Tampa	Florida	3	2018	219000
8340	38	Tampa	Florida	4	2018	221000
8341	38	Tampa	Florida	5	2018	225000
8342	38	Tampa	Florida	6	2018	234000
8343	38	Tampa	Florida	7	2018	229500
8344	38	Tampa	Florida	8	2018	226200
8345	38	Tampa	Florida	9	2018	225000
8346	38	Tampa	Florida	10	2018	223795
8347	38	Tampa	Florida	11	2018	228000
8348	38	Tampa	Florida	12	2018	228000
8349	38	Tampa	Florida	1	2019	0
8350	99	Oklahoma City	Oklahoma	1	2009	127500
8351	99	Oklahoma City	Oklahoma	2	2009	126000
8352	99	Oklahoma City	Oklahoma	3	2009	127390
8353	99	Oklahoma City	Oklahoma	4	2009	126000
8354	99	Oklahoma City	Oklahoma	5	2009	132100
8355	99	Oklahoma City	Oklahoma	6	2009	136000
8356	99	Oklahoma City	Oklahoma	7	2009	135000
8357	99	Oklahoma City	Oklahoma	8	2009	133000
8358	99	Oklahoma City	Oklahoma	9	2009	129000
8359	99	Oklahoma City	Oklahoma	10	2009	128000
8360	99	Oklahoma City	Oklahoma	11	2009	126000
8361	99	Oklahoma City	Oklahoma	12	2009	128250
8362	99	Oklahoma City	Oklahoma	1	2010	127500
8363	99	Oklahoma City	Oklahoma	2	2010	129000
8364	99	Oklahoma City	Oklahoma	3	2010	132000
8365	99	Oklahoma City	Oklahoma	4	2010	129000
8366	99	Oklahoma City	Oklahoma	5	2010	132700
8367	99	Oklahoma City	Oklahoma	6	2010	140000
8368	99	Oklahoma City	Oklahoma	7	2010	138000
8369	99	Oklahoma City	Oklahoma	8	2010	140000
8370	99	Oklahoma City	Oklahoma	9	2010	136000
8371	99	Oklahoma City	Oklahoma	10	2010	138000
8372	99	Oklahoma City	Oklahoma	11	2010	138000
8373	99	Oklahoma City	Oklahoma	12	2010	133500
8374	99	Oklahoma City	Oklahoma	1	2011	127000
8375	99	Oklahoma City	Oklahoma	2	2011	130000
8376	99	Oklahoma City	Oklahoma	3	2011	127500
8377	99	Oklahoma City	Oklahoma	4	2011	135000
8378	99	Oklahoma City	Oklahoma	5	2011	140000
8379	99	Oklahoma City	Oklahoma	6	2011	140000
8380	99	Oklahoma City	Oklahoma	7	2011	144000
8381	99	Oklahoma City	Oklahoma	8	2011	140000
8382	99	Oklahoma City	Oklahoma	9	2011	135000
8383	99	Oklahoma City	Oklahoma	10	2011	131500
8384	99	Oklahoma City	Oklahoma	11	2011	135000
8385	99	Oklahoma City	Oklahoma	12	2011	132950
8386	99	Oklahoma City	Oklahoma	1	2012	130000
8387	99	Oklahoma City	Oklahoma	2	2012	134000
8388	99	Oklahoma City	Oklahoma	3	2012	135000
8389	99	Oklahoma City	Oklahoma	4	2012	135000
8390	99	Oklahoma City	Oklahoma	5	2012	147500
8391	99	Oklahoma City	Oklahoma	6	2012	140000
8392	99	Oklahoma City	Oklahoma	7	2012	141100
8393	99	Oklahoma City	Oklahoma	8	2012	145000
8394	99	Oklahoma City	Oklahoma	9	2012	145000
8395	99	Oklahoma City	Oklahoma	10	2012	145000
8396	99	Oklahoma City	Oklahoma	11	2012	146950
8397	99	Oklahoma City	Oklahoma	12	2012	144000
8398	99	Oklahoma City	Oklahoma	1	2013	140500
8399	99	Oklahoma City	Oklahoma	2	2013	138500
8400	99	Oklahoma City	Oklahoma	3	2013	143000
8401	99	Oklahoma City	Oklahoma	4	2013	143842
8402	99	Oklahoma City	Oklahoma	5	2013	149900
8403	99	Oklahoma City	Oklahoma	6	2013	154000
8404	99	Oklahoma City	Oklahoma	7	2013	155000
8405	99	Oklahoma City	Oklahoma	8	2013	157000
8406	99	Oklahoma City	Oklahoma	9	2013	147000
8407	99	Oklahoma City	Oklahoma	10	2013	146318
8408	99	Oklahoma City	Oklahoma	11	2013	146500
8409	99	Oklahoma City	Oklahoma	12	2013	146500
8410	99	Oklahoma City	Oklahoma	1	2014	142000
8411	99	Oklahoma City	Oklahoma	2	2014	145000
8412	99	Oklahoma City	Oklahoma	3	2014	150000
8413	99	Oklahoma City	Oklahoma	4	2014	148500
8414	99	Oklahoma City	Oklahoma	5	2014	155000
8415	99	Oklahoma City	Oklahoma	6	2014	161750
8416	99	Oklahoma City	Oklahoma	7	2014	160000
8417	99	Oklahoma City	Oklahoma	8	2014	154900
8418	99	Oklahoma City	Oklahoma	9	2014	155000
8419	99	Oklahoma City	Oklahoma	10	2014	156000
8420	99	Oklahoma City	Oklahoma	11	2014	154900
8421	99	Oklahoma City	Oklahoma	12	2014	155000
8422	99	Oklahoma City	Oklahoma	1	2015	148750
8423	99	Oklahoma City	Oklahoma	2	2015	153500
8424	99	Oklahoma City	Oklahoma	3	2015	154500
8425	99	Oklahoma City	Oklahoma	4	2015	154500
8426	99	Oklahoma City	Oklahoma	5	2015	163000
8427	99	Oklahoma City	Oklahoma	6	2015	166000
8428	99	Oklahoma City	Oklahoma	7	2015	165500
8429	99	Oklahoma City	Oklahoma	8	2015	164000
8430	99	Oklahoma City	Oklahoma	9	2015	160500
8431	99	Oklahoma City	Oklahoma	10	2015	160000
8432	99	Oklahoma City	Oklahoma	11	2015	156000
8433	99	Oklahoma City	Oklahoma	12	2015	155000
8434	99	Oklahoma City	Oklahoma	1	2016	157750
8435	99	Oklahoma City	Oklahoma	2	2016	153500
8436	99	Oklahoma City	Oklahoma	3	2016	157000
8437	99	Oklahoma City	Oklahoma	4	2016	160000
8438	99	Oklahoma City	Oklahoma	5	2016	160000
8439	99	Oklahoma City	Oklahoma	6	2016	165000
8440	99	Oklahoma City	Oklahoma	7	2016	166500
8441	99	Oklahoma City	Oklahoma	8	2016	164000
8442	99	Oklahoma City	Oklahoma	9	2016	163000
8443	99	Oklahoma City	Oklahoma	10	2016	161500
8444	99	Oklahoma City	Oklahoma	11	2016	163000
8445	99	Oklahoma City	Oklahoma	12	2016	159500
8446	99	Oklahoma City	Oklahoma	1	2017	156750
8447	99	Oklahoma City	Oklahoma	2	2017	160050
8448	99	Oklahoma City	Oklahoma	3	2017	160220
8449	99	Oklahoma City	Oklahoma	4	2017	165000
8450	99	Oklahoma City	Oklahoma	5	2017	166000
8451	99	Oklahoma City	Oklahoma	6	2017	170000
8452	99	Oklahoma City	Oklahoma	7	2017	170000
8453	99	Oklahoma City	Oklahoma	8	2017	165000
8454	99	Oklahoma City	Oklahoma	9	2017	166950
8455	99	Oklahoma City	Oklahoma	10	2017	162000
8456	99	Oklahoma City	Oklahoma	11	2017	161000
8457	99	Oklahoma City	Oklahoma	12	2017	160000
8458	99	Oklahoma City	Oklahoma	1	2018	158000
8459	99	Oklahoma City	Oklahoma	2	2018	159750
8460	99	Oklahoma City	Oklahoma	3	2018	165000
8461	99	Oklahoma City	Oklahoma	4	2018	170000
8462	99	Oklahoma City	Oklahoma	5	2018	170000
8463	99	Oklahoma City	Oklahoma	6	2018	173250
8464	99	Oklahoma City	Oklahoma	7	2018	174900
8465	99	Oklahoma City	Oklahoma	8	2018	171000
8466	99	Oklahoma City	Oklahoma	9	2018	169900
8467	99	Oklahoma City	Oklahoma	10	2018	169900
8468	99	Oklahoma City	Oklahoma	11	2018	164900
8469	99	Oklahoma City	Oklahoma	12	2018	165060
8470	99	Oklahoma City	Oklahoma	1	2019	0
8471	150	Lincoln	Nebraska	1	2009	0
8472	150	Lincoln	Nebraska	2	2009	131100
8473	150	Lincoln	Nebraska	3	2009	131300
8474	150	Lincoln	Nebraska	4	2009	131600
8475	150	Lincoln	Nebraska	5	2009	131800
8476	150	Lincoln	Nebraska	6	2009	131800
8477	150	Lincoln	Nebraska	7	2009	131700
8478	150	Lincoln	Nebraska	8	2009	131600
8479	150	Lincoln	Nebraska	9	2009	131500
8480	150	Lincoln	Nebraska	10	2009	131700
8481	150	Lincoln	Nebraska	11	2009	131900
8482	150	Lincoln	Nebraska	12	2009	132200
8483	150	Lincoln	Nebraska	1	2010	132600
8484	150	Lincoln	Nebraska	2	2010	133000
8485	150	Lincoln	Nebraska	3	2010	133100
8486	150	Lincoln	Nebraska	4	2010	132800
8487	150	Lincoln	Nebraska	5	2010	132400
8488	150	Lincoln	Nebraska	6	2010	132300
8489	150	Lincoln	Nebraska	7	2010	132400
8490	150	Lincoln	Nebraska	8	2010	132400
8491	150	Lincoln	Nebraska	9	2010	132100
8492	150	Lincoln	Nebraska	10	2010	131400
8493	150	Lincoln	Nebraska	11	2010	130900
8494	150	Lincoln	Nebraska	12	2010	130300
8495	150	Lincoln	Nebraska	1	2011	129800
8496	150	Lincoln	Nebraska	2	2011	129500
8497	150	Lincoln	Nebraska	3	2011	129800
8498	150	Lincoln	Nebraska	4	2011	130000
8499	150	Lincoln	Nebraska	5	2011	130000
8500	150	Lincoln	Nebraska	6	2011	129700
8501	150	Lincoln	Nebraska	7	2011	129600
8502	150	Lincoln	Nebraska	8	2011	129500
8503	150	Lincoln	Nebraska	9	2011	129500
8504	150	Lincoln	Nebraska	10	2011	129600
8505	150	Lincoln	Nebraska	11	2011	129600
8506	150	Lincoln	Nebraska	12	2011	129600
8507	150	Lincoln	Nebraska	1	2012	129800
8508	150	Lincoln	Nebraska	2	2012	129700
8509	150	Lincoln	Nebraska	3	2012	129600
8510	150	Lincoln	Nebraska	4	2012	129800
8511	150	Lincoln	Nebraska	5	2012	130100
8512	150	Lincoln	Nebraska	6	2012	130400
8513	150	Lincoln	Nebraska	7	2012	130900
8514	150	Lincoln	Nebraska	8	2012	131500
8515	150	Lincoln	Nebraska	9	2012	132300
8516	150	Lincoln	Nebraska	10	2012	133000
8517	150	Lincoln	Nebraska	11	2012	133500
8518	150	Lincoln	Nebraska	12	2012	133800
8519	150	Lincoln	Nebraska	1	2013	133800
8520	150	Lincoln	Nebraska	2	2013	133500
8521	150	Lincoln	Nebraska	3	2013	133000
8522	150	Lincoln	Nebraska	4	2013	133000
8523	150	Lincoln	Nebraska	5	2013	133500
8524	150	Lincoln	Nebraska	6	2013	134000
8525	150	Lincoln	Nebraska	7	2013	134300
8526	150	Lincoln	Nebraska	8	2013	134600
8527	150	Lincoln	Nebraska	9	2013	135000
8528	150	Lincoln	Nebraska	10	2013	135500
8529	150	Lincoln	Nebraska	11	2013	136200
8530	150	Lincoln	Nebraska	12	2013	137000
8531	150	Lincoln	Nebraska	1	2014	137700
8532	150	Lincoln	Nebraska	2	2014	138500
8533	150	Lincoln	Nebraska	3	2014	139000
8534	150	Lincoln	Nebraska	4	2014	139000
8535	150	Lincoln	Nebraska	5	2014	139100
8536	150	Lincoln	Nebraska	6	2014	139500
8537	150	Lincoln	Nebraska	7	2014	139800
8538	150	Lincoln	Nebraska	8	2014	140000
8539	150	Lincoln	Nebraska	9	2014	140200
8540	150	Lincoln	Nebraska	10	2014	140600
8541	150	Lincoln	Nebraska	11	2014	141400
8542	150	Lincoln	Nebraska	12	2014	142200
8543	150	Lincoln	Nebraska	1	2015	142700
8544	150	Lincoln	Nebraska	2	2015	143700
8545	150	Lincoln	Nebraska	3	2015	145100
8546	150	Lincoln	Nebraska	4	2015	146200
8547	150	Lincoln	Nebraska	5	2015	146900
8548	150	Lincoln	Nebraska	6	2015	147500
8549	150	Lincoln	Nebraska	7	2015	148200
8550	150	Lincoln	Nebraska	8	2015	148800
8551	150	Lincoln	Nebraska	9	2015	149600
8552	150	Lincoln	Nebraska	10	2015	150100
8553	150	Lincoln	Nebraska	11	2015	150500
8554	150	Lincoln	Nebraska	12	2015	151000
8555	150	Lincoln	Nebraska	1	2016	151400
8556	150	Lincoln	Nebraska	2	2016	151900
8557	150	Lincoln	Nebraska	3	2016	152500
8558	150	Lincoln	Nebraska	4	2016	153200
8559	150	Lincoln	Nebraska	5	2016	154100
8560	150	Lincoln	Nebraska	6	2016	155000
8561	150	Lincoln	Nebraska	7	2016	155900
8562	150	Lincoln	Nebraska	8	2016	157000
8563	150	Lincoln	Nebraska	9	2016	158100
8564	150	Lincoln	Nebraska	10	2016	158900
8565	150	Lincoln	Nebraska	11	2016	159500
8566	150	Lincoln	Nebraska	12	2016	159700
8567	150	Lincoln	Nebraska	1	2017	159900
8568	150	Lincoln	Nebraska	2	2017	160400
8569	150	Lincoln	Nebraska	3	2017	161400
8570	150	Lincoln	Nebraska	4	2017	162500
8571	150	Lincoln	Nebraska	5	2017	163500
8572	150	Lincoln	Nebraska	6	2017	164600
8573	150	Lincoln	Nebraska	7	2017	165600
8574	150	Lincoln	Nebraska	8	2017	166200
8575	150	Lincoln	Nebraska	9	2017	166600
8576	150	Lincoln	Nebraska	10	2017	167100
8577	150	Lincoln	Nebraska	11	2017	167700
8578	150	Lincoln	Nebraska	12	2017	168200
8579	150	Lincoln	Nebraska	1	2018	169000
8580	150	Lincoln	Nebraska	2	2018	170200
8581	150	Lincoln	Nebraska	3	2018	171100
8582	150	Lincoln	Nebraska	4	2018	172100
8583	150	Lincoln	Nebraska	5	2018	173500
8584	150	Lincoln	Nebraska	6	2018	174700
8585	150	Lincoln	Nebraska	7	2018	175400
8586	150	Lincoln	Nebraska	8	2018	176200
8587	150	Lincoln	Nebraska	9	2018	176900
8588	150	Lincoln	Nebraska	10	2018	177500
8589	150	Lincoln	Nebraska	11	2018	177900
8590	150	Lincoln	Nebraska	12	2018	178600
8591	150	Lincoln	Nebraska	1	2019	179500
8592	149	Biloxi	Mississippi	1	2009	0
8593	149	Biloxi	Mississippi	2	2009	131100
8594	149	Biloxi	Mississippi	3	2009	131100
8595	149	Biloxi	Mississippi	4	2009	130800
8596	149	Biloxi	Mississippi	5	2009	130500
8597	149	Biloxi	Mississippi	6	2009	130100
8598	149	Biloxi	Mississippi	7	2009	129700
8599	149	Biloxi	Mississippi	8	2009	129500
8600	149	Biloxi	Mississippi	9	2009	129700
8601	149	Biloxi	Mississippi	10	2009	129900
8602	149	Biloxi	Mississippi	11	2009	129900
8603	149	Biloxi	Mississippi	12	2009	130400
8604	149	Biloxi	Mississippi	1	2010	131000
8605	149	Biloxi	Mississippi	2	2010	131300
8606	149	Biloxi	Mississippi	3	2010	132500
8607	149	Biloxi	Mississippi	4	2010	134100
8608	149	Biloxi	Mississippi	5	2010	135600
8609	149	Biloxi	Mississippi	6	2010	137000
8610	149	Biloxi	Mississippi	7	2010	137800
8611	149	Biloxi	Mississippi	8	2010	138000
8612	149	Biloxi	Mississippi	9	2010	138600
8613	149	Biloxi	Mississippi	10	2010	138900
8614	149	Biloxi	Mississippi	11	2010	138200
8615	149	Biloxi	Mississippi	12	2010	137200
8616	149	Biloxi	Mississippi	1	2011	136300
8617	149	Biloxi	Mississippi	2	2011	135900
8618	149	Biloxi	Mississippi	3	2011	135800
8619	149	Biloxi	Mississippi	4	2011	136000
8620	149	Biloxi	Mississippi	5	2011	136200
8621	149	Biloxi	Mississippi	6	2011	136400
8622	149	Biloxi	Mississippi	7	2011	137500
8623	149	Biloxi	Mississippi	8	2011	136500
8624	149	Biloxi	Mississippi	9	2011	132300
8625	149	Biloxi	Mississippi	10	2011	128600
8626	149	Biloxi	Mississippi	11	2011	126600
8627	149	Biloxi	Mississippi	12	2011	124500
8628	149	Biloxi	Mississippi	1	2012	123100
8629	149	Biloxi	Mississippi	2	2012	122500
8630	149	Biloxi	Mississippi	3	2012	121600
8631	149	Biloxi	Mississippi	4	2012	120500
8632	149	Biloxi	Mississippi	5	2012	120000
8633	149	Biloxi	Mississippi	6	2012	119600
8634	149	Biloxi	Mississippi	7	2012	119000
8635	149	Biloxi	Mississippi	8	2012	119300
8636	149	Biloxi	Mississippi	9	2012	120100
8637	149	Biloxi	Mississippi	10	2012	119700
8638	149	Biloxi	Mississippi	11	2012	119800
8639	149	Biloxi	Mississippi	12	2012	121200
8640	149	Biloxi	Mississippi	1	2013	121800
8641	149	Biloxi	Mississippi	2	2013	121300
8642	149	Biloxi	Mississippi	3	2013	120800
8643	149	Biloxi	Mississippi	4	2013	120600
8644	149	Biloxi	Mississippi	5	2013	120700
8645	149	Biloxi	Mississippi	6	2013	120400
8646	149	Biloxi	Mississippi	7	2013	119700
8647	149	Biloxi	Mississippi	8	2013	119100
8648	149	Biloxi	Mississippi	9	2013	118700
8649	149	Biloxi	Mississippi	10	2013	119600
8650	149	Biloxi	Mississippi	11	2013	121700
8651	149	Biloxi	Mississippi	12	2013	123500
8652	149	Biloxi	Mississippi	1	2014	124400
8653	149	Biloxi	Mississippi	2	2014	124500
8654	149	Biloxi	Mississippi	3	2014	123600
8655	149	Biloxi	Mississippi	4	2014	122300
8656	149	Biloxi	Mississippi	5	2014	121200
8657	149	Biloxi	Mississippi	6	2014	120700
8658	149	Biloxi	Mississippi	7	2014	120000
8659	149	Biloxi	Mississippi	8	2014	119300
8660	149	Biloxi	Mississippi	9	2014	119500
8661	149	Biloxi	Mississippi	10	2014	119900
8662	149	Biloxi	Mississippi	11	2014	119500
8663	149	Biloxi	Mississippi	12	2014	119300
8664	149	Biloxi	Mississippi	1	2015	119100
8665	149	Biloxi	Mississippi	2	2015	118700
8666	149	Biloxi	Mississippi	3	2015	118700
8667	149	Biloxi	Mississippi	4	2015	118900
8668	149	Biloxi	Mississippi	5	2015	118100
8669	149	Biloxi	Mississippi	6	2015	116700
8670	149	Biloxi	Mississippi	7	2015	115600
8671	149	Biloxi	Mississippi	8	2015	114400
8672	149	Biloxi	Mississippi	9	2015	113900
8673	149	Biloxi	Mississippi	10	2015	114600
8674	149	Biloxi	Mississippi	11	2015	114800
8675	149	Biloxi	Mississippi	12	2015	114100
8676	149	Biloxi	Mississippi	1	2016	113900
8677	149	Biloxi	Mississippi	2	2016	114400
8678	149	Biloxi	Mississippi	3	2016	115000
8679	149	Biloxi	Mississippi	4	2016	115200
8680	149	Biloxi	Mississippi	5	2016	114800
8681	149	Biloxi	Mississippi	6	2016	114600
8682	149	Biloxi	Mississippi	7	2016	114900
8683	149	Biloxi	Mississippi	8	2016	115400
8684	149	Biloxi	Mississippi	9	2016	115800
8685	149	Biloxi	Mississippi	10	2016	116000
8686	149	Biloxi	Mississippi	11	2016	116000
8687	149	Biloxi	Mississippi	12	2016	116000
8688	149	Biloxi	Mississippi	1	2017	116200
8689	149	Biloxi	Mississippi	2	2017	116400
8690	149	Biloxi	Mississippi	3	2017	116700
8691	149	Biloxi	Mississippi	4	2017	117200
8692	149	Biloxi	Mississippi	5	2017	117200
8693	149	Biloxi	Mississippi	6	2017	116600
8694	149	Biloxi	Mississippi	7	2017	116700
8695	149	Biloxi	Mississippi	8	2017	117900
8696	149	Biloxi	Mississippi	9	2017	119000
8697	149	Biloxi	Mississippi	10	2017	119300
8698	149	Biloxi	Mississippi	11	2017	119200
8699	149	Biloxi	Mississippi	12	2017	119500
8700	149	Biloxi	Mississippi	1	2018	120100
8701	149	Biloxi	Mississippi	2	2018	121000
8702	149	Biloxi	Mississippi	3	2018	121200
8703	149	Biloxi	Mississippi	4	2018	121700
8704	149	Biloxi	Mississippi	5	2018	123300
8705	149	Biloxi	Mississippi	6	2018	125400
8706	149	Biloxi	Mississippi	7	2018	127300
8707	149	Biloxi	Mississippi	8	2018	130000
8708	149	Biloxi	Mississippi	9	2018	133000
8709	149	Biloxi	Mississippi	10	2018	135300
8710	149	Biloxi	Mississippi	11	2018	136500
8711	149	Biloxi	Mississippi	12	2018	136900
8712	149	Biloxi	Mississippi	1	2019	137000
8713	113	Memphis	Tennessee	1	2009	83500
8714	113	Memphis	Tennessee	2	2009	99900
8715	113	Memphis	Tennessee	3	2009	103070
8716	113	Memphis	Tennessee	4	2009	111400
8717	113	Memphis	Tennessee	5	2009	119900
8718	113	Memphis	Tennessee	6	2009	130000
8719	113	Memphis	Tennessee	7	2009	137000
8720	113	Memphis	Tennessee	8	2009	128000
8721	113	Memphis	Tennessee	9	2009	125995
8722	113	Memphis	Tennessee	10	2009	125000
8723	113	Memphis	Tennessee	11	2009	124000
8724	113	Memphis	Tennessee	12	2009	125000
8725	113	Memphis	Tennessee	1	2010	100000
8726	113	Memphis	Tennessee	2	2010	116000
8727	113	Memphis	Tennessee	3	2010	120000
8728	113	Memphis	Tennessee	4	2010	125000
8729	113	Memphis	Tennessee	5	2010	126900
8730	113	Memphis	Tennessee	6	2010	130000
8731	113	Memphis	Tennessee	7	2010	122000
8732	113	Memphis	Tennessee	8	2010	122900
8733	113	Memphis	Tennessee	9	2010	130000
8734	113	Memphis	Tennessee	10	2010	122500
8735	113	Memphis	Tennessee	11	2010	119400
8736	113	Memphis	Tennessee	12	2010	119000
8737	113	Memphis	Tennessee	1	2011	105000
8738	113	Memphis	Tennessee	2	2011	111625
8739	113	Memphis	Tennessee	3	2011	103750
8740	113	Memphis	Tennessee	4	2011	107500
8741	113	Memphis	Tennessee	5	2011	113000
8742	113	Memphis	Tennessee	6	2011	122441
8743	113	Memphis	Tennessee	7	2011	122000
8744	113	Memphis	Tennessee	8	2011	120000
8745	113	Memphis	Tennessee	9	2011	123500
8746	113	Memphis	Tennessee	10	2011	107000
8747	113	Memphis	Tennessee	11	2011	115000
8748	113	Memphis	Tennessee	12	2011	113000
8749	113	Memphis	Tennessee	1	2012	97125
8750	113	Memphis	Tennessee	2	2012	103000
8751	113	Memphis	Tennessee	3	2012	116879
8752	113	Memphis	Tennessee	4	2012	120000
8753	113	Memphis	Tennessee	5	2012	120400
8754	113	Memphis	Tennessee	6	2012	124000
8755	113	Memphis	Tennessee	7	2012	129900
8756	113	Memphis	Tennessee	8	2012	123000
8757	113	Memphis	Tennessee	9	2012	122033
8758	113	Memphis	Tennessee	10	2012	120000
8759	113	Memphis	Tennessee	11	2012	117500
8760	113	Memphis	Tennessee	12	2012	119900
8761	113	Memphis	Tennessee	1	2013	108715
8762	113	Memphis	Tennessee	2	2013	109950
8763	113	Memphis	Tennessee	3	2013	119950
8764	113	Memphis	Tennessee	4	2013	120900
8765	113	Memphis	Tennessee	5	2013	127000
8766	113	Memphis	Tennessee	6	2013	145000
8767	113	Memphis	Tennessee	7	2013	140000
8768	113	Memphis	Tennessee	8	2013	144000
8769	113	Memphis	Tennessee	9	2013	137750
8770	113	Memphis	Tennessee	10	2013	129000
8771	113	Memphis	Tennessee	11	2013	124900
8772	113	Memphis	Tennessee	12	2013	130000
8773	113	Memphis	Tennessee	1	2014	116900
8774	113	Memphis	Tennessee	2	2014	121000
8775	113	Memphis	Tennessee	3	2014	134100
8776	113	Memphis	Tennessee	4	2014	135000
8777	113	Memphis	Tennessee	5	2014	142500
8778	113	Memphis	Tennessee	6	2014	149500
8779	113	Memphis	Tennessee	7	2014	158000
8780	113	Memphis	Tennessee	8	2014	149300
8781	113	Memphis	Tennessee	9	2014	140500
8782	113	Memphis	Tennessee	10	2014	136950
8783	113	Memphis	Tennessee	11	2014	132000
8784	113	Memphis	Tennessee	12	2014	139900
8785	113	Memphis	Tennessee	1	2015	134200
8786	113	Memphis	Tennessee	2	2015	142900
8787	113	Memphis	Tennessee	3	2015	139000
8788	113	Memphis	Tennessee	4	2015	138750
8789	113	Memphis	Tennessee	5	2015	154000
8790	113	Memphis	Tennessee	6	2015	162000
8791	113	Memphis	Tennessee	7	2015	154000
8792	113	Memphis	Tennessee	8	2015	163975
8793	113	Memphis	Tennessee	9	2015	152375
8794	113	Memphis	Tennessee	10	2015	137000
8795	113	Memphis	Tennessee	11	2015	145300
8796	113	Memphis	Tennessee	12	2015	146000
8797	113	Memphis	Tennessee	1	2016	130000
8798	113	Memphis	Tennessee	2	2016	135000
8799	113	Memphis	Tennessee	3	2016	140400
8800	113	Memphis	Tennessee	4	2016	146750
8801	113	Memphis	Tennessee	5	2016	152000
8802	113	Memphis	Tennessee	6	2016	172500
8803	113	Memphis	Tennessee	7	2016	165000
8804	113	Memphis	Tennessee	8	2016	158000
8805	113	Memphis	Tennessee	9	2016	157000
8806	113	Memphis	Tennessee	10	2016	154850
8807	113	Memphis	Tennessee	11	2016	160000
8808	113	Memphis	Tennessee	12	2016	157900
8809	113	Memphis	Tennessee	1	2017	131950
8810	113	Memphis	Tennessee	2	2017	150000
8811	113	Memphis	Tennessee	3	2017	156900
8812	113	Memphis	Tennessee	4	2017	160000
8813	113	Memphis	Tennessee	5	2017	165575
8814	113	Memphis	Tennessee	6	2017	180000
8815	113	Memphis	Tennessee	7	2017	167500
8816	113	Memphis	Tennessee	8	2017	169975
8817	113	Memphis	Tennessee	9	2017	169950
8818	113	Memphis	Tennessee	10	2017	164900
8819	113	Memphis	Tennessee	11	2017	165000
8820	113	Memphis	Tennessee	12	2017	168400
8821	113	Memphis	Tennessee	1	2018	162500
8822	113	Memphis	Tennessee	2	2018	154000
8823	113	Memphis	Tennessee	3	2018	165900
8824	113	Memphis	Tennessee	4	2018	165000
8825	113	Memphis	Tennessee	5	2018	190000
8826	113	Memphis	Tennessee	6	2018	195000
8827	113	Memphis	Tennessee	7	2018	189000
8828	113	Memphis	Tennessee	8	2018	174250
8829	113	Memphis	Tennessee	9	2018	176000
8830	113	Memphis	Tennessee	10	2018	173250
8831	113	Memphis	Tennessee	11	2018	170000
8832	113	Memphis	Tennessee	12	2018	165000
8833	113	Memphis	Tennessee	1	2019	0
8834	36	Orlando	Florida	1	2009	145000
8835	36	Orlando	Florida	2	2009	143000
8836	36	Orlando	Florida	3	2009	136000
8837	36	Orlando	Florida	4	2009	130000
8838	36	Orlando	Florida	5	2009	127113
8839	36	Orlando	Florida	6	2009	129000
8840	36	Orlando	Florida	7	2009	131500
8841	36	Orlando	Florida	8	2009	125000
8842	36	Orlando	Florida	9	2009	121000
8843	36	Orlando	Florida	10	2009	125000
8844	36	Orlando	Florida	11	2009	124700
8845	36	Orlando	Florida	12	2009	120000
8846	36	Orlando	Florida	1	2010	105000
8847	36	Orlando	Florida	2	2010	110000
8848	36	Orlando	Florida	3	2010	114900
8849	36	Orlando	Florida	4	2010	115000
8850	36	Orlando	Florida	5	2010	119000
8851	36	Orlando	Florida	6	2010	117000
8852	36	Orlando	Florida	7	2010	110000
8853	36	Orlando	Florida	8	2010	100000
8854	36	Orlando	Florida	9	2010	105000
8855	36	Orlando	Florida	10	2010	107250
8856	36	Orlando	Florida	11	2010	107450
8857	36	Orlando	Florida	12	2010	104900
8858	36	Orlando	Florida	1	2011	95900
8859	36	Orlando	Florida	2	2011	96982
8860	36	Orlando	Florida	3	2011	103900
8861	36	Orlando	Florida	4	2011	105000
8862	36	Orlando	Florida	5	2011	112500
8863	36	Orlando	Florida	6	2011	111000
8864	36	Orlando	Florida	7	2011	117000
8865	36	Orlando	Florida	8	2011	115000
8866	36	Orlando	Florida	9	2011	114000
8867	36	Orlando	Florida	10	2011	115000
8868	36	Orlando	Florida	11	2011	115000
8869	36	Orlando	Florida	12	2011	115000
8870	36	Orlando	Florida	1	2012	111000
8871	36	Orlando	Florida	2	2012	114000
8872	36	Orlando	Florida	3	2012	116785
8873	36	Orlando	Florida	4	2012	115000
8874	36	Orlando	Florida	5	2012	120000
8875	36	Orlando	Florida	6	2012	125000
8876	36	Orlando	Florida	7	2012	125000
8877	36	Orlando	Florida	8	2012	124000
8878	36	Orlando	Florida	9	2012	126000
8879	36	Orlando	Florida	10	2012	123500
8880	36	Orlando	Florida	11	2012	130000
8881	36	Orlando	Florida	12	2012	133200
8882	36	Orlando	Florida	1	2013	130000
8883	36	Orlando	Florida	2	2013	133500
8884	36	Orlando	Florida	3	2013	141540
8885	36	Orlando	Florida	4	2013	145000
8886	36	Orlando	Florida	5	2013	142500
8887	36	Orlando	Florida	6	2013	150000
8888	36	Orlando	Florida	7	2013	155800
8889	36	Orlando	Florida	8	2013	157000
8890	36	Orlando	Florida	9	2013	158000
8891	36	Orlando	Florida	10	2013	155050
8892	36	Orlando	Florida	11	2013	159000
8893	36	Orlando	Florida	12	2013	158000
8894	36	Orlando	Florida	1	2014	157000
8895	36	Orlando	Florida	2	2014	154000
8896	36	Orlando	Florida	3	2014	160000
8897	36	Orlando	Florida	4	2014	165300
8898	36	Orlando	Florida	5	2014	165000
8899	36	Orlando	Florida	6	2014	165950
8900	36	Orlando	Florida	7	2014	173219
8901	36	Orlando	Florida	8	2014	170000
8902	36	Orlando	Florida	9	2014	169000
8903	36	Orlando	Florida	10	2014	165000
8904	36	Orlando	Florida	11	2014	166000
8905	36	Orlando	Florida	12	2014	167950
8906	36	Orlando	Florida	1	2015	164650
8907	36	Orlando	Florida	2	2015	164000
8908	36	Orlando	Florida	3	2015	178000
8909	36	Orlando	Florida	4	2015	174000
8910	36	Orlando	Florida	5	2015	180275
8911	36	Orlando	Florida	6	2015	183000
8912	36	Orlando	Florida	7	2015	185000
8913	36	Orlando	Florida	8	2015	182000
8914	36	Orlando	Florida	9	2015	185000
8915	36	Orlando	Florida	10	2015	181000
8916	36	Orlando	Florida	11	2015	187000
8917	36	Orlando	Florida	12	2015	186500
8918	36	Orlando	Florida	1	2016	185400
8919	36	Orlando	Florida	2	2016	182000
8920	36	Orlando	Florida	3	2016	192100
8921	36	Orlando	Florida	4	2016	195000
8922	36	Orlando	Florida	5	2016	200000
8923	36	Orlando	Florida	6	2016	209900
8924	36	Orlando	Florida	7	2016	210000
8925	36	Orlando	Florida	8	2016	210000
8926	36	Orlando	Florida	9	2016	208700
8927	36	Orlando	Florida	10	2016	208000
8928	36	Orlando	Florida	11	2016	209900
8929	36	Orlando	Florida	12	2016	210000
8930	36	Orlando	Florida	1	2017	208000
8931	36	Orlando	Florida	2	2017	207520
8932	36	Orlando	Florida	3	2017	220000
8933	36	Orlando	Florida	4	2017	220000
8934	36	Orlando	Florida	5	2017	220000
8935	36	Orlando	Florida	6	2017	231000
8936	36	Orlando	Florida	7	2017	227000
8937	36	Orlando	Florida	8	2017	227000
8938	36	Orlando	Florida	9	2017	230000
8939	36	Orlando	Florida	10	2017	225000
8940	36	Orlando	Florida	11	2017	225000
8941	36	Orlando	Florida	12	2017	235101
8942	36	Orlando	Florida	1	2018	234900
8943	36	Orlando	Florida	2	2018	235000
8944	36	Orlando	Florida	3	2018	235000
8945	36	Orlando	Florida	4	2018	240000
8946	36	Orlando	Florida	5	2018	248000
8947	36	Orlando	Florida	6	2018	249900
8948	36	Orlando	Florida	7	2018	245500
8949	36	Orlando	Florida	8	2018	245900
8950	36	Orlando	Florida	9	2018	245000
8951	36	Orlando	Florida	10	2018	240530
8952	36	Orlando	Florida	11	2018	245000
8953	36	Orlando	Florida	12	2018	249945
8954	36	Orlando	Florida	1	2019	0
8955	55	Indianapolis	Indiana	1	2009	88000
8956	55	Indianapolis	Indiana	2	2009	97250
8957	55	Indianapolis	Indiana	3	2009	109900
8958	55	Indianapolis	Indiana	4	2009	107000
8959	55	Indianapolis	Indiana	5	2009	125000
8960	55	Indianapolis	Indiana	6	2009	122000
8961	55	Indianapolis	Indiana	7	2009	122000
8962	55	Indianapolis	Indiana	8	2009	122700
8963	55	Indianapolis	Indiana	9	2009	119900
8964	55	Indianapolis	Indiana	10	2009	114000
8965	55	Indianapolis	Indiana	11	2009	117000
8966	55	Indianapolis	Indiana	12	2009	108900
8967	55	Indianapolis	Indiana	1	2010	99000
8968	55	Indianapolis	Indiana	2	2010	108000
8969	55	Indianapolis	Indiana	3	2010	117825
8970	55	Indianapolis	Indiana	4	2010	124000
8971	55	Indianapolis	Indiana	5	2010	130000
8972	55	Indianapolis	Indiana	6	2010	124000
8973	55	Indianapolis	Indiana	7	2010	125000
8974	55	Indianapolis	Indiana	8	2010	122500
8975	55	Indianapolis	Indiana	9	2010	117000
8976	55	Indianapolis	Indiana	10	2010	119000
8977	55	Indianapolis	Indiana	11	2010	124000
8978	55	Indianapolis	Indiana	12	2010	119900
8979	55	Indianapolis	Indiana	1	2011	109000
8980	55	Indianapolis	Indiana	2	2011	108000
8981	55	Indianapolis	Indiana	3	2011	114500
8982	55	Indianapolis	Indiana	4	2011	122500
8983	55	Indianapolis	Indiana	5	2011	124900
8984	55	Indianapolis	Indiana	6	2011	127000
8985	55	Indianapolis	Indiana	7	2011	130000
8986	55	Indianapolis	Indiana	8	2011	123800
8987	55	Indianapolis	Indiana	9	2011	125000
8988	55	Indianapolis	Indiana	10	2011	116000
8989	55	Indianapolis	Indiana	11	2011	116450
8990	55	Indianapolis	Indiana	12	2011	119000
8991	55	Indianapolis	Indiana	1	2012	110000
8992	55	Indianapolis	Indiana	2	2012	104900
8993	55	Indianapolis	Indiana	3	2012	120000
8994	55	Indianapolis	Indiana	4	2012	125000
8995	55	Indianapolis	Indiana	5	2012	130000
8996	55	Indianapolis	Indiana	6	2012	135000
8997	55	Indianapolis	Indiana	7	2012	131500
8998	55	Indianapolis	Indiana	8	2012	126500
8999	55	Indianapolis	Indiana	9	2012	125000
9000	55	Indianapolis	Indiana	10	2012	124550
9001	55	Indianapolis	Indiana	11	2012	124445
9002	55	Indianapolis	Indiana	12	2012	123000
9003	55	Indianapolis	Indiana	1	2013	117500
9004	55	Indianapolis	Indiana	2	2013	115000
9005	55	Indianapolis	Indiana	3	2013	125000
9006	55	Indianapolis	Indiana	4	2013	128900
9007	55	Indianapolis	Indiana	5	2013	137000
9008	55	Indianapolis	Indiana	6	2013	143000
9009	55	Indianapolis	Indiana	7	2013	144900
9010	55	Indianapolis	Indiana	8	2013	136000
9011	55	Indianapolis	Indiana	9	2013	135000
9012	55	Indianapolis	Indiana	10	2013	131500
9013	55	Indianapolis	Indiana	11	2013	130000
9014	55	Indianapolis	Indiana	12	2013	135000
9015	55	Indianapolis	Indiana	1	2014	125000
9016	55	Indianapolis	Indiana	2	2014	124900
9017	55	Indianapolis	Indiana	3	2014	134625
9018	55	Indianapolis	Indiana	4	2014	136950
9019	55	Indianapolis	Indiana	5	2014	143000
9020	55	Indianapolis	Indiana	6	2014	151403
9021	55	Indianapolis	Indiana	7	2014	146465
9022	55	Indianapolis	Indiana	8	2014	148000
9023	55	Indianapolis	Indiana	9	2014	142250
9024	55	Indianapolis	Indiana	10	2014	141500
9025	55	Indianapolis	Indiana	11	2014	139000
9026	55	Indianapolis	Indiana	12	2014	135000
9027	55	Indianapolis	Indiana	1	2015	127900
9028	55	Indianapolis	Indiana	2	2015	132500
9029	55	Indianapolis	Indiana	3	2015	142358
9030	55	Indianapolis	Indiana	4	2015	148000
9031	55	Indianapolis	Indiana	5	2015	155000
9032	55	Indianapolis	Indiana	6	2015	160000
9033	55	Indianapolis	Indiana	7	2015	155950
9034	55	Indianapolis	Indiana	8	2015	151500
9035	55	Indianapolis	Indiana	9	2015	148500
9036	55	Indianapolis	Indiana	10	2015	142500
9037	55	Indianapolis	Indiana	11	2015	145000
9038	55	Indianapolis	Indiana	12	2015	142000
9039	55	Indianapolis	Indiana	1	2016	135000
9040	55	Indianapolis	Indiana	2	2016	135000
9041	55	Indianapolis	Indiana	3	2016	150000
9042	55	Indianapolis	Indiana	4	2016	150000
9043	55	Indianapolis	Indiana	5	2016	159750
9044	55	Indianapolis	Indiana	6	2016	162950
9045	55	Indianapolis	Indiana	7	2016	160000
9046	55	Indianapolis	Indiana	8	2016	153500
9047	55	Indianapolis	Indiana	9	2016	159900
9048	55	Indianapolis	Indiana	10	2016	153700
9049	55	Indianapolis	Indiana	11	2016	151000
9050	55	Indianapolis	Indiana	12	2016	153283
9051	55	Indianapolis	Indiana	1	2017	140000
9052	55	Indianapolis	Indiana	2	2017	152500
9053	55	Indianapolis	Indiana	3	2017	157000
9054	55	Indianapolis	Indiana	4	2017	161250
9055	55	Indianapolis	Indiana	5	2017	169300
9056	55	Indianapolis	Indiana	6	2017	174900
9057	55	Indianapolis	Indiana	7	2017	168500
9058	55	Indianapolis	Indiana	8	2017	164263
9059	55	Indianapolis	Indiana	9	2017	163000
9060	55	Indianapolis	Indiana	10	2017	162750
9061	55	Indianapolis	Indiana	11	2017	165000
9062	55	Indianapolis	Indiana	12	2017	164900
9063	55	Indianapolis	Indiana	1	2018	157900
9064	55	Indianapolis	Indiana	2	2018	167200
9065	55	Indianapolis	Indiana	3	2018	173500
9066	55	Indianapolis	Indiana	4	2018	175000
9067	55	Indianapolis	Indiana	5	2018	186000
9068	55	Indianapolis	Indiana	6	2018	188000
9069	55	Indianapolis	Indiana	7	2018	182000
9070	55	Indianapolis	Indiana	8	2018	179000
9071	55	Indianapolis	Indiana	9	2018	176000
9072	55	Indianapolis	Indiana	10	2018	173500
9073	55	Indianapolis	Indiana	11	2018	175000
9074	55	Indianapolis	Indiana	12	2018	175000
9075	55	Indianapolis	Indiana	1	2019	0
9076	148	Jackson	Mississippi	1	2009	0
9077	148	Jackson	Mississippi	2	2009	153100
9078	148	Jackson	Mississippi	3	2009	147600
9079	148	Jackson	Mississippi	4	2009	142100
9080	148	Jackson	Mississippi	5	2009	137700
9081	148	Jackson	Mississippi	6	2009	132900
9082	148	Jackson	Mississippi	7	2009	127100
9083	148	Jackson	Mississippi	8	2009	121900
9084	148	Jackson	Mississippi	9	2009	118700
9085	148	Jackson	Mississippi	10	2009	117400
9086	148	Jackson	Mississippi	11	2009	117900
9087	148	Jackson	Mississippi	12	2009	119200
9088	148	Jackson	Mississippi	1	2010	120300
9089	148	Jackson	Mississippi	2	2010	120600
9090	148	Jackson	Mississippi	3	2010	122200
9091	148	Jackson	Mississippi	4	2010	124000
9092	148	Jackson	Mississippi	5	2010	123900
9093	148	Jackson	Mississippi	6	2010	122400
9094	148	Jackson	Mississippi	7	2010	123500
9095	148	Jackson	Mississippi	8	2010	125500
9096	148	Jackson	Mississippi	9	2010	127000
9097	148	Jackson	Mississippi	10	2010	126800
9098	148	Jackson	Mississippi	11	2010	126600
9099	148	Jackson	Mississippi	12	2010	129700
9100	148	Jackson	Mississippi	1	2011	133100
9101	148	Jackson	Mississippi	2	2011	132700
9102	148	Jackson	Mississippi	3	2011	129500
9103	148	Jackson	Mississippi	4	2011	126400
9104	148	Jackson	Mississippi	5	2011	123700
9105	148	Jackson	Mississippi	6	2011	122900
9106	148	Jackson	Mississippi	7	2011	122500
9107	148	Jackson	Mississippi	8	2011	122600
9108	148	Jackson	Mississippi	9	2011	123600
9109	148	Jackson	Mississippi	10	2011	124600
9110	148	Jackson	Mississippi	11	2011	124500
9111	148	Jackson	Mississippi	12	2011	124100
9112	148	Jackson	Mississippi	1	2012	125400
9113	148	Jackson	Mississippi	2	2012	130600
9114	148	Jackson	Mississippi	3	2012	137900
9115	148	Jackson	Mississippi	4	2012	142600
9116	148	Jackson	Mississippi	5	2012	143500
9117	148	Jackson	Mississippi	6	2012	144900
9118	148	Jackson	Mississippi	7	2012	147700
9119	148	Jackson	Mississippi	8	2012	149600
9120	148	Jackson	Mississippi	9	2012	149900
9121	148	Jackson	Mississippi	10	2012	150600
9122	148	Jackson	Mississippi	11	2012	150900
9123	148	Jackson	Mississippi	12	2012	149600
9124	148	Jackson	Mississippi	1	2013	148600
9125	148	Jackson	Mississippi	2	2013	149000
9126	148	Jackson	Mississippi	3	2013	151100
9127	148	Jackson	Mississippi	4	2013	156000
9128	148	Jackson	Mississippi	5	2013	162400
9129	148	Jackson	Mississippi	6	2013	166700
9130	148	Jackson	Mississippi	7	2013	169200
9131	148	Jackson	Mississippi	8	2013	171400
9132	148	Jackson	Mississippi	9	2013	173500
9133	148	Jackson	Mississippi	10	2013	175800
9134	148	Jackson	Mississippi	11	2013	178300
9135	148	Jackson	Mississippi	12	2013	179300
9136	148	Jackson	Mississippi	1	2014	178100
9137	148	Jackson	Mississippi	2	2014	176800
9138	148	Jackson	Mississippi	3	2014	174900
9139	148	Jackson	Mississippi	4	2014	173200
9140	148	Jackson	Mississippi	5	2014	173600
9141	148	Jackson	Mississippi	6	2014	176600
9142	148	Jackson	Mississippi	7	2014	180400
9143	148	Jackson	Mississippi	8	2014	184000
9144	148	Jackson	Mississippi	9	2014	185900
9145	148	Jackson	Mississippi	10	2014	186700
9146	148	Jackson	Mississippi	11	2014	188900
9147	148	Jackson	Mississippi	12	2014	192100
9148	148	Jackson	Mississippi	1	2015	194800
9149	148	Jackson	Mississippi	2	2015	195700
9150	148	Jackson	Mississippi	3	2015	193900
9151	148	Jackson	Mississippi	4	2015	192000
9152	148	Jackson	Mississippi	5	2015	192900
9153	148	Jackson	Mississippi	6	2015	194400
9154	148	Jackson	Mississippi	7	2015	195300
9155	148	Jackson	Mississippi	8	2015	197400
9156	148	Jackson	Mississippi	9	2015	198500
9157	148	Jackson	Mississippi	10	2015	198000
9158	148	Jackson	Mississippi	11	2015	197500
9159	148	Jackson	Mississippi	12	2015	196900
9160	148	Jackson	Mississippi	1	2016	196100
9161	148	Jackson	Mississippi	2	2016	196700
9162	148	Jackson	Mississippi	3	2016	198000
9163	148	Jackson	Mississippi	4	2016	198500
9164	148	Jackson	Mississippi	5	2016	196800
9165	148	Jackson	Mississippi	6	2016	195400
9166	148	Jackson	Mississippi	7	2016	195900
9167	148	Jackson	Mississippi	8	2016	197300
9168	148	Jackson	Mississippi	9	2016	199000
9169	148	Jackson	Mississippi	10	2016	200600
9170	148	Jackson	Mississippi	11	2016	200900
9171	148	Jackson	Mississippi	12	2016	200100
9172	148	Jackson	Mississippi	1	2017	200400
9173	148	Jackson	Mississippi	2	2017	201000
9174	148	Jackson	Mississippi	3	2017	202500
9175	148	Jackson	Mississippi	4	2017	204400
9176	148	Jackson	Mississippi	5	2017	206200
9177	148	Jackson	Mississippi	6	2017	206100
9178	148	Jackson	Mississippi	7	2017	206400
9179	148	Jackson	Mississippi	8	2017	207900
9180	148	Jackson	Mississippi	9	2017	210400
9181	148	Jackson	Mississippi	10	2017	211600
9182	148	Jackson	Mississippi	11	2017	212300
9183	148	Jackson	Mississippi	12	2017	213500
9184	148	Jackson	Mississippi	1	2018	214200
9185	148	Jackson	Mississippi	2	2018	213600
9186	148	Jackson	Mississippi	3	2018	212300
9187	148	Jackson	Mississippi	4	2018	214500
9188	148	Jackson	Mississippi	5	2018	222900
9189	148	Jackson	Mississippi	6	2018	231000
9190	148	Jackson	Mississippi	7	2018	230600
9191	148	Jackson	Mississippi	8	2018	224700
9192	148	Jackson	Mississippi	9	2018	222700
9193	148	Jackson	Mississippi	10	2018	227700
9194	148	Jackson	Mississippi	11	2018	235100
9195	148	Jackson	Mississippi	12	2018	240400
9196	148	Jackson	Mississippi	1	2019	244200
9197	144	Frankfort	Kentucky	1	2009	0
9198	144	Frankfort	Kentucky	2	2009	122200
9199	144	Frankfort	Kentucky	3	2009	121900
9200	144	Frankfort	Kentucky	4	2009	121800
9201	144	Frankfort	Kentucky	5	2009	121500
9202	144	Frankfort	Kentucky	6	2009	121200
9203	144	Frankfort	Kentucky	7	2009	120800
9204	144	Frankfort	Kentucky	8	2009	120500
9205	144	Frankfort	Kentucky	9	2009	120100
9206	144	Frankfort	Kentucky	10	2009	119800
9207	144	Frankfort	Kentucky	11	2009	119700
9208	144	Frankfort	Kentucky	12	2009	119800
9209	144	Frankfort	Kentucky	1	2010	119600
9210	144	Frankfort	Kentucky	2	2010	119300
9211	144	Frankfort	Kentucky	3	2010	119400
9212	144	Frankfort	Kentucky	4	2010	119400
9213	144	Frankfort	Kentucky	5	2010	119000
9214	144	Frankfort	Kentucky	6	2010	118800
9215	144	Frankfort	Kentucky	7	2010	119000
9216	144	Frankfort	Kentucky	8	2010	119300
9217	144	Frankfort	Kentucky	9	2010	119400
9218	144	Frankfort	Kentucky	10	2010	119300
9219	144	Frankfort	Kentucky	11	2010	119300
9220	144	Frankfort	Kentucky	12	2010	119500
9221	144	Frankfort	Kentucky	1	2011	119700
9222	144	Frankfort	Kentucky	2	2011	119600
9223	144	Frankfort	Kentucky	3	2011	119200
9224	144	Frankfort	Kentucky	4	2011	118600
9225	144	Frankfort	Kentucky	5	2011	117900
9226	144	Frankfort	Kentucky	6	2011	117300
9227	144	Frankfort	Kentucky	7	2011	116700
9228	144	Frankfort	Kentucky	8	2011	116200
9229	144	Frankfort	Kentucky	9	2011	116000
9230	144	Frankfort	Kentucky	10	2011	115900
9231	144	Frankfort	Kentucky	11	2011	115700
9232	144	Frankfort	Kentucky	12	2011	115200
9233	144	Frankfort	Kentucky	1	2012	114700
9234	144	Frankfort	Kentucky	2	2012	114800
9235	144	Frankfort	Kentucky	3	2012	114900
9236	144	Frankfort	Kentucky	4	2012	114900
9237	144	Frankfort	Kentucky	5	2012	115400
9238	144	Frankfort	Kentucky	6	2012	115900
9239	144	Frankfort	Kentucky	7	2012	115800
9240	144	Frankfort	Kentucky	8	2012	115600
9241	144	Frankfort	Kentucky	9	2012	115800
9242	144	Frankfort	Kentucky	10	2012	115800
9243	144	Frankfort	Kentucky	11	2012	115000
9244	144	Frankfort	Kentucky	12	2012	114200
9245	144	Frankfort	Kentucky	1	2013	114200
9246	144	Frankfort	Kentucky	2	2013	114400
9247	144	Frankfort	Kentucky	3	2013	114100
9248	144	Frankfort	Kentucky	4	2013	113900
9249	144	Frankfort	Kentucky	5	2013	114000
9250	144	Frankfort	Kentucky	6	2013	114400
9251	144	Frankfort	Kentucky	7	2013	114800
9252	144	Frankfort	Kentucky	8	2013	114700
9253	144	Frankfort	Kentucky	9	2013	114100
9254	144	Frankfort	Kentucky	10	2013	113700
9255	144	Frankfort	Kentucky	11	2013	113200
9256	144	Frankfort	Kentucky	12	2013	112800
9257	144	Frankfort	Kentucky	1	2014	112800
9258	144	Frankfort	Kentucky	2	2014	113000
9259	144	Frankfort	Kentucky	3	2014	113200
9260	144	Frankfort	Kentucky	4	2014	113600
9261	144	Frankfort	Kentucky	5	2014	113900
9262	144	Frankfort	Kentucky	6	2014	114000
9263	144	Frankfort	Kentucky	7	2014	113900
9264	144	Frankfort	Kentucky	8	2014	114200
9265	144	Frankfort	Kentucky	9	2014	114400
9266	144	Frankfort	Kentucky	10	2014	114400
9267	144	Frankfort	Kentucky	11	2014	114500
9268	144	Frankfort	Kentucky	12	2014	114700
9269	144	Frankfort	Kentucky	1	2015	114900
9270	144	Frankfort	Kentucky	2	2015	115200
9271	144	Frankfort	Kentucky	3	2015	115600
9272	144	Frankfort	Kentucky	4	2015	115400
9273	144	Frankfort	Kentucky	5	2015	115000
9274	144	Frankfort	Kentucky	6	2015	114700
9275	144	Frankfort	Kentucky	7	2015	114600
9276	144	Frankfort	Kentucky	8	2015	114200
9277	144	Frankfort	Kentucky	9	2015	113700
9278	144	Frankfort	Kentucky	10	2015	113200
9279	144	Frankfort	Kentucky	11	2015	113200
9280	144	Frankfort	Kentucky	12	2015	113400
9281	144	Frankfort	Kentucky	1	2016	113700
9282	144	Frankfort	Kentucky	2	2016	114300
9283	144	Frankfort	Kentucky	3	2016	115000
9284	144	Frankfort	Kentucky	4	2016	115700
9285	144	Frankfort	Kentucky	5	2016	116300
9286	144	Frankfort	Kentucky	6	2016	116800
9287	144	Frankfort	Kentucky	7	2016	117600
9288	144	Frankfort	Kentucky	8	2016	118700
9289	144	Frankfort	Kentucky	9	2016	119900
9290	144	Frankfort	Kentucky	10	2016	120900
9291	144	Frankfort	Kentucky	11	2016	121600
9292	144	Frankfort	Kentucky	12	2016	121900
9293	144	Frankfort	Kentucky	1	2017	122100
9294	144	Frankfort	Kentucky	2	2017	122300
9295	144	Frankfort	Kentucky	3	2017	122700
9296	144	Frankfort	Kentucky	4	2017	123400
9297	144	Frankfort	Kentucky	5	2017	124300
9298	144	Frankfort	Kentucky	6	2017	124900
9299	144	Frankfort	Kentucky	7	2017	125300
9300	144	Frankfort	Kentucky	8	2017	125800
9301	144	Frankfort	Kentucky	9	2017	125600
9302	144	Frankfort	Kentucky	10	2017	125700
9303	144	Frankfort	Kentucky	11	2017	127300
9304	144	Frankfort	Kentucky	12	2017	129600
9305	144	Frankfort	Kentucky	1	2018	130400
9306	144	Frankfort	Kentucky	2	2018	129700
9307	144	Frankfort	Kentucky	3	2018	128900
9308	144	Frankfort	Kentucky	4	2018	128800
9309	144	Frankfort	Kentucky	5	2018	128800
9310	144	Frankfort	Kentucky	6	2018	128800
9311	144	Frankfort	Kentucky	7	2018	129000
9312	144	Frankfort	Kentucky	8	2018	129200
9313	144	Frankfort	Kentucky	9	2018	130700
9314	144	Frankfort	Kentucky	10	2018	133500
9315	144	Frankfort	Kentucky	11	2018	135800
9316	144	Frankfort	Kentucky	12	2018	136400
9317	144	Frankfort	Kentucky	1	2019	136300
9318	83	Las Vegas	Nevada	1	2009	149990
9319	83	Las Vegas	Nevada	2	2009	142000
9320	83	Las Vegas	Nevada	3	2009	135000
9321	83	Las Vegas	Nevada	4	2009	125000
9322	83	Las Vegas	Nevada	5	2009	127950
9323	83	Las Vegas	Nevada	6	2009	125000
9324	83	Las Vegas	Nevada	7	2009	125000
9325	83	Las Vegas	Nevada	8	2009	120500
9326	83	Las Vegas	Nevada	9	2009	125000
9327	83	Las Vegas	Nevada	10	2009	125000
9328	83	Las Vegas	Nevada	11	2009	126050
9329	83	Las Vegas	Nevada	12	2009	123950
9330	83	Las Vegas	Nevada	1	2010	122000
9331	83	Las Vegas	Nevada	2	2010	121750
9332	83	Las Vegas	Nevada	3	2010	125000
9333	83	Las Vegas	Nevada	4	2010	129949
9334	83	Las Vegas	Nevada	5	2010	129000
9335	83	Las Vegas	Nevada	6	2010	127500
9336	83	Las Vegas	Nevada	7	2010	124900
9337	83	Las Vegas	Nevada	8	2010	124000
9338	83	Las Vegas	Nevada	9	2010	123000
9339	83	Las Vegas	Nevada	10	2010	119000
9340	83	Las Vegas	Nevada	11	2010	120000
9341	83	Las Vegas	Nevada	12	2010	118000
9342	83	Las Vegas	Nevada	1	2011	115000
9343	83	Las Vegas	Nevada	2	2011	113625
9344	83	Las Vegas	Nevada	3	2011	112350
9345	83	Las Vegas	Nevada	4	2011	113750
9346	83	Las Vegas	Nevada	5	2011	111000
9347	83	Las Vegas	Nevada	6	2011	110000
9348	83	Las Vegas	Nevada	7	2011	109000
9349	83	Las Vegas	Nevada	8	2011	105750
9350	83	Las Vegas	Nevada	9	2011	108000
9351	83	Las Vegas	Nevada	10	2011	109900
9352	83	Las Vegas	Nevada	11	2011	110000
9353	83	Las Vegas	Nevada	12	2011	108000
9354	83	Las Vegas	Nevada	1	2012	106750
9355	83	Las Vegas	Nevada	2	2012	107000
9356	83	Las Vegas	Nevada	3	2012	110000
9357	83	Las Vegas	Nevada	4	2012	115000
9358	83	Las Vegas	Nevada	5	2012	117000
9359	83	Las Vegas	Nevada	6	2012	120000
9360	83	Las Vegas	Nevada	7	2012	122500
9361	83	Las Vegas	Nevada	8	2012	125013
9362	83	Las Vegas	Nevada	9	2012	130000
9363	83	Las Vegas	Nevada	10	2012	130000
9364	83	Las Vegas	Nevada	11	2012	133000
9365	83	Las Vegas	Nevada	12	2012	136000
9366	83	Las Vegas	Nevada	1	2013	136000
9367	83	Las Vegas	Nevada	2	2013	140000
9368	83	Las Vegas	Nevada	3	2013	148000
9369	83	Las Vegas	Nevada	4	2013	151000
9370	83	Las Vegas	Nevada	5	2013	155000
9371	83	Las Vegas	Nevada	6	2013	162500
9372	83	Las Vegas	Nevada	7	2013	165000
9373	83	Las Vegas	Nevada	8	2013	167000
9374	83	Las Vegas	Nevada	9	2013	168000
9375	83	Las Vegas	Nevada	10	2013	171500
9376	83	Las Vegas	Nevada	11	2013	170000
9377	83	Las Vegas	Nevada	12	2013	170000
9378	83	Las Vegas	Nevada	1	2014	169900
9379	83	Las Vegas	Nevada	2	2014	173500
9380	83	Las Vegas	Nevada	3	2014	180000
9381	83	Las Vegas	Nevada	4	2014	177000
9382	83	Las Vegas	Nevada	5	2014	178550
9383	83	Las Vegas	Nevada	6	2014	182000
9384	83	Las Vegas	Nevada	7	2014	182950
9385	83	Las Vegas	Nevada	8	2014	185000
9386	83	Las Vegas	Nevada	9	2014	186000
9387	83	Las Vegas	Nevada	10	2014	182000
9388	83	Las Vegas	Nevada	11	2014	187500
9389	83	Las Vegas	Nevada	12	2014	188000
9390	83	Las Vegas	Nevada	1	2015	184900
9391	83	Las Vegas	Nevada	2	2015	188000
9392	83	Las Vegas	Nevada	3	2015	190000
9393	83	Las Vegas	Nevada	4	2015	195500
9394	83	Las Vegas	Nevada	5	2015	193000
9395	83	Las Vegas	Nevada	6	2015	200000
9396	83	Las Vegas	Nevada	7	2015	204000
9397	83	Las Vegas	Nevada	8	2015	202000
9398	83	Las Vegas	Nevada	9	2015	204000
9399	83	Las Vegas	Nevada	10	2015	199900
9400	83	Las Vegas	Nevada	11	2015	202000
9401	83	Las Vegas	Nevada	12	2015	200000
9402	83	Las Vegas	Nevada	1	2016	199000
9403	83	Las Vegas	Nevada	2	2016	203050
9404	83	Las Vegas	Nevada	3	2016	200000
9405	83	Las Vegas	Nevada	4	2016	205000
9406	83	Las Vegas	Nevada	5	2016	215000
9407	83	Las Vegas	Nevada	6	2016	215000
9408	83	Las Vegas	Nevada	7	2016	217000
9409	83	Las Vegas	Nevada	8	2016	215000
9410	83	Las Vegas	Nevada	9	2016	217000
9411	83	Las Vegas	Nevada	10	2016	217950
9412	83	Las Vegas	Nevada	11	2016	222000
9413	83	Las Vegas	Nevada	12	2016	215000
9414	83	Las Vegas	Nevada	1	2017	217750
9415	83	Las Vegas	Nevada	2	2017	221000
9416	83	Las Vegas	Nevada	3	2017	227000
9417	83	Las Vegas	Nevada	4	2017	230000
9418	83	Las Vegas	Nevada	5	2017	235000
9419	83	Las Vegas	Nevada	6	2017	241850
9420	83	Las Vegas	Nevada	7	2017	245000
9421	83	Las Vegas	Nevada	8	2017	245000
9422	83	Las Vegas	Nevada	9	2017	248000
9423	83	Las Vegas	Nevada	10	2017	250000
9424	83	Las Vegas	Nevada	11	2017	248000
9425	83	Las Vegas	Nevada	12	2017	253250
9426	83	Las Vegas	Nevada	1	2018	250000
9427	83	Las Vegas	Nevada	2	2018	257000
9428	83	Las Vegas	Nevada	3	2018	265000
9429	83	Las Vegas	Nevada	4	2018	269900
9430	83	Las Vegas	Nevada	5	2018	272500
9431	83	Las Vegas	Nevada	6	2018	275000
9432	83	Las Vegas	Nevada	7	2018	272000
9433	83	Las Vegas	Nevada	8	2018	277500
9434	83	Las Vegas	Nevada	9	2018	279900
9435	83	Las Vegas	Nevada	10	2018	275200
9436	83	Las Vegas	Nevada	11	2018	278000
9437	83	Las Vegas	Nevada	12	2018	275000
9438	83	Las Vegas	Nevada	1	2019	0
9439	145	Augusta	Maine	1	2009	0
9440	145	Augusta	Maine	2	2009	108300
9441	145	Augusta	Maine	3	2009	108700
9442	145	Augusta	Maine	4	2009	109000
9443	145	Augusta	Maine	5	2009	109200
9444	145	Augusta	Maine	6	2009	109600
9445	145	Augusta	Maine	7	2009	110000
9446	145	Augusta	Maine	8	2009	110600
9447	145	Augusta	Maine	9	2009	111200
9448	145	Augusta	Maine	10	2009	111900
9449	145	Augusta	Maine	11	2009	112600
9450	145	Augusta	Maine	12	2009	113600
9451	145	Augusta	Maine	1	2010	114400
9452	145	Augusta	Maine	2	2010	114400
9453	145	Augusta	Maine	3	2010	115000
9454	145	Augusta	Maine	4	2010	116700
9455	145	Augusta	Maine	5	2010	118000
9456	145	Augusta	Maine	6	2010	118600
9457	145	Augusta	Maine	7	2010	118800
9458	145	Augusta	Maine	8	2010	118900
9459	145	Augusta	Maine	9	2010	118900
9460	145	Augusta	Maine	10	2010	118600
9461	145	Augusta	Maine	11	2010	117900
9462	145	Augusta	Maine	12	2010	116900
9463	145	Augusta	Maine	1	2011	116100
9464	145	Augusta	Maine	2	2011	115600
9465	145	Augusta	Maine	3	2011	115000
9466	145	Augusta	Maine	4	2011	114100
9467	145	Augusta	Maine	5	2011	113800
9468	145	Augusta	Maine	6	2011	113800
9469	145	Augusta	Maine	7	2011	114000
9470	145	Augusta	Maine	8	2011	114100
9471	145	Augusta	Maine	9	2011	114300
9472	145	Augusta	Maine	10	2011	114500
9473	145	Augusta	Maine	11	2011	114600
9474	145	Augusta	Maine	12	2011	114600
9475	145	Augusta	Maine	1	2012	114500
9476	145	Augusta	Maine	2	2012	114500
9477	145	Augusta	Maine	3	2012	114500
9478	145	Augusta	Maine	4	2012	114600
9479	145	Augusta	Maine	5	2012	114800
9480	145	Augusta	Maine	6	2012	115000
9481	145	Augusta	Maine	7	2012	115000
9482	145	Augusta	Maine	8	2012	115100
9483	145	Augusta	Maine	9	2012	115300
9484	145	Augusta	Maine	10	2012	115600
9485	145	Augusta	Maine	11	2012	115900
9486	145	Augusta	Maine	12	2012	116100
9487	145	Augusta	Maine	1	2013	116300
9488	145	Augusta	Maine	2	2013	116600
9489	145	Augusta	Maine	3	2013	116900
9490	145	Augusta	Maine	4	2013	116900
9491	145	Augusta	Maine	5	2013	116600
9492	145	Augusta	Maine	6	2013	116500
9493	145	Augusta	Maine	7	2013	116300
9494	145	Augusta	Maine	8	2013	116100
9495	145	Augusta	Maine	9	2013	116000
9496	145	Augusta	Maine	10	2013	115800
9497	145	Augusta	Maine	11	2013	115600
9498	145	Augusta	Maine	12	2013	115600
9499	145	Augusta	Maine	1	2014	115700
9500	145	Augusta	Maine	2	2014	116100
9501	145	Augusta	Maine	3	2014	116500
9502	145	Augusta	Maine	4	2014	117100
9503	145	Augusta	Maine	5	2014	117800
9504	145	Augusta	Maine	6	2014	118400
9505	145	Augusta	Maine	7	2014	118700
9506	145	Augusta	Maine	8	2014	118600
9507	145	Augusta	Maine	9	2014	118100
9508	145	Augusta	Maine	10	2014	117900
9509	145	Augusta	Maine	11	2014	118200
9510	145	Augusta	Maine	12	2014	118500
9511	145	Augusta	Maine	1	2015	119000
9512	145	Augusta	Maine	2	2015	119600
9513	145	Augusta	Maine	3	2015	120200
9514	145	Augusta	Maine	4	2015	120500
9515	145	Augusta	Maine	5	2015	120400
9516	145	Augusta	Maine	6	2015	120400
9517	145	Augusta	Maine	7	2015	120300
9518	145	Augusta	Maine	8	2015	119900
9519	145	Augusta	Maine	9	2015	119600
9520	145	Augusta	Maine	10	2015	119700
9521	145	Augusta	Maine	11	2015	120000
9522	145	Augusta	Maine	12	2015	120300
9523	145	Augusta	Maine	1	2016	120500
9524	145	Augusta	Maine	2	2016	120700
9525	145	Augusta	Maine	3	2016	121100
9526	145	Augusta	Maine	4	2016	121500
9527	145	Augusta	Maine	5	2016	121900
9528	145	Augusta	Maine	6	2016	122500
9529	145	Augusta	Maine	7	2016	123100
9530	145	Augusta	Maine	8	2016	123600
9531	145	Augusta	Maine	9	2016	124000
9532	145	Augusta	Maine	10	2016	124600
9533	145	Augusta	Maine	11	2016	125200
9534	145	Augusta	Maine	12	2016	125500
9535	145	Augusta	Maine	1	2017	125900
9536	145	Augusta	Maine	2	2017	126200
9537	145	Augusta	Maine	3	2017	126500
9538	145	Augusta	Maine	4	2017	127000
9539	145	Augusta	Maine	5	2017	127300
9540	145	Augusta	Maine	6	2017	127400
9541	145	Augusta	Maine	7	2017	127700
9542	145	Augusta	Maine	8	2017	128000
9543	145	Augusta	Maine	9	2017	128100
9544	145	Augusta	Maine	10	2017	128500
9545	145	Augusta	Maine	11	2017	129400
9546	145	Augusta	Maine	12	2017	130600
9547	145	Augusta	Maine	1	2018	131400
9548	145	Augusta	Maine	2	2018	132300
9549	145	Augusta	Maine	3	2018	133000
9550	145	Augusta	Maine	4	2018	133200
9551	145	Augusta	Maine	5	2018	133400
9552	145	Augusta	Maine	6	2018	133800
9553	145	Augusta	Maine	7	2018	134600
9554	145	Augusta	Maine	8	2018	136000
9555	145	Augusta	Maine	9	2018	137800
9556	145	Augusta	Maine	10	2018	138700
9557	145	Augusta	Maine	11	2018	139000
9558	145	Augusta	Maine	12	2018	139300
9559	145	Augusta	Maine	1	2019	139700
9560	155	Topeka	Kansas	1	2009	0
9561	155	Topeka	Kansas	2	2009	102200
9562	155	Topeka	Kansas	3	2009	102200
9563	155	Topeka	Kansas	4	2009	102100
9564	155	Topeka	Kansas	5	2009	101900
9565	155	Topeka	Kansas	6	2009	101800
9566	155	Topeka	Kansas	7	2009	101700
9567	155	Topeka	Kansas	8	2009	101700
9568	155	Topeka	Kansas	9	2009	101600
9569	155	Topeka	Kansas	10	2009	101700
9570	155	Topeka	Kansas	11	2009	101700
9571	155	Topeka	Kansas	12	2009	101800
9572	155	Topeka	Kansas	1	2010	101700
9573	155	Topeka	Kansas	2	2010	101700
9574	155	Topeka	Kansas	3	2010	102000
9575	155	Topeka	Kansas	4	2010	102100
9576	155	Topeka	Kansas	5	2010	102000
9577	155	Topeka	Kansas	6	2010	101800
9578	155	Topeka	Kansas	7	2010	101500
9579	155	Topeka	Kansas	8	2010	101000
9580	155	Topeka	Kansas	9	2010	100400
9581	155	Topeka	Kansas	10	2010	99900
9582	155	Topeka	Kansas	11	2010	99300
9583	155	Topeka	Kansas	12	2010	98800
9584	155	Topeka	Kansas	1	2011	98400
9585	155	Topeka	Kansas	2	2011	98100
9586	155	Topeka	Kansas	3	2011	97600
9587	155	Topeka	Kansas	4	2011	97300
9588	155	Topeka	Kansas	5	2011	97400
9589	155	Topeka	Kansas	6	2011	97400
9590	155	Topeka	Kansas	7	2011	97500
9591	155	Topeka	Kansas	8	2011	97800
9592	155	Topeka	Kansas	9	2011	98000
9593	155	Topeka	Kansas	10	2011	98100
9594	155	Topeka	Kansas	11	2011	98000
9595	155	Topeka	Kansas	12	2011	97800
9596	155	Topeka	Kansas	1	2012	97900
9597	155	Topeka	Kansas	2	2012	97500
9598	155	Topeka	Kansas	3	2012	96800
9599	155	Topeka	Kansas	4	2012	96300
9600	155	Topeka	Kansas	5	2012	96000
9601	155	Topeka	Kansas	6	2012	95400
9602	155	Topeka	Kansas	7	2012	94800
9603	155	Topeka	Kansas	8	2012	94300
9604	155	Topeka	Kansas	9	2012	93800
9605	155	Topeka	Kansas	10	2012	93800
9606	155	Topeka	Kansas	11	2012	94200
9607	155	Topeka	Kansas	12	2012	94200
9608	155	Topeka	Kansas	1	2013	93600
9609	155	Topeka	Kansas	2	2013	93100
9610	155	Topeka	Kansas	3	2013	93100
9611	155	Topeka	Kansas	4	2013	93100
9612	155	Topeka	Kansas	5	2013	92900
9613	155	Topeka	Kansas	6	2013	92700
9614	155	Topeka	Kansas	7	2013	92800
9615	155	Topeka	Kansas	8	2013	92800
9616	155	Topeka	Kansas	9	2013	93100
9617	155	Topeka	Kansas	10	2013	93500
9618	155	Topeka	Kansas	11	2013	93900
9619	155	Topeka	Kansas	12	2013	94800
9620	155	Topeka	Kansas	1	2014	95900
9621	155	Topeka	Kansas	2	2014	96400
9622	155	Topeka	Kansas	3	2014	96600
9623	155	Topeka	Kansas	4	2014	97000
9624	155	Topeka	Kansas	5	2014	97300
9625	155	Topeka	Kansas	6	2014	97400
9626	155	Topeka	Kansas	7	2014	97600
9627	155	Topeka	Kansas	8	2014	97700
9628	155	Topeka	Kansas	9	2014	97600
9629	155	Topeka	Kansas	10	2014	97300
9630	155	Topeka	Kansas	11	2014	96800
9631	155	Topeka	Kansas	12	2014	96100
9632	155	Topeka	Kansas	1	2015	95600
9633	155	Topeka	Kansas	2	2015	95500
9634	155	Topeka	Kansas	3	2015	96000
9635	155	Topeka	Kansas	4	2015	96600
9636	155	Topeka	Kansas	5	2015	96800
9637	155	Topeka	Kansas	6	2015	96900
9638	155	Topeka	Kansas	7	2015	97000
9639	155	Topeka	Kansas	8	2015	97400
9640	155	Topeka	Kansas	9	2015	97800
9641	155	Topeka	Kansas	10	2015	98100
9642	155	Topeka	Kansas	11	2015	97900
9643	155	Topeka	Kansas	12	2015	98000
9644	155	Topeka	Kansas	1	2016	98800
9645	155	Topeka	Kansas	2	2016	99600
9646	155	Topeka	Kansas	3	2016	99400
9647	155	Topeka	Kansas	4	2016	98800
9648	155	Topeka	Kansas	5	2016	98400
9649	155	Topeka	Kansas	6	2016	98800
9650	155	Topeka	Kansas	7	2016	99700
9651	155	Topeka	Kansas	8	2016	100400
9652	155	Topeka	Kansas	9	2016	100600
9653	155	Topeka	Kansas	10	2016	100300
9654	155	Topeka	Kansas	11	2016	100000
9655	155	Topeka	Kansas	12	2016	100400
9656	155	Topeka	Kansas	1	2017	101100
9657	155	Topeka	Kansas	2	2017	101500
9658	155	Topeka	Kansas	3	2017	101800
9659	155	Topeka	Kansas	4	2017	102400
9660	155	Topeka	Kansas	5	2017	102900
9661	155	Topeka	Kansas	6	2017	103900
9662	155	Topeka	Kansas	7	2017	104300
9663	155	Topeka	Kansas	8	2017	104300
9664	155	Topeka	Kansas	9	2017	104500
9665	155	Topeka	Kansas	10	2017	105000
9666	155	Topeka	Kansas	11	2017	106300
9667	155	Topeka	Kansas	12	2017	106300
9668	155	Topeka	Kansas	1	2018	105100
9669	155	Topeka	Kansas	2	2018	104300
9670	155	Topeka	Kansas	3	2018	105200
9671	155	Topeka	Kansas	4	2018	106200
9672	155	Topeka	Kansas	5	2018	107600
9673	155	Topeka	Kansas	6	2018	108600
9674	155	Topeka	Kansas	7	2018	109100
9675	155	Topeka	Kansas	8	2018	109500
9676	155	Topeka	Kansas	9	2018	110000
9677	155	Topeka	Kansas	10	2018	110600
9678	155	Topeka	Kansas	11	2018	111000
9679	155	Topeka	Kansas	12	2018	111000
9680	155	Topeka	Kansas	1	2019	111200
9681	153	Charleston	West Virginia	1	2009	0
9682	153	Charleston	West Virginia	2	2009	100100
9683	153	Charleston	West Virginia	3	2009	99900
9684	153	Charleston	West Virginia	4	2009	99700
9685	153	Charleston	West Virginia	5	2009	99500
9686	153	Charleston	West Virginia	6	2009	99300
9687	153	Charleston	West Virginia	7	2009	99300
9688	153	Charleston	West Virginia	8	2009	99500
9689	153	Charleston	West Virginia	9	2009	100000
9690	153	Charleston	West Virginia	10	2009	100500
9691	153	Charleston	West Virginia	11	2009	101000
9692	153	Charleston	West Virginia	12	2009	101700
9693	153	Charleston	West Virginia	1	2010	102400
9694	153	Charleston	West Virginia	2	2010	102700
9695	153	Charleston	West Virginia	3	2010	102200
9696	153	Charleston	West Virginia	4	2010	101600
9697	153	Charleston	West Virginia	5	2010	100900
9698	153	Charleston	West Virginia	6	2010	100400
9699	153	Charleston	West Virginia	7	2010	100200
9700	153	Charleston	West Virginia	8	2010	99900
9701	153	Charleston	West Virginia	9	2010	99000
9702	153	Charleston	West Virginia	10	2010	98300
9703	153	Charleston	West Virginia	11	2010	97700
9704	153	Charleston	West Virginia	12	2010	96900
9705	153	Charleston	West Virginia	1	2011	96400
9706	153	Charleston	West Virginia	2	2011	96200
9707	153	Charleston	West Virginia	3	2011	96200
9708	153	Charleston	West Virginia	4	2011	96600
9709	153	Charleston	West Virginia	5	2011	97200
9710	153	Charleston	West Virginia	6	2011	97600
9711	153	Charleston	West Virginia	7	2011	97100
9712	153	Charleston	West Virginia	8	2011	96700
9713	153	Charleston	West Virginia	9	2011	97300
9714	153	Charleston	West Virginia	10	2011	98100
9715	153	Charleston	West Virginia	11	2011	98400
9716	153	Charleston	West Virginia	12	2011	98700
9717	153	Charleston	West Virginia	1	2012	98800
9718	153	Charleston	West Virginia	2	2012	99200
9719	153	Charleston	West Virginia	3	2012	99800
9720	153	Charleston	West Virginia	4	2012	100400
9721	153	Charleston	West Virginia	5	2012	100500
9722	153	Charleston	West Virginia	6	2012	101000
9723	153	Charleston	West Virginia	7	2012	102500
9724	153	Charleston	West Virginia	8	2012	104000
9725	153	Charleston	West Virginia	9	2012	104300
9726	153	Charleston	West Virginia	10	2012	104000
9727	153	Charleston	West Virginia	11	2012	104400
9728	153	Charleston	West Virginia	12	2012	104900
9729	153	Charleston	West Virginia	1	2013	105100
9730	153	Charleston	West Virginia	2	2013	105000
9731	153	Charleston	West Virginia	3	2013	105100
9732	153	Charleston	West Virginia	4	2013	104700
9733	153	Charleston	West Virginia	5	2013	103600
9734	153	Charleston	West Virginia	6	2013	102400
9735	153	Charleston	West Virginia	7	2013	101900
9736	153	Charleston	West Virginia	8	2013	102100
9737	153	Charleston	West Virginia	9	2013	102400
9738	153	Charleston	West Virginia	10	2013	102100
9739	153	Charleston	West Virginia	11	2013	101900
9740	153	Charleston	West Virginia	12	2013	101800
9741	153	Charleston	West Virginia	1	2014	101900
9742	153	Charleston	West Virginia	2	2014	101800
9743	153	Charleston	West Virginia	3	2014	101000
9744	153	Charleston	West Virginia	4	2014	100200
9745	153	Charleston	West Virginia	5	2014	100700
9746	153	Charleston	West Virginia	6	2014	102100
9747	153	Charleston	West Virginia	7	2014	103000
9748	153	Charleston	West Virginia	8	2014	103100
9749	153	Charleston	West Virginia	9	2014	103500
9750	153	Charleston	West Virginia	10	2014	104500
9751	153	Charleston	West Virginia	11	2014	105100
9752	153	Charleston	West Virginia	12	2014	105000
9753	153	Charleston	West Virginia	1	2015	105300
9754	153	Charleston	West Virginia	2	2015	106200
9755	153	Charleston	West Virginia	3	2015	107000
9756	153	Charleston	West Virginia	4	2015	107800
9757	153	Charleston	West Virginia	5	2015	108600
9758	153	Charleston	West Virginia	6	2015	109300
9759	153	Charleston	West Virginia	7	2015	109800
9760	153	Charleston	West Virginia	8	2015	110300
9761	153	Charleston	West Virginia	9	2015	110700
9762	153	Charleston	West Virginia	10	2015	111500
9763	153	Charleston	West Virginia	11	2015	113100
9764	153	Charleston	West Virginia	12	2015	114700
9765	153	Charleston	West Virginia	1	2016	115800
9766	153	Charleston	West Virginia	2	2016	116500
9767	153	Charleston	West Virginia	3	2016	117200
9768	153	Charleston	West Virginia	4	2016	117900
9769	153	Charleston	West Virginia	5	2016	118400
9770	153	Charleston	West Virginia	6	2016	118000
9771	153	Charleston	West Virginia	7	2016	116900
9772	153	Charleston	West Virginia	8	2016	115700
9773	153	Charleston	West Virginia	9	2016	115500
9774	153	Charleston	West Virginia	10	2016	115400
9775	153	Charleston	West Virginia	11	2016	114800
9776	153	Charleston	West Virginia	12	2016	114100
9777	153	Charleston	West Virginia	1	2017	113700
9778	153	Charleston	West Virginia	2	2017	113600
9779	153	Charleston	West Virginia	3	2017	113500
9780	153	Charleston	West Virginia	4	2017	113800
9781	153	Charleston	West Virginia	5	2017	114300
9782	153	Charleston	West Virginia	6	2017	114800
9783	153	Charleston	West Virginia	7	2017	115100
9784	153	Charleston	West Virginia	8	2017	115600
9785	153	Charleston	West Virginia	9	2017	116300
9786	153	Charleston	West Virginia	10	2017	116800
9787	153	Charleston	West Virginia	11	2017	117000
9788	153	Charleston	West Virginia	12	2017	116900
9789	153	Charleston	West Virginia	1	2018	116300
9790	153	Charleston	West Virginia	2	2018	115200
9791	153	Charleston	West Virginia	3	2018	114600
9792	153	Charleston	West Virginia	4	2018	114300
9793	153	Charleston	West Virginia	5	2018	113900
9794	153	Charleston	West Virginia	6	2018	113700
9795	153	Charleston	West Virginia	7	2018	113400
9796	153	Charleston	West Virginia	8	2018	112500
9797	153	Charleston	West Virginia	9	2018	111200
9798	153	Charleston	West Virginia	10	2018	110000
9799	153	Charleston	West Virginia	11	2018	108900
9800	153	Charleston	West Virginia	12	2018	108300
9801	153	Charleston	West Virginia	1	2019	107900
9802	152	Springfield	Illinois	1	2009	0
9803	152	Springfield	Illinois	2	2009	97800
9804	152	Springfield	Illinois	3	2009	97700
9805	152	Springfield	Illinois	4	2009	97500
9806	152	Springfield	Illinois	5	2009	97400
9807	152	Springfield	Illinois	6	2009	97500
9808	152	Springfield	Illinois	7	2009	97700
9809	152	Springfield	Illinois	8	2009	98000
9810	152	Springfield	Illinois	9	2009	98200
9811	152	Springfield	Illinois	10	2009	98400
9812	152	Springfield	Illinois	11	2009	98500
9813	152	Springfield	Illinois	12	2009	99100
9814	152	Springfield	Illinois	1	2010	99500
9815	152	Springfield	Illinois	2	2010	98900
9816	152	Springfield	Illinois	3	2010	99200
9817	152	Springfield	Illinois	4	2010	100700
9818	152	Springfield	Illinois	5	2010	101000
9819	152	Springfield	Illinois	6	2010	100200
9820	152	Springfield	Illinois	7	2010	99800
9821	152	Springfield	Illinois	8	2010	99800
9822	152	Springfield	Illinois	9	2010	99900
9823	152	Springfield	Illinois	10	2010	99900
9824	152	Springfield	Illinois	11	2010	99500
9825	152	Springfield	Illinois	12	2010	99100
9826	152	Springfield	Illinois	1	2011	99200
9827	152	Springfield	Illinois	2	2011	99500
9828	152	Springfield	Illinois	3	2011	99500
9829	152	Springfield	Illinois	4	2011	99600
9830	152	Springfield	Illinois	5	2011	100200
9831	152	Springfield	Illinois	6	2011	100800
9832	152	Springfield	Illinois	7	2011	101300
9833	152	Springfield	Illinois	8	2011	101700
9834	152	Springfield	Illinois	9	2011	101900
9835	152	Springfield	Illinois	10	2011	101900
9836	152	Springfield	Illinois	11	2011	102000
9837	152	Springfield	Illinois	12	2011	101900
9838	152	Springfield	Illinois	1	2012	101900
9839	152	Springfield	Illinois	2	2012	101900
9840	152	Springfield	Illinois	3	2012	101600
9841	152	Springfield	Illinois	4	2012	101500
9842	152	Springfield	Illinois	5	2012	101700
9843	152	Springfield	Illinois	6	2012	101900
9844	152	Springfield	Illinois	7	2012	102000
9845	152	Springfield	Illinois	8	2012	102000
9846	152	Springfield	Illinois	9	2012	101900
9847	152	Springfield	Illinois	10	2012	102000
9848	152	Springfield	Illinois	11	2012	102300
9849	152	Springfield	Illinois	12	2012	102600
9850	152	Springfield	Illinois	1	2013	102800
9851	152	Springfield	Illinois	2	2013	102900
9852	152	Springfield	Illinois	3	2013	103000
9853	152	Springfield	Illinois	4	2013	103000
9854	152	Springfield	Illinois	5	2013	102800
9855	152	Springfield	Illinois	6	2013	102600
9856	152	Springfield	Illinois	7	2013	102400
9857	152	Springfield	Illinois	8	2013	102400
9858	152	Springfield	Illinois	9	2013	102300
9859	152	Springfield	Illinois	10	2013	102200
9860	152	Springfield	Illinois	11	2013	102100
9861	152	Springfield	Illinois	12	2013	101900
9862	152	Springfield	Illinois	1	2014	102000
9863	152	Springfield	Illinois	2	2014	102800
9864	152	Springfield	Illinois	3	2014	103500
9865	152	Springfield	Illinois	4	2014	103400
9866	152	Springfield	Illinois	5	2014	103300
9867	152	Springfield	Illinois	6	2014	103600
9868	152	Springfield	Illinois	7	2014	104200
9869	152	Springfield	Illinois	8	2014	104300
9870	152	Springfield	Illinois	9	2014	104300
9871	152	Springfield	Illinois	10	2014	104300
9872	152	Springfield	Illinois	11	2014	104500
9873	152	Springfield	Illinois	12	2014	104600
9874	152	Springfield	Illinois	1	2015	104300
9875	152	Springfield	Illinois	2	2015	104000
9876	152	Springfield	Illinois	3	2015	103600
9877	152	Springfield	Illinois	4	2015	103400
9878	152	Springfield	Illinois	5	2015	103400
9879	152	Springfield	Illinois	6	2015	103600
9880	152	Springfield	Illinois	7	2015	103500
9881	152	Springfield	Illinois	8	2015	103600
9882	152	Springfield	Illinois	9	2015	103400
9883	152	Springfield	Illinois	10	2015	103600
9884	152	Springfield	Illinois	11	2015	104300
9885	152	Springfield	Illinois	12	2015	105100
9886	152	Springfield	Illinois	1	2016	105300
9887	152	Springfield	Illinois	2	2016	105600
9888	152	Springfield	Illinois	3	2016	105900
9889	152	Springfield	Illinois	4	2016	106000
9890	152	Springfield	Illinois	5	2016	106100
9891	152	Springfield	Illinois	6	2016	106000
9892	152	Springfield	Illinois	7	2016	105700
9893	152	Springfield	Illinois	8	2016	105800
9894	152	Springfield	Illinois	9	2016	106200
9895	152	Springfield	Illinois	10	2016	106700
9896	152	Springfield	Illinois	11	2016	107000
9897	152	Springfield	Illinois	12	2016	107200
9898	152	Springfield	Illinois	1	2017	107500
9899	152	Springfield	Illinois	2	2017	107600
9900	152	Springfield	Illinois	3	2017	107600
9901	152	Springfield	Illinois	4	2017	107200
9902	152	Springfield	Illinois	5	2017	107300
9903	152	Springfield	Illinois	6	2017	107400
9904	152	Springfield	Illinois	7	2017	107400
9905	152	Springfield	Illinois	8	2017	107100
9906	152	Springfield	Illinois	9	2017	107100
9907	152	Springfield	Illinois	10	2017	107100
9908	152	Springfield	Illinois	11	2017	107100
9909	152	Springfield	Illinois	12	2017	107300
9910	152	Springfield	Illinois	1	2018	107600
9911	152	Springfield	Illinois	2	2018	107900
9912	152	Springfield	Illinois	3	2018	108100
9913	152	Springfield	Illinois	4	2018	108600
9914	152	Springfield	Illinois	5	2018	108900
9915	152	Springfield	Illinois	6	2018	109400
9916	152	Springfield	Illinois	7	2018	109600
9917	152	Springfield	Illinois	8	2018	109600
9918	152	Springfield	Illinois	9	2018	109800
9919	152	Springfield	Illinois	10	2018	109800
9920	152	Springfield	Illinois	11	2018	108800
9921	152	Springfield	Illinois	12	2018	107500
9922	152	Springfield	Illinois	1	2019	106800
9923	143	Montgomery	Alabama	1	2009	0
9924	143	Montgomery	Alabama	2	2009	99400
9925	143	Montgomery	Alabama	3	2009	99000
9926	143	Montgomery	Alabama	4	2009	98500
9927	143	Montgomery	Alabama	5	2009	97800
9928	143	Montgomery	Alabama	6	2009	97200
9929	143	Montgomery	Alabama	7	2009	96700
9930	143	Montgomery	Alabama	8	2009	96600
9931	143	Montgomery	Alabama	9	2009	96800
9932	143	Montgomery	Alabama	10	2009	97000
9933	143	Montgomery	Alabama	11	2009	97300
9934	143	Montgomery	Alabama	12	2009	97500
9935	143	Montgomery	Alabama	1	2010	97800
9936	143	Montgomery	Alabama	2	2010	98300
9937	143	Montgomery	Alabama	3	2010	98100
9938	143	Montgomery	Alabama	4	2010	97200
9939	143	Montgomery	Alabama	5	2010	96400
9940	143	Montgomery	Alabama	6	2010	96200
9941	143	Montgomery	Alabama	7	2010	95800
9942	143	Montgomery	Alabama	8	2010	95200
9943	143	Montgomery	Alabama	9	2010	94500
9944	143	Montgomery	Alabama	10	2010	93900
9945	143	Montgomery	Alabama	11	2010	93200
9946	143	Montgomery	Alabama	12	2010	92000
9947	143	Montgomery	Alabama	1	2011	90700
9948	143	Montgomery	Alabama	2	2011	90100
9949	143	Montgomery	Alabama	3	2011	90000
9950	143	Montgomery	Alabama	4	2011	89400
9951	143	Montgomery	Alabama	5	2011	88300
9952	143	Montgomery	Alabama	6	2011	87200
9953	143	Montgomery	Alabama	7	2011	86400
9954	143	Montgomery	Alabama	8	2011	85700
9955	143	Montgomery	Alabama	9	2011	84700
9956	143	Montgomery	Alabama	10	2011	83800
9957	143	Montgomery	Alabama	11	2011	83400
9958	143	Montgomery	Alabama	12	2011	83100
9959	143	Montgomery	Alabama	1	2012	82500
9960	143	Montgomery	Alabama	2	2012	81100
9961	143	Montgomery	Alabama	3	2012	79100
9962	143	Montgomery	Alabama	4	2012	77700
9963	143	Montgomery	Alabama	5	2012	77300
9964	143	Montgomery	Alabama	6	2012	77400
9965	143	Montgomery	Alabama	7	2012	77400
9966	143	Montgomery	Alabama	8	2012	77300
9967	143	Montgomery	Alabama	9	2012	77300
9968	143	Montgomery	Alabama	10	2012	77000
9969	143	Montgomery	Alabama	11	2012	76600
9970	143	Montgomery	Alabama	12	2012	76300
9971	143	Montgomery	Alabama	1	2013	76000
9972	143	Montgomery	Alabama	2	2013	75500
9973	143	Montgomery	Alabama	3	2013	75600
9974	143	Montgomery	Alabama	4	2013	76600
9975	143	Montgomery	Alabama	5	2013	77400
9976	143	Montgomery	Alabama	6	2013	77200
9977	143	Montgomery	Alabama	7	2013	77300
9978	143	Montgomery	Alabama	8	2013	77900
9979	143	Montgomery	Alabama	9	2013	78200
9980	143	Montgomery	Alabama	10	2013	78200
9981	143	Montgomery	Alabama	11	2013	78200
9982	143	Montgomery	Alabama	12	2013	78100
9983	143	Montgomery	Alabama	1	2014	78400
9984	143	Montgomery	Alabama	2	2014	79000
9985	143	Montgomery	Alabama	3	2014	79200
9986	143	Montgomery	Alabama	4	2014	79000
9987	143	Montgomery	Alabama	5	2014	78600
9988	143	Montgomery	Alabama	6	2014	78600
9989	143	Montgomery	Alabama	7	2014	78500
9990	143	Montgomery	Alabama	8	2014	77700
9991	143	Montgomery	Alabama	9	2014	76500
9992	143	Montgomery	Alabama	10	2014	75800
9993	143	Montgomery	Alabama	11	2014	75200
9994	143	Montgomery	Alabama	12	2014	74500
9995	143	Montgomery	Alabama	1	2015	73700
9996	143	Montgomery	Alabama	2	2015	73200
9997	143	Montgomery	Alabama	3	2015	73200
9998	143	Montgomery	Alabama	4	2015	73500
9999	143	Montgomery	Alabama	5	2015	73800
10000	143	Montgomery	Alabama	6	2015	73800
10001	143	Montgomery	Alabama	7	2015	73900
10002	143	Montgomery	Alabama	8	2015	74500
10003	143	Montgomery	Alabama	9	2015	75500
10004	143	Montgomery	Alabama	10	2015	76200
10005	143	Montgomery	Alabama	11	2015	77100
10006	143	Montgomery	Alabama	12	2015	78000
10007	143	Montgomery	Alabama	1	2016	78600
10008	143	Montgomery	Alabama	2	2016	78900
10009	143	Montgomery	Alabama	3	2016	79000
10010	143	Montgomery	Alabama	4	2016	78900
10011	143	Montgomery	Alabama	5	2016	78800
10012	143	Montgomery	Alabama	6	2016	78600
10013	143	Montgomery	Alabama	7	2016	78300
10014	143	Montgomery	Alabama	8	2016	78000
10015	143	Montgomery	Alabama	9	2016	78000
10016	143	Montgomery	Alabama	10	2016	78300
10017	143	Montgomery	Alabama	11	2016	78700
10018	143	Montgomery	Alabama	12	2016	78700
10019	143	Montgomery	Alabama	1	2017	78300
10020	143	Montgomery	Alabama	2	2017	77900
10021	143	Montgomery	Alabama	3	2017	77900
10022	143	Montgomery	Alabama	4	2017	78500
10023	143	Montgomery	Alabama	5	2017	79400
10024	143	Montgomery	Alabama	6	2017	80300
10025	143	Montgomery	Alabama	7	2017	80500
10026	143	Montgomery	Alabama	8	2017	80200
10027	143	Montgomery	Alabama	9	2017	79900
10028	143	Montgomery	Alabama	10	2017	79700
10029	143	Montgomery	Alabama	11	2017	79200
10030	143	Montgomery	Alabama	12	2017	78800
10031	143	Montgomery	Alabama	1	2018	79100
10032	143	Montgomery	Alabama	2	2018	79800
10033	143	Montgomery	Alabama	3	2018	80400
10034	143	Montgomery	Alabama	4	2018	80600
10035	143	Montgomery	Alabama	5	2018	80500
10036	143	Montgomery	Alabama	6	2018	80400
10037	143	Montgomery	Alabama	7	2018	80100
10038	143	Montgomery	Alabama	8	2018	80300
10039	143	Montgomery	Alabama	9	2018	80900
10040	143	Montgomery	Alabama	10	2018	81500
10041	143	Montgomery	Alabama	11	2018	81900
10042	143	Montgomery	Alabama	12	2018	82400
10043	143	Montgomery	Alabama	1	2019	83000
10044	154	Pittsburgh	Pennsylvania	1	2009	82700
10045	154	Pittsburgh	Pennsylvania	2	2009	82800
10046	154	Pittsburgh	Pennsylvania	3	2009	82700
10047	154	Pittsburgh	Pennsylvania	4	2009	82600
10048	154	Pittsburgh	Pennsylvania	5	2009	82400
10049	154	Pittsburgh	Pennsylvania	6	2009	82300
10050	154	Pittsburgh	Pennsylvania	7	2009	82100
10051	154	Pittsburgh	Pennsylvania	8	2009	82100
10052	154	Pittsburgh	Pennsylvania	9	2009	82200
10053	154	Pittsburgh	Pennsylvania	10	2009	82400
10054	154	Pittsburgh	Pennsylvania	11	2009	82500
10055	154	Pittsburgh	Pennsylvania	12	2009	82700
10056	154	Pittsburgh	Pennsylvania	1	2010	83000
10057	154	Pittsburgh	Pennsylvania	2	2010	83100
10058	154	Pittsburgh	Pennsylvania	3	2010	83000
10059	154	Pittsburgh	Pennsylvania	4	2010	83000
10060	154	Pittsburgh	Pennsylvania	5	2010	83100
10061	154	Pittsburgh	Pennsylvania	6	2010	83300
10062	154	Pittsburgh	Pennsylvania	7	2010	83100
10063	154	Pittsburgh	Pennsylvania	8	2010	83000
10064	154	Pittsburgh	Pennsylvania	9	2010	82900
10065	154	Pittsburgh	Pennsylvania	10	2010	82800
10066	154	Pittsburgh	Pennsylvania	11	2010	82800
10067	154	Pittsburgh	Pennsylvania	12	2010	82800
10068	154	Pittsburgh	Pennsylvania	1	2011	82700
10069	154	Pittsburgh	Pennsylvania	2	2011	82400
10070	154	Pittsburgh	Pennsylvania	3	2011	82400
10071	154	Pittsburgh	Pennsylvania	4	2011	82200
10072	154	Pittsburgh	Pennsylvania	5	2011	81600
10073	154	Pittsburgh	Pennsylvania	6	2011	81200
10074	154	Pittsburgh	Pennsylvania	7	2011	81000
10075	154	Pittsburgh	Pennsylvania	8	2011	80600
10076	154	Pittsburgh	Pennsylvania	9	2011	80200
10077	154	Pittsburgh	Pennsylvania	10	2011	79900
10078	154	Pittsburgh	Pennsylvania	11	2011	79600
10079	154	Pittsburgh	Pennsylvania	12	2011	79300
10080	154	Pittsburgh	Pennsylvania	1	2012	79000
10081	154	Pittsburgh	Pennsylvania	2	2012	78900
10082	154	Pittsburgh	Pennsylvania	3	2012	78800
10083	154	Pittsburgh	Pennsylvania	4	2012	78700
10084	154	Pittsburgh	Pennsylvania	5	2012	78700
10085	154	Pittsburgh	Pennsylvania	6	2012	78900
10086	154	Pittsburgh	Pennsylvania	7	2012	79100
10087	154	Pittsburgh	Pennsylvania	8	2012	79300
10088	154	Pittsburgh	Pennsylvania	9	2012	79600
10089	154	Pittsburgh	Pennsylvania	10	2012	80000
10090	154	Pittsburgh	Pennsylvania	11	2012	80500
10091	154	Pittsburgh	Pennsylvania	12	2012	81000
10092	154	Pittsburgh	Pennsylvania	1	2013	81400
10093	154	Pittsburgh	Pennsylvania	2	2013	81900
10094	154	Pittsburgh	Pennsylvania	3	2013	82500
10095	154	Pittsburgh	Pennsylvania	4	2013	83000
10096	154	Pittsburgh	Pennsylvania	5	2013	83600
10097	154	Pittsburgh	Pennsylvania	6	2013	84000
10098	154	Pittsburgh	Pennsylvania	7	2013	84300
10099	154	Pittsburgh	Pennsylvania	8	2013	84600
10100	154	Pittsburgh	Pennsylvania	9	2013	84500
10101	154	Pittsburgh	Pennsylvania	10	2013	84200
10102	154	Pittsburgh	Pennsylvania	11	2013	84200
10103	154	Pittsburgh	Pennsylvania	12	2013	84600
10104	154	Pittsburgh	Pennsylvania	1	2014	84900
10105	154	Pittsburgh	Pennsylvania	2	2014	85100
10106	154	Pittsburgh	Pennsylvania	3	2014	85500
10107	154	Pittsburgh	Pennsylvania	4	2014	86100
10108	154	Pittsburgh	Pennsylvania	5	2014	86600
10109	154	Pittsburgh	Pennsylvania	6	2014	87400
10110	154	Pittsburgh	Pennsylvania	7	2014	88400
10111	154	Pittsburgh	Pennsylvania	8	2014	89500
10112	154	Pittsburgh	Pennsylvania	9	2014	90500
10113	154	Pittsburgh	Pennsylvania	10	2014	91500
10114	154	Pittsburgh	Pennsylvania	11	2014	92400
10115	154	Pittsburgh	Pennsylvania	12	2014	93100
10116	154	Pittsburgh	Pennsylvania	1	2015	93500
10117	154	Pittsburgh	Pennsylvania	2	2015	93900
10118	154	Pittsburgh	Pennsylvania	3	2015	94600
10119	154	Pittsburgh	Pennsylvania	4	2015	95400
10120	154	Pittsburgh	Pennsylvania	5	2015	96400
10121	154	Pittsburgh	Pennsylvania	6	2015	97600
10122	154	Pittsburgh	Pennsylvania	7	2015	99000
10123	154	Pittsburgh	Pennsylvania	8	2015	100300
10124	154	Pittsburgh	Pennsylvania	9	2015	101900
10125	154	Pittsburgh	Pennsylvania	10	2015	103400
10126	154	Pittsburgh	Pennsylvania	11	2015	104700
10127	154	Pittsburgh	Pennsylvania	12	2015	106200
10128	154	Pittsburgh	Pennsylvania	1	2016	107800
10129	154	Pittsburgh	Pennsylvania	2	2016	109300
10130	154	Pittsburgh	Pennsylvania	3	2016	110500
10131	154	Pittsburgh	Pennsylvania	4	2016	111700
10132	154	Pittsburgh	Pennsylvania	5	2016	113100
10133	154	Pittsburgh	Pennsylvania	6	2016	114100
10134	154	Pittsburgh	Pennsylvania	7	2016	114700
10135	154	Pittsburgh	Pennsylvania	8	2016	115400
10136	154	Pittsburgh	Pennsylvania	9	2016	116400
10137	154	Pittsburgh	Pennsylvania	10	2016	117400
10138	154	Pittsburgh	Pennsylvania	11	2016	118200
10139	154	Pittsburgh	Pennsylvania	12	2016	118700
10140	154	Pittsburgh	Pennsylvania	1	2017	119200
10141	154	Pittsburgh	Pennsylvania	2	2017	120500
10142	154	Pittsburgh	Pennsylvania	3	2017	122300
10143	154	Pittsburgh	Pennsylvania	4	2017	124200
10144	154	Pittsburgh	Pennsylvania	5	2017	125600
10145	154	Pittsburgh	Pennsylvania	6	2017	126700
10146	154	Pittsburgh	Pennsylvania	7	2017	127900
10147	154	Pittsburgh	Pennsylvania	8	2017	129400
10148	154	Pittsburgh	Pennsylvania	9	2017	130800
10149	154	Pittsburgh	Pennsylvania	10	2017	132100
10150	154	Pittsburgh	Pennsylvania	11	2017	132900
10151	154	Pittsburgh	Pennsylvania	12	2017	134600
10152	154	Pittsburgh	Pennsylvania	1	2018	137500
10153	154	Pittsburgh	Pennsylvania	2	2018	139900
10154	154	Pittsburgh	Pennsylvania	3	2018	141500
10155	154	Pittsburgh	Pennsylvania	4	2018	142900
10156	154	Pittsburgh	Pennsylvania	5	2018	144200
10157	154	Pittsburgh	Pennsylvania	6	2018	145200
10158	154	Pittsburgh	Pennsylvania	7	2018	146400
10159	154	Pittsburgh	Pennsylvania	8	2018	147200
10160	154	Pittsburgh	Pennsylvania	9	2018	148200
10161	154	Pittsburgh	Pennsylvania	10	2018	149500
10162	154	Pittsburgh	Pennsylvania	11	2018	150400
10163	154	Pittsburgh	Pennsylvania	12	2018	150500
10164	154	Pittsburgh	Pennsylvania	1	2019	0
10165	157	Lansing	Michigan	1	2009	0
10166	157	Lansing	Michigan	2	2009	83800
10167	157	Lansing	Michigan	3	2009	82600
10168	157	Lansing	Michigan	4	2009	81600
10169	157	Lansing	Michigan	5	2009	80600
10170	157	Lansing	Michigan	6	2009	79700
10171	157	Lansing	Michigan	7	2009	79100
10172	157	Lansing	Michigan	8	2009	78600
10173	157	Lansing	Michigan	9	2009	77900
10174	157	Lansing	Michigan	10	2009	77200
10175	157	Lansing	Michigan	11	2009	76600
10176	157	Lansing	Michigan	12	2009	76300
10177	157	Lansing	Michigan	1	2010	75200
10178	157	Lansing	Michigan	2	2010	74600
10179	157	Lansing	Michigan	3	2010	74100
10180	157	Lansing	Michigan	4	2010	72800
10181	157	Lansing	Michigan	5	2010	71300
10182	157	Lansing	Michigan	6	2010	70900
10183	157	Lansing	Michigan	7	2010	69600
10184	157	Lansing	Michigan	8	2010	68000
10185	157	Lansing	Michigan	9	2010	66900
10186	157	Lansing	Michigan	10	2010	65700
10187	157	Lansing	Michigan	11	2010	64200
10188	157	Lansing	Michigan	12	2010	62800
10189	157	Lansing	Michigan	1	2011	61500
10190	157	Lansing	Michigan	2	2011	60200
10191	157	Lansing	Michigan	3	2011	59600
10192	157	Lansing	Michigan	4	2011	59000
10193	157	Lansing	Michigan	5	2011	58100
10194	157	Lansing	Michigan	6	2011	57400
10195	157	Lansing	Michigan	7	2011	57400
10196	157	Lansing	Michigan	8	2011	57300
10197	157	Lansing	Michigan	9	2011	57200
10198	157	Lansing	Michigan	10	2011	57700
10199	157	Lansing	Michigan	11	2011	58200
10200	157	Lansing	Michigan	12	2011	58100
10201	157	Lansing	Michigan	1	2012	58200
10202	157	Lansing	Michigan	2	2012	58500
10203	157	Lansing	Michigan	3	2012	58700
10204	157	Lansing	Michigan	4	2012	58800
10205	157	Lansing	Michigan	5	2012	58900
10206	157	Lansing	Michigan	6	2012	57900
10207	157	Lansing	Michigan	7	2012	56000
10208	157	Lansing	Michigan	8	2012	54800
10209	157	Lansing	Michigan	9	2012	54400
10210	157	Lansing	Michigan	10	2012	53700
10211	157	Lansing	Michigan	11	2012	52900
10212	157	Lansing	Michigan	12	2012	52400
10213	157	Lansing	Michigan	1	2013	52200
10214	157	Lansing	Michigan	2	2013	51800
10215	157	Lansing	Michigan	3	2013	51500
10216	157	Lansing	Michigan	4	2013	51700
10217	157	Lansing	Michigan	5	2013	52500
10218	157	Lansing	Michigan	6	2013	53800
10219	157	Lansing	Michigan	7	2013	55700
10220	157	Lansing	Michigan	8	2013	57300
10221	157	Lansing	Michigan	9	2013	57700
10222	157	Lansing	Michigan	10	2013	57800
10223	157	Lansing	Michigan	11	2013	58500
10224	157	Lansing	Michigan	12	2013	59400
10225	157	Lansing	Michigan	1	2014	60100
10226	157	Lansing	Michigan	2	2014	60800
10227	157	Lansing	Michigan	3	2014	61800
10228	157	Lansing	Michigan	4	2014	62400
10229	157	Lansing	Michigan	5	2014	62000
10230	157	Lansing	Michigan	6	2014	61600
10231	157	Lansing	Michigan	7	2014	61500
10232	157	Lansing	Michigan	8	2014	61500
10233	157	Lansing	Michigan	9	2014	61500
10234	157	Lansing	Michigan	10	2014	61700
10235	157	Lansing	Michigan	11	2014	61900
10236	157	Lansing	Michigan	12	2014	62100
10237	157	Lansing	Michigan	1	2015	62300
10238	157	Lansing	Michigan	2	2015	62400
10239	157	Lansing	Michigan	3	2015	62300
10240	157	Lansing	Michigan	4	2015	62300
10241	157	Lansing	Michigan	5	2015	62400
10242	157	Lansing	Michigan	6	2015	61800
10243	157	Lansing	Michigan	7	2015	61200
10244	157	Lansing	Michigan	8	2015	60800
10245	157	Lansing	Michigan	9	2015	61000
10246	157	Lansing	Michigan	10	2015	61400
10247	157	Lansing	Michigan	11	2015	61500
10248	157	Lansing	Michigan	12	2015	61600
10249	157	Lansing	Michigan	1	2016	62100
10250	157	Lansing	Michigan	2	2016	62300
10251	157	Lansing	Michigan	3	2016	62300
10252	157	Lansing	Michigan	4	2016	62900
10253	157	Lansing	Michigan	5	2016	63900
10254	157	Lansing	Michigan	6	2016	64800
10255	157	Lansing	Michigan	7	2016	65600
10256	157	Lansing	Michigan	8	2016	66300
10257	157	Lansing	Michigan	9	2016	66800
10258	157	Lansing	Michigan	10	2016	67100
10259	157	Lansing	Michigan	11	2016	68000
10260	157	Lansing	Michigan	12	2016	69000
10261	157	Lansing	Michigan	1	2017	69900
10262	157	Lansing	Michigan	2	2017	70900
10263	157	Lansing	Michigan	3	2017	71600
10264	157	Lansing	Michigan	4	2017	72000
10265	157	Lansing	Michigan	5	2017	72500
10266	157	Lansing	Michigan	6	2017	73200
10267	157	Lansing	Michigan	7	2017	74200
10268	157	Lansing	Michigan	8	2017	75400
10269	157	Lansing	Michigan	9	2017	76400
10270	157	Lansing	Michigan	10	2017	77200
10271	157	Lansing	Michigan	11	2017	78200
10272	157	Lansing	Michigan	12	2017	78900
10273	157	Lansing	Michigan	1	2018	79500
10274	157	Lansing	Michigan	2	2018	80400
10275	157	Lansing	Michigan	3	2018	80900
10276	157	Lansing	Michigan	4	2018	81500
10277	157	Lansing	Michigan	5	2018	82600
10278	157	Lansing	Michigan	6	2018	83800
10279	157	Lansing	Michigan	7	2018	84600
10280	157	Lansing	Michigan	8	2018	85600
10281	157	Lansing	Michigan	9	2018	86800
10282	157	Lansing	Michigan	10	2018	87600
10283	157	Lansing	Michigan	11	2018	87600
10284	157	Lansing	Michigan	12	2018	87300
10285	157	Lansing	Michigan	1	2019	87300
10286	1	Birmingham	Alabama	1	2009	0
10287	1	Birmingham	Alabama	2	2009	0
10288	1	Birmingham	Alabama	3	2009	0
10289	1	Birmingham	Alabama	4	2009	0
10290	1	Birmingham	Alabama	5	2009	0
10291	1	Birmingham	Alabama	6	2009	0
10292	1	Birmingham	Alabama	7	2009	0
10293	1	Birmingham	Alabama	8	2009	0
10294	1	Birmingham	Alabama	9	2009	0
10295	1	Birmingham	Alabama	10	2009	0
10296	1	Birmingham	Alabama	11	2009	0
10297	1	Birmingham	Alabama	12	2009	0
10298	1	Birmingham	Alabama	1	2010	0
10299	1	Birmingham	Alabama	2	2010	0
10300	1	Birmingham	Alabama	3	2010	0
10301	1	Birmingham	Alabama	4	2010	0
10302	1	Birmingham	Alabama	5	2010	0
10303	1	Birmingham	Alabama	6	2010	0
10304	1	Birmingham	Alabama	7	2010	0
10305	1	Birmingham	Alabama	8	2010	0
10306	1	Birmingham	Alabama	9	2010	0
10307	1	Birmingham	Alabama	10	2010	0
10308	1	Birmingham	Alabama	11	2010	196100
10309	1	Birmingham	Alabama	12	2010	0
10310	1	Birmingham	Alabama	1	2011	0
10311	1	Birmingham	Alabama	2	2011	0
10312	1	Birmingham	Alabama	3	2011	0
10313	1	Birmingham	Alabama	4	2011	0
10314	1	Birmingham	Alabama	5	2011	0
10315	1	Birmingham	Alabama	6	2011	0
10316	1	Birmingham	Alabama	7	2011	0
10317	1	Birmingham	Alabama	8	2011	0
10318	1	Birmingham	Alabama	9	2011	0
10319	1	Birmingham	Alabama	10	2011	0
10320	1	Birmingham	Alabama	11	2011	0
10321	1	Birmingham	Alabama	12	2011	0
10322	1	Birmingham	Alabama	1	2012	125000
10323	1	Birmingham	Alabama	2	2012	132700
10324	1	Birmingham	Alabama	3	2012	140000
10325	1	Birmingham	Alabama	4	2012	138000
10326	1	Birmingham	Alabama	5	2012	154250
10327	1	Birmingham	Alabama	6	2012	165000
10328	1	Birmingham	Alabama	7	2012	161174
10329	1	Birmingham	Alabama	8	2012	155000
10330	1	Birmingham	Alabama	9	2012	159900
10331	1	Birmingham	Alabama	10	2012	149900
10332	1	Birmingham	Alabama	11	2012	156590
10333	1	Birmingham	Alabama	12	2012	153250
10334	1	Birmingham	Alabama	1	2013	140000
10335	1	Birmingham	Alabama	2	2013	140108
10336	1	Birmingham	Alabama	3	2013	142000
10337	1	Birmingham	Alabama	4	2013	154000
10338	1	Birmingham	Alabama	5	2013	168827
10339	1	Birmingham	Alabama	6	2013	183283
10340	1	Birmingham	Alabama	7	2013	180038
10341	1	Birmingham	Alabama	8	2013	170319
10342	1	Birmingham	Alabama	9	2013	166000
10343	1	Birmingham	Alabama	10	2013	159675
10344	1	Birmingham	Alabama	11	2013	162000
10345	1	Birmingham	Alabama	12	2013	156664
10346	1	Birmingham	Alabama	1	2014	147900
10347	1	Birmingham	Alabama	2	2014	150000
10348	1	Birmingham	Alabama	3	2014	155000
10349	1	Birmingham	Alabama	4	2014	160000
10350	1	Birmingham	Alabama	5	2014	166900
10351	1	Birmingham	Alabama	6	2014	173500
10352	1	Birmingham	Alabama	7	2014	175441
10353	1	Birmingham	Alabama	8	2014	171325
10354	1	Birmingham	Alabama	9	2014	172000
10355	1	Birmingham	Alabama	10	2014	169900
10356	1	Birmingham	Alabama	11	2014	159777
10357	1	Birmingham	Alabama	12	2014	175250
10358	1	Birmingham	Alabama	1	2015	155838
10359	1	Birmingham	Alabama	2	2015	160055
10360	1	Birmingham	Alabama	3	2015	167955
10361	1	Birmingham	Alabama	4	2015	175000
10362	1	Birmingham	Alabama	5	2015	189122
10363	1	Birmingham	Alabama	6	2015	188000
10364	1	Birmingham	Alabama	7	2015	179257
10365	1	Birmingham	Alabama	8	2015	186220
10366	1	Birmingham	Alabama	9	2015	174700
10367	1	Birmingham	Alabama	10	2015	166493
10368	1	Birmingham	Alabama	11	2015	161000
10369	1	Birmingham	Alabama	12	2015	165083
10370	1	Birmingham	Alabama	1	2016	163000
10371	1	Birmingham	Alabama	2	2016	166247
10372	1	Birmingham	Alabama	3	2016	171400
10373	1	Birmingham	Alabama	4	2016	177500
10374	1	Birmingham	Alabama	5	2016	185000
10375	1	Birmingham	Alabama	6	2016	194486
10376	1	Birmingham	Alabama	7	2016	189997
10377	1	Birmingham	Alabama	8	2016	177625
10378	1	Birmingham	Alabama	9	2016	179903
10379	1	Birmingham	Alabama	10	2016	180000
10380	1	Birmingham	Alabama	11	2016	170210
10381	1	Birmingham	Alabama	12	2016	176397
10382	1	Birmingham	Alabama	1	2017	179025
10383	1	Birmingham	Alabama	2	2017	167188
10384	1	Birmingham	Alabama	3	2017	168550
10385	1	Birmingham	Alabama	4	2017	187540
10386	1	Birmingham	Alabama	5	2017	197050
10387	1	Birmingham	Alabama	6	2017	200000
10388	1	Birmingham	Alabama	7	2017	191800
10389	1	Birmingham	Alabama	8	2017	194900
10390	1	Birmingham	Alabama	9	2017	188070
10391	1	Birmingham	Alabama	10	2017	192000
10392	1	Birmingham	Alabama	11	2017	175045
10393	1	Birmingham	Alabama	12	2017	192385
10394	1	Birmingham	Alabama	1	2018	175165
10395	1	Birmingham	Alabama	2	2018	186975
10396	1	Birmingham	Alabama	3	2018	192650
10397	1	Birmingham	Alabama	4	2018	189900
10398	1	Birmingham	Alabama	5	2018	210200
10399	1	Birmingham	Alabama	6	2018	209095
10400	1	Birmingham	Alabama	7	2018	210196
10401	1	Birmingham	Alabama	8	2018	200000
10402	1	Birmingham	Alabama	9	2018	196675
10403	1	Birmingham	Alabama	10	2018	195000
10404	1	Birmingham	Alabama	11	2018	194000
10405	1	Birmingham	Alabama	12	2018	196975
10406	1	Birmingham	Alabama	1	2019	0
10407	2	Helena	Alabama	1	2009	0
10408	2	Helena	Alabama	2	2009	0
10409	2	Helena	Alabama	3	2009	0
10410	2	Helena	Alabama	4	2009	0
10411	2	Helena	Alabama	5	2009	0
10412	2	Helena	Alabama	6	2009	0
10413	2	Helena	Alabama	7	2009	0
10414	2	Helena	Alabama	8	2009	0
10415	2	Helena	Alabama	9	2009	0
10416	2	Helena	Alabama	10	2009	0
10417	2	Helena	Alabama	11	2009	0
10418	2	Helena	Alabama	12	2009	0
10419	2	Helena	Alabama	1	2010	0
10420	2	Helena	Alabama	2	2010	0
10421	2	Helena	Alabama	3	2010	0
10422	2	Helena	Alabama	4	2010	0
10423	2	Helena	Alabama	5	2010	0
10424	2	Helena	Alabama	6	2010	0
10425	2	Helena	Alabama	7	2010	0
10426	2	Helena	Alabama	8	2010	0
10427	2	Helena	Alabama	9	2010	0
10428	2	Helena	Alabama	10	2010	0
10429	2	Helena	Alabama	11	2010	0
10430	2	Helena	Alabama	12	2010	0
10431	2	Helena	Alabama	1	2011	0
10432	2	Helena	Alabama	2	2011	0
10433	2	Helena	Alabama	3	2011	0
10434	2	Helena	Alabama	4	2011	0
10435	2	Helena	Alabama	5	2011	0
10436	2	Helena	Alabama	6	2011	0
10437	2	Helena	Alabama	7	2011	0
10438	2	Helena	Alabama	8	2011	0
10439	2	Helena	Alabama	9	2011	0
10440	2	Helena	Alabama	10	2011	0
10441	2	Helena	Alabama	11	2011	0
10442	2	Helena	Alabama	12	2011	0
10443	2	Helena	Alabama	1	2012	265000
10444	2	Helena	Alabama	2	2012	285000
10445	2	Helena	Alabama	3	2012	275000
10446	2	Helena	Alabama	4	2012	301100
10447	2	Helena	Alabama	5	2012	289850
10448	2	Helena	Alabama	6	2012	294500
10449	2	Helena	Alabama	7	2012	280000
10450	2	Helena	Alabama	8	2012	275000
10451	2	Helena	Alabama	9	2012	240000
10452	2	Helena	Alabama	10	2012	254000
10453	2	Helena	Alabama	11	2012	240000
10454	2	Helena	Alabama	12	2012	243750
10455	2	Helena	Alabama	1	2013	250000
10456	2	Helena	Alabama	2	2013	250000
10457	2	Helena	Alabama	3	2013	282000
10458	2	Helena	Alabama	4	2013	282000
10459	2	Helena	Alabama	5	2013	279000
10460	2	Helena	Alabama	6	2013	225424
10461	2	Helena	Alabama	7	2013	238000
10462	2	Helena	Alabama	8	2013	255000
10463	2	Helena	Alabama	9	2013	295000
10464	2	Helena	Alabama	10	2013	255000
10465	2	Helena	Alabama	11	2013	231412
10466	2	Helena	Alabama	12	2013	209400
10467	2	Helena	Alabama	1	2014	271525
10468	2	Helena	Alabama	2	2014	252000
10469	2	Helena	Alabama	3	2014	177987
10470	2	Helena	Alabama	4	2014	202487
10471	2	Helena	Alabama	5	2014	247000
10472	2	Helena	Alabama	6	2014	262127
10473	2	Helena	Alabama	7	2014	262127
10474	2	Helena	Alabama	8	2014	271000
10475	2	Helena	Alabama	9	2014	250350
10476	2	Helena	Alabama	10	2014	210000
10477	2	Helena	Alabama	11	2014	183600
10478	2	Helena	Alabama	12	2014	201500
10479	2	Helena	Alabama	1	2015	183750
10480	2	Helena	Alabama	2	2015	201500
10481	2	Helena	Alabama	3	2015	170400
10482	2	Helena	Alabama	4	2015	225000
10483	2	Helena	Alabama	5	2015	283500
10484	2	Helena	Alabama	6	2015	295500
10485	2	Helena	Alabama	7	2015	299000
10486	2	Helena	Alabama	8	2015	293000
10487	2	Helena	Alabama	9	2015	290000
10488	2	Helena	Alabama	10	2015	267875
10489	2	Helena	Alabama	11	2015	224000
10490	2	Helena	Alabama	12	2015	220000
10491	2	Helena	Alabama	1	2016	209000
10492	2	Helena	Alabama	2	2016	186250
10493	2	Helena	Alabama	3	2016	166250
10494	2	Helena	Alabama	4	2016	229900
10495	2	Helena	Alabama	5	2016	239900
10496	2	Helena	Alabama	6	2016	253250
10497	2	Helena	Alabama	7	2016	282000
10498	2	Helena	Alabama	8	2016	282375
10499	2	Helena	Alabama	9	2016	245000
10500	2	Helena	Alabama	10	2016	246000
10501	2	Helena	Alabama	11	2016	247000
10502	2	Helena	Alabama	12	2016	258136
10503	2	Helena	Alabama	1	2017	251612
10504	2	Helena	Alabama	2	2017	256632
10505	2	Helena	Alabama	3	2017	271632
10506	2	Helena	Alabama	4	2017	250807
10507	2	Helena	Alabama	5	2017	268000
10508	2	Helena	Alabama	6	2017	282500
10509	2	Helena	Alabama	7	2017	293000
10510	2	Helena	Alabama	8	2017	297250
10511	2	Helena	Alabama	9	2017	275000
10512	2	Helena	Alabama	10	2017	274900
10513	2	Helena	Alabama	11	2017	263000
10514	2	Helena	Alabama	12	2017	274900
10515	2	Helena	Alabama	1	2018	275000
10516	2	Helena	Alabama	2	2018	277500
10517	2	Helena	Alabama	3	2018	280000
10518	2	Helena	Alabama	4	2018	284665
10519	2	Helena	Alabama	5	2018	289665
10520	2	Helena	Alabama	6	2018	289665
10521	2	Helena	Alabama	7	2018	255000
10522	2	Helena	Alabama	8	2018	262500
10523	2	Helena	Alabama	9	2018	280000
10524	2	Helena	Alabama	10	2018	289500
10525	2	Helena	Alabama	11	2018	289000
10526	2	Helena	Alabama	12	2018	274500
10527	2	Helena	Alabama	1	2019	0
10528	3	Peoria	Arizona	1	2009	0
10529	3	Peoria	Arizona	2	2009	0
10530	3	Peoria	Arizona	3	2009	0
10531	3	Peoria	Arizona	4	2009	0
10532	3	Peoria	Arizona	5	2009	0
10533	3	Peoria	Arizona	6	2009	0
10534	3	Peoria	Arizona	7	2009	0
10535	3	Peoria	Arizona	8	2009	0
10536	3	Peoria	Arizona	9	2009	0
10537	3	Peoria	Arizona	10	2009	0
10538	3	Peoria	Arizona	11	2009	0
10539	3	Peoria	Arizona	12	2009	0
10540	3	Peoria	Arizona	1	2010	0
10541	3	Peoria	Arizona	2	2010	0
10542	3	Peoria	Arizona	3	2010	0
10543	3	Peoria	Arizona	4	2010	0
10544	3	Peoria	Arizona	5	2010	0
10545	3	Peoria	Arizona	6	2010	0
10546	3	Peoria	Arizona	7	2010	0
10547	3	Peoria	Arizona	8	2010	0
10548	3	Peoria	Arizona	9	2010	0
10549	3	Peoria	Arizona	10	2010	0
10550	3	Peoria	Arizona	11	2010	0
10551	3	Peoria	Arizona	12	2010	0
10552	3	Peoria	Arizona	1	2011	0
10553	3	Peoria	Arizona	2	2011	0
10554	3	Peoria	Arizona	3	2011	0
10555	3	Peoria	Arizona	4	2011	0
10556	3	Peoria	Arizona	5	2011	0
10557	3	Peoria	Arizona	6	2011	0
10558	3	Peoria	Arizona	7	2011	0
10559	3	Peoria	Arizona	8	2011	0
10560	3	Peoria	Arizona	9	2011	0
10561	3	Peoria	Arizona	10	2011	0
10562	3	Peoria	Arizona	11	2011	0
10563	3	Peoria	Arizona	12	2011	0
10564	3	Peoria	Arizona	1	2012	135350
10565	3	Peoria	Arizona	2	2012	135000
10566	3	Peoria	Arizona	3	2012	149000
10567	3	Peoria	Arizona	4	2012	155000
10568	3	Peoria	Arizona	5	2012	162500
10569	3	Peoria	Arizona	6	2012	160300
10570	3	Peoria	Arizona	7	2012	165500
10571	3	Peoria	Arizona	8	2012	160000
10572	3	Peoria	Arizona	9	2012	169500
10573	3	Peoria	Arizona	10	2012	172750
10574	3	Peoria	Arizona	11	2012	170000
10575	3	Peoria	Arizona	12	2012	175000
10576	3	Peoria	Arizona	1	2013	160000
10577	3	Peoria	Arizona	2	2013	175000
10578	3	Peoria	Arizona	3	2013	186250
10579	3	Peoria	Arizona	4	2013	188250
10580	3	Peoria	Arizona	5	2013	192000
10581	3	Peoria	Arizona	6	2013	189625
10582	3	Peoria	Arizona	7	2013	200000
10583	3	Peoria	Arizona	8	2013	196000
10584	3	Peoria	Arizona	9	2013	220000
10585	3	Peoria	Arizona	10	2013	194000
10586	3	Peoria	Arizona	11	2013	210000
10587	3	Peoria	Arizona	12	2013	199950
10588	3	Peoria	Arizona	1	2014	207250
10589	3	Peoria	Arizona	2	2014	210000
10590	3	Peoria	Arizona	3	2014	214569
10591	3	Peoria	Arizona	4	2014	209500
10592	3	Peoria	Arizona	5	2014	219900
10593	3	Peoria	Arizona	6	2014	217000
10594	3	Peoria	Arizona	7	2014	215000
10595	3	Peoria	Arizona	8	2014	227000
10596	3	Peoria	Arizona	9	2014	211500
10597	3	Peoria	Arizona	10	2014	221995
10598	3	Peoria	Arizona	11	2014	202000
10599	3	Peoria	Arizona	12	2014	228000
10600	3	Peoria	Arizona	1	2015	209500
10601	3	Peoria	Arizona	2	2015	234570
10602	3	Peoria	Arizona	3	2015	228750
10603	3	Peoria	Arizona	4	2015	226052
10604	3	Peoria	Arizona	5	2015	245000
10605	3	Peoria	Arizona	6	2015	229450
10606	3	Peoria	Arizona	7	2015	221000
10607	3	Peoria	Arizona	8	2015	228250
10608	3	Peoria	Arizona	9	2015	224950
10609	3	Peoria	Arizona	10	2015	233595
10610	3	Peoria	Arizona	11	2015	214450
10611	3	Peoria	Arizona	12	2015	233000
10612	3	Peoria	Arizona	1	2016	235886
10613	3	Peoria	Arizona	2	2016	226500
10614	3	Peoria	Arizona	3	2016	225950
10615	3	Peoria	Arizona	4	2016	232000
10616	3	Peoria	Arizona	5	2016	255000
10617	3	Peoria	Arizona	6	2016	250000
10618	3	Peoria	Arizona	7	2016	239900
10619	3	Peoria	Arizona	8	2016	250000
10620	3	Peoria	Arizona	9	2016	260000
10621	3	Peoria	Arizona	10	2016	242000
10622	3	Peoria	Arizona	11	2016	254368
10623	3	Peoria	Arizona	12	2016	240000
10624	3	Peoria	Arizona	1	2017	248500
10625	3	Peoria	Arizona	2	2017	255000
10626	3	Peoria	Arizona	3	2017	255000
10627	3	Peoria	Arizona	4	2017	255000
10628	3	Peoria	Arizona	5	2017	259900
10629	3	Peoria	Arizona	6	2017	265145
10630	3	Peoria	Arizona	7	2017	260000
10631	3	Peoria	Arizona	8	2017	255642
10632	3	Peoria	Arizona	9	2017	275000
10633	3	Peoria	Arizona	10	2017	272363
10634	3	Peoria	Arizona	11	2017	259900
10635	3	Peoria	Arizona	12	2017	265000
10636	3	Peoria	Arizona	1	2018	268950
10637	3	Peoria	Arizona	2	2018	276000
10638	3	Peoria	Arizona	3	2018	280000
10639	3	Peoria	Arizona	4	2018	274945
10640	3	Peoria	Arizona	5	2018	279825
10641	3	Peoria	Arizona	6	2018	290000
10642	3	Peoria	Arizona	7	2018	294495
10643	3	Peoria	Arizona	8	2018	289900
10644	3	Peoria	Arizona	9	2018	285000
10645	3	Peoria	Arizona	10	2018	279950
10646	3	Peoria	Arizona	11	2018	284500
10647	3	Peoria	Arizona	12	2018	295000
10648	3	Peoria	Arizona	1	2019	0
10649	4	Phoenix	Arizona	1	2009	0
10650	4	Phoenix	Arizona	2	2009	0
10651	4	Phoenix	Arizona	3	2009	0
10652	4	Phoenix	Arizona	4	2009	0
10653	4	Phoenix	Arizona	5	2009	0
10654	4	Phoenix	Arizona	6	2009	0
10655	4	Phoenix	Arizona	7	2009	0
10656	4	Phoenix	Arizona	8	2009	0
10657	4	Phoenix	Arizona	9	2009	0
10658	4	Phoenix	Arizona	10	2009	0
10659	4	Phoenix	Arizona	11	2009	0
10660	4	Phoenix	Arizona	12	2009	0
10661	4	Phoenix	Arizona	1	2010	0
10662	4	Phoenix	Arizona	2	2010	0
10663	4	Phoenix	Arizona	3	2010	0
10664	4	Phoenix	Arizona	4	2010	0
10665	4	Phoenix	Arizona	5	2010	0
10666	4	Phoenix	Arizona	6	2010	0
10667	4	Phoenix	Arizona	7	2010	0
10668	4	Phoenix	Arizona	8	2010	0
10669	4	Phoenix	Arizona	9	2010	0
10670	4	Phoenix	Arizona	10	2010	0
10671	4	Phoenix	Arizona	11	2010	0
10672	4	Phoenix	Arizona	12	2010	0
10673	4	Phoenix	Arizona	1	2011	0
10674	4	Phoenix	Arizona	2	2011	0
10675	4	Phoenix	Arizona	3	2011	0
10676	4	Phoenix	Arizona	4	2011	0
10677	4	Phoenix	Arizona	5	2011	0
10678	4	Phoenix	Arizona	6	2011	0
10679	4	Phoenix	Arizona	7	2011	0
10680	4	Phoenix	Arizona	8	2011	0
10681	4	Phoenix	Arizona	9	2011	0
10682	4	Phoenix	Arizona	10	2011	0
10683	4	Phoenix	Arizona	11	2011	0
10684	4	Phoenix	Arizona	12	2011	0
10685	4	Phoenix	Arizona	1	2012	95000
10686	4	Phoenix	Arizona	2	2012	99900
10687	4	Phoenix	Arizona	3	2012	105000
10688	4	Phoenix	Arizona	4	2012	116000
10689	4	Phoenix	Arizona	5	2012	127000
10690	4	Phoenix	Arizona	6	2012	127225
10691	4	Phoenix	Arizona	7	2012	128250
10692	4	Phoenix	Arizona	8	2012	125000
10693	4	Phoenix	Arizona	9	2012	129000
10694	4	Phoenix	Arizona	10	2012	137900
10695	4	Phoenix	Arizona	11	2012	139562
10696	4	Phoenix	Arizona	12	2012	135000
10697	4	Phoenix	Arizona	1	2013	135000
10698	4	Phoenix	Arizona	2	2013	145000
10699	4	Phoenix	Arizona	3	2013	152500
10700	4	Phoenix	Arizona	4	2013	155000
10701	4	Phoenix	Arizona	5	2013	159000
10702	4	Phoenix	Arizona	6	2013	169900
10703	4	Phoenix	Arizona	7	2013	170000
10704	4	Phoenix	Arizona	8	2013	167000
10705	4	Phoenix	Arizona	9	2013	171200
10706	4	Phoenix	Arizona	10	2013	165000
10707	4	Phoenix	Arizona	11	2013	165102
10708	4	Phoenix	Arizona	12	2013	167614
10709	4	Phoenix	Arizona	1	2014	165000
10710	4	Phoenix	Arizona	2	2014	165000
10711	4	Phoenix	Arizona	3	2014	175000
10712	4	Phoenix	Arizona	4	2014	175000
10713	4	Phoenix	Arizona	5	2014	173200
10714	4	Phoenix	Arizona	6	2014	179313
10715	4	Phoenix	Arizona	7	2014	184900
10716	4	Phoenix	Arizona	8	2014	183000
10717	4	Phoenix	Arizona	9	2014	182500
10718	4	Phoenix	Arizona	10	2014	180000
10719	4	Phoenix	Arizona	11	2014	180000
10720	4	Phoenix	Arizona	12	2014	185000
10721	4	Phoenix	Arizona	1	2015	178250
10722	4	Phoenix	Arizona	2	2015	189900
10723	4	Phoenix	Arizona	3	2015	189250
10724	4	Phoenix	Arizona	4	2015	193000
10725	4	Phoenix	Arizona	5	2015	201500
10726	4	Phoenix	Arizona	6	2015	201000
10727	4	Phoenix	Arizona	7	2015	199000
10728	4	Phoenix	Arizona	8	2015	199500
10729	4	Phoenix	Arizona	9	2015	205000
10730	4	Phoenix	Arizona	10	2015	198000
10731	4	Phoenix	Arizona	11	2015	200000
10732	4	Phoenix	Arizona	12	2015	200000
10733	4	Phoenix	Arizona	1	2016	192250
10734	4	Phoenix	Arizona	2	2016	199900
10735	4	Phoenix	Arizona	3	2016	213500
10736	4	Phoenix	Arizona	4	2016	206000
10737	4	Phoenix	Arizona	5	2016	220000
10738	4	Phoenix	Arizona	6	2016	221000
10739	4	Phoenix	Arizona	7	2016	215000
10740	4	Phoenix	Arizona	8	2016	220000
10741	4	Phoenix	Arizona	9	2016	225000
10742	4	Phoenix	Arizona	10	2016	219175
10743	4	Phoenix	Arizona	11	2016	215000
10744	4	Phoenix	Arizona	12	2016	219490
10745	4	Phoenix	Arizona	1	2017	215000
10746	4	Phoenix	Arizona	2	2017	226000
10747	4	Phoenix	Arizona	3	2017	225000
10748	4	Phoenix	Arizona	4	2017	219900
10749	4	Phoenix	Arizona	5	2017	230000
10750	4	Phoenix	Arizona	6	2017	235000
10751	4	Phoenix	Arizona	7	2017	234950
10752	4	Phoenix	Arizona	8	2017	232500
10753	4	Phoenix	Arizona	9	2017	229500
10754	4	Phoenix	Arizona	10	2017	244000
10755	4	Phoenix	Arizona	11	2017	237500
10756	4	Phoenix	Arizona	12	2017	235000
10757	4	Phoenix	Arizona	1	2018	235000
10758	4	Phoenix	Arizona	2	2018	239900
10759	4	Phoenix	Arizona	3	2018	245000
10760	4	Phoenix	Arizona	4	2018	249950
10761	4	Phoenix	Arizona	5	2018	256500
10762	4	Phoenix	Arizona	6	2018	259900
10763	4	Phoenix	Arizona	7	2018	255000
10764	4	Phoenix	Arizona	8	2018	250000
10765	4	Phoenix	Arizona	9	2018	245500
10766	4	Phoenix	Arizona	10	2018	255000
10767	4	Phoenix	Arizona	11	2018	255000
10768	4	Phoenix	Arizona	12	2018	247200
10769	4	Phoenix	Arizona	1	2019	0
10770	5	Scottsdale	Arizona	1	2009	0
10771	5	Scottsdale	Arizona	2	2009	0
10772	5	Scottsdale	Arizona	3	2009	0
10773	5	Scottsdale	Arizona	4	2009	0
10774	5	Scottsdale	Arizona	5	2009	0
10775	5	Scottsdale	Arizona	6	2009	0
10776	5	Scottsdale	Arizona	7	2009	0
10777	5	Scottsdale	Arizona	8	2009	0
10778	5	Scottsdale	Arizona	9	2009	0
10779	5	Scottsdale	Arizona	10	2009	0
10780	5	Scottsdale	Arizona	11	2009	0
10781	5	Scottsdale	Arizona	12	2009	0
10782	5	Scottsdale	Arizona	1	2010	0
10783	5	Scottsdale	Arizona	2	2010	0
10784	5	Scottsdale	Arizona	3	2010	0
10785	5	Scottsdale	Arizona	4	2010	0
10786	5	Scottsdale	Arizona	5	2010	0
10787	5	Scottsdale	Arizona	6	2010	0
10788	5	Scottsdale	Arizona	7	2010	0
10789	5	Scottsdale	Arizona	8	2010	0
10790	5	Scottsdale	Arizona	9	2010	0
10791	5	Scottsdale	Arizona	10	2010	0
10792	5	Scottsdale	Arizona	11	2010	0
10793	5	Scottsdale	Arizona	12	2010	0
10794	5	Scottsdale	Arizona	1	2011	0
10795	5	Scottsdale	Arizona	2	2011	0
10796	5	Scottsdale	Arizona	3	2011	0
10797	5	Scottsdale	Arizona	4	2011	0
10798	5	Scottsdale	Arizona	5	2011	0
10799	5	Scottsdale	Arizona	6	2011	0
10800	5	Scottsdale	Arizona	7	2011	0
10801	5	Scottsdale	Arizona	8	2011	0
10802	5	Scottsdale	Arizona	9	2011	0
10803	5	Scottsdale	Arizona	10	2011	0
10804	5	Scottsdale	Arizona	11	2011	0
10805	5	Scottsdale	Arizona	12	2011	0
10806	5	Scottsdale	Arizona	1	2012	255000
10807	5	Scottsdale	Arizona	2	2012	277750
10808	5	Scottsdale	Arizona	3	2012	300000
10809	5	Scottsdale	Arizona	4	2012	318500
10810	5	Scottsdale	Arizona	5	2012	349200
10811	5	Scottsdale	Arizona	6	2012	335000
10812	5	Scottsdale	Arizona	7	2012	340000
10813	5	Scottsdale	Arizona	8	2012	311000
10814	5	Scottsdale	Arizona	9	2012	316000
10815	5	Scottsdale	Arizona	10	2012	320000
10816	5	Scottsdale	Arizona	11	2012	331750
10817	5	Scottsdale	Arizona	12	2012	360000
10818	5	Scottsdale	Arizona	1	2013	336250
10819	5	Scottsdale	Arizona	2	2013	358750
10820	5	Scottsdale	Arizona	3	2013	355000
10821	5	Scottsdale	Arizona	4	2013	365000
10822	5	Scottsdale	Arizona	5	2013	401500
10823	5	Scottsdale	Arizona	6	2013	381000
10824	5	Scottsdale	Arizona	7	2013	375000
10825	5	Scottsdale	Arizona	8	2013	391000
10826	5	Scottsdale	Arizona	9	2013	370000
10827	5	Scottsdale	Arizona	10	2013	395000
10828	5	Scottsdale	Arizona	11	2013	365000
10829	5	Scottsdale	Arizona	12	2013	369750
10830	5	Scottsdale	Arizona	1	2014	373200
10831	5	Scottsdale	Arizona	2	2014	390000
10832	5	Scottsdale	Arizona	3	2014	385000
10833	5	Scottsdale	Arizona	4	2014	400000
10834	5	Scottsdale	Arizona	5	2014	395000
10835	5	Scottsdale	Arizona	6	2014	394750
10836	5	Scottsdale	Arizona	7	2014	364078
10837	5	Scottsdale	Arizona	8	2014	355125
10838	5	Scottsdale	Arizona	9	2014	348500
10839	5	Scottsdale	Arizona	10	2014	390000
10840	5	Scottsdale	Arizona	11	2014	375000
10841	5	Scottsdale	Arizona	12	2014	375000
10842	5	Scottsdale	Arizona	1	2015	385000
10843	5	Scottsdale	Arizona	2	2015	367000
10844	5	Scottsdale	Arizona	3	2015	380000
10845	5	Scottsdale	Arizona	4	2015	390000
10846	5	Scottsdale	Arizona	5	2015	380000
10847	5	Scottsdale	Arizona	6	2015	378500
10848	5	Scottsdale	Arizona	7	2015	399500
10849	5	Scottsdale	Arizona	8	2015	383000
10850	5	Scottsdale	Arizona	9	2015	385750
10851	5	Scottsdale	Arizona	10	2015	396000
10852	5	Scottsdale	Arizona	11	2015	396500
10853	5	Scottsdale	Arizona	12	2015	374950
10854	5	Scottsdale	Arizona	1	2016	399000
10855	5	Scottsdale	Arizona	2	2016	405000
10856	5	Scottsdale	Arizona	3	2016	405000
10857	5	Scottsdale	Arizona	4	2016	399782
10858	5	Scottsdale	Arizona	5	2016	412000
10859	5	Scottsdale	Arizona	6	2016	400000
10860	5	Scottsdale	Arizona	7	2016	391000
10861	5	Scottsdale	Arizona	8	2016	385000
10862	5	Scottsdale	Arizona	9	2016	399500
10863	5	Scottsdale	Arizona	10	2016	399839
10864	5	Scottsdale	Arizona	11	2016	420000
10865	5	Scottsdale	Arizona	12	2016	395000
10866	5	Scottsdale	Arizona	1	2017	410000
10867	5	Scottsdale	Arizona	2	2017	405000
10868	5	Scottsdale	Arizona	3	2017	418000
10869	5	Scottsdale	Arizona	4	2017	420000
10870	5	Scottsdale	Arizona	5	2017	425000
10871	5	Scottsdale	Arizona	6	2017	438000
10872	5	Scottsdale	Arizona	7	2017	429999
10873	5	Scottsdale	Arizona	8	2017	410000
10874	5	Scottsdale	Arizona	9	2017	445000
10875	5	Scottsdale	Arizona	10	2017	420000
10876	5	Scottsdale	Arizona	11	2017	427000
10877	5	Scottsdale	Arizona	12	2017	446500
10878	5	Scottsdale	Arizona	1	2018	440000
10879	5	Scottsdale	Arizona	2	2018	434000
10880	5	Scottsdale	Arizona	3	2018	450000
10881	5	Scottsdale	Arizona	4	2018	455000
10882	5	Scottsdale	Arizona	5	2018	459900
10883	5	Scottsdale	Arizona	6	2018	475000
10884	5	Scottsdale	Arizona	7	2018	453250
10885	5	Scottsdale	Arizona	8	2018	475000
10886	5	Scottsdale	Arizona	9	2018	431500
10887	5	Scottsdale	Arizona	10	2018	465000
10888	5	Scottsdale	Arizona	11	2018	470000
10889	5	Scottsdale	Arizona	12	2018	479950
10890	5	Scottsdale	Arizona	1	2019	0
10891	6	Tucson	Arizona	1	2009	0
10892	6	Tucson	Arizona	2	2009	0
10893	6	Tucson	Arizona	3	2009	0
10894	6	Tucson	Arizona	4	2009	0
10895	6	Tucson	Arizona	5	2009	0
10896	6	Tucson	Arizona	6	2009	0
10897	6	Tucson	Arizona	7	2009	0
10898	6	Tucson	Arizona	8	2009	0
10899	6	Tucson	Arizona	9	2009	0
10900	6	Tucson	Arizona	10	2009	0
10901	6	Tucson	Arizona	11	2009	0
10902	6	Tucson	Arizona	12	2009	0
10903	6	Tucson	Arizona	1	2010	0
10904	6	Tucson	Arizona	2	2010	0
10905	6	Tucson	Arizona	3	2010	0
10906	6	Tucson	Arizona	4	2010	0
10907	6	Tucson	Arizona	5	2010	0
10908	6	Tucson	Arizona	6	2010	0
10909	6	Tucson	Arizona	7	2010	0
10910	6	Tucson	Arizona	8	2010	0
10911	6	Tucson	Arizona	9	2010	0
10912	6	Tucson	Arizona	10	2010	0
10913	6	Tucson	Arizona	11	2010	0
10914	6	Tucson	Arizona	12	2010	0
10915	6	Tucson	Arizona	1	2011	0
10916	6	Tucson	Arizona	2	2011	0
10917	6	Tucson	Arizona	3	2011	0
10918	6	Tucson	Arizona	4	2011	0
10919	6	Tucson	Arizona	5	2011	0
10920	6	Tucson	Arizona	6	2011	0
10921	6	Tucson	Arizona	7	2011	0
10922	6	Tucson	Arizona	8	2011	0
10923	6	Tucson	Arizona	9	2011	0
10924	6	Tucson	Arizona	10	2011	0
10925	6	Tucson	Arizona	11	2011	0
10926	6	Tucson	Arizona	12	2011	0
10927	6	Tucson	Arizona	1	2012	0
10928	6	Tucson	Arizona	2	2012	0
10929	6	Tucson	Arizona	3	2012	0
10930	6	Tucson	Arizona	4	2012	0
10931	6	Tucson	Arizona	5	2012	0
10932	6	Tucson	Arizona	6	2012	0
10933	6	Tucson	Arizona	7	2012	0
10934	6	Tucson	Arizona	8	2012	0
10935	6	Tucson	Arizona	9	2012	0
10936	6	Tucson	Arizona	10	2012	0
10937	6	Tucson	Arizona	11	2012	0
10938	6	Tucson	Arizona	12	2012	0
10939	6	Tucson	Arizona	1	2013	0
10940	6	Tucson	Arizona	2	2013	0
10941	6	Tucson	Arizona	3	2013	0
10942	6	Tucson	Arizona	4	2013	0
10943	6	Tucson	Arizona	5	2013	0
10944	6	Tucson	Arizona	6	2013	0
10945	6	Tucson	Arizona	7	2013	0
10946	6	Tucson	Arizona	8	2013	0
10947	6	Tucson	Arizona	9	2013	0
10948	6	Tucson	Arizona	10	2013	0
10949	6	Tucson	Arizona	11	2013	155000
10950	6	Tucson	Arizona	12	2013	152000
10951	6	Tucson	Arizona	1	2014	155000
10952	6	Tucson	Arizona	2	2014	157250
10953	6	Tucson	Arizona	3	2014	160000
10954	6	Tucson	Arizona	4	2014	158100
10955	6	Tucson	Arizona	5	2014	163000
10956	6	Tucson	Arizona	6	2014	167500
10957	6	Tucson	Arizona	7	2014	164900
10958	6	Tucson	Arizona	8	2014	159000
10959	6	Tucson	Arizona	9	2014	162500
10960	6	Tucson	Arizona	10	2014	164500
10961	6	Tucson	Arizona	11	2014	159900
10962	6	Tucson	Arizona	12	2014	160000
10963	6	Tucson	Arizona	1	2015	154000
10964	6	Tucson	Arizona	2	2015	162200
10965	6	Tucson	Arizona	3	2015	170000
10966	6	Tucson	Arizona	4	2015	164000
10967	6	Tucson	Arizona	5	2015	169000
10968	6	Tucson	Arizona	6	2015	170000
10969	6	Tucson	Arizona	7	2015	168500
10970	6	Tucson	Arizona	8	2015	169000
10971	6	Tucson	Arizona	9	2015	165000
10972	6	Tucson	Arizona	10	2015	170000
10973	6	Tucson	Arizona	11	2015	165250
10974	6	Tucson	Arizona	12	2015	170000
10975	6	Tucson	Arizona	1	2016	160000
10976	6	Tucson	Arizona	2	2016	165175
10977	6	Tucson	Arizona	3	2016	170000
10978	6	Tucson	Arizona	4	2016	170000
10979	6	Tucson	Arizona	5	2016	177000
10980	6	Tucson	Arizona	6	2016	185000
10981	6	Tucson	Arizona	7	2016	177500
10982	6	Tucson	Arizona	8	2016	180000
10983	6	Tucson	Arizona	9	2016	172000
10984	6	Tucson	Arizona	10	2016	169450
10985	6	Tucson	Arizona	11	2016	175500
10986	6	Tucson	Arizona	12	2016	174451
10987	6	Tucson	Arizona	1	2017	180000
10988	6	Tucson	Arizona	2	2017	187000
10989	6	Tucson	Arizona	3	2017	187500
10990	6	Tucson	Arizona	4	2017	185000
10991	6	Tucson	Arizona	5	2017	190000
10992	6	Tucson	Arizona	6	2017	197250
10993	6	Tucson	Arizona	7	2017	186500
10994	6	Tucson	Arizona	8	2017	186700
10995	6	Tucson	Arizona	9	2017	200000
10996	6	Tucson	Arizona	10	2017	190000
10997	6	Tucson	Arizona	11	2017	192750
10998	6	Tucson	Arizona	12	2017	195250
10999	6	Tucson	Arizona	1	2018	192750
11000	6	Tucson	Arizona	2	2018	199000
11001	6	Tucson	Arizona	3	2018	197000
11002	6	Tucson	Arizona	4	2018	210000
11003	6	Tucson	Arizona	5	2018	207000
11004	6	Tucson	Arizona	6	2018	204000
11005	6	Tucson	Arizona	7	2018	205000
11006	6	Tucson	Arizona	8	2018	208000
11007	6	Tucson	Arizona	9	2018	200000
11008	6	Tucson	Arizona	10	2018	205500
11009	6	Tucson	Arizona	11	2018	207500
11010	6	Tucson	Arizona	12	2018	199000
11011	6	Tucson	Arizona	1	2019	0
11012	7	Little Rock	Arkansas	1	2009	0
11013	7	Little Rock	Arkansas	2	2009	0
11014	7	Little Rock	Arkansas	3	2009	0
11015	7	Little Rock	Arkansas	4	2009	0
11016	7	Little Rock	Arkansas	5	2009	0
11017	7	Little Rock	Arkansas	6	2009	0
11018	7	Little Rock	Arkansas	7	2009	0
11019	7	Little Rock	Arkansas	8	2009	0
11020	7	Little Rock	Arkansas	9	2009	0
11021	7	Little Rock	Arkansas	10	2009	0
11022	7	Little Rock	Arkansas	11	2009	0
11023	7	Little Rock	Arkansas	12	2009	0
11024	7	Little Rock	Arkansas	1	2010	0
11025	7	Little Rock	Arkansas	2	2010	0
11026	7	Little Rock	Arkansas	3	2010	0
11027	7	Little Rock	Arkansas	4	2010	0
11028	7	Little Rock	Arkansas	5	2010	0
11029	7	Little Rock	Arkansas	6	2010	0
11030	7	Little Rock	Arkansas	7	2010	0
11031	7	Little Rock	Arkansas	8	2010	0
11032	7	Little Rock	Arkansas	9	2010	0
11033	7	Little Rock	Arkansas	10	2010	0
11034	7	Little Rock	Arkansas	11	2010	0
11035	7	Little Rock	Arkansas	12	2010	0
11036	7	Little Rock	Arkansas	1	2011	0
11037	7	Little Rock	Arkansas	2	2011	0
11038	7	Little Rock	Arkansas	3	2011	0
11039	7	Little Rock	Arkansas	4	2011	0
11040	7	Little Rock	Arkansas	5	2011	0
11041	7	Little Rock	Arkansas	6	2011	0
11042	7	Little Rock	Arkansas	7	2011	0
11043	7	Little Rock	Arkansas	8	2011	0
11044	7	Little Rock	Arkansas	9	2011	0
11045	7	Little Rock	Arkansas	10	2011	0
11046	7	Little Rock	Arkansas	11	2011	0
11047	7	Little Rock	Arkansas	12	2011	0
11048	7	Little Rock	Arkansas	1	2012	0
11049	7	Little Rock	Arkansas	2	2012	0
11050	7	Little Rock	Arkansas	3	2012	0
11051	7	Little Rock	Arkansas	4	2012	0
11052	7	Little Rock	Arkansas	5	2012	0
11053	7	Little Rock	Arkansas	6	2012	0
11054	7	Little Rock	Arkansas	7	2012	0
11055	7	Little Rock	Arkansas	8	2012	0
11056	7	Little Rock	Arkansas	9	2012	0
11057	7	Little Rock	Arkansas	10	2012	0
11058	7	Little Rock	Arkansas	11	2012	0
11059	7	Little Rock	Arkansas	12	2012	0
11060	7	Little Rock	Arkansas	1	2013	0
11061	7	Little Rock	Arkansas	2	2013	0
11062	7	Little Rock	Arkansas	3	2013	0
11063	7	Little Rock	Arkansas	4	2013	149950
11064	7	Little Rock	Arkansas	5	2013	158490
11065	7	Little Rock	Arkansas	6	2013	160750
11066	7	Little Rock	Arkansas	7	2013	156311
11067	7	Little Rock	Arkansas	8	2013	153000
11068	7	Little Rock	Arkansas	9	2013	145000
11069	7	Little Rock	Arkansas	10	2013	149997
11070	7	Little Rock	Arkansas	11	2013	140000
11071	7	Little Rock	Arkansas	12	2013	144950
11072	7	Little Rock	Arkansas	1	2014	130000
11073	7	Little Rock	Arkansas	2	2014	136200
11074	7	Little Rock	Arkansas	3	2014	136000
11075	7	Little Rock	Arkansas	4	2014	145000
11076	7	Little Rock	Arkansas	5	2014	154000
11077	7	Little Rock	Arkansas	6	2014	152500
11078	7	Little Rock	Arkansas	7	2014	148700
11079	7	Little Rock	Arkansas	8	2014	149000
11080	7	Little Rock	Arkansas	9	2014	148000
11081	7	Little Rock	Arkansas	10	2014	144000
11082	7	Little Rock	Arkansas	11	2014	140000
11083	7	Little Rock	Arkansas	12	2014	147500
11084	7	Little Rock	Arkansas	1	2015	134755
11085	7	Little Rock	Arkansas	2	2015	141500
11086	7	Little Rock	Arkansas	3	2015	150000
11087	7	Little Rock	Arkansas	4	2015	145000
11088	7	Little Rock	Arkansas	5	2015	151000
11089	7	Little Rock	Arkansas	6	2015	155000
11090	7	Little Rock	Arkansas	7	2015	153000
11091	7	Little Rock	Arkansas	8	2015	150000
11092	7	Little Rock	Arkansas	9	2015	144000
11093	7	Little Rock	Arkansas	10	2015	153000
11094	7	Little Rock	Arkansas	11	2015	146500
11095	7	Little Rock	Arkansas	12	2015	147339
11096	7	Little Rock	Arkansas	1	2016	136450
11097	7	Little Rock	Arkansas	2	2016	142900
11098	7	Little Rock	Arkansas	3	2016	146000
11099	7	Little Rock	Arkansas	4	2016	149000
11100	7	Little Rock	Arkansas	5	2016	155000
11101	7	Little Rock	Arkansas	6	2016	161000
11102	7	Little Rock	Arkansas	7	2016	150250
11103	7	Little Rock	Arkansas	8	2016	150316
11104	7	Little Rock	Arkansas	9	2016	151000
11105	7	Little Rock	Arkansas	10	2016	154000
11106	7	Little Rock	Arkansas	11	2016	155000
11107	7	Little Rock	Arkansas	12	2016	155000
11108	7	Little Rock	Arkansas	1	2017	149450
11109	7	Little Rock	Arkansas	2	2017	151000
11110	7	Little Rock	Arkansas	3	2017	152000
11111	7	Little Rock	Arkansas	4	2017	152000
11112	7	Little Rock	Arkansas	5	2017	155000
11113	7	Little Rock	Arkansas	6	2017	166500
11114	7	Little Rock	Arkansas	7	2017	156900
11115	7	Little Rock	Arkansas	8	2017	157845
11116	7	Little Rock	Arkansas	9	2017	158910
11117	7	Little Rock	Arkansas	10	2017	154000
11118	7	Little Rock	Arkansas	11	2017	159000
11119	7	Little Rock	Arkansas	12	2017	159000
11120	7	Little Rock	Arkansas	1	2018	146125
11121	7	Little Rock	Arkansas	2	2018	154550
11122	7	Little Rock	Arkansas	3	2018	155000
11123	7	Little Rock	Arkansas	4	2018	160000
11124	7	Little Rock	Arkansas	5	2018	162000
11125	7	Little Rock	Arkansas	6	2018	165000
11126	7	Little Rock	Arkansas	7	2018	165000
11127	7	Little Rock	Arkansas	8	2018	158650
11128	7	Little Rock	Arkansas	9	2018	154900
11129	7	Little Rock	Arkansas	10	2018	158000
11130	7	Little Rock	Arkansas	11	2018	158000
11131	7	Little Rock	Arkansas	12	2018	160000
11132	7	Little Rock	Arkansas	1	2019	0
11133	8	North Little Rock	Arkansas	1	2009	0
11134	8	North Little Rock	Arkansas	2	2009	0
11135	8	North Little Rock	Arkansas	3	2009	0
11136	8	North Little Rock	Arkansas	4	2009	0
11137	8	North Little Rock	Arkansas	5	2009	0
11138	8	North Little Rock	Arkansas	6	2009	0
11139	8	North Little Rock	Arkansas	7	2009	0
11140	8	North Little Rock	Arkansas	8	2009	0
11141	8	North Little Rock	Arkansas	9	2009	0
11142	8	North Little Rock	Arkansas	10	2009	0
11143	8	North Little Rock	Arkansas	11	2009	0
11144	8	North Little Rock	Arkansas	12	2009	0
11145	8	North Little Rock	Arkansas	1	2010	0
11146	8	North Little Rock	Arkansas	2	2010	0
11147	8	North Little Rock	Arkansas	3	2010	0
11148	8	North Little Rock	Arkansas	4	2010	0
11149	8	North Little Rock	Arkansas	5	2010	0
11150	8	North Little Rock	Arkansas	6	2010	0
11151	8	North Little Rock	Arkansas	7	2010	0
11152	8	North Little Rock	Arkansas	8	2010	0
11153	8	North Little Rock	Arkansas	9	2010	0
11154	8	North Little Rock	Arkansas	10	2010	0
11155	8	North Little Rock	Arkansas	11	2010	0
11156	8	North Little Rock	Arkansas	12	2010	0
11157	8	North Little Rock	Arkansas	1	2011	0
11158	8	North Little Rock	Arkansas	2	2011	0
11159	8	North Little Rock	Arkansas	3	2011	0
11160	8	North Little Rock	Arkansas	4	2011	0
11161	8	North Little Rock	Arkansas	5	2011	0
11162	8	North Little Rock	Arkansas	6	2011	0
11163	8	North Little Rock	Arkansas	7	2011	0
11164	8	North Little Rock	Arkansas	8	2011	0
11165	8	North Little Rock	Arkansas	9	2011	0
11166	8	North Little Rock	Arkansas	10	2011	0
11167	8	North Little Rock	Arkansas	11	2011	0
11168	8	North Little Rock	Arkansas	12	2011	0
11169	8	North Little Rock	Arkansas	1	2012	0
11170	8	North Little Rock	Arkansas	2	2012	0
11171	8	North Little Rock	Arkansas	3	2012	0
11172	8	North Little Rock	Arkansas	4	2012	0
11173	8	North Little Rock	Arkansas	5	2012	0
11174	8	North Little Rock	Arkansas	6	2012	0
11175	8	North Little Rock	Arkansas	7	2012	0
11176	8	North Little Rock	Arkansas	8	2012	0
11177	8	North Little Rock	Arkansas	9	2012	0
11178	8	North Little Rock	Arkansas	10	2012	0
11179	8	North Little Rock	Arkansas	11	2012	0
11180	8	North Little Rock	Arkansas	12	2012	0
11181	8	North Little Rock	Arkansas	1	2013	0
11182	8	North Little Rock	Arkansas	2	2013	0
11183	8	North Little Rock	Arkansas	3	2013	0
11184	8	North Little Rock	Arkansas	4	2013	0
11185	8	North Little Rock	Arkansas	5	2013	0
11186	8	North Little Rock	Arkansas	6	2013	59500
11187	8	North Little Rock	Arkansas	7	2013	62500
11188	8	North Little Rock	Arkansas	8	2013	70380
11189	8	North Little Rock	Arkansas	9	2013	70380
11190	8	North Little Rock	Arkansas	10	2013	52500
11191	8	North Little Rock	Arkansas	11	2013	49000
11192	8	North Little Rock	Arkansas	12	2013	45300
11193	8	North Little Rock	Arkansas	1	2014	51000
11194	8	North Little Rock	Arkansas	2	2014	40251
11195	8	North Little Rock	Arkansas	3	2014	49376
11196	8	North Little Rock	Arkansas	4	2014	50125
11197	8	North Little Rock	Arkansas	5	2014	58500
11198	8	North Little Rock	Arkansas	6	2014	79900
11199	8	North Little Rock	Arkansas	7	2014	73950
11200	8	North Little Rock	Arkansas	8	2014	68000
11201	8	North Little Rock	Arkansas	9	2014	55000
11202	8	North Little Rock	Arkansas	10	2014	72000
11203	8	North Little Rock	Arkansas	11	2014	74000
11204	8	North Little Rock	Arkansas	12	2014	58500
11205	8	North Little Rock	Arkansas	1	2015	38178
11206	8	North Little Rock	Arkansas	2	2015	37625
11207	8	North Little Rock	Arkansas	3	2015	58500
11208	8	North Little Rock	Arkansas	4	2015	73000
11209	8	North Little Rock	Arkansas	5	2015	85900
11210	8	North Little Rock	Arkansas	6	2015	71900
11211	8	North Little Rock	Arkansas	7	2015	72450
11212	8	North Little Rock	Arkansas	8	2015	71900
11213	8	North Little Rock	Arkansas	9	2015	96500
11214	8	North Little Rock	Arkansas	10	2015	84500
11215	8	North Little Rock	Arkansas	11	2015	92500
11216	8	North Little Rock	Arkansas	12	2015	59900
11217	8	North Little Rock	Arkansas	1	2016	40850
11218	8	North Little Rock	Arkansas	2	2016	39200
11219	8	North Little Rock	Arkansas	3	2016	52000
11220	8	North Little Rock	Arkansas	4	2016	58950
11221	8	North Little Rock	Arkansas	5	2016	59900
11222	8	North Little Rock	Arkansas	6	2016	59000
11223	8	North Little Rock	Arkansas	7	2016	51305
11224	8	North Little Rock	Arkansas	8	2016	49000
11225	8	North Little Rock	Arkansas	9	2016	48500
11226	8	North Little Rock	Arkansas	10	2016	40132
11227	8	North Little Rock	Arkansas	11	2016	56674
11228	8	North Little Rock	Arkansas	12	2016	69900
11229	8	North Little Rock	Arkansas	1	2017	60180
11230	8	North Little Rock	Arkansas	2	2017	50230
11231	8	North Little Rock	Arkansas	3	2017	47000
11232	8	North Little Rock	Arkansas	4	2017	87000
11233	8	North Little Rock	Arkansas	5	2017	80000
11234	8	North Little Rock	Arkansas	6	2017	69250
11235	8	North Little Rock	Arkansas	7	2017	79900
11236	8	North Little Rock	Arkansas	8	2017	65500
11237	8	North Little Rock	Arkansas	9	2017	65000
11238	8	North Little Rock	Arkansas	10	2017	60000
11239	8	North Little Rock	Arkansas	11	2017	52450
11240	8	North Little Rock	Arkansas	12	2017	50000
11241	8	North Little Rock	Arkansas	1	2018	55050
11242	8	North Little Rock	Arkansas	2	2018	72050
11243	8	North Little Rock	Arkansas	3	2018	73850
11244	8	North Little Rock	Arkansas	4	2018	65875
11245	8	North Little Rock	Arkansas	5	2018	63250
11246	8	North Little Rock	Arkansas	6	2018	80750
11247	8	North Little Rock	Arkansas	7	2018	87450
11248	8	North Little Rock	Arkansas	8	2018	90000
11249	8	North Little Rock	Arkansas	9	2018	83450
11250	8	North Little Rock	Arkansas	10	2018	82000
11251	8	North Little Rock	Arkansas	11	2018	64900
11252	8	North Little Rock	Arkansas	12	2018	58950
11253	8	North Little Rock	Arkansas	1	2019	0
11254	10	Newark	California	1	2009	0
11255	10	Newark	California	2	2009	0
11256	10	Newark	California	3	2009	0
11257	10	Newark	California	4	2009	0
11258	10	Newark	California	5	2009	0
11259	10	Newark	California	6	2009	0
11260	10	Newark	California	7	2009	0
11261	10	Newark	California	8	2009	0
11262	10	Newark	California	9	2009	0
11263	10	Newark	California	10	2009	0
11264	10	Newark	California	11	2009	0
11265	10	Newark	California	12	2009	0
11266	10	Newark	California	1	2010	0
11267	10	Newark	California	2	2010	0
11268	10	Newark	California	3	2010	0
11269	10	Newark	California	4	2010	0
11270	10	Newark	California	5	2010	0
11271	10	Newark	California	6	2010	0
11272	10	Newark	California	7	2010	0
11273	10	Newark	California	8	2010	0
11274	10	Newark	California	9	2010	0
11275	10	Newark	California	10	2010	0
11276	10	Newark	California	11	2010	0
11277	10	Newark	California	12	2010	0
11278	10	Newark	California	1	2011	0
11279	10	Newark	California	2	2011	0
11280	10	Newark	California	3	2011	0
11281	10	Newark	California	4	2011	0
11282	10	Newark	California	5	2011	0
11283	10	Newark	California	6	2011	0
11284	10	Newark	California	7	2011	0
11285	10	Newark	California	8	2011	0
11286	10	Newark	California	9	2011	0
11287	10	Newark	California	10	2011	0
11288	10	Newark	California	11	2011	0
11289	10	Newark	California	12	2011	0
11290	10	Newark	California	1	2012	340000
11291	10	Newark	California	2	2012	300000
11292	10	Newark	California	3	2012	375500
11293	10	Newark	California	4	2012	325000
11294	10	Newark	California	5	2012	362000
11295	10	Newark	California	6	2012	337000
11296	10	Newark	California	7	2012	377500
11297	10	Newark	California	8	2012	352500
11298	10	Newark	California	9	2012	326000
11299	10	Newark	California	10	2012	372500
11300	10	Newark	California	11	2012	367500
11301	10	Newark	California	12	2012	366000
11302	10	Newark	California	1	2013	400000
11303	10	Newark	California	2	2013	405000
11304	10	Newark	California	3	2013	442000
11305	10	Newark	California	4	2013	455000
11306	10	Newark	California	5	2013	489000
11307	10	Newark	California	6	2013	514500
11308	10	Newark	California	7	2013	477500
11309	10	Newark	California	8	2013	465600
11310	10	Newark	California	9	2013	480000
11311	10	Newark	California	10	2013	452500
11312	10	Newark	California	11	2013	520000
11313	10	Newark	California	12	2013	432500
11314	10	Newark	California	1	2014	542500
11315	10	Newark	California	2	2014	451500
11316	10	Newark	California	3	2014	560000
11317	10	Newark	California	4	2014	580000
11318	10	Newark	California	5	2014	507500
11319	10	Newark	California	6	2014	575000
11320	10	Newark	California	7	2014	585000
11321	10	Newark	California	8	2014	550000
11322	10	Newark	California	9	2014	545000
11323	10	Newark	California	10	2014	577000
11324	10	Newark	California	11	2014	580000
11325	10	Newark	California	12	2014	526500
11326	10	Newark	California	1	2015	565000
11327	10	Newark	California	2	2015	608800
11328	10	Newark	California	3	2015	649000
11329	10	Newark	California	4	2015	676750
11330	10	Newark	California	5	2015	670250
11331	10	Newark	California	6	2015	730000
11332	10	Newark	California	7	2015	650000
11333	10	Newark	California	8	2015	647000
11334	10	Newark	California	9	2015	665000
11335	10	Newark	California	10	2015	654000
11336	10	Newark	California	11	2015	630000
11337	10	Newark	California	12	2015	725000
11338	10	Newark	California	1	2016	572000
11339	10	Newark	California	2	2016	787500
11340	10	Newark	California	3	2016	635000
11341	10	Newark	California	4	2016	704000
11342	10	Newark	California	5	2016	689000
11343	10	Newark	California	6	2016	710000
11344	10	Newark	California	7	2016	650000
11345	10	Newark	California	8	2016	665750
11346	10	Newark	California	9	2016	702500
11347	10	Newark	California	10	2016	700000
11348	10	Newark	California	11	2016	675000
11349	10	Newark	California	12	2016	665000
11350	10	Newark	California	1	2017	694200
11351	10	Newark	California	2	2017	745000
11352	10	Newark	California	3	2017	731800
11353	10	Newark	California	4	2017	744000
11354	10	Newark	California	5	2017	770000
11355	10	Newark	California	6	2017	817000
11356	10	Newark	California	7	2017	755500
11357	10	Newark	California	8	2017	789000
11358	10	Newark	California	9	2017	753500
11359	10	Newark	California	10	2017	720100
11360	10	Newark	California	11	2017	806000
11361	10	Newark	California	12	2017	907500
11362	10	Newark	California	1	2018	877500
11363	10	Newark	California	2	2018	951000
11364	10	Newark	California	3	2018	990000
11365	10	Newark	California	4	2018	1000000
11366	10	Newark	California	5	2018	908000
11367	10	Newark	California	6	2018	981250
11368	10	Newark	California	7	2018	960000
11369	10	Newark	California	8	2018	951000
11370	10	Newark	California	9	2018	935000
11371	10	Newark	California	10	2018	900000
11372	10	Newark	California	11	2018	827500
11373	10	Newark	California	12	2018	887500
11374	10	Newark	California	1	2019	0
11375	11	Oakland	California	1	2009	0
11376	11	Oakland	California	2	2009	0
11377	11	Oakland	California	3	2009	0
11378	11	Oakland	California	4	2009	0
11379	11	Oakland	California	5	2009	0
11380	11	Oakland	California	6	2009	0
11381	11	Oakland	California	7	2009	0
11382	11	Oakland	California	8	2009	0
11383	11	Oakland	California	9	2009	0
11384	11	Oakland	California	10	2009	0
11385	11	Oakland	California	11	2009	0
11386	11	Oakland	California	12	2009	0
11387	11	Oakland	California	1	2010	0
11388	11	Oakland	California	2	2010	0
11389	11	Oakland	California	3	2010	0
11390	11	Oakland	California	4	2010	0
11391	11	Oakland	California	5	2010	0
11392	11	Oakland	California	6	2010	0
11393	11	Oakland	California	7	2010	0
11394	11	Oakland	California	8	2010	0
11395	11	Oakland	California	9	2010	0
11396	11	Oakland	California	10	2010	0
11397	11	Oakland	California	11	2010	0
11398	11	Oakland	California	12	2010	0
11399	11	Oakland	California	1	2011	0
11400	11	Oakland	California	2	2011	0
11401	11	Oakland	California	3	2011	0
11402	11	Oakland	California	4	2011	0
11403	11	Oakland	California	5	2011	0
11404	11	Oakland	California	6	2011	0
11405	11	Oakland	California	7	2011	0
11406	11	Oakland	California	8	2011	0
11407	11	Oakland	California	9	2011	0
11408	11	Oakland	California	10	2011	0
11409	11	Oakland	California	11	2011	0
11410	11	Oakland	California	12	2011	0
11411	11	Oakland	California	1	2012	215000
11412	11	Oakland	California	2	2012	228750
11413	11	Oakland	California	3	2012	235000
11414	11	Oakland	California	4	2012	241250
11415	11	Oakland	California	5	2012	270000
11416	11	Oakland	California	6	2012	269250
11417	11	Oakland	California	7	2012	300000
11418	11	Oakland	California	8	2012	299000
11419	11	Oakland	California	9	2012	292500
11420	11	Oakland	California	10	2012	334000
11421	11	Oakland	California	11	2012	359500
11422	11	Oakland	California	12	2012	360000
11423	11	Oakland	California	1	2013	343500
11424	11	Oakland	California	2	2013	322500
11425	11	Oakland	California	3	2013	350000
11426	11	Oakland	California	4	2013	450000
11427	11	Oakland	California	5	2013	397000
11428	11	Oakland	California	6	2013	447500
11429	11	Oakland	California	7	2013	463500
11430	11	Oakland	California	8	2013	450750
11431	11	Oakland	California	9	2013	438000
11432	11	Oakland	California	10	2013	450000
11433	11	Oakland	California	11	2013	436645
11434	11	Oakland	California	12	2013	420000
11435	11	Oakland	California	1	2014	365000
11436	11	Oakland	California	2	2014	388450
11437	11	Oakland	California	3	2014	423000
11438	11	Oakland	California	4	2014	475000
11439	11	Oakland	California	5	2014	493000
11440	11	Oakland	California	6	2014	499000
11441	11	Oakland	California	7	2014	529000
11442	11	Oakland	California	8	2014	520000
11443	11	Oakland	California	9	2014	495000
11444	11	Oakland	California	10	2014	490000
11445	11	Oakland	California	11	2014	536250
11446	11	Oakland	California	12	2014	483000
11447	11	Oakland	California	1	2015	425000
11448	11	Oakland	California	2	2015	457000
11449	11	Oakland	California	3	2015	495250
11450	11	Oakland	California	4	2015	600000
11451	11	Oakland	California	5	2015	609500
11452	11	Oakland	California	6	2015	573000
11453	11	Oakland	California	7	2015	575000
11454	11	Oakland	California	8	2015	610000
11455	11	Oakland	California	9	2015	550000
11456	11	Oakland	California	10	2015	588000
11457	11	Oakland	California	11	2015	600000
11458	11	Oakland	California	12	2015	565000
11459	11	Oakland	California	1	2016	550000
11460	11	Oakland	California	2	2016	550000
11461	11	Oakland	California	3	2016	580000
11462	11	Oakland	California	4	2016	640000
11463	11	Oakland	California	5	2016	635000
11464	11	Oakland	California	6	2016	666500
11465	11	Oakland	California	7	2016	630000
11466	11	Oakland	California	8	2016	665000
11467	11	Oakland	California	9	2016	638000
11468	11	Oakland	California	10	2016	620000
11469	11	Oakland	California	11	2016	725000
11470	11	Oakland	California	12	2016	600000
11471	11	Oakland	California	1	2017	603000
11472	11	Oakland	California	2	2017	650000
11473	11	Oakland	California	3	2017	677436
11474	11	Oakland	California	4	2017	700000
11475	11	Oakland	California	5	2017	675000
11476	11	Oakland	California	6	2017	740000
11477	11	Oakland	California	7	2017	675000
11478	11	Oakland	California	8	2017	682500
11479	11	Oakland	California	9	2017	670000
11480	11	Oakland	California	10	2017	675000
11481	11	Oakland	California	11	2017	707500
11482	11	Oakland	California	12	2017	675100
11483	11	Oakland	California	1	2018	665000
11484	11	Oakland	California	2	2018	653000
11485	11	Oakland	California	3	2018	725000
11486	11	Oakland	California	4	2018	778000
11487	11	Oakland	California	5	2018	772500
11488	11	Oakland	California	6	2018	810000
11489	11	Oakland	California	7	2018	760000
11490	11	Oakland	California	8	2018	789113
11491	11	Oakland	California	9	2018	757500
11492	11	Oakland	California	10	2018	756500
11493	11	Oakland	California	11	2018	790000
11494	11	Oakland	California	12	2018	676825
11495	11	Oakland	California	1	2019	0
11496	12	Richmond	California	1	2009	0
11497	12	Richmond	California	2	2009	0
11498	12	Richmond	California	3	2009	0
11499	12	Richmond	California	4	2009	0
11500	12	Richmond	California	5	2009	0
11501	12	Richmond	California	6	2009	0
11502	12	Richmond	California	7	2009	0
11503	12	Richmond	California	8	2009	0
11504	12	Richmond	California	9	2009	0
11505	12	Richmond	California	10	2009	0
11506	12	Richmond	California	11	2009	0
11507	12	Richmond	California	12	2009	0
11508	12	Richmond	California	1	2010	0
11509	12	Richmond	California	2	2010	0
11510	12	Richmond	California	3	2010	0
11511	12	Richmond	California	4	2010	0
11512	12	Richmond	California	5	2010	0
11513	12	Richmond	California	6	2010	0
11514	12	Richmond	California	7	2010	0
11515	12	Richmond	California	8	2010	0
11516	12	Richmond	California	9	2010	0
11517	12	Richmond	California	10	2010	0
11518	12	Richmond	California	11	2010	0
11519	12	Richmond	California	12	2010	0
11520	12	Richmond	California	1	2011	0
11521	12	Richmond	California	2	2011	0
11522	12	Richmond	California	3	2011	0
11523	12	Richmond	California	4	2011	0
11524	12	Richmond	California	5	2011	0
11525	12	Richmond	California	6	2011	0
11526	12	Richmond	California	7	2011	0
11527	12	Richmond	California	8	2011	0
11528	12	Richmond	California	9	2011	0
11529	12	Richmond	California	10	2011	0
11530	12	Richmond	California	11	2011	0
11531	12	Richmond	California	12	2011	0
11532	12	Richmond	California	1	2012	160000
11533	12	Richmond	California	2	2012	160000
11534	12	Richmond	California	3	2012	147500
11535	12	Richmond	California	4	2012	196900
11536	12	Richmond	California	5	2012	200000
11537	12	Richmond	California	6	2012	171000
11538	12	Richmond	California	7	2012	190000
11539	12	Richmond	California	8	2012	181000
11540	12	Richmond	California	9	2012	195500
11541	12	Richmond	California	10	2012	207000
11542	12	Richmond	California	11	2012	217500
11543	12	Richmond	California	12	2012	239500
11544	12	Richmond	California	1	2013	206000
11545	12	Richmond	California	2	2013	230500
11546	12	Richmond	California	3	2013	238000
11547	12	Richmond	California	4	2013	219250
11548	12	Richmond	California	5	2013	280000
11549	12	Richmond	California	6	2013	235000
11550	12	Richmond	California	7	2013	300000
11551	12	Richmond	California	8	2013	295000
11552	12	Richmond	California	9	2013	300500
11553	12	Richmond	California	10	2013	290000
11554	12	Richmond	California	11	2013	290750
11555	12	Richmond	California	12	2013	319000
11556	12	Richmond	California	1	2014	270000
11557	12	Richmond	California	2	2014	325000
11558	12	Richmond	California	3	2014	315000
11559	12	Richmond	California	4	2014	335000
11560	12	Richmond	California	5	2014	336500
11561	12	Richmond	California	6	2014	341000
11562	12	Richmond	California	7	2014	337000
11563	12	Richmond	California	8	2014	330000
11564	12	Richmond	California	9	2014	345000
11565	12	Richmond	California	10	2014	370500
11566	12	Richmond	California	11	2014	336000
11567	12	Richmond	California	12	2014	358000
11568	12	Richmond	California	1	2015	306000
11569	12	Richmond	California	2	2015	327500
11570	12	Richmond	California	3	2015	342500
11571	12	Richmond	California	4	2015	375000
11572	12	Richmond	California	5	2015	380000
11573	12	Richmond	California	6	2015	465000
11574	12	Richmond	California	7	2015	388550
11575	12	Richmond	California	8	2015	395000
11576	12	Richmond	California	9	2015	425500
11577	12	Richmond	California	10	2015	420000
11578	12	Richmond	California	11	2015	405000
11579	12	Richmond	California	12	2015	385000
11580	12	Richmond	California	1	2016	418000
11581	12	Richmond	California	2	2016	385000
11582	12	Richmond	California	3	2016	419750
11583	12	Richmond	California	4	2016	442000
11584	12	Richmond	California	5	2016	442500
11585	12	Richmond	California	6	2016	445750
11586	12	Richmond	California	7	2016	470000
11587	12	Richmond	California	8	2016	422500
11588	12	Richmond	California	9	2016	443550
11589	12	Richmond	California	10	2016	469500
11590	12	Richmond	California	11	2016	442500
11591	12	Richmond	California	12	2016	435000
11592	12	Richmond	California	1	2017	399500
11593	12	Richmond	California	2	2017	385000
11594	12	Richmond	California	3	2017	380000
11595	12	Richmond	California	4	2017	428000
11596	12	Richmond	California	5	2017	505000
11597	12	Richmond	California	6	2017	480000
11598	12	Richmond	California	7	2017	472500
11599	12	Richmond	California	8	2017	475000
11600	12	Richmond	California	9	2017	488000
11601	12	Richmond	California	10	2017	520000
11602	12	Richmond	California	11	2017	480000
11603	12	Richmond	California	12	2017	490000
11604	12	Richmond	California	1	2018	479750
11605	12	Richmond	California	2	2018	524000
11606	12	Richmond	California	3	2018	537500
11607	12	Richmond	California	4	2018	530000
11608	12	Richmond	California	5	2018	535000
11609	12	Richmond	California	6	2018	530000
11610	12	Richmond	California	7	2018	520000
11611	12	Richmond	California	8	2018	550000
11612	12	Richmond	California	9	2018	525000
11613	12	Richmond	California	10	2018	570000
11614	12	Richmond	California	11	2018	555000
11615	12	Richmond	California	12	2018	548313
11616	12	Richmond	California	1	2019	0
11617	17	South San Francisco	California	1	2009	0
11618	17	South San Francisco	California	2	2009	0
11619	17	South San Francisco	California	3	2009	0
11620	17	South San Francisco	California	4	2009	0
11621	17	South San Francisco	California	5	2009	0
11622	17	South San Francisco	California	6	2009	0
11623	17	South San Francisco	California	7	2009	0
11624	17	South San Francisco	California	8	2009	0
11625	17	South San Francisco	California	9	2009	0
11626	17	South San Francisco	California	10	2009	0
11627	17	South San Francisco	California	11	2009	0
11628	17	South San Francisco	California	12	2009	0
11629	17	South San Francisco	California	1	2010	0
11630	17	South San Francisco	California	2	2010	0
11631	17	South San Francisco	California	3	2010	0
11632	17	South San Francisco	California	4	2010	0
11633	17	South San Francisco	California	5	2010	0
11634	17	South San Francisco	California	6	2010	0
11635	17	South San Francisco	California	7	2010	0
11636	17	South San Francisco	California	8	2010	0
11637	17	South San Francisco	California	9	2010	0
11638	17	South San Francisco	California	10	2010	0
11639	17	South San Francisco	California	11	2010	0
11640	17	South San Francisco	California	12	2010	0
11641	17	South San Francisco	California	1	2011	0
11642	17	South San Francisco	California	2	2011	0
11643	17	South San Francisco	California	3	2011	0
11644	17	South San Francisco	California	4	2011	0
11645	17	South San Francisco	California	5	2011	0
11646	17	South San Francisco	California	6	2011	0
11647	17	South San Francisco	California	7	2011	0
11648	17	South San Francisco	California	8	2011	0
11649	17	South San Francisco	California	9	2011	0
11650	17	South San Francisco	California	10	2011	0
11651	17	South San Francisco	California	11	2011	0
11652	17	South San Francisco	California	12	2011	0
11653	17	South San Francisco	California	1	2012	407500
11654	17	South San Francisco	California	2	2012	415500
11655	17	South San Francisco	California	3	2012	410000
11656	17	South San Francisco	California	4	2012	429000
11657	17	South San Francisco	California	5	2012	442500
11658	17	South San Francisco	California	6	2012	450000
11659	17	South San Francisco	California	7	2012	475000
11660	17	South San Francisco	California	8	2012	500000
11661	17	South San Francisco	California	9	2012	501500
11662	17	South San Francisco	California	10	2012	520000
11663	17	South San Francisco	California	11	2012	491000
11664	17	South San Francisco	California	12	2012	477500
11665	17	South San Francisco	California	1	2013	535000
11666	17	South San Francisco	California	2	2013	552750
11667	17	South San Francisco	California	3	2013	542000
11668	17	South San Francisco	California	4	2013	562000
11669	17	South San Francisco	California	5	2013	596250
11670	17	South San Francisco	California	6	2013	641000
11671	17	South San Francisco	California	7	2013	618000
11672	17	South San Francisco	California	8	2013	635000
11673	17	South San Francisco	California	9	2013	622500
11674	17	South San Francisco	California	10	2013	597500
11675	17	South San Francisco	California	11	2013	614000
11676	17	South San Francisco	California	12	2013	628000
11677	17	South San Francisco	California	1	2014	640000
11678	17	South San Francisco	California	2	2014	620000
11679	17	South San Francisco	California	3	2014	650500
11680	17	South San Francisco	California	4	2014	612500
11681	17	South San Francisco	California	5	2014	652500
11682	17	South San Francisco	California	6	2014	679000
11683	17	South San Francisco	California	7	2014	677500
11684	17	South San Francisco	California	8	2014	648000
11685	17	South San Francisco	California	9	2014	640000
11686	17	South San Francisco	California	10	2014	672500
11687	17	South San Francisco	California	11	2014	730000
11688	17	South San Francisco	California	12	2014	705000
11689	17	South San Francisco	California	1	2015	720000
11690	17	South San Francisco	California	2	2015	770000
11691	17	South San Francisco	California	3	2015	725000
11692	17	South San Francisco	California	4	2015	761000
11693	17	South San Francisco	California	5	2015	750000
11694	17	South San Francisco	California	6	2015	720000
11695	17	South San Francisco	California	7	2015	780000
11696	17	South San Francisco	California	8	2015	765000
11697	17	South San Francisco	California	9	2015	775000
11698	17	South San Francisco	California	10	2015	795000
11699	17	South San Francisco	California	11	2015	760000
11700	17	South San Francisco	California	12	2015	735000
11701	17	South San Francisco	California	1	2016	823750
11702	17	South San Francisco	California	2	2016	833000
11703	17	South San Francisco	California	3	2016	820100
11704	17	South San Francisco	California	4	2016	837500
11705	17	South San Francisco	California	5	2016	870000
11706	17	South San Francisco	California	6	2016	800500
11707	17	South San Francisco	California	7	2016	820000
11708	17	South San Francisco	California	8	2016	805000
11709	17	South San Francisco	California	9	2016	766955
11710	17	South San Francisco	California	10	2016	816500
11711	17	South San Francisco	California	11	2016	792500
11712	17	South San Francisco	California	12	2016	830000
11713	17	South San Francisco	California	1	2017	865000
11714	17	South San Francisco	California	2	2017	890000
11715	17	South San Francisco	California	3	2017	817500
11716	17	South San Francisco	California	4	2017	923000
11717	17	South San Francisco	California	5	2017	819000
11718	17	South San Francisco	California	6	2017	920000
11719	17	South San Francisco	California	7	2017	867500
11720	17	South San Francisco	California	8	2017	860000
11721	17	South San Francisco	California	9	2017	830000
11722	17	South San Francisco	California	10	2017	860500
11723	17	South San Francisco	California	11	2017	858500
11724	17	South San Francisco	California	12	2017	987500
11725	17	South San Francisco	California	1	2018	950000
11726	17	South San Francisco	California	2	2018	1110000
11727	17	South San Francisco	California	3	2018	1056500
11728	17	South San Francisco	California	4	2018	966500
11729	17	South San Francisco	California	5	2018	1100000
11730	17	South San Francisco	California	6	2018	1020000
11731	17	South San Francisco	California	7	2018	1150000
11732	17	South San Francisco	California	8	2018	1000000
11733	17	South San Francisco	California	9	2018	1001000
11734	17	South San Francisco	California	10	2018	958000
11735	17	South San Francisco	California	11	2018	980000
11736	17	South San Francisco	California	12	2018	1049500
11737	17	South San Francisco	California	1	2019	0
11738	18	Aurora	Colorado	1	2009	0
11739	18	Aurora	Colorado	2	2009	0
11740	18	Aurora	Colorado	3	2009	0
11741	18	Aurora	Colorado	4	2009	0
11742	18	Aurora	Colorado	5	2009	0
11743	18	Aurora	Colorado	6	2009	0
11744	18	Aurora	Colorado	7	2009	0
11745	18	Aurora	Colorado	8	2009	0
11746	18	Aurora	Colorado	9	2009	0
11747	18	Aurora	Colorado	10	2009	0
11748	18	Aurora	Colorado	11	2009	0
11749	18	Aurora	Colorado	12	2009	0
11750	18	Aurora	Colorado	1	2010	0
11751	18	Aurora	Colorado	2	2010	0
11752	18	Aurora	Colorado	3	2010	0
11753	18	Aurora	Colorado	4	2010	0
11754	18	Aurora	Colorado	5	2010	0
11755	18	Aurora	Colorado	6	2010	0
11756	18	Aurora	Colorado	7	2010	0
11757	18	Aurora	Colorado	8	2010	0
11758	18	Aurora	Colorado	9	2010	0
11759	18	Aurora	Colorado	10	2010	0
11760	18	Aurora	Colorado	11	2010	0
11761	18	Aurora	Colorado	12	2010	0
11762	18	Aurora	Colorado	1	2011	0
11763	18	Aurora	Colorado	2	2011	0
11764	18	Aurora	Colorado	3	2011	0
11765	18	Aurora	Colorado	4	2011	0
11766	18	Aurora	Colorado	5	2011	0
11767	18	Aurora	Colorado	6	2011	0
11768	18	Aurora	Colorado	7	2011	0
11769	18	Aurora	Colorado	8	2011	0
11770	18	Aurora	Colorado	9	2011	0
11771	18	Aurora	Colorado	10	2011	0
11772	18	Aurora	Colorado	11	2011	0
11773	18	Aurora	Colorado	12	2011	0
11774	18	Aurora	Colorado	1	2012	146550
11775	18	Aurora	Colorado	2	2012	140000
11776	18	Aurora	Colorado	3	2012	153000
11777	18	Aurora	Colorado	4	2012	165000
11778	18	Aurora	Colorado	5	2012	169700
11779	18	Aurora	Colorado	6	2012	175000
11780	18	Aurora	Colorado	7	2012	173500
11781	18	Aurora	Colorado	8	2012	170000
11782	18	Aurora	Colorado	9	2012	163100
11783	18	Aurora	Colorado	10	2012	176950
11784	18	Aurora	Colorado	11	2012	177000
11785	18	Aurora	Colorado	12	2012	170000
11786	18	Aurora	Colorado	1	2013	160000
11787	18	Aurora	Colorado	2	2013	170000
11788	18	Aurora	Colorado	3	2013	184000
11789	18	Aurora	Colorado	4	2013	189900
11790	18	Aurora	Colorado	5	2013	199900
11791	18	Aurora	Colorado	6	2013	205000
11792	18	Aurora	Colorado	7	2013	200000
11793	18	Aurora	Colorado	8	2013	198000
11794	18	Aurora	Colorado	9	2013	202300
11795	18	Aurora	Colorado	10	2013	192000
11796	18	Aurora	Colorado	11	2013	190000
11797	18	Aurora	Colorado	12	2013	195750
11798	18	Aurora	Colorado	1	2014	187000
11799	18	Aurora	Colorado	2	2014	191000
11800	18	Aurora	Colorado	3	2014	206500
11801	18	Aurora	Colorado	4	2014	215500
11802	18	Aurora	Colorado	5	2014	213000
11803	18	Aurora	Colorado	6	2014	215000
11804	18	Aurora	Colorado	7	2014	224950
11805	18	Aurora	Colorado	8	2014	222000
11806	18	Aurora	Colorado	9	2014	222000
11807	18	Aurora	Colorado	10	2014	217500
11808	18	Aurora	Colorado	11	2014	215500
11809	18	Aurora	Colorado	12	2014	220000
11810	18	Aurora	Colorado	1	2015	215000
11811	18	Aurora	Colorado	2	2015	222000
11812	18	Aurora	Colorado	3	2015	231000
11813	18	Aurora	Colorado	4	2015	237000
11814	18	Aurora	Colorado	5	2015	255000
11815	18	Aurora	Colorado	6	2015	257185
11816	18	Aurora	Colorado	7	2015	256000
11817	18	Aurora	Colorado	8	2015	250000
11818	18	Aurora	Colorado	9	2015	249925
11819	18	Aurora	Colorado	10	2015	246000
11820	18	Aurora	Colorado	11	2015	250000
11821	18	Aurora	Colorado	12	2015	249300
11822	18	Aurora	Colorado	1	2016	250500
11823	18	Aurora	Colorado	2	2016	258754
11824	18	Aurora	Colorado	3	2016	269250
11825	18	Aurora	Colorado	4	2016	271000
11826	18	Aurora	Colorado	5	2016	285000
11827	18	Aurora	Colorado	6	2016	285000
11828	18	Aurora	Colorado	7	2016	284550
11829	18	Aurora	Colorado	8	2016	280000
11830	18	Aurora	Colorado	9	2016	280000
11831	18	Aurora	Colorado	10	2016	280000
11832	18	Aurora	Colorado	11	2016	278000
11833	18	Aurora	Colorado	12	2016	285250
11834	18	Aurora	Colorado	1	2017	280000
11835	18	Aurora	Colorado	2	2017	285000
11836	18	Aurora	Colorado	3	2017	295000
11837	18	Aurora	Colorado	4	2017	300000
11838	18	Aurora	Colorado	5	2017	309750
11839	18	Aurora	Colorado	6	2017	311750
11840	18	Aurora	Colorado	7	2017	315000
11841	18	Aurora	Colorado	8	2017	309750
11842	18	Aurora	Colorado	9	2017	309200
11843	18	Aurora	Colorado	10	2017	314005
11844	18	Aurora	Colorado	11	2017	312750
11845	18	Aurora	Colorado	12	2017	312000
11846	18	Aurora	Colorado	1	2018	310050
11847	18	Aurora	Colorado	2	2018	328000
11848	18	Aurora	Colorado	3	2018	325700
11849	18	Aurora	Colorado	4	2018	334000
11850	18	Aurora	Colorado	5	2018	336000
11851	18	Aurora	Colorado	6	2018	353500
11852	18	Aurora	Colorado	7	2018	350000
11853	18	Aurora	Colorado	8	2018	330000
11854	18	Aurora	Colorado	9	2018	340000
11855	18	Aurora	Colorado	10	2018	335000
11856	18	Aurora	Colorado	11	2018	334000
11857	18	Aurora	Colorado	12	2018	332750
11858	18	Aurora	Colorado	1	2019	0
11859	21	Lafayette	Colorado	1	2009	0
11860	21	Lafayette	Colorado	2	2009	0
11861	21	Lafayette	Colorado	3	2009	0
11862	21	Lafayette	Colorado	4	2009	0
11863	21	Lafayette	Colorado	5	2009	0
11864	21	Lafayette	Colorado	6	2009	0
11865	21	Lafayette	Colorado	7	2009	0
11866	21	Lafayette	Colorado	8	2009	0
11867	21	Lafayette	Colorado	9	2009	0
11868	21	Lafayette	Colorado	10	2009	0
11869	21	Lafayette	Colorado	11	2009	0
11870	21	Lafayette	Colorado	12	2009	0
11871	21	Lafayette	Colorado	1	2010	0
11872	21	Lafayette	Colorado	2	2010	0
11873	21	Lafayette	Colorado	3	2010	0
11874	21	Lafayette	Colorado	4	2010	0
11875	21	Lafayette	Colorado	5	2010	0
11876	21	Lafayette	Colorado	6	2010	0
11877	21	Lafayette	Colorado	7	2010	0
11878	21	Lafayette	Colorado	8	2010	0
11879	21	Lafayette	Colorado	9	2010	0
11880	21	Lafayette	Colorado	10	2010	0
11881	21	Lafayette	Colorado	11	2010	0
11882	21	Lafayette	Colorado	12	2010	0
11883	21	Lafayette	Colorado	1	2011	0
11884	21	Lafayette	Colorado	2	2011	0
11885	21	Lafayette	Colorado	3	2011	0
11886	21	Lafayette	Colorado	4	2011	0
11887	21	Lafayette	Colorado	5	2011	0
11888	21	Lafayette	Colorado	6	2011	0
11889	21	Lafayette	Colorado	7	2011	0
11890	21	Lafayette	Colorado	8	2011	0
11891	21	Lafayette	Colorado	9	2011	0
11892	21	Lafayette	Colorado	10	2011	0
11893	21	Lafayette	Colorado	11	2011	0
11894	21	Lafayette	Colorado	12	2011	0
11895	21	Lafayette	Colorado	1	2012	290000
11896	21	Lafayette	Colorado	2	2012	277500
11897	21	Lafayette	Colorado	3	2012	310450
11898	21	Lafayette	Colorado	4	2012	264500
11899	21	Lafayette	Colorado	5	2012	320000
11900	21	Lafayette	Colorado	6	2012	295000
11901	21	Lafayette	Colorado	7	2012	255000
11902	21	Lafayette	Colorado	8	2012	258750
11903	21	Lafayette	Colorado	9	2012	250000
11904	21	Lafayette	Colorado	10	2012	296500
11905	21	Lafayette	Colorado	11	2012	292830
11906	21	Lafayette	Colorado	12	2012	394000
11907	21	Lafayette	Colorado	1	2013	322732
11908	21	Lafayette	Colorado	2	2013	312384
11909	21	Lafayette	Colorado	3	2013	360000
11910	21	Lafayette	Colorado	4	2013	365000
11911	21	Lafayette	Colorado	5	2013	339000
11912	21	Lafayette	Colorado	6	2013	295000
11913	21	Lafayette	Colorado	7	2013	290000
11914	21	Lafayette	Colorado	8	2013	293500
11915	21	Lafayette	Colorado	9	2013	305000
11916	21	Lafayette	Colorado	10	2013	297000
11917	21	Lafayette	Colorado	11	2013	269000
11918	21	Lafayette	Colorado	12	2013	262400
11919	21	Lafayette	Colorado	1	2014	303000
11920	21	Lafayette	Colorado	2	2014	300000
11921	21	Lafayette	Colorado	3	2014	360500
11922	21	Lafayette	Colorado	4	2014	332000
11923	21	Lafayette	Colorado	5	2014	330000
11924	21	Lafayette	Colorado	6	2014	390000
11925	21	Lafayette	Colorado	7	2014	335500
11926	21	Lafayette	Colorado	8	2014	344224
11927	21	Lafayette	Colorado	9	2014	355300
11928	21	Lafayette	Colorado	10	2014	345000
11929	21	Lafayette	Colorado	11	2014	369200
11930	21	Lafayette	Colorado	12	2014	374380
11931	21	Lafayette	Colorado	1	2015	393390
11932	21	Lafayette	Colorado	2	2015	317875
11933	21	Lafayette	Colorado	3	2015	425706
11934	21	Lafayette	Colorado	4	2015	390000
11935	21	Lafayette	Colorado	5	2015	432199
11936	21	Lafayette	Colorado	6	2015	372000
11937	21	Lafayette	Colorado	7	2015	410000
11938	21	Lafayette	Colorado	8	2015	376400
11939	21	Lafayette	Colorado	9	2015	374220
11940	21	Lafayette	Colorado	10	2015	359500
11941	21	Lafayette	Colorado	11	2015	377500
11942	21	Lafayette	Colorado	12	2015	392000
11943	21	Lafayette	Colorado	1	2016	448000
11944	21	Lafayette	Colorado	2	2016	380000
11945	21	Lafayette	Colorado	3	2016	398200
11946	21	Lafayette	Colorado	4	2016	437495
11947	21	Lafayette	Colorado	5	2016	430750
11948	21	Lafayette	Colorado	6	2016	450000
11949	21	Lafayette	Colorado	7	2016	424990
11950	21	Lafayette	Colorado	8	2016	409500
11951	21	Lafayette	Colorado	9	2016	449000
11952	21	Lafayette	Colorado	10	2016	414750
11953	21	Lafayette	Colorado	11	2016	495000
11954	21	Lafayette	Colorado	12	2016	449000
11955	21	Lafayette	Colorado	1	2017	389000
11956	21	Lafayette	Colorado	2	2017	435000
11957	21	Lafayette	Colorado	3	2017	440000
11958	21	Lafayette	Colorado	4	2017	482000
11959	21	Lafayette	Colorado	5	2017	537000
11960	21	Lafayette	Colorado	6	2017	515000
11961	21	Lafayette	Colorado	7	2017	515000
11962	21	Lafayette	Colorado	8	2017	489300
11963	21	Lafayette	Colorado	9	2017	437495
11964	21	Lafayette	Colorado	10	2017	449900
11965	21	Lafayette	Colorado	11	2017	448000
11966	21	Lafayette	Colorado	12	2017	534500
11967	21	Lafayette	Colorado	1	2018	485000
11968	21	Lafayette	Colorado	2	2018	450000
11969	21	Lafayette	Colorado	3	2018	525000
11970	21	Lafayette	Colorado	4	2018	494300
11971	21	Lafayette	Colorado	5	2018	562500
11972	21	Lafayette	Colorado	6	2018	497750
11973	21	Lafayette	Colorado	7	2018	555500
11974	21	Lafayette	Colorado	8	2018	464237
11975	21	Lafayette	Colorado	9	2018	530000
11976	21	Lafayette	Colorado	10	2018	455000
11977	21	Lafayette	Colorado	11	2018	492500
11978	21	Lafayette	Colorado	12	2018	585000
11979	21	Lafayette	Colorado	1	2019	0
11980	24	Greenwich	Connecitcut	1	2009	0
11981	24	Greenwich	Connecitcut	2	2009	0
11982	24	Greenwich	Connecitcut	3	2009	0
11983	24	Greenwich	Connecitcut	4	2009	0
11984	24	Greenwich	Connecitcut	5	2009	0
11985	24	Greenwich	Connecitcut	6	2009	0
11986	24	Greenwich	Connecitcut	7	2009	0
11987	24	Greenwich	Connecitcut	8	2009	0
11988	24	Greenwich	Connecitcut	9	2009	0
11989	24	Greenwich	Connecitcut	10	2009	0
11990	24	Greenwich	Connecitcut	11	2009	0
11991	24	Greenwich	Connecitcut	12	2009	0
11992	24	Greenwich	Connecitcut	1	2010	0
11993	24	Greenwich	Connecitcut	2	2010	0
11994	24	Greenwich	Connecitcut	3	2010	0
11995	24	Greenwich	Connecitcut	4	2010	0
11996	24	Greenwich	Connecitcut	5	2010	0
11997	24	Greenwich	Connecitcut	6	2010	0
11998	24	Greenwich	Connecitcut	7	2010	0
11999	24	Greenwich	Connecitcut	8	2010	0
12000	24	Greenwich	Connecitcut	9	2010	0
12001	24	Greenwich	Connecitcut	10	2010	0
12002	24	Greenwich	Connecitcut	11	2010	0
12003	24	Greenwich	Connecitcut	12	2010	0
12004	24	Greenwich	Connecitcut	1	2011	0
12005	24	Greenwich	Connecitcut	2	2011	0
12006	24	Greenwich	Connecitcut	3	2011	0
12007	24	Greenwich	Connecitcut	4	2011	0
12008	24	Greenwich	Connecitcut	5	2011	0
12009	24	Greenwich	Connecitcut	6	2011	0
12010	24	Greenwich	Connecitcut	7	2011	0
12011	24	Greenwich	Connecitcut	8	2011	0
12012	24	Greenwich	Connecitcut	9	2011	0
12013	24	Greenwich	Connecitcut	10	2011	0
12014	24	Greenwich	Connecitcut	11	2011	0
12015	24	Greenwich	Connecitcut	12	2011	0
12016	24	Greenwich	Connecitcut	1	2012	727500
12017	24	Greenwich	Connecitcut	2	2012	897500
12018	24	Greenwich	Connecitcut	3	2012	837500
12019	24	Greenwich	Connecitcut	4	2012	1125000
12020	24	Greenwich	Connecitcut	5	2012	1200000
12021	24	Greenwich	Connecitcut	6	2012	1250000
12022	24	Greenwich	Connecitcut	7	2012	1219500
12023	24	Greenwich	Connecitcut	8	2012	1081750
12024	24	Greenwich	Connecitcut	9	2012	977500
12025	24	Greenwich	Connecitcut	10	2012	1075000
12026	24	Greenwich	Connecitcut	11	2012	945000
12027	24	Greenwich	Connecitcut	12	2012	935000
12028	24	Greenwich	Connecitcut	1	2013	900000
12029	24	Greenwich	Connecitcut	2	2013	900000
12030	24	Greenwich	Connecitcut	3	2013	635000
12031	24	Greenwich	Connecitcut	4	2013	687500
12032	24	Greenwich	Connecitcut	5	2013	892500
12033	24	Greenwich	Connecitcut	6	2013	937500
12034	24	Greenwich	Connecitcut	7	2013	949250
12035	24	Greenwich	Connecitcut	8	2013	1000000
12036	24	Greenwich	Connecitcut	9	2013	1100000
12037	24	Greenwich	Connecitcut	10	2013	1075000
12038	24	Greenwich	Connecitcut	11	2013	1100000
12039	24	Greenwich	Connecitcut	12	2013	1380000
12040	24	Greenwich	Connecitcut	1	2014	1402500
12041	24	Greenwich	Connecitcut	2	2014	1260500
12042	24	Greenwich	Connecitcut	3	2014	975000
12043	24	Greenwich	Connecitcut	4	2014	950000
12044	24	Greenwich	Connecitcut	5	2014	1100000
12045	24	Greenwich	Connecitcut	6	2014	1175000
12046	24	Greenwich	Connecitcut	7	2014	1300000
12047	24	Greenwich	Connecitcut	8	2014	1525000
12048	24	Greenwich	Connecitcut	9	2014	1406000
12049	24	Greenwich	Connecitcut	10	2014	1400625
12050	24	Greenwich	Connecitcut	11	2014	1362025
12051	24	Greenwich	Connecitcut	12	2014	1200000
12052	24	Greenwich	Connecitcut	1	2015	1175000
12053	24	Greenwich	Connecitcut	2	2015	1187500
12054	24	Greenwich	Connecitcut	3	2015	1230000
12055	24	Greenwich	Connecitcut	4	2015	1250000
12056	24	Greenwich	Connecitcut	5	2015	1289500
12057	24	Greenwich	Connecitcut	6	2015	1500000
12058	24	Greenwich	Connecitcut	7	2015	1600000
12059	24	Greenwich	Connecitcut	8	2015	1533333
12060	24	Greenwich	Connecitcut	9	2015	1372700
12061	24	Greenwich	Connecitcut	10	2015	900000
12062	24	Greenwich	Connecitcut	11	2015	950000
12063	24	Greenwich	Connecitcut	12	2015	883500
12064	24	Greenwich	Connecitcut	1	2016	975000
12065	24	Greenwich	Connecitcut	2	2016	899500
12066	24	Greenwich	Connecitcut	3	2016	1100000
12067	24	Greenwich	Connecitcut	4	2016	1100000
12068	24	Greenwich	Connecitcut	5	2016	1150000
12069	24	Greenwich	Connecitcut	6	2016	1102500
12070	24	Greenwich	Connecitcut	7	2016	1300000
12071	24	Greenwich	Connecitcut	8	2016	1450000
12072	24	Greenwich	Connecitcut	9	2016	1456250
12073	24	Greenwich	Connecitcut	10	2016	1015000
12074	24	Greenwich	Connecitcut	11	2016	1015000
12075	24	Greenwich	Connecitcut	12	2016	1400000
12076	24	Greenwich	Connecitcut	1	2017	1575000
12077	24	Greenwich	Connecitcut	2	2017	1525000
12078	24	Greenwich	Connecitcut	3	2017	1199999
12079	24	Greenwich	Connecitcut	4	2017	1112500
12080	24	Greenwich	Connecitcut	5	2017	1040000
12081	24	Greenwich	Connecitcut	6	2017	1310000
12082	24	Greenwich	Connecitcut	7	2017	1337500
12083	24	Greenwich	Connecitcut	8	2017	1325000
12084	24	Greenwich	Connecitcut	9	2017	1325000
12085	24	Greenwich	Connecitcut	10	2017	1325000
12086	24	Greenwich	Connecitcut	11	2017	1195000
12087	24	Greenwich	Connecitcut	12	2017	1145125
12088	24	Greenwich	Connecitcut	1	2018	1045000
12089	24	Greenwich	Connecitcut	2	2018	1145125
12090	24	Greenwich	Connecitcut	3	2018	901500
12091	24	Greenwich	Connecitcut	4	2018	1200000
12092	24	Greenwich	Connecitcut	5	2018	1072500
12093	24	Greenwich	Connecitcut	6	2018	1445000
12094	24	Greenwich	Connecitcut	7	2018	1350000
12095	24	Greenwich	Connecitcut	8	2018	1200000
12096	24	Greenwich	Connecitcut	9	2018	1090000
12097	24	Greenwich	Connecitcut	10	2018	1212500
12098	24	Greenwich	Connecitcut	11	2018	1274500
12099	24	Greenwich	Connecitcut	12	2018	899000
12100	24	Greenwich	Connecitcut	1	2019	0
12101	27	Dover	Delaware	1	2009	0
12102	27	Dover	Delaware	2	2009	0
12103	27	Dover	Delaware	3	2009	0
12104	27	Dover	Delaware	4	2009	0
12105	27	Dover	Delaware	5	2009	0
12106	27	Dover	Delaware	6	2009	0
12107	27	Dover	Delaware	7	2009	0
12108	27	Dover	Delaware	8	2009	0
12109	27	Dover	Delaware	9	2009	0
12110	27	Dover	Delaware	10	2009	0
12111	27	Dover	Delaware	11	2009	0
12112	27	Dover	Delaware	12	2009	0
12113	27	Dover	Delaware	1	2010	193000
12114	27	Dover	Delaware	2	2010	185000
12115	27	Dover	Delaware	3	2010	189200
12116	27	Dover	Delaware	4	2010	195000
12117	27	Dover	Delaware	5	2010	199000
12118	27	Dover	Delaware	6	2010	194898
12119	27	Dover	Delaware	7	2010	183000
12120	27	Dover	Delaware	8	2010	180000
12121	27	Dover	Delaware	9	2010	184900
12122	27	Dover	Delaware	10	2010	183750
12123	27	Dover	Delaware	11	2010	205995
12124	27	Dover	Delaware	12	2010	194900
12125	27	Dover	Delaware	1	2011	164900
12126	27	Dover	Delaware	2	2011	172000
12127	27	Dover	Delaware	3	2011	154300
12128	27	Dover	Delaware	4	2011	169900
12129	27	Dover	Delaware	5	2011	166000
12130	27	Dover	Delaware	6	2011	175000
12131	27	Dover	Delaware	7	2011	175000
12132	27	Dover	Delaware	8	2011	182400
12133	27	Dover	Delaware	9	2011	175000
12134	27	Dover	Delaware	10	2011	156500
12135	27	Dover	Delaware	11	2011	165000
12136	27	Dover	Delaware	12	2011	175000
12137	27	Dover	Delaware	1	2012	161600
12138	27	Dover	Delaware	2	2012	149900
12139	27	Dover	Delaware	3	2012	162900
12140	27	Dover	Delaware	4	2012	180000
12141	27	Dover	Delaware	5	2012	168750
12142	27	Dover	Delaware	6	2012	165000
12143	27	Dover	Delaware	7	2012	175000
12144	27	Dover	Delaware	8	2012	179950
12145	27	Dover	Delaware	9	2012	169500
12146	27	Dover	Delaware	10	2012	187500
12147	27	Dover	Delaware	11	2012	190000
12148	27	Dover	Delaware	12	2012	170000
12149	27	Dover	Delaware	1	2013	163000
12150	27	Dover	Delaware	2	2013	166000
12151	27	Dover	Delaware	3	2013	163950
12152	27	Dover	Delaware	4	2013	171250
12153	27	Dover	Delaware	5	2013	173000
12154	27	Dover	Delaware	6	2013	189000
12155	27	Dover	Delaware	7	2013	191500
12156	27	Dover	Delaware	8	2013	192000
12157	27	Dover	Delaware	9	2013	175000
12158	27	Dover	Delaware	10	2013	189050
12159	27	Dover	Delaware	11	2013	176143
12160	27	Dover	Delaware	12	2013	173750
12161	27	Dover	Delaware	1	2014	166500
12162	27	Dover	Delaware	2	2014	186250
12163	27	Dover	Delaware	3	2014	185000
12164	27	Dover	Delaware	4	2014	173450
12165	27	Dover	Delaware	5	2014	175000
12166	27	Dover	Delaware	6	2014	175000
12167	27	Dover	Delaware	7	2014	194950
12168	27	Dover	Delaware	8	2014	179900
12169	27	Dover	Delaware	9	2014	188700
12170	27	Dover	Delaware	10	2014	189900
12171	27	Dover	Delaware	11	2014	187000
12172	27	Dover	Delaware	12	2014	184000
12173	27	Dover	Delaware	1	2015	169900
12174	27	Dover	Delaware	2	2015	180000
12175	27	Dover	Delaware	3	2015	202850
12176	27	Dover	Delaware	4	2015	188450
12177	27	Dover	Delaware	5	2015	188000
12178	27	Dover	Delaware	6	2015	192800
12179	27	Dover	Delaware	7	2015	190000
12180	27	Dover	Delaware	8	2015	207900
12181	27	Dover	Delaware	9	2015	194989
12182	27	Dover	Delaware	10	2015	185500
12183	27	Dover	Delaware	11	2015	179500
12184	27	Dover	Delaware	12	2015	193500
12185	27	Dover	Delaware	1	2016	199000
12186	27	Dover	Delaware	2	2016	198425
12187	27	Dover	Delaware	3	2016	188950
12188	27	Dover	Delaware	4	2016	203500
12189	27	Dover	Delaware	5	2016	199000
12190	27	Dover	Delaware	6	2016	204950
12191	27	Dover	Delaware	7	2016	198050
12192	27	Dover	Delaware	8	2016	186450
12193	27	Dover	Delaware	9	2016	205600
12194	27	Dover	Delaware	10	2016	199500
12195	27	Dover	Delaware	11	2016	205500
12196	27	Dover	Delaware	12	2016	186750
12197	27	Dover	Delaware	1	2017	187900
12198	27	Dover	Delaware	2	2017	189950
12199	27	Dover	Delaware	3	2017	195000
12200	27	Dover	Delaware	4	2017	204450
12201	27	Dover	Delaware	5	2017	205000
12202	27	Dover	Delaware	6	2017	199900
12203	27	Dover	Delaware	7	2017	194900
12204	27	Dover	Delaware	8	2017	205000
12205	27	Dover	Delaware	9	2017	220700
12206	27	Dover	Delaware	10	2017	205000
12207	27	Dover	Delaware	11	2017	200000
12208	27	Dover	Delaware	12	2017	205000
12209	27	Dover	Delaware	1	2018	190000
12210	27	Dover	Delaware	2	2018	194000
12211	27	Dover	Delaware	3	2018	198500
12212	27	Dover	Delaware	4	2018	206750
12213	27	Dover	Delaware	5	2018	215000
12214	27	Dover	Delaware	6	2018	223525
12215	27	Dover	Delaware	7	2018	215000
12216	27	Dover	Delaware	8	2018	213500
12217	27	Dover	Delaware	9	2018	228450
12218	27	Dover	Delaware	10	2018	211000
12219	27	Dover	Delaware	11	2018	217000
12220	27	Dover	Delaware	12	2018	199900
12221	27	Dover	Delaware	1	2019	0
12222	28	Newark	Delaware	1	2009	0
12223	28	Newark	Delaware	2	2009	0
12224	28	Newark	Delaware	3	2009	0
12225	28	Newark	Delaware	4	2009	0
12226	28	Newark	Delaware	5	2009	0
12227	28	Newark	Delaware	6	2009	0
12228	28	Newark	Delaware	7	2009	0
12229	28	Newark	Delaware	8	2009	0
12230	28	Newark	Delaware	9	2009	0
12231	28	Newark	Delaware	10	2009	0
12232	28	Newark	Delaware	11	2009	0
12233	28	Newark	Delaware	12	2009	0
12234	28	Newark	Delaware	1	2010	0
12235	28	Newark	Delaware	2	2010	0
12236	28	Newark	Delaware	3	2010	0
12237	28	Newark	Delaware	4	2010	0
12238	28	Newark	Delaware	5	2010	0
12239	28	Newark	Delaware	6	2010	0
12240	28	Newark	Delaware	7	2010	0
12241	28	Newark	Delaware	8	2010	0
12242	28	Newark	Delaware	9	2010	0
12243	28	Newark	Delaware	10	2010	0
12244	28	Newark	Delaware	11	2010	0
12245	28	Newark	Delaware	12	2010	0
12246	28	Newark	Delaware	1	2011	0
12247	28	Newark	Delaware	2	2011	0
12248	28	Newark	Delaware	3	2011	0
12249	28	Newark	Delaware	4	2011	0
12250	28	Newark	Delaware	5	2011	0
12251	28	Newark	Delaware	6	2011	0
12252	28	Newark	Delaware	7	2011	0
12253	28	Newark	Delaware	8	2011	0
12254	28	Newark	Delaware	9	2011	0
12255	28	Newark	Delaware	10	2011	0
12256	28	Newark	Delaware	11	2011	0
12257	28	Newark	Delaware	12	2011	0
12258	28	Newark	Delaware	1	2012	0
12259	28	Newark	Delaware	2	2012	0
12260	28	Newark	Delaware	3	2012	0
12261	28	Newark	Delaware	4	2012	159900
12262	28	Newark	Delaware	5	2012	0
12263	28	Newark	Delaware	6	2012	0
12264	28	Newark	Delaware	7	2012	0
12265	28	Newark	Delaware	8	2012	0
12266	28	Newark	Delaware	9	2012	0
12267	28	Newark	Delaware	10	2012	0
12268	28	Newark	Delaware	11	2012	0
12269	28	Newark	Delaware	12	2012	0
12270	28	Newark	Delaware	1	2013	0
12271	28	Newark	Delaware	2	2013	0
12272	28	Newark	Delaware	3	2013	165000
12273	28	Newark	Delaware	4	2013	175000
12274	28	Newark	Delaware	5	2013	182000
12275	28	Newark	Delaware	6	2013	205000
12276	28	Newark	Delaware	7	2013	199900
12277	28	Newark	Delaware	8	2013	184500
12278	28	Newark	Delaware	9	2013	192000
12279	28	Newark	Delaware	10	2013	210000
12280	28	Newark	Delaware	11	2013	181000
12281	28	Newark	Delaware	12	2013	183900
12282	28	Newark	Delaware	1	2014	188700
12283	28	Newark	Delaware	2	2014	187000
12284	28	Newark	Delaware	3	2014	202000
12285	28	Newark	Delaware	4	2014	190000
12286	28	Newark	Delaware	5	2014	189950
12287	28	Newark	Delaware	6	2014	187500
12288	28	Newark	Delaware	7	2014	211500
12289	28	Newark	Delaware	8	2014	213950
12290	28	Newark	Delaware	9	2014	219900
12291	28	Newark	Delaware	10	2014	219900
12292	28	Newark	Delaware	11	2014	213790
12293	28	Newark	Delaware	12	2014	194000
12294	28	Newark	Delaware	1	2015	200000
12295	28	Newark	Delaware	2	2015	217000
12296	28	Newark	Delaware	3	2015	199000
12297	28	Newark	Delaware	4	2015	206000
12298	28	Newark	Delaware	5	2015	199450
12299	28	Newark	Delaware	6	2015	204450
12300	28	Newark	Delaware	7	2015	204815
12301	28	Newark	Delaware	8	2015	209000
12302	28	Newark	Delaware	9	2015	210000
12303	28	Newark	Delaware	10	2015	206750
12304	28	Newark	Delaware	11	2015	216495
12305	28	Newark	Delaware	12	2015	200000
12306	28	Newark	Delaware	1	2016	200000
12307	28	Newark	Delaware	2	2016	210000
12308	28	Newark	Delaware	3	2016	194900
12309	28	Newark	Delaware	4	2016	200000
12310	28	Newark	Delaware	5	2016	205000
12311	28	Newark	Delaware	6	2016	204500
12312	28	Newark	Delaware	7	2016	212975
12313	28	Newark	Delaware	8	2016	219900
12314	28	Newark	Delaware	9	2016	209000
12315	28	Newark	Delaware	10	2016	219000
12316	28	Newark	Delaware	11	2016	224500
12317	28	Newark	Delaware	12	2016	214750
12318	28	Newark	Delaware	1	2017	210000
12319	28	Newark	Delaware	2	2017	199900
12320	28	Newark	Delaware	3	2017	200000
12321	28	Newark	Delaware	4	2017	205000
12322	28	Newark	Delaware	5	2017	213950
12323	28	Newark	Delaware	6	2017	218375
12324	28	Newark	Delaware	7	2017	210000
12325	28	Newark	Delaware	8	2017	230000
12326	28	Newark	Delaware	9	2017	204300
12327	28	Newark	Delaware	10	2017	210000
12328	28	Newark	Delaware	11	2017	195000
12329	28	Newark	Delaware	12	2017	222695
12330	28	Newark	Delaware	1	2018	219900
12331	28	Newark	Delaware	2	2018	209200
12332	28	Newark	Delaware	3	2018	215000
12333	28	Newark	Delaware	4	2018	207000
12334	28	Newark	Delaware	5	2018	210000
12335	28	Newark	Delaware	6	2018	230000
12336	28	Newark	Delaware	7	2018	225000
12337	28	Newark	Delaware	8	2018	233750
12338	28	Newark	Delaware	9	2018	235000
12339	28	Newark	Delaware	10	2018	210500
12340	28	Newark	Delaware	11	2018	230000
12341	28	Newark	Delaware	12	2018	221750
12342	28	Newark	Delaware	1	2019	0
12343	31	Jacksonville Beach	Florida	1	2009	0
12344	31	Jacksonville Beach	Florida	2	2009	0
12345	31	Jacksonville Beach	Florida	3	2009	0
12346	31	Jacksonville Beach	Florida	4	2009	0
12347	31	Jacksonville Beach	Florida	5	2009	0
12348	31	Jacksonville Beach	Florida	6	2009	0
12349	31	Jacksonville Beach	Florida	7	2009	0
12350	31	Jacksonville Beach	Florida	8	2009	0
12351	31	Jacksonville Beach	Florida	9	2009	0
12352	31	Jacksonville Beach	Florida	10	2009	0
12353	31	Jacksonville Beach	Florida	11	2009	0
12354	31	Jacksonville Beach	Florida	12	2009	0
12355	31	Jacksonville Beach	Florida	1	2010	0
12356	31	Jacksonville Beach	Florida	2	2010	0
12357	31	Jacksonville Beach	Florida	3	2010	0
12358	31	Jacksonville Beach	Florida	4	2010	0
12359	31	Jacksonville Beach	Florida	5	2010	0
12360	31	Jacksonville Beach	Florida	6	2010	0
12361	31	Jacksonville Beach	Florida	7	2010	0
12362	31	Jacksonville Beach	Florida	8	2010	0
12363	31	Jacksonville Beach	Florida	9	2010	0
12364	31	Jacksonville Beach	Florida	10	2010	0
12365	31	Jacksonville Beach	Florida	11	2010	0
12366	31	Jacksonville Beach	Florida	12	2010	0
12367	31	Jacksonville Beach	Florida	1	2011	0
12368	31	Jacksonville Beach	Florida	2	2011	0
12369	31	Jacksonville Beach	Florida	3	2011	0
12370	31	Jacksonville Beach	Florida	4	2011	0
12371	31	Jacksonville Beach	Florida	5	2011	0
12372	31	Jacksonville Beach	Florida	6	2011	0
12373	31	Jacksonville Beach	Florida	7	2011	0
12374	31	Jacksonville Beach	Florida	8	2011	0
12375	31	Jacksonville Beach	Florida	9	2011	0
12376	31	Jacksonville Beach	Florida	10	2011	0
12377	31	Jacksonville Beach	Florida	11	2011	0
12378	31	Jacksonville Beach	Florida	12	2011	0
12379	31	Jacksonville Beach	Florida	1	2012	238250
12380	31	Jacksonville Beach	Florida	2	2012	235000
12381	31	Jacksonville Beach	Florida	3	2012	245000
12382	31	Jacksonville Beach	Florida	4	2012	245000
12383	31	Jacksonville Beach	Florida	5	2012	253750
12384	31	Jacksonville Beach	Florida	6	2012	259500
12385	31	Jacksonville Beach	Florida	7	2012	259000
12386	31	Jacksonville Beach	Florida	8	2012	250000
12387	31	Jacksonville Beach	Florida	9	2012	245000
12388	31	Jacksonville Beach	Florida	10	2012	240000
12389	31	Jacksonville Beach	Florida	11	2012	250000
12390	31	Jacksonville Beach	Florida	12	2012	240000
12391	31	Jacksonville Beach	Florida	1	2013	239000
12392	31	Jacksonville Beach	Florida	2	2013	237000
12393	31	Jacksonville Beach	Florida	3	2013	269000
12394	31	Jacksonville Beach	Florida	4	2013	285000
12395	31	Jacksonville Beach	Florida	5	2013	289500
12396	31	Jacksonville Beach	Florida	6	2013	286755
12397	31	Jacksonville Beach	Florida	7	2013	288100
12398	31	Jacksonville Beach	Florida	8	2013	300000
12399	31	Jacksonville Beach	Florida	9	2013	281900
12400	31	Jacksonville Beach	Florida	10	2013	275500
12401	31	Jacksonville Beach	Florida	11	2013	274950
12402	31	Jacksonville Beach	Florida	12	2013	266500
12403	31	Jacksonville Beach	Florida	1	2014	270000
12404	31	Jacksonville Beach	Florida	2	2014	274450
12405	31	Jacksonville Beach	Florida	3	2014	308899
12406	31	Jacksonville Beach	Florida	4	2014	304900
12407	31	Jacksonville Beach	Florida	5	2014	297812
12408	31	Jacksonville Beach	Florida	6	2014	297812
12409	31	Jacksonville Beach	Florida	7	2014	305000
12410	31	Jacksonville Beach	Florida	8	2014	307500
12411	31	Jacksonville Beach	Florida	9	2014	315000
12412	31	Jacksonville Beach	Florida	10	2014	293500
12413	31	Jacksonville Beach	Florida	11	2014	289950
12414	31	Jacksonville Beach	Florida	12	2014	271000
12415	31	Jacksonville Beach	Florida	1	2015	297500
12416	31	Jacksonville Beach	Florida	2	2015	298500
12417	31	Jacksonville Beach	Florida	3	2015	305000
12418	31	Jacksonville Beach	Florida	4	2015	295000
12419	31	Jacksonville Beach	Florida	5	2015	295000
12420	31	Jacksonville Beach	Florida	6	2015	291250
12421	31	Jacksonville Beach	Florida	7	2015	305000
12422	31	Jacksonville Beach	Florida	8	2015	305000
12423	31	Jacksonville Beach	Florida	9	2015	320000
12424	31	Jacksonville Beach	Florida	10	2015	313250
12425	31	Jacksonville Beach	Florida	11	2015	335000
12426	31	Jacksonville Beach	Florida	12	2015	339000
12427	31	Jacksonville Beach	Florida	1	2016	356250
12428	31	Jacksonville Beach	Florida	2	2016	335000
12429	31	Jacksonville Beach	Florida	3	2016	320000
12430	31	Jacksonville Beach	Florida	4	2016	316500
12431	31	Jacksonville Beach	Florida	5	2016	300450
12432	31	Jacksonville Beach	Florida	6	2016	318950
12433	31	Jacksonville Beach	Florida	7	2016	329500
12434	31	Jacksonville Beach	Florida	8	2016	350000
12435	31	Jacksonville Beach	Florida	9	2016	350000
12436	31	Jacksonville Beach	Florida	10	2016	354500
12437	31	Jacksonville Beach	Florida	11	2016	330000
12438	31	Jacksonville Beach	Florida	12	2016	335000
12439	31	Jacksonville Beach	Florida	1	2017	341000
12440	31	Jacksonville Beach	Florida	2	2017	342000
12441	31	Jacksonville Beach	Florida	3	2017	340000
12442	31	Jacksonville Beach	Florida	4	2017	350000
12443	31	Jacksonville Beach	Florida	5	2017	366000
12444	31	Jacksonville Beach	Florida	6	2017	362500
12445	31	Jacksonville Beach	Florida	7	2017	362250
12446	31	Jacksonville Beach	Florida	8	2017	357000
12447	31	Jacksonville Beach	Florida	9	2017	360000
12448	31	Jacksonville Beach	Florida	10	2017	364750
12449	31	Jacksonville Beach	Florida	11	2017	364000
12450	31	Jacksonville Beach	Florida	12	2017	372450
12451	31	Jacksonville Beach	Florida	1	2018	375000
12452	31	Jacksonville Beach	Florida	2	2018	375000
12453	31	Jacksonville Beach	Florida	3	2018	385000
12454	31	Jacksonville Beach	Florida	4	2018	385000
12455	31	Jacksonville Beach	Florida	5	2018	385000
12456	31	Jacksonville Beach	Florida	6	2018	390000
12457	31	Jacksonville Beach	Florida	7	2018	406850
12458	31	Jacksonville Beach	Florida	8	2018	408850
12459	31	Jacksonville Beach	Florida	9	2018	389000
12460	31	Jacksonville Beach	Florida	10	2018	368750
12461	31	Jacksonville Beach	Florida	11	2018	370000
12462	31	Jacksonville Beach	Florida	12	2018	379250
12463	31	Jacksonville Beach	Florida	1	2019	0
12464	33	Miami Beach	Florida	1	2009	0
12465	33	Miami Beach	Florida	2	2009	0
12466	33	Miami Beach	Florida	3	2009	0
12467	33	Miami Beach	Florida	4	2009	0
12468	33	Miami Beach	Florida	5	2009	0
12469	33	Miami Beach	Florida	6	2009	0
12470	33	Miami Beach	Florida	7	2009	0
12471	33	Miami Beach	Florida	8	2009	0
12472	33	Miami Beach	Florida	9	2009	0
12473	33	Miami Beach	Florida	10	2009	0
12474	33	Miami Beach	Florida	11	2009	0
12475	33	Miami Beach	Florida	12	2009	0
12476	33	Miami Beach	Florida	1	2010	0
12477	33	Miami Beach	Florida	2	2010	0
12478	33	Miami Beach	Florida	3	2010	0
12479	33	Miami Beach	Florida	4	2010	0
12480	33	Miami Beach	Florida	5	2010	0
12481	33	Miami Beach	Florida	6	2010	0
12482	33	Miami Beach	Florida	7	2010	0
12483	33	Miami Beach	Florida	8	2010	0
12484	33	Miami Beach	Florida	9	2010	0
12485	33	Miami Beach	Florida	10	2010	0
12486	33	Miami Beach	Florida	11	2010	0
12487	33	Miami Beach	Florida	12	2010	0
12488	33	Miami Beach	Florida	1	2011	0
12489	33	Miami Beach	Florida	2	2011	0
12490	33	Miami Beach	Florida	3	2011	0
12491	33	Miami Beach	Florida	4	2011	0
12492	33	Miami Beach	Florida	5	2011	0
12493	33	Miami Beach	Florida	6	2011	0
12494	33	Miami Beach	Florida	7	2011	0
12495	33	Miami Beach	Florida	8	2011	0
12496	33	Miami Beach	Florida	9	2011	0
12497	33	Miami Beach	Florida	10	2011	0
12498	33	Miami Beach	Florida	11	2011	0
12499	33	Miami Beach	Florida	12	2011	0
12500	33	Miami Beach	Florida	1	2012	0
12501	33	Miami Beach	Florida	2	2012	0
12502	33	Miami Beach	Florida	3	2012	0
12503	33	Miami Beach	Florida	4	2012	0
12504	33	Miami Beach	Florida	5	2012	0
12505	33	Miami Beach	Florida	6	2012	0
12506	33	Miami Beach	Florida	7	2012	0
12507	33	Miami Beach	Florida	8	2012	0
12508	33	Miami Beach	Florida	9	2012	0
12509	33	Miami Beach	Florida	10	2012	0
12510	33	Miami Beach	Florida	11	2012	0
12511	33	Miami Beach	Florida	12	2012	0
12512	33	Miami Beach	Florida	1	2013	246500
12513	33	Miami Beach	Florida	2	2013	310000
12514	33	Miami Beach	Florida	3	2013	0
12515	33	Miami Beach	Florida	4	2013	340000
12516	33	Miami Beach	Florida	5	2013	377500
12517	33	Miami Beach	Florida	6	2013	320000
12518	33	Miami Beach	Florida	7	2013	310000
12519	33	Miami Beach	Florida	8	2013	392000
12520	33	Miami Beach	Florida	9	2013	325000
12521	33	Miami Beach	Florida	10	2013	349250
12522	33	Miami Beach	Florida	11	2013	330000
12523	33	Miami Beach	Florida	12	2013	342300
12524	33	Miami Beach	Florida	1	2014	350000
12525	33	Miami Beach	Florida	2	2014	367000
12526	33	Miami Beach	Florida	3	2014	365000
12527	33	Miami Beach	Florida	4	2014	380000
12528	33	Miami Beach	Florida	5	2014	390000
12529	33	Miami Beach	Florida	6	2014	340000
12530	33	Miami Beach	Florida	7	2014	408500
12531	33	Miami Beach	Florida	8	2014	370000
12532	33	Miami Beach	Florida	9	2014	355500
12533	33	Miami Beach	Florida	10	2014	370000
12534	33	Miami Beach	Florida	11	2014	319000
12535	33	Miami Beach	Florida	12	2014	408500
12536	33	Miami Beach	Florida	1	2015	400000
12537	33	Miami Beach	Florida	2	2015	400000
12538	33	Miami Beach	Florida	3	2015	370000
12539	33	Miami Beach	Florida	4	2015	406000
12540	33	Miami Beach	Florida	5	2015	396000
12541	33	Miami Beach	Florida	6	2015	430000
12542	33	Miami Beach	Florida	7	2015	378000
12543	33	Miami Beach	Florida	8	2015	354000
12544	33	Miami Beach	Florida	9	2015	378750
12545	33	Miami Beach	Florida	10	2015	330000
12546	33	Miami Beach	Florida	11	2015	318000
12547	33	Miami Beach	Florida	12	2015	360000
12548	33	Miami Beach	Florida	1	2016	360000
12549	33	Miami Beach	Florida	2	2016	370150
12550	33	Miami Beach	Florida	3	2016	350000
12551	33	Miami Beach	Florida	4	2016	400000
12552	33	Miami Beach	Florida	5	2016	370000
12553	33	Miami Beach	Florida	6	2016	427500
12554	33	Miami Beach	Florida	7	2016	366000
12555	33	Miami Beach	Florida	8	2016	398000
12556	33	Miami Beach	Florida	9	2016	347500
12557	33	Miami Beach	Florida	10	2016	362500
12558	33	Miami Beach	Florida	11	2016	373500
12559	33	Miami Beach	Florida	12	2016	365000
12560	33	Miami Beach	Florida	1	2017	349500
12561	33	Miami Beach	Florida	2	2017	345000
12562	33	Miami Beach	Florida	3	2017	375000
12563	33	Miami Beach	Florida	4	2017	385000
12564	33	Miami Beach	Florida	5	2017	370000
12565	33	Miami Beach	Florida	6	2017	405000
12566	33	Miami Beach	Florida	7	2017	395250
12567	33	Miami Beach	Florida	8	2017	340000
12568	33	Miami Beach	Florida	9	2017	327500
12569	33	Miami Beach	Florida	10	2017	400000
12570	33	Miami Beach	Florida	11	2017	315000
12571	33	Miami Beach	Florida	12	2017	335000
12572	33	Miami Beach	Florida	1	2018	346250
12573	33	Miami Beach	Florida	2	2018	415000
12574	33	Miami Beach	Florida	3	2018	433000
12575	33	Miami Beach	Florida	4	2018	351500
12576	33	Miami Beach	Florida	5	2018	345000
12577	33	Miami Beach	Florida	6	2018	442500
12578	33	Miami Beach	Florida	7	2018	407500
12579	33	Miami Beach	Florida	8	2018	355000
12580	33	Miami Beach	Florida	9	2018	325000
12581	33	Miami Beach	Florida	10	2018	301000
12582	33	Miami Beach	Florida	11	2018	312500
12583	33	Miami Beach	Florida	12	2018	375000
12584	33	Miami Beach	Florida	1	2019	0
12585	34	North Miami	Florida	1	2009	0
12586	34	North Miami	Florida	2	2009	0
12587	34	North Miami	Florida	3	2009	0
12588	34	North Miami	Florida	4	2009	0
12589	34	North Miami	Florida	5	2009	0
12590	34	North Miami	Florida	6	2009	0
12591	34	North Miami	Florida	7	2009	0
12592	34	North Miami	Florida	8	2009	0
12593	34	North Miami	Florida	9	2009	0
12594	34	North Miami	Florida	10	2009	0
12595	34	North Miami	Florida	11	2009	0
12596	34	North Miami	Florida	12	2009	0
12597	34	North Miami	Florida	1	2010	0
12598	34	North Miami	Florida	2	2010	0
12599	34	North Miami	Florida	3	2010	0
12600	34	North Miami	Florida	4	2010	0
12601	34	North Miami	Florida	5	2010	0
12602	34	North Miami	Florida	6	2010	0
12603	34	North Miami	Florida	7	2010	0
12604	34	North Miami	Florida	8	2010	0
12605	34	North Miami	Florida	9	2010	0
12606	34	North Miami	Florida	10	2010	0
12607	34	North Miami	Florida	11	2010	0
12608	34	North Miami	Florida	12	2010	0
12609	34	North Miami	Florida	1	2011	0
12610	34	North Miami	Florida	2	2011	0
12611	34	North Miami	Florida	3	2011	0
12612	34	North Miami	Florida	4	2011	0
12613	34	North Miami	Florida	5	2011	0
12614	34	North Miami	Florida	6	2011	0
12615	34	North Miami	Florida	7	2011	0
12616	34	North Miami	Florida	8	2011	0
12617	34	North Miami	Florida	9	2011	0
12618	34	North Miami	Florida	10	2011	0
12619	34	North Miami	Florida	11	2011	0
12620	34	North Miami	Florida	12	2011	0
12621	34	North Miami	Florida	1	2012	0
12622	34	North Miami	Florida	2	2012	0
12623	34	North Miami	Florida	3	2012	0
12624	34	North Miami	Florida	4	2012	0
12625	34	North Miami	Florida	5	2012	0
12626	34	North Miami	Florida	6	2012	0
12627	34	North Miami	Florida	7	2012	0
12628	34	North Miami	Florida	8	2012	0
12629	34	North Miami	Florida	9	2012	0
12630	34	North Miami	Florida	10	2012	0
12631	34	North Miami	Florida	11	2012	0
12632	34	North Miami	Florida	12	2012	0
12633	34	North Miami	Florida	1	2013	0
12634	34	North Miami	Florida	2	2013	0
12635	34	North Miami	Florida	3	2013	95000
12636	34	North Miami	Florida	4	2013	95000
12637	34	North Miami	Florida	5	2013	114500
12638	34	North Miami	Florida	6	2013	103500
12639	34	North Miami	Florida	7	2013	115000
12640	34	North Miami	Florida	8	2013	115300
12641	34	North Miami	Florida	9	2013	95000
12642	34	North Miami	Florida	10	2013	110000
12643	34	North Miami	Florida	11	2013	145500
12644	34	North Miami	Florida	12	2013	138000
12645	34	North Miami	Florida	1	2014	118000
12646	34	North Miami	Florida	2	2014	106500
12647	34	North Miami	Florida	3	2014	130000
12648	34	North Miami	Florida	4	2014	127000
12649	34	North Miami	Florida	5	2014	120000
12650	34	North Miami	Florida	6	2014	136900
12651	34	North Miami	Florida	7	2014	135000
12652	34	North Miami	Florida	8	2014	113000
12653	34	North Miami	Florida	9	2014	129250
12654	34	North Miami	Florida	10	2014	134900
12655	34	North Miami	Florida	11	2014	130000
12656	34	North Miami	Florida	12	2014	134900
12657	34	North Miami	Florida	1	2015	134500
12658	34	North Miami	Florida	2	2015	145000
12659	34	North Miami	Florida	3	2015	128800
12660	34	North Miami	Florida	4	2015	125000
12661	34	North Miami	Florida	5	2015	134500
12662	34	North Miami	Florida	6	2015	138000
12663	34	North Miami	Florida	7	2015	157000
12664	34	North Miami	Florida	8	2015	151000
12665	34	North Miami	Florida	9	2015	150412
12666	34	North Miami	Florida	10	2015	141000
12667	34	North Miami	Florida	11	2015	145000
12668	34	North Miami	Florida	12	2015	150000
12669	34	North Miami	Florida	1	2016	140500
12670	34	North Miami	Florida	2	2016	155000
12671	34	North Miami	Florida	3	2016	165000
12672	34	North Miami	Florida	4	2016	151000
12673	34	North Miami	Florida	5	2016	172000
12674	34	North Miami	Florida	6	2016	160000
12675	34	North Miami	Florida	7	2016	165000
12676	34	North Miami	Florida	8	2016	205000
12677	34	North Miami	Florida	9	2016	169000
12678	34	North Miami	Florida	10	2016	151000
12679	34	North Miami	Florida	11	2016	193000
12680	34	North Miami	Florida	12	2016	172000
12681	34	North Miami	Florida	1	2017	187500
12682	34	North Miami	Florida	2	2017	212500
12683	34	North Miami	Florida	3	2017	181000
12684	34	North Miami	Florida	4	2017	226000
12685	34	North Miami	Florida	5	2017	223500
12686	34	North Miami	Florida	6	2017	230000
12687	34	North Miami	Florida	7	2017	235000
12688	34	North Miami	Florida	8	2017	197500
12689	34	North Miami	Florida	9	2017	214000
12690	34	North Miami	Florida	10	2017	209000
12691	34	North Miami	Florida	11	2017	210000
12692	34	North Miami	Florida	12	2017	197500
12693	34	North Miami	Florida	1	2018	214500
12694	34	North Miami	Florida	2	2018	220000
12695	34	North Miami	Florida	3	2018	200000
12696	34	North Miami	Florida	4	2018	250000
12697	34	North Miami	Florida	5	2018	212500
12698	34	North Miami	Florida	6	2018	239750
12699	34	North Miami	Florida	7	2018	203000
12700	34	North Miami	Florida	8	2018	220000
12701	34	North Miami	Florida	9	2018	237500
12702	34	North Miami	Florida	10	2018	242500
12703	34	North Miami	Florida	11	2018	220000
12704	34	North Miami	Florida	12	2018	175000
12705	34	North Miami	Florida	1	2019	0
12706	35	North Miami Beach	Florida	1	2009	0
12707	35	North Miami Beach	Florida	2	2009	0
12708	35	North Miami Beach	Florida	3	2009	0
12709	35	North Miami Beach	Florida	4	2009	0
12710	35	North Miami Beach	Florida	5	2009	0
12711	35	North Miami Beach	Florida	6	2009	0
12712	35	North Miami Beach	Florida	7	2009	0
12713	35	North Miami Beach	Florida	8	2009	0
12714	35	North Miami Beach	Florida	9	2009	0
12715	35	North Miami Beach	Florida	10	2009	0
12716	35	North Miami Beach	Florida	11	2009	0
12717	35	North Miami Beach	Florida	12	2009	0
12718	35	North Miami Beach	Florida	1	2010	0
12719	35	North Miami Beach	Florida	2	2010	0
12720	35	North Miami Beach	Florida	3	2010	0
12721	35	North Miami Beach	Florida	4	2010	0
12722	35	North Miami Beach	Florida	5	2010	0
12723	35	North Miami Beach	Florida	6	2010	0
12724	35	North Miami Beach	Florida	7	2010	0
12725	35	North Miami Beach	Florida	8	2010	0
12726	35	North Miami Beach	Florida	9	2010	0
12727	35	North Miami Beach	Florida	10	2010	0
12728	35	North Miami Beach	Florida	11	2010	0
12729	35	North Miami Beach	Florida	12	2010	0
12730	35	North Miami Beach	Florida	1	2011	0
12731	35	North Miami Beach	Florida	2	2011	0
12732	35	North Miami Beach	Florida	3	2011	0
12733	35	North Miami Beach	Florida	4	2011	0
12734	35	North Miami Beach	Florida	5	2011	0
12735	35	North Miami Beach	Florida	6	2011	0
12736	35	North Miami Beach	Florida	7	2011	0
12737	35	North Miami Beach	Florida	8	2011	0
12738	35	North Miami Beach	Florida	9	2011	0
12739	35	North Miami Beach	Florida	10	2011	0
12740	35	North Miami Beach	Florida	11	2011	0
12741	35	North Miami Beach	Florida	12	2011	0
12742	35	North Miami Beach	Florida	1	2012	0
12743	35	North Miami Beach	Florida	2	2012	0
12744	35	North Miami Beach	Florida	3	2012	0
12745	35	North Miami Beach	Florida	4	2012	0
12746	35	North Miami Beach	Florida	5	2012	0
12747	35	North Miami Beach	Florida	6	2012	0
12748	35	North Miami Beach	Florida	7	2012	0
12749	35	North Miami Beach	Florida	8	2012	84000
12750	35	North Miami Beach	Florida	9	2012	0
12751	35	North Miami Beach	Florida	10	2012	0
12752	35	North Miami Beach	Florida	11	2012	0
12753	35	North Miami Beach	Florida	12	2012	117000
12754	35	North Miami Beach	Florida	1	2013	0
12755	35	North Miami Beach	Florida	2	2013	0
12756	35	North Miami Beach	Florida	3	2013	115000
12757	35	North Miami Beach	Florida	4	2013	124450
12758	35	North Miami Beach	Florida	5	2013	120000
12759	35	North Miami Beach	Florida	6	2013	130500
12760	35	North Miami Beach	Florida	7	2013	128750
12761	35	North Miami Beach	Florida	8	2013	125000
12762	35	North Miami Beach	Florida	9	2013	123500
12763	35	North Miami Beach	Florida	10	2013	124750
12764	35	North Miami Beach	Florida	11	2013	134500
12765	35	North Miami Beach	Florida	12	2013	127550
12766	35	North Miami Beach	Florida	1	2014	129750
12767	35	North Miami Beach	Florida	2	2014	133000
12768	35	North Miami Beach	Florida	3	2014	125150
12769	35	North Miami Beach	Florida	4	2014	127000
12770	35	North Miami Beach	Florida	5	2014	155000
12771	35	North Miami Beach	Florida	6	2014	149000
12772	35	North Miami Beach	Florida	7	2014	146000
12773	35	North Miami Beach	Florida	8	2014	120000
12774	35	North Miami Beach	Florida	9	2014	140000
12775	35	North Miami Beach	Florida	10	2014	152000
12776	35	North Miami Beach	Florida	11	2014	143500
12777	35	North Miami Beach	Florida	12	2014	140000
12778	35	North Miami Beach	Florida	1	2015	125000
12779	35	North Miami Beach	Florida	2	2015	145000
12780	35	North Miami Beach	Florida	3	2015	142500
12781	35	North Miami Beach	Florida	4	2015	141800
12782	35	North Miami Beach	Florida	5	2015	137500
12783	35	North Miami Beach	Florida	6	2015	163750
12784	35	North Miami Beach	Florida	7	2015	150000
12785	35	North Miami Beach	Florida	8	2015	171000
12786	35	North Miami Beach	Florida	9	2015	151900
12787	35	North Miami Beach	Florida	10	2015	140000
12788	35	North Miami Beach	Florida	11	2015	158950
12789	35	North Miami Beach	Florida	12	2015	180000
12790	35	North Miami Beach	Florida	1	2016	157450
12791	35	North Miami Beach	Florida	2	2016	150100
12792	35	North Miami Beach	Florida	3	2016	165000
12793	35	North Miami Beach	Florida	4	2016	205000
12794	35	North Miami Beach	Florida	5	2016	168300
12795	35	North Miami Beach	Florida	6	2016	168300
12796	35	North Miami Beach	Florida	7	2016	180000
12797	35	North Miami Beach	Florida	8	2016	174750
12798	35	North Miami Beach	Florida	9	2016	199500
12799	35	North Miami Beach	Florida	10	2016	204500
12800	35	North Miami Beach	Florida	11	2016	184000
12801	35	North Miami Beach	Florida	12	2016	180000
12802	35	North Miami Beach	Florida	1	2017	175000
12803	35	North Miami Beach	Florida	2	2017	200000
12804	35	North Miami Beach	Florida	3	2017	189000
12805	35	North Miami Beach	Florida	4	2017	160000
12806	35	North Miami Beach	Florida	5	2017	212950
12807	35	North Miami Beach	Florida	6	2017	188000
12808	35	North Miami Beach	Florida	7	2017	247500
12809	35	North Miami Beach	Florida	8	2017	197500
12810	35	North Miami Beach	Florida	9	2017	230000
12811	35	North Miami Beach	Florida	10	2017	182000
12812	35	North Miami Beach	Florida	11	2017	187000
12813	35	North Miami Beach	Florida	12	2017	190000
12814	35	North Miami Beach	Florida	1	2018	250000
12815	35	North Miami Beach	Florida	2	2018	180000
12816	35	North Miami Beach	Florida	3	2018	186950
12817	35	North Miami Beach	Florida	4	2018	230000
12818	35	North Miami Beach	Florida	5	2018	217500
12819	35	North Miami Beach	Florida	6	2018	230000
12820	35	North Miami Beach	Florida	7	2018	229100
12821	35	North Miami Beach	Florida	8	2018	180000
12822	35	North Miami Beach	Florida	9	2018	265000
12823	35	North Miami Beach	Florida	10	2018	219500
12824	35	North Miami Beach	Florida	11	2018	216000
12825	35	North Miami Beach	Florida	12	2018	182500
12826	35	North Miami Beach	Florida	1	2019	0
12827	37	South Miami	Florida	1	2009	0
12828	37	South Miami	Florida	2	2009	0
12829	37	South Miami	Florida	3	2009	0
12830	37	South Miami	Florida	4	2009	0
12831	37	South Miami	Florida	5	2009	0
12832	37	South Miami	Florida	6	2009	0
12833	37	South Miami	Florida	7	2009	0
12834	37	South Miami	Florida	8	2009	0
12835	37	South Miami	Florida	9	2009	0
12836	37	South Miami	Florida	10	2009	0
12837	37	South Miami	Florida	11	2009	0
12838	37	South Miami	Florida	12	2009	0
12839	37	South Miami	Florida	1	2010	0
12840	37	South Miami	Florida	2	2010	0
12841	37	South Miami	Florida	3	2010	0
12842	37	South Miami	Florida	4	2010	0
12843	37	South Miami	Florida	5	2010	0
12844	37	South Miami	Florida	6	2010	0
12845	37	South Miami	Florida	7	2010	0
12846	37	South Miami	Florida	8	2010	0
12847	37	South Miami	Florida	9	2010	0
12848	37	South Miami	Florida	10	2010	0
12849	37	South Miami	Florida	11	2010	0
12850	37	South Miami	Florida	12	2010	0
12851	37	South Miami	Florida	1	2011	0
12852	37	South Miami	Florida	2	2011	0
12853	37	South Miami	Florida	3	2011	0
12854	37	South Miami	Florida	4	2011	0
12855	37	South Miami	Florida	5	2011	0
12856	37	South Miami	Florida	6	2011	0
12857	37	South Miami	Florida	7	2011	0
12858	37	South Miami	Florida	8	2011	0
12859	37	South Miami	Florida	9	2011	0
12860	37	South Miami	Florida	10	2011	0
12861	37	South Miami	Florida	11	2011	0
12862	37	South Miami	Florida	12	2011	0
12863	37	South Miami	Florida	1	2012	0
12864	37	South Miami	Florida	2	2012	0
12865	37	South Miami	Florida	3	2012	0
12866	37	South Miami	Florida	4	2012	0
12867	37	South Miami	Florida	5	2012	0
12868	37	South Miami	Florida	6	2012	0
12869	37	South Miami	Florida	7	2012	0
12870	37	South Miami	Florida	8	2012	0
12871	37	South Miami	Florida	9	2012	0
12872	37	South Miami	Florida	10	2012	0
12873	37	South Miami	Florida	11	2012	0
12874	37	South Miami	Florida	12	2012	0
12875	37	South Miami	Florida	1	2013	0
12876	37	South Miami	Florida	2	2013	0
12877	37	South Miami	Florida	3	2013	0
12878	37	South Miami	Florida	4	2013	290000
12879	37	South Miami	Florida	5	2013	390000
12880	37	South Miami	Florida	6	2013	480000
12881	37	South Miami	Florida	7	2013	305000
12882	37	South Miami	Florida	8	2013	342850
12883	37	South Miami	Florida	9	2013	385000
12884	37	South Miami	Florida	10	2013	255000
12885	37	South Miami	Florida	11	2013	398000
12886	37	South Miami	Florida	12	2013	472500
12887	37	South Miami	Florida	1	2014	295000
12888	37	South Miami	Florida	2	2014	278000
12889	37	South Miami	Florida	3	2014	400500
12890	37	South Miami	Florida	4	2014	347550
12891	37	South Miami	Florida	5	2014	307000
12892	37	South Miami	Florida	6	2014	390000
12893	37	South Miami	Florida	7	2014	497000
12894	37	South Miami	Florida	8	2014	372000
12895	37	South Miami	Florida	9	2014	302500
12896	37	South Miami	Florida	10	2014	347500
12897	37	South Miami	Florida	11	2014	325000
12898	37	South Miami	Florida	12	2014	475000
12899	37	South Miami	Florida	1	2015	344000
12900	37	South Miami	Florida	2	2015	475000
12901	37	South Miami	Florida	3	2015	345000
12902	37	South Miami	Florida	4	2015	385000
12903	37	South Miami	Florida	5	2015	488750
12904	37	South Miami	Florida	6	2015	425000
12905	37	South Miami	Florida	7	2015	466500
12906	37	South Miami	Florida	8	2015	340969
12907	37	South Miami	Florida	9	2015	393000
12908	37	South Miami	Florida	10	2015	515000
12909	37	South Miami	Florida	11	2015	284500
12910	37	South Miami	Florida	12	2015	412500
12911	37	South Miami	Florida	1	2016	372000
12912	37	South Miami	Florida	2	2016	379000
12913	37	South Miami	Florida	3	2016	440000
12914	37	South Miami	Florida	4	2016	397500
12915	37	South Miami	Florida	5	2016	524300
12916	37	South Miami	Florida	6	2016	425000
12917	37	South Miami	Florida	7	2016	424000
12918	37	South Miami	Florida	8	2016	425000
12919	37	South Miami	Florida	9	2016	475250
12920	37	South Miami	Florida	10	2016	445000
12921	37	South Miami	Florida	11	2016	560000
12922	37	South Miami	Florida	12	2016	470000
12923	37	South Miami	Florida	1	2017	562500
12924	37	South Miami	Florida	2	2017	420000
12925	37	South Miami	Florida	3	2017	475500
12926	37	South Miami	Florida	4	2017	457500
12927	37	South Miami	Florida	5	2017	480000
12928	37	South Miami	Florida	6	2017	492500
12929	37	South Miami	Florida	7	2017	540000
12930	37	South Miami	Florida	8	2017	402500
12931	37	South Miami	Florida	9	2017	707500
12932	37	South Miami	Florida	10	2017	558500
12933	37	South Miami	Florida	11	2017	440000
12934	37	South Miami	Florida	12	2017	495000
12935	37	South Miami	Florida	1	2018	504500
12936	37	South Miami	Florida	2	2018	472500
12937	37	South Miami	Florida	3	2018	545750
12938	37	South Miami	Florida	4	2018	542500
12939	37	South Miami	Florida	5	2018	539000
12940	37	South Miami	Florida	6	2018	436500
12941	37	South Miami	Florida	7	2018	389900
12942	37	South Miami	Florida	8	2018	425000
12943	37	South Miami	Florida	9	2018	420000
12944	37	South Miami	Florida	10	2018	375000
12945	37	South Miami	Florida	11	2018	460000
12946	37	South Miami	Florida	12	2018	487500
12947	37	South Miami	Florida	1	2019	0
12948	40	Fayetteville	Georgia	1	2009	0
12949	40	Fayetteville	Georgia	2	2009	0
12950	40	Fayetteville	Georgia	3	2009	0
12951	40	Fayetteville	Georgia	4	2009	0
12952	40	Fayetteville	Georgia	5	2009	0
12953	40	Fayetteville	Georgia	6	2009	0
12954	40	Fayetteville	Georgia	7	2009	0
12955	40	Fayetteville	Georgia	8	2009	0
12956	40	Fayetteville	Georgia	9	2009	0
12957	40	Fayetteville	Georgia	10	2009	0
12958	40	Fayetteville	Georgia	11	2009	0
12959	40	Fayetteville	Georgia	12	2009	0
12960	40	Fayetteville	Georgia	1	2010	0
12961	40	Fayetteville	Georgia	2	2010	0
12962	40	Fayetteville	Georgia	3	2010	0
12963	40	Fayetteville	Georgia	4	2010	0
12964	40	Fayetteville	Georgia	5	2010	0
12965	40	Fayetteville	Georgia	6	2010	0
12966	40	Fayetteville	Georgia	7	2010	0
12967	40	Fayetteville	Georgia	8	2010	0
12968	40	Fayetteville	Georgia	9	2010	0
12969	40	Fayetteville	Georgia	10	2010	0
12970	40	Fayetteville	Georgia	11	2010	0
12971	40	Fayetteville	Georgia	12	2010	0
12972	40	Fayetteville	Georgia	1	2011	0
12973	40	Fayetteville	Georgia	2	2011	0
12974	40	Fayetteville	Georgia	3	2011	0
12975	40	Fayetteville	Georgia	4	2011	0
12976	40	Fayetteville	Georgia	5	2011	0
12977	40	Fayetteville	Georgia	6	2011	0
12978	40	Fayetteville	Georgia	7	2011	0
12979	40	Fayetteville	Georgia	8	2011	0
12980	40	Fayetteville	Georgia	9	2011	0
12981	40	Fayetteville	Georgia	10	2011	0
12982	40	Fayetteville	Georgia	11	2011	0
12983	40	Fayetteville	Georgia	12	2011	0
12984	40	Fayetteville	Georgia	1	2012	107900
12985	40	Fayetteville	Georgia	2	2012	117900
12986	40	Fayetteville	Georgia	3	2012	129000
12987	40	Fayetteville	Georgia	4	2012	128000
12988	40	Fayetteville	Georgia	5	2012	157750
12989	40	Fayetteville	Georgia	6	2012	155000
12990	40	Fayetteville	Georgia	7	2012	157000
13101	41	Jackson	Georgia	9	2011	0
12991	40	Fayetteville	Georgia	8	2012	155600
12992	40	Fayetteville	Georgia	9	2012	138500
12993	40	Fayetteville	Georgia	10	2012	140000
12994	40	Fayetteville	Georgia	11	2012	157500
12995	40	Fayetteville	Georgia	12	2012	169500
12996	40	Fayetteville	Georgia	1	2013	144000
12997	40	Fayetteville	Georgia	2	2013	172500
12998	40	Fayetteville	Georgia	3	2013	157000
12999	40	Fayetteville	Georgia	4	2013	165500
13000	40	Fayetteville	Georgia	5	2013	175000
13001	40	Fayetteville	Georgia	6	2013	203786
13002	40	Fayetteville	Georgia	7	2013	197626
13003	40	Fayetteville	Georgia	8	2013	177310
13004	40	Fayetteville	Georgia	9	2013	190060
13005	40	Fayetteville	Georgia	10	2013	192150
13006	40	Fayetteville	Georgia	11	2013	226000
13007	40	Fayetteville	Georgia	12	2013	224792
13008	40	Fayetteville	Georgia	1	2014	185000
13009	40	Fayetteville	Georgia	2	2014	231971
13010	40	Fayetteville	Georgia	3	2014	211000
13011	40	Fayetteville	Georgia	4	2014	192000
13012	40	Fayetteville	Georgia	5	2014	189000
13013	40	Fayetteville	Georgia	6	2014	249900
13014	40	Fayetteville	Georgia	7	2014	230000
13015	40	Fayetteville	Georgia	8	2014	199000
13016	40	Fayetteville	Georgia	9	2014	193950
13017	40	Fayetteville	Georgia	10	2014	205000
13018	40	Fayetteville	Georgia	11	2014	216000
13019	40	Fayetteville	Georgia	12	2014	218245
13020	40	Fayetteville	Georgia	1	2015	215850
13021	40	Fayetteville	Georgia	2	2015	177500
13022	40	Fayetteville	Georgia	3	2015	180000
13023	40	Fayetteville	Georgia	4	2015	213195
13024	40	Fayetteville	Georgia	5	2015	232000
13025	40	Fayetteville	Georgia	6	2015	259485
13026	40	Fayetteville	Georgia	7	2015	219950
13027	40	Fayetteville	Georgia	8	2015	276500
13028	40	Fayetteville	Georgia	9	2015	251000
13029	40	Fayetteville	Georgia	10	2015	228500
13030	40	Fayetteville	Georgia	11	2015	250000
13031	40	Fayetteville	Georgia	12	2015	259950
13032	40	Fayetteville	Georgia	1	2016	236000
13033	40	Fayetteville	Georgia	2	2016	235000
13034	40	Fayetteville	Georgia	3	2016	258750
13035	40	Fayetteville	Georgia	4	2016	249500
13036	40	Fayetteville	Georgia	5	2016	257450
13037	40	Fayetteville	Georgia	6	2016	255000
13038	40	Fayetteville	Georgia	7	2016	269500
13039	40	Fayetteville	Georgia	8	2016	250000
13040	40	Fayetteville	Georgia	9	2016	233500
13041	40	Fayetteville	Georgia	10	2016	200000
13042	40	Fayetteville	Georgia	11	2016	254700
13043	40	Fayetteville	Georgia	12	2016	239500
13044	40	Fayetteville	Georgia	1	2017	229000
13045	40	Fayetteville	Georgia	2	2017	215000
13046	40	Fayetteville	Georgia	3	2017	243500
13047	40	Fayetteville	Georgia	4	2017	250185
13048	40	Fayetteville	Georgia	5	2017	240000
13049	40	Fayetteville	Georgia	6	2017	285000
13050	40	Fayetteville	Georgia	7	2017	260950
13051	40	Fayetteville	Georgia	8	2017	260000
13052	40	Fayetteville	Georgia	9	2017	220000
13053	40	Fayetteville	Georgia	10	2017	245000
13054	40	Fayetteville	Georgia	11	2017	187000
13055	40	Fayetteville	Georgia	12	2017	225000
13056	40	Fayetteville	Georgia	1	2018	217500
13057	40	Fayetteville	Georgia	2	2018	273000
13058	40	Fayetteville	Georgia	3	2018	257000
13059	40	Fayetteville	Georgia	4	2018	269000
13060	40	Fayetteville	Georgia	5	2018	290000
13061	40	Fayetteville	Georgia	6	2018	315950
13062	40	Fayetteville	Georgia	7	2018	303000
13063	40	Fayetteville	Georgia	8	2018	275000
13064	40	Fayetteville	Georgia	9	2018	255000
13065	40	Fayetteville	Georgia	10	2018	232500
13066	40	Fayetteville	Georgia	11	2018	266000
13067	40	Fayetteville	Georgia	12	2018	246500
13068	40	Fayetteville	Georgia	1	2019	0
13069	41	Jackson	Georgia	1	2009	0
13070	41	Jackson	Georgia	2	2009	0
13071	41	Jackson	Georgia	3	2009	0
13072	41	Jackson	Georgia	4	2009	0
13073	41	Jackson	Georgia	5	2009	0
13074	41	Jackson	Georgia	6	2009	0
13075	41	Jackson	Georgia	7	2009	0
13076	41	Jackson	Georgia	8	2009	0
13077	41	Jackson	Georgia	9	2009	0
13078	41	Jackson	Georgia	10	2009	0
13079	41	Jackson	Georgia	11	2009	0
13080	41	Jackson	Georgia	12	2009	0
13081	41	Jackson	Georgia	1	2010	0
13082	41	Jackson	Georgia	2	2010	0
13083	41	Jackson	Georgia	3	2010	0
13084	41	Jackson	Georgia	4	2010	0
13085	41	Jackson	Georgia	5	2010	0
13086	41	Jackson	Georgia	6	2010	0
13087	41	Jackson	Georgia	7	2010	0
13088	41	Jackson	Georgia	8	2010	0
13089	41	Jackson	Georgia	9	2010	0
13090	41	Jackson	Georgia	10	2010	0
13091	41	Jackson	Georgia	11	2010	0
13092	41	Jackson	Georgia	12	2010	0
13093	41	Jackson	Georgia	1	2011	0
13094	41	Jackson	Georgia	2	2011	0
13095	41	Jackson	Georgia	3	2011	0
13096	41	Jackson	Georgia	4	2011	0
13097	41	Jackson	Georgia	5	2011	0
13098	41	Jackson	Georgia	6	2011	0
13099	41	Jackson	Georgia	7	2011	0
13100	41	Jackson	Georgia	8	2011	0
13102	41	Jackson	Georgia	10	2011	0
13103	41	Jackson	Georgia	11	2011	0
13104	41	Jackson	Georgia	12	2011	0
13105	41	Jackson	Georgia	1	2012	57501
13106	41	Jackson	Georgia	2	2012	90000
13107	41	Jackson	Georgia	3	2012	73000
13108	41	Jackson	Georgia	4	2012	56000
13109	41	Jackson	Georgia	5	2012	89750
13110	41	Jackson	Georgia	6	2012	68700
13111	41	Jackson	Georgia	7	2012	67225
13112	41	Jackson	Georgia	8	2012	47250
13113	41	Jackson	Georgia	9	2012	64775
13114	41	Jackson	Georgia	10	2012	53000
13115	41	Jackson	Georgia	11	2012	70900
13116	41	Jackson	Georgia	12	2012	62500
13117	41	Jackson	Georgia	1	2013	64575
13118	41	Jackson	Georgia	2	2013	57200
13119	41	Jackson	Georgia	3	2013	76000
13120	41	Jackson	Georgia	4	2013	78450
13121	41	Jackson	Georgia	5	2013	90587
13122	41	Jackson	Georgia	6	2013	82000
13123	41	Jackson	Georgia	7	2013	81950
13124	41	Jackson	Georgia	8	2013	87000
13125	41	Jackson	Georgia	9	2013	77450
13126	41	Jackson	Georgia	10	2013	66425
13127	41	Jackson	Georgia	11	2013	80650
13128	41	Jackson	Georgia	12	2013	91000
13129	41	Jackson	Georgia	1	2014	43000
13130	41	Jackson	Georgia	2	2014	107375
13131	41	Jackson	Georgia	3	2014	85000
13132	41	Jackson	Georgia	4	2014	71850
13133	41	Jackson	Georgia	5	2014	111000
13134	41	Jackson	Georgia	6	2014	117900
13135	41	Jackson	Georgia	7	2014	103500
13136	41	Jackson	Georgia	8	2014	116050
13137	41	Jackson	Georgia	9	2014	96600
13138	41	Jackson	Georgia	10	2014	95000
13139	41	Jackson	Georgia	11	2014	122000
13140	41	Jackson	Georgia	12	2014	115000
13141	41	Jackson	Georgia	1	2015	97500
13142	41	Jackson	Georgia	2	2015	95000
13143	41	Jackson	Georgia	3	2015	97450
13144	41	Jackson	Georgia	4	2015	137450
13145	41	Jackson	Georgia	5	2015	133500
13146	41	Jackson	Georgia	6	2015	132450
13147	41	Jackson	Georgia	7	2015	127950
13148	41	Jackson	Georgia	8	2015	117500
13149	41	Jackson	Georgia	9	2015	119450
13150	41	Jackson	Georgia	10	2015	113100
13151	41	Jackson	Georgia	11	2015	141450
13152	41	Jackson	Georgia	12	2015	96550
13153	41	Jackson	Georgia	1	2016	113080
13154	41	Jackson	Georgia	2	2016	99450
13155	41	Jackson	Georgia	3	2016	144000
13156	41	Jackson	Georgia	4	2016	131817
13157	41	Jackson	Georgia	5	2016	136300
13158	41	Jackson	Georgia	6	2016	171000
13159	41	Jackson	Georgia	7	2016	122950
13160	41	Jackson	Georgia	8	2016	130100
13161	41	Jackson	Georgia	9	2016	126450
13162	41	Jackson	Georgia	10	2016	134000
13163	41	Jackson	Georgia	11	2016	149500
13164	41	Jackson	Georgia	12	2016	128973
13165	41	Jackson	Georgia	1	2017	136000
13166	41	Jackson	Georgia	2	2017	135000
13167	41	Jackson	Georgia	3	2017	127950
13168	41	Jackson	Georgia	4	2017	127000
13169	41	Jackson	Georgia	5	2017	127758
13170	41	Jackson	Georgia	6	2017	135000
13171	41	Jackson	Georgia	7	2017	135000
13172	41	Jackson	Georgia	8	2017	128473
13173	41	Jackson	Georgia	9	2017	162900
13174	41	Jackson	Georgia	10	2017	138950
13175	41	Jackson	Georgia	11	2017	139900
13176	41	Jackson	Georgia	12	2017	139900
13177	41	Jackson	Georgia	1	2018	150950
13178	41	Jackson	Georgia	2	2018	148950
13179	41	Jackson	Georgia	3	2018	143500
13180	41	Jackson	Georgia	4	2018	174900
13181	41	Jackson	Georgia	5	2018	147500
13182	41	Jackson	Georgia	6	2018	148450
13183	41	Jackson	Georgia	7	2018	190000
13184	41	Jackson	Georgia	8	2018	152500
13185	41	Jackson	Georgia	9	2018	152900
13186	41	Jackson	Georgia	10	2018	157900
13187	41	Jackson	Georgia	11	2018	152700
13188	41	Jackson	Georgia	12	2018	147700
13189	41	Jackson	Georgia	1	2019	0
13190	42	North Atlanta	Georgia	1	2009	0
13191	42	North Atlanta	Georgia	2	2009	0
13192	42	North Atlanta	Georgia	3	2009	0
13193	42	North Atlanta	Georgia	4	2009	0
13194	42	North Atlanta	Georgia	5	2009	0
13195	42	North Atlanta	Georgia	6	2009	0
13196	42	North Atlanta	Georgia	7	2009	0
13197	42	North Atlanta	Georgia	8	2009	0
13198	42	North Atlanta	Georgia	9	2009	0
13199	42	North Atlanta	Georgia	10	2009	0
13200	42	North Atlanta	Georgia	11	2009	0
13201	42	North Atlanta	Georgia	12	2009	0
13202	42	North Atlanta	Georgia	1	2010	0
13203	42	North Atlanta	Georgia	2	2010	0
13204	42	North Atlanta	Georgia	3	2010	0
13205	42	North Atlanta	Georgia	4	2010	0
13206	42	North Atlanta	Georgia	5	2010	0
13207	42	North Atlanta	Georgia	6	2010	0
13208	42	North Atlanta	Georgia	7	2010	0
13209	42	North Atlanta	Georgia	8	2010	0
13210	42	North Atlanta	Georgia	9	2010	0
13211	42	North Atlanta	Georgia	10	2010	0
13212	42	North Atlanta	Georgia	11	2010	0
13213	42	North Atlanta	Georgia	12	2010	0
13214	42	North Atlanta	Georgia	1	2011	0
13215	42	North Atlanta	Georgia	2	2011	0
13216	42	North Atlanta	Georgia	3	2011	0
13217	42	North Atlanta	Georgia	4	2011	0
13218	42	North Atlanta	Georgia	5	2011	0
13219	42	North Atlanta	Georgia	6	2011	0
13220	42	North Atlanta	Georgia	7	2011	0
13221	42	North Atlanta	Georgia	8	2011	0
13222	42	North Atlanta	Georgia	9	2011	0
13223	42	North Atlanta	Georgia	10	2011	0
13224	42	North Atlanta	Georgia	11	2011	0
13225	42	North Atlanta	Georgia	12	2011	0
13226	42	North Atlanta	Georgia	1	2012	253500
13227	42	North Atlanta	Georgia	2	2012	314750
13228	42	North Atlanta	Georgia	3	2012	324750
13229	42	North Atlanta	Georgia	4	2012	330500
13230	42	North Atlanta	Georgia	5	2012	308750
13231	42	North Atlanta	Georgia	6	2012	287500
13232	42	North Atlanta	Georgia	7	2012	308000
13233	42	North Atlanta	Georgia	8	2012	325000
13234	42	North Atlanta	Georgia	9	2012	345000
13235	42	North Atlanta	Georgia	10	2012	305000
13236	42	North Atlanta	Georgia	11	2012	298000
13237	42	North Atlanta	Georgia	12	2012	340000
13238	42	North Atlanta	Georgia	1	2013	300000
13239	42	North Atlanta	Georgia	2	2013	280000
13240	42	North Atlanta	Georgia	3	2013	364000
13241	42	North Atlanta	Georgia	4	2013	335000
13242	42	North Atlanta	Georgia	5	2013	319960
13243	42	North Atlanta	Georgia	6	2013	376500
13244	42	North Atlanta	Georgia	7	2013	389900
13245	42	North Atlanta	Georgia	8	2013	332000
13246	42	North Atlanta	Georgia	9	2013	345100
13247	42	North Atlanta	Georgia	10	2013	367450
13248	42	North Atlanta	Georgia	11	2013	385000
13249	42	North Atlanta	Georgia	12	2013	382000
13250	42	North Atlanta	Georgia	1	2014	323100
13251	42	North Atlanta	Georgia	2	2014	405000
13252	42	North Atlanta	Georgia	3	2014	382000
13253	42	North Atlanta	Georgia	4	2014	386750
13254	42	North Atlanta	Georgia	5	2014	370000
13255	42	North Atlanta	Georgia	6	2014	422000
13256	42	North Atlanta	Georgia	7	2014	365250
13257	42	North Atlanta	Georgia	8	2014	475000
13258	42	North Atlanta	Georgia	9	2014	418000
13259	42	North Atlanta	Georgia	10	2014	406000
13260	42	North Atlanta	Georgia	11	2014	355000
13261	42	North Atlanta	Georgia	12	2014	398900
13262	42	North Atlanta	Georgia	1	2015	431500
13263	42	North Atlanta	Georgia	2	2015	413989
13264	42	North Atlanta	Georgia	3	2015	358000
13265	42	North Atlanta	Georgia	4	2015	376500
13266	42	North Atlanta	Georgia	5	2015	392000
13267	42	North Atlanta	Georgia	6	2015	406250
13268	42	North Atlanta	Georgia	7	2015	453000
13269	42	North Atlanta	Georgia	8	2015	435000
13270	42	North Atlanta	Georgia	9	2015	399000
13271	42	North Atlanta	Georgia	10	2015	370650
13272	42	North Atlanta	Georgia	11	2015	423900
13273	42	North Atlanta	Georgia	12	2015	387500
13274	42	North Atlanta	Georgia	1	2016	362450
13275	42	North Atlanta	Georgia	2	2016	398500
13276	42	North Atlanta	Georgia	3	2016	417550
13277	42	North Atlanta	Georgia	4	2016	449200
13278	42	North Atlanta	Georgia	5	2016	484945
13279	42	North Atlanta	Georgia	6	2016	435000
13280	42	North Atlanta	Georgia	7	2016	455000
13281	42	North Atlanta	Georgia	8	2016	379500
13282	42	North Atlanta	Georgia	9	2016	449500
13283	42	North Atlanta	Georgia	10	2016	460000
13284	42	North Atlanta	Georgia	11	2016	460000
13285	42	North Atlanta	Georgia	12	2016	405250
13286	42	North Atlanta	Georgia	1	2017	487950
13287	42	North Atlanta	Georgia	2	2017	420000
13288	42	North Atlanta	Georgia	3	2017	470000
13289	42	North Atlanta	Georgia	4	2017	466000
13290	42	North Atlanta	Georgia	5	2017	497500
13291	42	North Atlanta	Georgia	6	2017	440000
13292	42	North Atlanta	Georgia	7	2017	448750
13293	42	North Atlanta	Georgia	8	2017	481500
13294	42	North Atlanta	Georgia	9	2017	465000
13295	42	North Atlanta	Georgia	10	2017	457500
13296	42	North Atlanta	Georgia	11	2017	495000
13297	42	North Atlanta	Georgia	12	2017	379000
13298	42	North Atlanta	Georgia	1	2018	531779
13299	42	North Atlanta	Georgia	2	2018	504500
13300	42	North Atlanta	Georgia	3	2018	469500
13301	42	North Atlanta	Georgia	4	2018	483000
13302	42	North Atlanta	Georgia	5	2018	525000
13303	42	North Atlanta	Georgia	6	2018	558000
13304	42	North Atlanta	Georgia	7	2018	549000
13305	42	North Atlanta	Georgia	8	2018	477000
13306	42	North Atlanta	Georgia	9	2018	473000
13307	42	North Atlanta	Georgia	10	2018	500000
13308	42	North Atlanta	Georgia	11	2018	480000
13309	42	North Atlanta	Georgia	12	2018	487000
13310	42	North Atlanta	Georgia	1	2019	0
13311	43	East Honolulu	Hawaii	1	2009	0
13312	43	East Honolulu	Hawaii	2	2009	0
13313	43	East Honolulu	Hawaii	3	2009	0
13314	43	East Honolulu	Hawaii	4	2009	0
13315	43	East Honolulu	Hawaii	5	2009	0
13316	43	East Honolulu	Hawaii	6	2009	0
13317	43	East Honolulu	Hawaii	7	2009	0
13318	43	East Honolulu	Hawaii	8	2009	0
13319	43	East Honolulu	Hawaii	9	2009	0
13320	43	East Honolulu	Hawaii	10	2009	0
13321	43	East Honolulu	Hawaii	11	2009	0
13322	43	East Honolulu	Hawaii	12	2009	0
13323	43	East Honolulu	Hawaii	1	2010	0
13324	43	East Honolulu	Hawaii	2	2010	0
13325	43	East Honolulu	Hawaii	3	2010	0
13326	43	East Honolulu	Hawaii	4	2010	0
13327	43	East Honolulu	Hawaii	5	2010	0
13328	43	East Honolulu	Hawaii	6	2010	0
13329	43	East Honolulu	Hawaii	7	2010	0
13330	43	East Honolulu	Hawaii	8	2010	0
13331	43	East Honolulu	Hawaii	9	2010	0
13332	43	East Honolulu	Hawaii	10	2010	0
13333	43	East Honolulu	Hawaii	11	2010	0
13334	43	East Honolulu	Hawaii	12	2010	0
13335	43	East Honolulu	Hawaii	1	2011	0
13336	43	East Honolulu	Hawaii	2	2011	0
13337	43	East Honolulu	Hawaii	3	2011	0
13338	43	East Honolulu	Hawaii	4	2011	0
13339	43	East Honolulu	Hawaii	5	2011	0
13340	43	East Honolulu	Hawaii	6	2011	0
13341	43	East Honolulu	Hawaii	7	2011	0
13342	43	East Honolulu	Hawaii	8	2011	0
13343	43	East Honolulu	Hawaii	9	2011	0
13344	43	East Honolulu	Hawaii	10	2011	0
13345	43	East Honolulu	Hawaii	11	2011	0
13346	43	East Honolulu	Hawaii	12	2011	0
13347	43	East Honolulu	Hawaii	1	2012	631000
13348	43	East Honolulu	Hawaii	2	2012	650000
13349	43	East Honolulu	Hawaii	3	2012	700000
13350	43	East Honolulu	Hawaii	4	2012	655000
13351	43	East Honolulu	Hawaii	5	2012	648500
13352	43	East Honolulu	Hawaii	6	2012	596000
13353	43	East Honolulu	Hawaii	7	2012	620000
13354	43	East Honolulu	Hawaii	8	2012	660000
13355	43	East Honolulu	Hawaii	9	2012	691500
13356	43	East Honolulu	Hawaii	10	2012	655000
13357	43	East Honolulu	Hawaii	11	2012	655000
13358	43	East Honolulu	Hawaii	12	2012	647000
13359	43	East Honolulu	Hawaii	1	2013	670000
13360	43	East Honolulu	Hawaii	2	2013	760000
13361	43	East Honolulu	Hawaii	3	2013	699500
13362	43	East Honolulu	Hawaii	4	2013	670000
13363	43	East Honolulu	Hawaii	5	2013	635000
13364	43	East Honolulu	Hawaii	6	2013	709000
13365	43	East Honolulu	Hawaii	7	2013	757500
13366	43	East Honolulu	Hawaii	8	2013	815000
13367	43	East Honolulu	Hawaii	9	2013	820250
13368	43	East Honolulu	Hawaii	10	2013	772000
13369	43	East Honolulu	Hawaii	11	2013	725000
13370	43	East Honolulu	Hawaii	12	2013	680000
13371	43	East Honolulu	Hawaii	1	2014	710000
13372	43	East Honolulu	Hawaii	2	2014	727000
13373	43	East Honolulu	Hawaii	3	2014	780000
13374	43	East Honolulu	Hawaii	4	2014	745000
13375	43	East Honolulu	Hawaii	5	2014	775000
13376	43	East Honolulu	Hawaii	6	2014	775000
13377	43	East Honolulu	Hawaii	7	2014	832500
13378	43	East Honolulu	Hawaii	8	2014	790000
13379	43	East Honolulu	Hawaii	9	2014	790000
13380	43	East Honolulu	Hawaii	10	2014	760000
13381	43	East Honolulu	Hawaii	11	2014	817500
13382	43	East Honolulu	Hawaii	12	2014	793750
13383	43	East Honolulu	Hawaii	1	2015	773500
13384	43	East Honolulu	Hawaii	2	2015	840000
13385	43	East Honolulu	Hawaii	3	2015	840000
13386	43	East Honolulu	Hawaii	4	2015	840000
13387	43	East Honolulu	Hawaii	5	2015	818000
13388	43	East Honolulu	Hawaii	6	2015	837500
13389	43	East Honolulu	Hawaii	7	2015	840000
13390	43	East Honolulu	Hawaii	8	2015	870000
13391	43	East Honolulu	Hawaii	9	2015	889500
13392	43	East Honolulu	Hawaii	10	2015	875000
13393	43	East Honolulu	Hawaii	11	2015	810000
13394	43	East Honolulu	Hawaii	12	2015	800500
13395	43	East Honolulu	Hawaii	1	2016	852500
13396	43	East Honolulu	Hawaii	2	2016	860000
13397	43	East Honolulu	Hawaii	3	2016	827500
13398	43	East Honolulu	Hawaii	4	2016	731000
13399	43	East Honolulu	Hawaii	5	2016	730000
13400	43	East Honolulu	Hawaii	6	2016	775000
13401	43	East Honolulu	Hawaii	7	2016	793000
13402	43	East Honolulu	Hawaii	8	2016	760000
13403	43	East Honolulu	Hawaii	9	2016	810000
13404	43	East Honolulu	Hawaii	10	2016	855000
13405	43	East Honolulu	Hawaii	11	2016	870000
13406	43	East Honolulu	Hawaii	12	2016	860000
13407	43	East Honolulu	Hawaii	1	2017	849000
13408	43	East Honolulu	Hawaii	2	2017	847500
13409	43	East Honolulu	Hawaii	3	2017	865000
13410	43	East Honolulu	Hawaii	4	2017	930000
13411	43	East Honolulu	Hawaii	5	2017	877500
13412	43	East Honolulu	Hawaii	6	2017	885000
13413	43	East Honolulu	Hawaii	7	2017	832000
13414	43	East Honolulu	Hawaii	8	2017	808750
13415	43	East Honolulu	Hawaii	9	2017	784750
13416	43	East Honolulu	Hawaii	10	2017	830000
13417	43	East Honolulu	Hawaii	11	2017	920000
13418	43	East Honolulu	Hawaii	12	2017	960000
13419	43	East Honolulu	Hawaii	1	2018	906000
13420	43	East Honolulu	Hawaii	2	2018	869500
13421	43	East Honolulu	Hawaii	3	2018	820000
13422	43	East Honolulu	Hawaii	4	2018	880000
13423	43	East Honolulu	Hawaii	5	2018	880000
13424	43	East Honolulu	Hawaii	6	2018	880000
13425	43	East Honolulu	Hawaii	7	2018	900000
13426	43	East Honolulu	Hawaii	8	2018	920000
13427	43	East Honolulu	Hawaii	9	2018	903375
13428	43	East Honolulu	Hawaii	10	2018	875000
13429	43	East Honolulu	Hawaii	11	2018	844444
13430	43	East Honolulu	Hawaii	12	2018	910000
13431	43	East Honolulu	Hawaii	1	2019	0
13432	46	Aurora	Illinois	1	2009	0
13433	46	Aurora	Illinois	2	2009	0
13434	46	Aurora	Illinois	3	2009	0
13435	46	Aurora	Illinois	4	2009	0
13436	46	Aurora	Illinois	5	2009	0
13437	46	Aurora	Illinois	6	2009	0
13438	46	Aurora	Illinois	7	2009	0
13439	46	Aurora	Illinois	8	2009	0
13440	46	Aurora	Illinois	9	2009	0
13441	46	Aurora	Illinois	10	2009	0
13442	46	Aurora	Illinois	11	2009	0
13443	46	Aurora	Illinois	12	2009	0
13444	46	Aurora	Illinois	1	2010	0
13445	46	Aurora	Illinois	2	2010	0
13446	46	Aurora	Illinois	3	2010	0
13447	46	Aurora	Illinois	4	2010	0
13448	46	Aurora	Illinois	5	2010	0
13449	46	Aurora	Illinois	6	2010	0
13450	46	Aurora	Illinois	7	2010	0
13451	46	Aurora	Illinois	8	2010	0
13452	46	Aurora	Illinois	9	2010	0
13453	46	Aurora	Illinois	10	2010	0
13454	46	Aurora	Illinois	11	2010	0
13455	46	Aurora	Illinois	12	2010	0
13456	46	Aurora	Illinois	1	2011	0
13457	46	Aurora	Illinois	2	2011	0
13458	46	Aurora	Illinois	3	2011	0
13459	46	Aurora	Illinois	4	2011	0
13460	46	Aurora	Illinois	5	2011	0
13461	46	Aurora	Illinois	6	2011	0
13462	46	Aurora	Illinois	7	2011	0
13463	46	Aurora	Illinois	8	2011	0
13464	46	Aurora	Illinois	9	2011	0
13465	46	Aurora	Illinois	10	2011	0
13466	46	Aurora	Illinois	11	2011	0
13467	46	Aurora	Illinois	12	2011	0
13468	46	Aurora	Illinois	1	2012	97000
13469	46	Aurora	Illinois	2	2012	76450
13470	46	Aurora	Illinois	3	2012	88000
13471	46	Aurora	Illinois	4	2012	105000
13472	46	Aurora	Illinois	5	2012	106000
13473	46	Aurora	Illinois	6	2012	118000
13474	46	Aurora	Illinois	7	2012	115000
13475	46	Aurora	Illinois	8	2012	104000
13476	46	Aurora	Illinois	9	2012	99917
13477	46	Aurora	Illinois	10	2012	107000
13478	46	Aurora	Illinois	11	2012	93500
13479	46	Aurora	Illinois	12	2012	91500
13480	46	Aurora	Illinois	1	2013	95750
13481	46	Aurora	Illinois	2	2013	90000
13482	46	Aurora	Illinois	3	2013	116900
13483	46	Aurora	Illinois	4	2013	110000
13484	46	Aurora	Illinois	5	2013	114000
13485	46	Aurora	Illinois	6	2013	136000
13486	46	Aurora	Illinois	7	2013	132000
13487	46	Aurora	Illinois	8	2013	142000
13488	46	Aurora	Illinois	9	2013	137500
13489	46	Aurora	Illinois	10	2013	136250
13490	46	Aurora	Illinois	11	2013	110000
13491	46	Aurora	Illinois	12	2013	125000
13492	46	Aurora	Illinois	1	2014	112000
13493	46	Aurora	Illinois	2	2014	112000
13494	46	Aurora	Illinois	3	2014	119250
13495	46	Aurora	Illinois	4	2014	134000
13496	46	Aurora	Illinois	5	2014	134000
13497	46	Aurora	Illinois	6	2014	150000
13498	46	Aurora	Illinois	7	2014	156500
13499	46	Aurora	Illinois	8	2014	155000
13500	46	Aurora	Illinois	9	2014	126000
13501	46	Aurora	Illinois	10	2014	141300
13502	46	Aurora	Illinois	11	2014	135250
13503	46	Aurora	Illinois	12	2014	140000
13504	46	Aurora	Illinois	1	2015	146450
13505	46	Aurora	Illinois	2	2015	127000
13506	46	Aurora	Illinois	3	2015	141000
13507	46	Aurora	Illinois	4	2015	146500
13508	46	Aurora	Illinois	5	2015	160000
13509	46	Aurora	Illinois	6	2015	168000
13510	46	Aurora	Illinois	7	2015	188950
13511	46	Aurora	Illinois	8	2015	185000
13512	46	Aurora	Illinois	9	2015	155000
13513	46	Aurora	Illinois	10	2015	150000
13514	46	Aurora	Illinois	11	2015	150000
13515	46	Aurora	Illinois	12	2015	160000
13516	46	Aurora	Illinois	1	2016	150500
13517	46	Aurora	Illinois	2	2016	144500
13518	46	Aurora	Illinois	3	2016	150000
13519	46	Aurora	Illinois	4	2016	169500
13520	46	Aurora	Illinois	5	2016	175000
13521	46	Aurora	Illinois	6	2016	193000
13522	46	Aurora	Illinois	7	2016	177750
13523	46	Aurora	Illinois	8	2016	179500
13524	46	Aurora	Illinois	9	2016	173000
13525	46	Aurora	Illinois	10	2016	170000
13526	46	Aurora	Illinois	11	2016	172500
13527	46	Aurora	Illinois	12	2016	161000
13528	46	Aurora	Illinois	1	2017	165000
13529	46	Aurora	Illinois	2	2017	155000
13530	46	Aurora	Illinois	3	2017	173500
13531	46	Aurora	Illinois	4	2017	190000
13532	46	Aurora	Illinois	5	2017	194000
13533	46	Aurora	Illinois	6	2017	214500
13534	46	Aurora	Illinois	7	2017	206000
13535	46	Aurora	Illinois	8	2017	195000
13536	46	Aurora	Illinois	9	2017	193000
13537	46	Aurora	Illinois	10	2017	187000
13538	46	Aurora	Illinois	11	2017	178000
13539	46	Aurora	Illinois	12	2017	178000
13540	46	Aurora	Illinois	1	2018	176500
13541	46	Aurora	Illinois	2	2018	170000
13542	46	Aurora	Illinois	3	2018	201000
13543	46	Aurora	Illinois	4	2018	195000
13544	46	Aurora	Illinois	5	2018	207750
13545	46	Aurora	Illinois	6	2018	212750
13546	46	Aurora	Illinois	7	2018	210000
13547	46	Aurora	Illinois	8	2018	203000
13548	46	Aurora	Illinois	9	2018	185000
13549	46	Aurora	Illinois	10	2018	178500
13550	46	Aurora	Illinois	11	2018	177000
13551	46	Aurora	Illinois	12	2018	184500
13552	46	Aurora	Illinois	1	2019	0
13553	48	Chicago Heights	Illinois	1	2009	0
13554	48	Chicago Heights	Illinois	2	2009	0
13555	48	Chicago Heights	Illinois	3	2009	0
13556	48	Chicago Heights	Illinois	4	2009	0
13557	48	Chicago Heights	Illinois	5	2009	0
13558	48	Chicago Heights	Illinois	6	2009	0
13559	48	Chicago Heights	Illinois	7	2009	0
13560	48	Chicago Heights	Illinois	8	2009	0
13561	48	Chicago Heights	Illinois	9	2009	0
13562	48	Chicago Heights	Illinois	10	2009	0
13563	48	Chicago Heights	Illinois	11	2009	0
13564	48	Chicago Heights	Illinois	12	2009	0
13565	48	Chicago Heights	Illinois	1	2010	0
13566	48	Chicago Heights	Illinois	2	2010	0
13567	48	Chicago Heights	Illinois	3	2010	0
13568	48	Chicago Heights	Illinois	4	2010	0
13569	48	Chicago Heights	Illinois	5	2010	0
13570	48	Chicago Heights	Illinois	6	2010	0
13571	48	Chicago Heights	Illinois	7	2010	0
13572	48	Chicago Heights	Illinois	8	2010	0
13573	48	Chicago Heights	Illinois	9	2010	0
13574	48	Chicago Heights	Illinois	10	2010	0
13575	48	Chicago Heights	Illinois	11	2010	0
13576	48	Chicago Heights	Illinois	12	2010	0
13577	48	Chicago Heights	Illinois	1	2011	0
13578	48	Chicago Heights	Illinois	2	2011	0
13579	48	Chicago Heights	Illinois	3	2011	0
13580	48	Chicago Heights	Illinois	4	2011	0
13581	48	Chicago Heights	Illinois	5	2011	0
13582	48	Chicago Heights	Illinois	6	2011	0
13583	48	Chicago Heights	Illinois	7	2011	0
13584	48	Chicago Heights	Illinois	8	2011	0
13585	48	Chicago Heights	Illinois	9	2011	0
13586	48	Chicago Heights	Illinois	10	2011	0
13587	48	Chicago Heights	Illinois	11	2011	0
13588	48	Chicago Heights	Illinois	12	2011	0
13589	48	Chicago Heights	Illinois	1	2012	24750
13590	48	Chicago Heights	Illinois	2	2012	47500
13591	48	Chicago Heights	Illinois	3	2012	34500
13592	48	Chicago Heights	Illinois	4	2012	26000
13593	48	Chicago Heights	Illinois	5	2012	25000
13594	48	Chicago Heights	Illinois	6	2012	53500
13595	48	Chicago Heights	Illinois	7	2012	40250
13596	48	Chicago Heights	Illinois	8	2012	62007
13597	48	Chicago Heights	Illinois	9	2012	55000
13598	48	Chicago Heights	Illinois	10	2012	50250
13599	48	Chicago Heights	Illinois	11	2012	33000
13600	48	Chicago Heights	Illinois	12	2012	31150
13601	48	Chicago Heights	Illinois	1	2013	43500
13602	48	Chicago Heights	Illinois	2	2013	50000
13603	48	Chicago Heights	Illinois	3	2013	45500
13604	48	Chicago Heights	Illinois	4	2013	27750
13605	48	Chicago Heights	Illinois	5	2013	44500
13606	48	Chicago Heights	Illinois	6	2013	40000
13607	48	Chicago Heights	Illinois	7	2013	50300
13608	48	Chicago Heights	Illinois	8	2013	27500
13609	48	Chicago Heights	Illinois	9	2013	76000
13610	48	Chicago Heights	Illinois	10	2013	49500
13611	48	Chicago Heights	Illinois	11	2013	68000
13612	48	Chicago Heights	Illinois	12	2013	32750
13613	48	Chicago Heights	Illinois	1	2014	62910
13614	48	Chicago Heights	Illinois	2	2014	45000
13615	48	Chicago Heights	Illinois	3	2014	48950
13616	48	Chicago Heights	Illinois	4	2014	50001
13617	48	Chicago Heights	Illinois	5	2014	35000
13618	48	Chicago Heights	Illinois	6	2014	74500
13619	48	Chicago Heights	Illinois	7	2014	60200
13620	48	Chicago Heights	Illinois	8	2014	60850
13621	48	Chicago Heights	Illinois	9	2014	76500
13622	48	Chicago Heights	Illinois	10	2014	46500
13623	48	Chicago Heights	Illinois	11	2014	54500
13624	48	Chicago Heights	Illinois	12	2014	49185
13625	48	Chicago Heights	Illinois	1	2015	50000
13626	48	Chicago Heights	Illinois	2	2015	50000
13627	48	Chicago Heights	Illinois	3	2015	36850
13628	48	Chicago Heights	Illinois	4	2015	40000
13629	48	Chicago Heights	Illinois	5	2015	52000
13630	48	Chicago Heights	Illinois	6	2015	82000
13631	48	Chicago Heights	Illinois	7	2015	54000
13632	48	Chicago Heights	Illinois	8	2015	94900
13633	48	Chicago Heights	Illinois	9	2015	59900
13634	48	Chicago Heights	Illinois	10	2015	60000
13635	48	Chicago Heights	Illinois	11	2015	72500
13636	48	Chicago Heights	Illinois	12	2015	63000
13637	48	Chicago Heights	Illinois	1	2016	44000
13638	48	Chicago Heights	Illinois	2	2016	40000
13639	48	Chicago Heights	Illinois	3	2016	48250
13640	48	Chicago Heights	Illinois	4	2016	68250
13641	48	Chicago Heights	Illinois	5	2016	68250
13642	48	Chicago Heights	Illinois	6	2016	60000
13643	48	Chicago Heights	Illinois	7	2016	75250
13644	48	Chicago Heights	Illinois	8	2016	49500
13645	48	Chicago Heights	Illinois	9	2016	60500
13646	48	Chicago Heights	Illinois	10	2016	50100
13647	48	Chicago Heights	Illinois	11	2016	69250
13648	48	Chicago Heights	Illinois	12	2016	57000
13649	48	Chicago Heights	Illinois	1	2017	57500
13650	48	Chicago Heights	Illinois	2	2017	71201
13651	48	Chicago Heights	Illinois	3	2017	68000
13652	48	Chicago Heights	Illinois	4	2017	81000
13653	48	Chicago Heights	Illinois	5	2017	60000
13654	48	Chicago Heights	Illinois	6	2017	73000
13655	48	Chicago Heights	Illinois	7	2017	96925
13656	48	Chicago Heights	Illinois	8	2017	95500
13657	48	Chicago Heights	Illinois	9	2017	96000
13658	48	Chicago Heights	Illinois	10	2017	94000
13659	48	Chicago Heights	Illinois	11	2017	80000
13660	48	Chicago Heights	Illinois	12	2017	90000
13661	48	Chicago Heights	Illinois	1	2018	75000
13662	48	Chicago Heights	Illinois	2	2018	79500
13663	48	Chicago Heights	Illinois	3	2018	61000
13664	48	Chicago Heights	Illinois	4	2018	98000
13665	48	Chicago Heights	Illinois	5	2018	76500
13666	48	Chicago Heights	Illinois	6	2018	77500
13667	48	Chicago Heights	Illinois	7	2018	146000
13668	48	Chicago Heights	Illinois	8	2018	84700
13669	48	Chicago Heights	Illinois	9	2018	93500
13670	48	Chicago Heights	Illinois	10	2018	118000
13671	48	Chicago Heights	Illinois	11	2018	77500
13672	48	Chicago Heights	Illinois	12	2018	79000
13673	48	Chicago Heights	Illinois	1	2019	0
13674	49	Frankfort	Illinois	1	2009	0
13675	49	Frankfort	Illinois	2	2009	0
13676	49	Frankfort	Illinois	3	2009	0
13677	49	Frankfort	Illinois	4	2009	0
13678	49	Frankfort	Illinois	5	2009	0
13679	49	Frankfort	Illinois	6	2009	0
13680	49	Frankfort	Illinois	7	2009	0
13681	49	Frankfort	Illinois	8	2009	0
13682	49	Frankfort	Illinois	9	2009	0
13683	49	Frankfort	Illinois	10	2009	0
13684	49	Frankfort	Illinois	11	2009	0
13685	49	Frankfort	Illinois	12	2009	0
13686	49	Frankfort	Illinois	1	2010	0
13687	49	Frankfort	Illinois	2	2010	0
13688	49	Frankfort	Illinois	3	2010	0
13689	49	Frankfort	Illinois	4	2010	0
13690	49	Frankfort	Illinois	5	2010	0
13691	49	Frankfort	Illinois	6	2010	0
13692	49	Frankfort	Illinois	7	2010	0
13693	49	Frankfort	Illinois	8	2010	0
13694	49	Frankfort	Illinois	9	2010	0
13695	49	Frankfort	Illinois	10	2010	0
13696	49	Frankfort	Illinois	11	2010	0
13697	49	Frankfort	Illinois	12	2010	0
13698	49	Frankfort	Illinois	1	2011	0
13699	49	Frankfort	Illinois	2	2011	0
13700	49	Frankfort	Illinois	3	2011	0
13701	49	Frankfort	Illinois	4	2011	0
13702	49	Frankfort	Illinois	5	2011	0
13703	49	Frankfort	Illinois	6	2011	0
13704	49	Frankfort	Illinois	7	2011	0
13705	49	Frankfort	Illinois	8	2011	0
13706	49	Frankfort	Illinois	9	2011	0
13707	49	Frankfort	Illinois	10	2011	0
13708	49	Frankfort	Illinois	11	2011	0
13709	49	Frankfort	Illinois	12	2011	0
13710	49	Frankfort	Illinois	1	2012	247450
13711	49	Frankfort	Illinois	2	2012	240000
13712	49	Frankfort	Illinois	3	2012	316000
13713	49	Frankfort	Illinois	4	2012	250000
13714	49	Frankfort	Illinois	5	2012	285000
13715	49	Frankfort	Illinois	6	2012	272900
13716	49	Frankfort	Illinois	7	2012	254100
13717	49	Frankfort	Illinois	8	2012	299950
13718	49	Frankfort	Illinois	9	2012	288000
13719	49	Frankfort	Illinois	10	2012	222500
13720	49	Frankfort	Illinois	11	2012	235000
13721	49	Frankfort	Illinois	12	2012	295000
13722	49	Frankfort	Illinois	1	2013	277500
13723	49	Frankfort	Illinois	2	2013	228000
13724	49	Frankfort	Illinois	3	2013	262000
13725	49	Frankfort	Illinois	4	2013	320159
13726	49	Frankfort	Illinois	5	2013	290000
13727	49	Frankfort	Illinois	6	2013	250750
13728	49	Frankfort	Illinois	7	2013	338750
13729	49	Frankfort	Illinois	8	2013	317000
13730	49	Frankfort	Illinois	9	2013	290000
13731	49	Frankfort	Illinois	10	2013	291250
13732	49	Frankfort	Illinois	11	2013	274250
13733	49	Frankfort	Illinois	12	2013	253750
13734	49	Frankfort	Illinois	1	2014	301300
13735	49	Frankfort	Illinois	2	2014	263000
13736	49	Frankfort	Illinois	3	2014	214700
13737	49	Frankfort	Illinois	4	2014	261500
13738	49	Frankfort	Illinois	5	2014	312500
13739	49	Frankfort	Illinois	6	2014	286250
13740	49	Frankfort	Illinois	7	2014	285000
13741	49	Frankfort	Illinois	8	2014	318000
13742	49	Frankfort	Illinois	9	2014	230000
13743	49	Frankfort	Illinois	10	2014	289000
13744	49	Frankfort	Illinois	11	2014	328400
13745	49	Frankfort	Illinois	12	2014	294250
13746	49	Frankfort	Illinois	1	2015	241000
13747	49	Frankfort	Illinois	2	2015	350000
13748	49	Frankfort	Illinois	3	2015	247500
13749	49	Frankfort	Illinois	4	2015	295000
13750	49	Frankfort	Illinois	5	2015	335000
13751	49	Frankfort	Illinois	6	2015	308450
13752	49	Frankfort	Illinois	7	2015	323000
13753	49	Frankfort	Illinois	8	2015	355950
13754	49	Frankfort	Illinois	9	2015	324750
13755	49	Frankfort	Illinois	10	2015	301000
13756	49	Frankfort	Illinois	11	2015	269500
13757	49	Frankfort	Illinois	12	2015	305000
13758	49	Frankfort	Illinois	1	2016	262000
13759	49	Frankfort	Illinois	2	2016	277500
13760	49	Frankfort	Illinois	3	2016	276000
13761	49	Frankfort	Illinois	4	2016	305000
13762	49	Frankfort	Illinois	5	2016	332500
13763	49	Frankfort	Illinois	6	2016	330000
13764	49	Frankfort	Illinois	7	2016	310555
13765	49	Frankfort	Illinois	8	2016	311750
13766	49	Frankfort	Illinois	9	2016	320000
13767	49	Frankfort	Illinois	10	2016	328000
13768	49	Frankfort	Illinois	11	2016	282000
13769	49	Frankfort	Illinois	12	2016	375000
13770	49	Frankfort	Illinois	1	2017	337500
13771	49	Frankfort	Illinois	2	2017	365750
13772	49	Frankfort	Illinois	3	2017	300000
13773	49	Frankfort	Illinois	4	2017	295000
13774	49	Frankfort	Illinois	5	2017	320000
13775	49	Frankfort	Illinois	6	2017	305000
13776	49	Frankfort	Illinois	7	2017	340000
13777	49	Frankfort	Illinois	8	2017	270000
13778	49	Frankfort	Illinois	9	2017	380000
13779	49	Frankfort	Illinois	10	2017	313500
13780	49	Frankfort	Illinois	11	2017	251250
13781	49	Frankfort	Illinois	12	2017	344250
13782	49	Frankfort	Illinois	1	2018	292000
13783	49	Frankfort	Illinois	2	2018	285000
13784	49	Frankfort	Illinois	3	2018	379750
13785	49	Frankfort	Illinois	4	2018	297700
13786	49	Frankfort	Illinois	5	2018	305000
13787	49	Frankfort	Illinois	6	2018	323500
13788	49	Frankfort	Illinois	7	2018	360000
13789	49	Frankfort	Illinois	8	2018	292500
13790	49	Frankfort	Illinois	9	2018	322555
13791	49	Frankfort	Illinois	10	2018	287000
13792	49	Frankfort	Illinois	11	2018	355000
13793	49	Frankfort	Illinois	12	2018	351000
13794	49	Frankfort	Illinois	1	2019	0
13795	50	Lansing	Illinois	1	2009	0
13796	50	Lansing	Illinois	2	2009	0
13797	50	Lansing	Illinois	3	2009	0
13798	50	Lansing	Illinois	4	2009	0
13799	50	Lansing	Illinois	5	2009	0
13800	50	Lansing	Illinois	6	2009	0
13801	50	Lansing	Illinois	7	2009	0
13802	50	Lansing	Illinois	8	2009	0
13803	50	Lansing	Illinois	9	2009	0
13804	50	Lansing	Illinois	10	2009	0
13805	50	Lansing	Illinois	11	2009	0
13806	50	Lansing	Illinois	12	2009	0
13807	50	Lansing	Illinois	1	2010	0
13808	50	Lansing	Illinois	2	2010	0
13809	50	Lansing	Illinois	3	2010	0
13810	50	Lansing	Illinois	4	2010	0
13811	50	Lansing	Illinois	5	2010	0
13812	50	Lansing	Illinois	6	2010	0
13813	50	Lansing	Illinois	7	2010	0
13814	50	Lansing	Illinois	8	2010	0
13815	50	Lansing	Illinois	9	2010	0
13816	50	Lansing	Illinois	10	2010	0
13817	50	Lansing	Illinois	11	2010	0
13818	50	Lansing	Illinois	12	2010	0
13819	50	Lansing	Illinois	1	2011	0
13820	50	Lansing	Illinois	2	2011	0
13821	50	Lansing	Illinois	3	2011	0
13822	50	Lansing	Illinois	4	2011	0
13823	50	Lansing	Illinois	5	2011	0
13824	50	Lansing	Illinois	6	2011	0
13825	50	Lansing	Illinois	7	2011	0
13826	50	Lansing	Illinois	8	2011	0
13827	50	Lansing	Illinois	9	2011	0
13828	50	Lansing	Illinois	10	2011	0
13829	50	Lansing	Illinois	11	2011	0
13830	50	Lansing	Illinois	12	2011	0
13831	50	Lansing	Illinois	1	2012	83500
13832	50	Lansing	Illinois	2	2012	45000
13833	50	Lansing	Illinois	3	2012	46808
13834	50	Lansing	Illinois	4	2012	40000
13835	50	Lansing	Illinois	5	2012	68252
13836	50	Lansing	Illinois	6	2012	40000
13837	50	Lansing	Illinois	7	2012	60000
13838	50	Lansing	Illinois	8	2012	81450
13839	50	Lansing	Illinois	9	2012	85000
13840	50	Lansing	Illinois	10	2012	86000
13841	50	Lansing	Illinois	11	2012	56500
13842	50	Lansing	Illinois	12	2012	75000
13843	50	Lansing	Illinois	1	2013	55000
13844	50	Lansing	Illinois	2	2013	57500
13845	50	Lansing	Illinois	3	2013	46500
13846	50	Lansing	Illinois	4	2013	49500
13847	50	Lansing	Illinois	5	2013	84700
13848	50	Lansing	Illinois	6	2013	82000
13849	50	Lansing	Illinois	7	2013	74500
13850	50	Lansing	Illinois	8	2013	101050
13851	50	Lansing	Illinois	9	2013	70500
13852	50	Lansing	Illinois	10	2013	107000
13853	50	Lansing	Illinois	11	2013	84500
13854	50	Lansing	Illinois	12	2013	66500
13855	50	Lansing	Illinois	1	2014	71500
13856	50	Lansing	Illinois	2	2014	76750
13857	50	Lansing	Illinois	3	2014	68500
13858	50	Lansing	Illinois	4	2014	82000
13859	50	Lansing	Illinois	5	2014	68500
13860	50	Lansing	Illinois	6	2014	68750
13861	50	Lansing	Illinois	7	2014	89000
13862	50	Lansing	Illinois	8	2014	88000
13863	50	Lansing	Illinois	9	2014	72000
13864	50	Lansing	Illinois	10	2014	90000
13865	50	Lansing	Illinois	11	2014	82500
13866	50	Lansing	Illinois	12	2014	100000
13867	50	Lansing	Illinois	1	2015	73501
13868	50	Lansing	Illinois	2	2015	65000
13869	50	Lansing	Illinois	3	2015	54250
13870	50	Lansing	Illinois	4	2015	78000
13871	50	Lansing	Illinois	5	2015	60000
13872	50	Lansing	Illinois	6	2015	110775
13873	50	Lansing	Illinois	7	2015	100000
13874	50	Lansing	Illinois	8	2015	110000
13875	50	Lansing	Illinois	9	2015	90450
13876	50	Lansing	Illinois	10	2015	114250
13877	50	Lansing	Illinois	11	2015	82000
13878	50	Lansing	Illinois	12	2015	86750
13879	50	Lansing	Illinois	1	2016	65000
13880	50	Lansing	Illinois	2	2016	90000
13881	50	Lansing	Illinois	3	2016	74950
13882	50	Lansing	Illinois	4	2016	68000
13883	50	Lansing	Illinois	5	2016	91250
13884	50	Lansing	Illinois	6	2016	94209
13885	50	Lansing	Illinois	7	2016	110000
13886	50	Lansing	Illinois	8	2016	85000
13887	50	Lansing	Illinois	9	2016	115000
13888	50	Lansing	Illinois	10	2016	76250
13889	50	Lansing	Illinois	11	2016	95000
13890	50	Lansing	Illinois	12	2016	80000
13891	50	Lansing	Illinois	1	2017	94000
13892	50	Lansing	Illinois	2	2017	64500
13893	50	Lansing	Illinois	3	2017	64575
13894	50	Lansing	Illinois	4	2017	80000
13895	50	Lansing	Illinois	5	2017	87000
13896	50	Lansing	Illinois	6	2017	92750
13897	50	Lansing	Illinois	7	2017	102250
13898	50	Lansing	Illinois	8	2017	109000
13899	50	Lansing	Illinois	9	2017	110000
13900	50	Lansing	Illinois	10	2017	104750
13901	50	Lansing	Illinois	11	2017	107500
13902	50	Lansing	Illinois	12	2017	135000
13903	50	Lansing	Illinois	1	2018	118500
13904	50	Lansing	Illinois	2	2018	93000
13905	50	Lansing	Illinois	3	2018	125000
13906	50	Lansing	Illinois	4	2018	89000
13907	50	Lansing	Illinois	5	2018	120000
13908	50	Lansing	Illinois	6	2018	120000
13909	50	Lansing	Illinois	7	2018	127000
13910	50	Lansing	Illinois	8	2018	91500
13911	50	Lansing	Illinois	9	2018	138900
13912	50	Lansing	Illinois	10	2018	130000
13913	50	Lansing	Illinois	11	2018	116000
13914	50	Lansing	Illinois	12	2018	136000
13915	50	Lansing	Illinois	1	2019	0
13916	51	Montgomery	Illinois	1	2009	0
13917	51	Montgomery	Illinois	2	2009	0
13918	51	Montgomery	Illinois	3	2009	0
13919	51	Montgomery	Illinois	4	2009	0
13920	51	Montgomery	Illinois	5	2009	0
13921	51	Montgomery	Illinois	6	2009	0
13922	51	Montgomery	Illinois	7	2009	0
13923	51	Montgomery	Illinois	8	2009	0
13924	51	Montgomery	Illinois	9	2009	0
13925	51	Montgomery	Illinois	10	2009	0
13926	51	Montgomery	Illinois	11	2009	0
13927	51	Montgomery	Illinois	12	2009	0
13928	51	Montgomery	Illinois	1	2010	0
13929	51	Montgomery	Illinois	2	2010	0
13930	51	Montgomery	Illinois	3	2010	0
13931	51	Montgomery	Illinois	4	2010	0
13932	51	Montgomery	Illinois	5	2010	0
13933	51	Montgomery	Illinois	6	2010	0
13934	51	Montgomery	Illinois	7	2010	0
13935	51	Montgomery	Illinois	8	2010	0
13936	51	Montgomery	Illinois	9	2010	0
13937	51	Montgomery	Illinois	10	2010	0
13938	51	Montgomery	Illinois	11	2010	0
13939	51	Montgomery	Illinois	12	2010	0
13940	51	Montgomery	Illinois	1	2011	0
13941	51	Montgomery	Illinois	2	2011	0
13942	51	Montgomery	Illinois	3	2011	0
13943	51	Montgomery	Illinois	4	2011	0
13944	51	Montgomery	Illinois	5	2011	0
13945	51	Montgomery	Illinois	6	2011	0
13946	51	Montgomery	Illinois	7	2011	0
13947	51	Montgomery	Illinois	8	2011	0
13948	51	Montgomery	Illinois	9	2011	0
13949	51	Montgomery	Illinois	10	2011	0
13950	51	Montgomery	Illinois	11	2011	0
13951	51	Montgomery	Illinois	12	2011	0
13952	51	Montgomery	Illinois	1	2012	132000
13953	51	Montgomery	Illinois	2	2012	135250
13954	51	Montgomery	Illinois	3	2012	88500
13955	51	Montgomery	Illinois	4	2012	129000
13956	51	Montgomery	Illinois	5	2012	108000
13957	51	Montgomery	Illinois	6	2012	114750
13958	51	Montgomery	Illinois	7	2012	130000
13959	51	Montgomery	Illinois	8	2012	116000
13960	51	Montgomery	Illinois	9	2012	136000
13961	51	Montgomery	Illinois	10	2012	129000
13962	51	Montgomery	Illinois	11	2012	127927
13963	51	Montgomery	Illinois	12	2012	134000
13964	51	Montgomery	Illinois	1	2013	112000
13965	51	Montgomery	Illinois	2	2013	100000
13966	51	Montgomery	Illinois	3	2013	143000
13967	51	Montgomery	Illinois	4	2013	125000
13968	51	Montgomery	Illinois	5	2013	124500
13969	51	Montgomery	Illinois	6	2013	121000
13970	51	Montgomery	Illinois	7	2013	162500
13971	51	Montgomery	Illinois	8	2013	115000
13972	51	Montgomery	Illinois	9	2013	144000
13973	51	Montgomery	Illinois	10	2013	130000
13974	51	Montgomery	Illinois	11	2013	122500
13975	51	Montgomery	Illinois	12	2013	138500
13976	51	Montgomery	Illinois	1	2014	146500
13977	51	Montgomery	Illinois	2	2014	119500
13978	51	Montgomery	Illinois	3	2014	126500
13979	51	Montgomery	Illinois	4	2014	145000
13980	51	Montgomery	Illinois	5	2014	179500
13981	51	Montgomery	Illinois	6	2014	155250
13982	51	Montgomery	Illinois	7	2014	151375
13983	51	Montgomery	Illinois	8	2014	147750
13984	51	Montgomery	Illinois	9	2014	134768
13985	51	Montgomery	Illinois	10	2014	133000
13986	51	Montgomery	Illinois	11	2014	154000
13987	51	Montgomery	Illinois	12	2014	137750
13988	51	Montgomery	Illinois	1	2015	140000
13989	51	Montgomery	Illinois	2	2015	154000
13990	51	Montgomery	Illinois	3	2015	137250
13991	51	Montgomery	Illinois	4	2015	152500
13992	51	Montgomery	Illinois	5	2015	165913
13993	51	Montgomery	Illinois	6	2015	169000
13994	51	Montgomery	Illinois	7	2015	158500
13995	51	Montgomery	Illinois	8	2015	168500
13996	51	Montgomery	Illinois	9	2015	148000
13997	51	Montgomery	Illinois	10	2015	151500
13998	51	Montgomery	Illinois	11	2015	135000
13999	51	Montgomery	Illinois	12	2015	155000
14000	51	Montgomery	Illinois	1	2016	186750
14001	51	Montgomery	Illinois	2	2016	140500
14002	51	Montgomery	Illinois	3	2016	164250
14003	51	Montgomery	Illinois	4	2016	168500
14004	51	Montgomery	Illinois	5	2016	173000
14005	51	Montgomery	Illinois	6	2016	178000
14006	51	Montgomery	Illinois	7	2016	180000
14007	51	Montgomery	Illinois	8	2016	179000
14008	51	Montgomery	Illinois	9	2016	156000
14009	51	Montgomery	Illinois	10	2016	204000
14010	51	Montgomery	Illinois	11	2016	187500
14011	51	Montgomery	Illinois	12	2016	188500
14012	51	Montgomery	Illinois	1	2017	184000
14013	51	Montgomery	Illinois	2	2017	162500
14014	51	Montgomery	Illinois	3	2017	176500
14015	51	Montgomery	Illinois	4	2017	190000
14016	51	Montgomery	Illinois	5	2017	189100
14017	51	Montgomery	Illinois	6	2017	189500
14018	51	Montgomery	Illinois	7	2017	180500
14019	51	Montgomery	Illinois	8	2017	195750
14020	51	Montgomery	Illinois	9	2017	183750
14021	51	Montgomery	Illinois	10	2017	179295
14022	51	Montgomery	Illinois	11	2017	163500
14023	51	Montgomery	Illinois	12	2017	178500
14024	51	Montgomery	Illinois	1	2018	201000
14025	51	Montgomery	Illinois	2	2018	167750
14026	51	Montgomery	Illinois	3	2018	184000
14027	51	Montgomery	Illinois	4	2018	180000
14028	51	Montgomery	Illinois	5	2018	200266
14029	51	Montgomery	Illinois	6	2018	200000
14030	51	Montgomery	Illinois	7	2018	187000
14031	51	Montgomery	Illinois	8	2018	190000
14032	51	Montgomery	Illinois	9	2018	184000
14033	51	Montgomery	Illinois	10	2018	174900
14034	51	Montgomery	Illinois	11	2018	176900
14035	51	Montgomery	Illinois	12	2018	198750
14036	51	Montgomery	Illinois	1	2019	0
14037	52	North Aurora	Illinois	1	2009	0
14038	52	North Aurora	Illinois	2	2009	0
14039	52	North Aurora	Illinois	3	2009	0
14040	52	North Aurora	Illinois	4	2009	0
14041	52	North Aurora	Illinois	5	2009	0
14042	52	North Aurora	Illinois	6	2009	0
14043	52	North Aurora	Illinois	7	2009	0
14044	52	North Aurora	Illinois	8	2009	0
14045	52	North Aurora	Illinois	9	2009	0
14046	52	North Aurora	Illinois	10	2009	0
14047	52	North Aurora	Illinois	11	2009	0
14048	52	North Aurora	Illinois	12	2009	0
14049	52	North Aurora	Illinois	1	2010	0
14050	52	North Aurora	Illinois	2	2010	0
14051	52	North Aurora	Illinois	3	2010	0
14052	52	North Aurora	Illinois	4	2010	0
14053	52	North Aurora	Illinois	5	2010	0
14054	52	North Aurora	Illinois	6	2010	0
14055	52	North Aurora	Illinois	7	2010	0
14056	52	North Aurora	Illinois	8	2010	0
14057	52	North Aurora	Illinois	9	2010	0
14058	52	North Aurora	Illinois	10	2010	0
14059	52	North Aurora	Illinois	11	2010	0
14060	52	North Aurora	Illinois	12	2010	0
14061	52	North Aurora	Illinois	1	2011	0
14062	52	North Aurora	Illinois	2	2011	0
14063	52	North Aurora	Illinois	3	2011	0
14064	52	North Aurora	Illinois	4	2011	0
14065	52	North Aurora	Illinois	5	2011	0
14066	52	North Aurora	Illinois	6	2011	0
14067	52	North Aurora	Illinois	7	2011	0
14068	52	North Aurora	Illinois	8	2011	0
14069	52	North Aurora	Illinois	9	2011	0
14070	52	North Aurora	Illinois	10	2011	0
14071	52	North Aurora	Illinois	11	2011	0
14072	52	North Aurora	Illinois	12	2011	0
14073	52	North Aurora	Illinois	1	2012	173750
14074	52	North Aurora	Illinois	2	2012	170000
14075	52	North Aurora	Illinois	3	2012	128000
14076	52	North Aurora	Illinois	4	2012	156000
14077	52	North Aurora	Illinois	5	2012	195250
14078	52	North Aurora	Illinois	6	2012	220000
14079	52	North Aurora	Illinois	7	2012	189000
14080	52	North Aurora	Illinois	8	2012	170000
14081	52	North Aurora	Illinois	9	2012	195000
14082	52	North Aurora	Illinois	10	2012	175000
14083	52	North Aurora	Illinois	11	2012	205000
14084	52	North Aurora	Illinois	12	2012	144000
14085	52	North Aurora	Illinois	1	2013	160000
14086	52	North Aurora	Illinois	2	2013	211000
14087	52	North Aurora	Illinois	3	2013	160000
14088	52	North Aurora	Illinois	4	2013	175000
14089	52	North Aurora	Illinois	5	2013	218500
14090	52	North Aurora	Illinois	6	2013	245000
14091	52	North Aurora	Illinois	7	2013	237000
14092	52	North Aurora	Illinois	8	2013	211500
14093	52	North Aurora	Illinois	9	2013	195000
14094	52	North Aurora	Illinois	10	2013	224500
14095	52	North Aurora	Illinois	11	2013	171500
14096	52	North Aurora	Illinois	12	2013	192000
14097	52	North Aurora	Illinois	1	2014	183000
14098	52	North Aurora	Illinois	2	2014	111250
14099	52	North Aurora	Illinois	3	2014	151250
14100	52	North Aurora	Illinois	4	2014	189370
14101	52	North Aurora	Illinois	5	2014	222500
14102	52	North Aurora	Illinois	6	2014	189000
14103	52	North Aurora	Illinois	7	2014	217000
14104	52	North Aurora	Illinois	8	2014	226500
14105	52	North Aurora	Illinois	9	2014	221500
14106	52	North Aurora	Illinois	10	2014	234250
14107	52	North Aurora	Illinois	11	2014	212000
14108	52	North Aurora	Illinois	12	2014	210000
14109	52	North Aurora	Illinois	1	2015	137500
14110	52	North Aurora	Illinois	2	2015	165000
14111	52	North Aurora	Illinois	3	2015	205500
14112	52	North Aurora	Illinois	4	2015	197000
14113	52	North Aurora	Illinois	5	2015	244500
14114	52	North Aurora	Illinois	6	2015	224000
14115	52	North Aurora	Illinois	7	2015	215000
14116	52	North Aurora	Illinois	8	2015	186000
14117	52	North Aurora	Illinois	9	2015	199750
14118	52	North Aurora	Illinois	10	2015	224000
14119	52	North Aurora	Illinois	11	2015	230000
14120	52	North Aurora	Illinois	12	2015	192000
14121	52	North Aurora	Illinois	1	2016	190000
14122	52	North Aurora	Illinois	2	2016	152000
14123	52	North Aurora	Illinois	3	2016	182750
14124	52	North Aurora	Illinois	4	2016	246000
14125	52	North Aurora	Illinois	5	2016	242500
14126	52	North Aurora	Illinois	6	2016	220000
14127	52	North Aurora	Illinois	7	2016	230000
14128	52	North Aurora	Illinois	8	2016	191500
14129	52	North Aurora	Illinois	9	2016	224250
14130	52	North Aurora	Illinois	10	2016	244500
14131	52	North Aurora	Illinois	11	2016	169000
14132	52	North Aurora	Illinois	12	2016	197000
14133	52	North Aurora	Illinois	1	2017	216500
14134	52	North Aurora	Illinois	2	2017	208500
14135	52	North Aurora	Illinois	3	2017	190000
14136	52	North Aurora	Illinois	4	2017	220000
14137	52	North Aurora	Illinois	5	2017	235000
14138	52	North Aurora	Illinois	6	2017	253750
14139	52	North Aurora	Illinois	7	2017	225500
14140	52	North Aurora	Illinois	8	2017	242500
14141	52	North Aurora	Illinois	9	2017	231250
14142	52	North Aurora	Illinois	10	2017	237000
14143	52	North Aurora	Illinois	11	2017	182500
14144	52	North Aurora	Illinois	12	2017	187750
14145	52	North Aurora	Illinois	1	2018	255000
14146	52	North Aurora	Illinois	2	2018	260000
14147	52	North Aurora	Illinois	3	2018	250100
14148	52	North Aurora	Illinois	4	2018	251250
14149	52	North Aurora	Illinois	5	2018	217500
14150	52	North Aurora	Illinois	6	2018	274500
14151	52	North Aurora	Illinois	7	2018	235500
14152	52	North Aurora	Illinois	8	2018	283500
14153	52	North Aurora	Illinois	9	2018	210450
14154	52	North Aurora	Illinois	10	2018	225000
14155	52	North Aurora	Illinois	11	2018	300000
14156	52	North Aurora	Illinois	12	2018	247750
14157	52	North Aurora	Illinois	1	2019	0
14158	53	North Chicago	Illinois	1	2009	0
14159	53	North Chicago	Illinois	2	2009	0
14160	53	North Chicago	Illinois	3	2009	0
14161	53	North Chicago	Illinois	4	2009	0
14162	53	North Chicago	Illinois	5	2009	0
14163	53	North Chicago	Illinois	6	2009	0
14164	53	North Chicago	Illinois	7	2009	0
14165	53	North Chicago	Illinois	8	2009	0
14166	53	North Chicago	Illinois	9	2009	0
14167	53	North Chicago	Illinois	10	2009	0
14168	53	North Chicago	Illinois	11	2009	0
14169	53	North Chicago	Illinois	12	2009	0
14170	53	North Chicago	Illinois	1	2010	0
14171	53	North Chicago	Illinois	2	2010	0
14172	53	North Chicago	Illinois	3	2010	0
14173	53	North Chicago	Illinois	4	2010	0
14174	53	North Chicago	Illinois	5	2010	0
14175	53	North Chicago	Illinois	6	2010	0
14176	53	North Chicago	Illinois	7	2010	0
14177	53	North Chicago	Illinois	8	2010	0
14178	53	North Chicago	Illinois	9	2010	0
14179	53	North Chicago	Illinois	10	2010	0
14180	53	North Chicago	Illinois	11	2010	0
14181	53	North Chicago	Illinois	12	2010	0
14182	53	North Chicago	Illinois	1	2011	0
14183	53	North Chicago	Illinois	2	2011	0
14184	53	North Chicago	Illinois	3	2011	0
14185	53	North Chicago	Illinois	4	2011	0
14186	53	North Chicago	Illinois	5	2011	0
14187	53	North Chicago	Illinois	6	2011	0
14188	53	North Chicago	Illinois	7	2011	0
14189	53	North Chicago	Illinois	8	2011	0
14190	53	North Chicago	Illinois	9	2011	0
14191	53	North Chicago	Illinois	10	2011	0
14192	53	North Chicago	Illinois	11	2011	0
14193	53	North Chicago	Illinois	12	2011	0
14194	53	North Chicago	Illinois	1	2012	22500
14195	53	North Chicago	Illinois	2	2012	23000
14196	53	North Chicago	Illinois	3	2012	27000
14197	53	North Chicago	Illinois	4	2012	27450
14198	53	North Chicago	Illinois	5	2012	30000
14199	53	North Chicago	Illinois	6	2012	24650
14200	53	North Chicago	Illinois	7	2012	24700
14201	53	North Chicago	Illinois	8	2012	25000
14202	53	North Chicago	Illinois	9	2012	27438
14203	53	North Chicago	Illinois	10	2012	27000
14204	53	North Chicago	Illinois	11	2012	27000
14205	53	North Chicago	Illinois	12	2012	30200
14206	53	North Chicago	Illinois	1	2013	40000
14207	53	North Chicago	Illinois	2	2013	40000
14208	53	North Chicago	Illinois	3	2013	29700
14209	53	North Chicago	Illinois	4	2013	28000
14210	53	North Chicago	Illinois	5	2013	28100
14211	53	North Chicago	Illinois	6	2013	28601
14212	53	North Chicago	Illinois	7	2013	29501
14213	53	North Chicago	Illinois	8	2013	34000
14214	53	North Chicago	Illinois	9	2013	40000
14215	53	North Chicago	Illinois	10	2013	35000
14216	53	North Chicago	Illinois	11	2013	33000
14217	53	North Chicago	Illinois	12	2013	33000
14218	53	North Chicago	Illinois	1	2014	34000
14219	53	North Chicago	Illinois	2	2014	31925
14220	53	North Chicago	Illinois	3	2014	29250
14221	53	North Chicago	Illinois	4	2014	32000
14222	53	North Chicago	Illinois	5	2014	34500
14223	53	North Chicago	Illinois	6	2014	42500
14224	53	North Chicago	Illinois	7	2014	35500
14225	53	North Chicago	Illinois	8	2014	35250
14226	53	North Chicago	Illinois	9	2014	35250
14227	53	North Chicago	Illinois	10	2014	31500
14228	53	North Chicago	Illinois	11	2014	30700
14229	53	North Chicago	Illinois	12	2014	27500
14230	53	North Chicago	Illinois	1	2015	25000
14231	53	North Chicago	Illinois	2	2015	30000
14232	53	North Chicago	Illinois	3	2015	28000
14233	53	North Chicago	Illinois	4	2015	34250
14234	53	North Chicago	Illinois	5	2015	23350
14235	53	North Chicago	Illinois	6	2015	47000
14236	53	North Chicago	Illinois	7	2015	47000
14237	53	North Chicago	Illinois	8	2015	50000
14238	53	North Chicago	Illinois	9	2015	30000
14239	53	North Chicago	Illinois	10	2015	30000
14240	53	North Chicago	Illinois	11	2015	30000
14241	53	North Chicago	Illinois	12	2015	40100
14242	53	North Chicago	Illinois	1	2016	52550
14243	53	North Chicago	Illinois	2	2016	54000
14244	53	North Chicago	Illinois	3	2016	59500
14245	53	North Chicago	Illinois	4	2016	33000
14246	53	North Chicago	Illinois	5	2016	38250
14247	53	North Chicago	Illinois	6	2016	37500
14248	53	North Chicago	Illinois	7	2016	43000
14249	53	North Chicago	Illinois	8	2016	46000
14250	53	North Chicago	Illinois	9	2016	51097
14251	53	North Chicago	Illinois	10	2016	67000
14252	53	North Chicago	Illinois	11	2016	57450
14253	53	North Chicago	Illinois	12	2016	65000
14254	53	North Chicago	Illinois	1	2017	65000
14255	53	North Chicago	Illinois	2	2017	80000
14256	53	North Chicago	Illinois	3	2017	68000
14257	53	North Chicago	Illinois	4	2017	43000
14258	53	North Chicago	Illinois	5	2017	51500
14259	53	North Chicago	Illinois	6	2017	36200
14260	53	North Chicago	Illinois	7	2017	90750
14261	53	North Chicago	Illinois	8	2017	68950
14262	53	North Chicago	Illinois	9	2017	84900
14263	53	North Chicago	Illinois	10	2017	53000
14264	53	North Chicago	Illinois	11	2017	65000
14265	53	North Chicago	Illinois	12	2017	75000
14266	53	North Chicago	Illinois	1	2018	75000
14267	53	North Chicago	Illinois	2	2018	75000
14268	53	North Chicago	Illinois	3	2018	64000
14269	53	North Chicago	Illinois	4	2018	63000
14270	53	North Chicago	Illinois	5	2018	64000
14271	53	North Chicago	Illinois	6	2018	63500
14272	53	North Chicago	Illinois	7	2018	72000
14273	53	North Chicago	Illinois	8	2018	52000
14274	53	North Chicago	Illinois	9	2018	52000
14275	53	North Chicago	Illinois	10	2018	59500
14276	53	North Chicago	Illinois	11	2018	97500
14277	53	North Chicago	Illinois	12	2018	95000
14278	53	North Chicago	Illinois	1	2019	0
14279	54	West Chicago	Illinois	1	2009	0
14280	54	West Chicago	Illinois	2	2009	0
14281	54	West Chicago	Illinois	3	2009	0
14282	54	West Chicago	Illinois	4	2009	0
14283	54	West Chicago	Illinois	5	2009	0
14284	54	West Chicago	Illinois	6	2009	0
14285	54	West Chicago	Illinois	7	2009	0
14286	54	West Chicago	Illinois	8	2009	0
14287	54	West Chicago	Illinois	9	2009	0
14288	54	West Chicago	Illinois	10	2009	0
14289	54	West Chicago	Illinois	11	2009	0
14290	54	West Chicago	Illinois	12	2009	0
14291	54	West Chicago	Illinois	1	2010	0
14292	54	West Chicago	Illinois	2	2010	0
14293	54	West Chicago	Illinois	3	2010	0
14294	54	West Chicago	Illinois	4	2010	0
14295	54	West Chicago	Illinois	5	2010	0
14296	54	West Chicago	Illinois	6	2010	0
14297	54	West Chicago	Illinois	7	2010	0
14298	54	West Chicago	Illinois	8	2010	0
14299	54	West Chicago	Illinois	9	2010	0
14300	54	West Chicago	Illinois	10	2010	0
14301	54	West Chicago	Illinois	11	2010	0
14302	54	West Chicago	Illinois	12	2010	0
14303	54	West Chicago	Illinois	1	2011	0
14304	54	West Chicago	Illinois	2	2011	0
14305	54	West Chicago	Illinois	3	2011	0
14306	54	West Chicago	Illinois	4	2011	0
14307	54	West Chicago	Illinois	5	2011	0
14308	54	West Chicago	Illinois	6	2011	0
14309	54	West Chicago	Illinois	7	2011	0
14310	54	West Chicago	Illinois	8	2011	0
14311	54	West Chicago	Illinois	9	2011	0
14312	54	West Chicago	Illinois	10	2011	0
14313	54	West Chicago	Illinois	11	2011	0
14314	54	West Chicago	Illinois	12	2011	0
14315	54	West Chicago	Illinois	1	2012	127000
14316	54	West Chicago	Illinois	2	2012	120000
14317	54	West Chicago	Illinois	3	2012	132950
14318	54	West Chicago	Illinois	4	2012	153500
14319	54	West Chicago	Illinois	5	2012	158250
14320	54	West Chicago	Illinois	6	2012	130000
14321	54	West Chicago	Illinois	7	2012	163250
14322	54	West Chicago	Illinois	8	2012	133000
14323	54	West Chicago	Illinois	9	2012	132500
14324	54	West Chicago	Illinois	10	2012	140000
14325	54	West Chicago	Illinois	11	2012	191500
14326	54	West Chicago	Illinois	12	2012	135500
14327	54	West Chicago	Illinois	1	2013	130000
14328	54	West Chicago	Illinois	2	2013	143500
14329	54	West Chicago	Illinois	3	2013	132000
14330	54	West Chicago	Illinois	4	2013	188250
14331	54	West Chicago	Illinois	5	2013	163000
14332	54	West Chicago	Illinois	6	2013	150000
14333	54	West Chicago	Illinois	7	2013	160000
14334	54	West Chicago	Illinois	8	2013	225000
14335	54	West Chicago	Illinois	9	2013	177500
14336	54	West Chicago	Illinois	10	2013	140000
14337	54	West Chicago	Illinois	11	2013	162300
14338	54	West Chicago	Illinois	12	2013	155000
14339	54	West Chicago	Illinois	1	2014	150000
14340	54	West Chicago	Illinois	2	2014	125000
14341	54	West Chicago	Illinois	3	2014	159250
14342	54	West Chicago	Illinois	4	2014	212500
14343	54	West Chicago	Illinois	5	2014	210000
14344	54	West Chicago	Illinois	6	2014	226000
14345	54	West Chicago	Illinois	7	2014	214000
14346	54	West Chicago	Illinois	8	2014	250000
14347	54	West Chicago	Illinois	9	2014	286500
14348	54	West Chicago	Illinois	10	2014	173750
14349	54	West Chicago	Illinois	11	2014	155000
14350	54	West Chicago	Illinois	12	2014	161250
14351	54	West Chicago	Illinois	1	2015	179750
14352	54	West Chicago	Illinois	2	2015	174000
14353	54	West Chicago	Illinois	3	2015	189500
14354	54	West Chicago	Illinois	4	2015	179500
14355	54	West Chicago	Illinois	5	2015	191250
14356	54	West Chicago	Illinois	6	2015	179000
14357	54	West Chicago	Illinois	7	2015	184500
14358	54	West Chicago	Illinois	8	2015	176000
14359	54	West Chicago	Illinois	9	2015	195000
14360	54	West Chicago	Illinois	10	2015	179000
14361	54	West Chicago	Illinois	11	2015	217500
14362	54	West Chicago	Illinois	12	2015	198000
14363	54	West Chicago	Illinois	1	2016	199000
14364	54	West Chicago	Illinois	2	2016	192500
14365	54	West Chicago	Illinois	3	2016	195500
14366	54	West Chicago	Illinois	4	2016	261000
14367	54	West Chicago	Illinois	5	2016	197000
14368	54	West Chicago	Illinois	6	2016	230000
14369	54	West Chicago	Illinois	7	2016	261750
14370	54	West Chicago	Illinois	8	2016	205000
14371	54	West Chicago	Illinois	9	2016	251500
14372	54	West Chicago	Illinois	10	2016	233500
14373	54	West Chicago	Illinois	11	2016	207500
14374	54	West Chicago	Illinois	12	2016	249000
14375	54	West Chicago	Illinois	1	2017	220400
14376	54	West Chicago	Illinois	2	2017	270000
14377	54	West Chicago	Illinois	3	2017	239500
14378	54	West Chicago	Illinois	4	2017	210000
14379	54	West Chicago	Illinois	5	2017	255000
14380	54	West Chicago	Illinois	6	2017	243000
14381	54	West Chicago	Illinois	7	2017	229000
14382	54	West Chicago	Illinois	8	2017	252500
14383	54	West Chicago	Illinois	9	2017	243500
14384	54	West Chicago	Illinois	10	2017	272550
14385	54	West Chicago	Illinois	11	2017	259990
14386	54	West Chicago	Illinois	12	2017	225000
14387	54	West Chicago	Illinois	1	2018	280000
14388	54	West Chicago	Illinois	2	2018	197500
14389	54	West Chicago	Illinois	3	2018	200500
14390	54	West Chicago	Illinois	4	2018	221900
14391	54	West Chicago	Illinois	5	2018	240000
14392	54	West Chicago	Illinois	6	2018	292000
14393	54	West Chicago	Illinois	7	2018	235000
14394	54	West Chicago	Illinois	8	2018	270000
14395	54	West Chicago	Illinois	9	2018	276450
14396	54	West Chicago	Illinois	10	2018	230000
14397	54	West Chicago	Illinois	11	2018	281500
14398	54	West Chicago	Illinois	12	2018	204900
14399	54	West Chicago	Illinois	1	2019	0
14400	57	West Des Moines	Iowa	1	2009	0
14401	57	West Des Moines	Iowa	2	2009	0
14402	57	West Des Moines	Iowa	3	2009	0
14403	57	West Des Moines	Iowa	4	2009	0
14404	57	West Des Moines	Iowa	5	2009	0
14405	57	West Des Moines	Iowa	6	2009	0
14406	57	West Des Moines	Iowa	7	2009	0
14407	57	West Des Moines	Iowa	8	2009	0
14408	57	West Des Moines	Iowa	9	2009	0
14409	57	West Des Moines	Iowa	10	2009	0
14410	57	West Des Moines	Iowa	11	2009	0
14411	57	West Des Moines	Iowa	12	2009	0
14412	57	West Des Moines	Iowa	1	2010	0
14413	57	West Des Moines	Iowa	2	2010	0
14414	57	West Des Moines	Iowa	3	2010	0
14415	57	West Des Moines	Iowa	4	2010	0
14416	57	West Des Moines	Iowa	5	2010	0
14417	57	West Des Moines	Iowa	6	2010	0
14418	57	West Des Moines	Iowa	7	2010	0
14419	57	West Des Moines	Iowa	8	2010	0
14420	57	West Des Moines	Iowa	9	2010	0
14421	57	West Des Moines	Iowa	10	2010	0
14422	57	West Des Moines	Iowa	11	2010	0
14423	57	West Des Moines	Iowa	12	2010	0
14424	57	West Des Moines	Iowa	1	2011	0
14425	57	West Des Moines	Iowa	2	2011	0
14426	57	West Des Moines	Iowa	3	2011	0
14427	57	West Des Moines	Iowa	4	2011	0
14428	57	West Des Moines	Iowa	5	2011	0
14429	57	West Des Moines	Iowa	6	2011	0
14430	57	West Des Moines	Iowa	7	2011	0
14431	57	West Des Moines	Iowa	8	2011	0
14432	57	West Des Moines	Iowa	9	2011	0
14433	57	West Des Moines	Iowa	10	2011	0
14434	57	West Des Moines	Iowa	11	2011	0
14435	57	West Des Moines	Iowa	12	2011	0
14436	57	West Des Moines	Iowa	1	2012	181750
14437	57	West Des Moines	Iowa	2	2012	150875
14438	57	West Des Moines	Iowa	3	2012	374750
14439	57	West Des Moines	Iowa	4	2012	355000
14440	57	West Des Moines	Iowa	5	2012	373750
14441	57	West Des Moines	Iowa	6	2012	193950
14442	57	West Des Moines	Iowa	7	2012	153000
14443	57	West Des Moines	Iowa	8	2012	138000
14444	57	West Des Moines	Iowa	9	2012	261375
14445	57	West Des Moines	Iowa	10	2012	222000
14446	57	West Des Moines	Iowa	11	2012	316250
14447	57	West Des Moines	Iowa	12	2012	220000
14448	57	West Des Moines	Iowa	1	2013	220000
14449	57	West Des Moines	Iowa	2	2013	176750
14450	57	West Des Moines	Iowa	3	2013	122000
14451	57	West Des Moines	Iowa	4	2013	133500
14452	57	West Des Moines	Iowa	5	2013	144500
14453	57	West Des Moines	Iowa	6	2013	435000
14454	57	West Des Moines	Iowa	7	2013	447500
14455	57	West Des Moines	Iowa	8	2013	460000
14456	57	West Des Moines	Iowa	9	2013	195000
14457	57	West Des Moines	Iowa	10	2013	145000
14458	57	West Des Moines	Iowa	11	2013	145000
14459	57	West Des Moines	Iowa	12	2013	145000
14460	57	West Des Moines	Iowa	1	2014	0
14461	57	West Des Moines	Iowa	2	2014	0
14462	57	West Des Moines	Iowa	3	2014	125000
14463	57	West Des Moines	Iowa	4	2014	174500
14464	57	West Des Moines	Iowa	5	2014	205000
14465	57	West Des Moines	Iowa	6	2014	267500
14466	57	West Des Moines	Iowa	7	2014	174500
14467	57	West Des Moines	Iowa	8	2014	141000
14468	57	West Des Moines	Iowa	9	2014	130750
14469	57	West Des Moines	Iowa	10	2014	126000
14470	57	West Des Moines	Iowa	11	2014	122500
14471	57	West Des Moines	Iowa	12	2014	170750
14472	57	West Des Moines	Iowa	1	2015	178500
14473	57	West Des Moines	Iowa	2	2015	168000
14474	57	West Des Moines	Iowa	3	2015	153000
14475	57	West Des Moines	Iowa	4	2015	168000
14476	57	West Des Moines	Iowa	5	2015	145750
14477	57	West Des Moines	Iowa	6	2015	148000
14478	57	West Des Moines	Iowa	7	2015	149875
14479	57	West Des Moines	Iowa	8	2015	520000
14480	57	West Des Moines	Iowa	9	2015	143500
14481	57	West Des Moines	Iowa	10	2015	136000
14482	57	West Des Moines	Iowa	11	2015	134500
14483	57	West Des Moines	Iowa	12	2015	149000
14484	57	West Des Moines	Iowa	1	2016	184500
14485	57	West Des Moines	Iowa	2	2016	220000
14486	57	West Des Moines	Iowa	3	2016	216500
14487	57	West Des Moines	Iowa	4	2016	213000
14488	57	West Des Moines	Iowa	5	2016	144250
14489	57	West Des Moines	Iowa	6	2016	155500
14490	57	West Des Moines	Iowa	7	2016	155500
14491	57	West Des Moines	Iowa	8	2016	155500
14492	57	West Des Moines	Iowa	9	2016	141500
14493	57	West Des Moines	Iowa	10	2016	155500
14494	57	West Des Moines	Iowa	11	2016	160500
14495	57	West Des Moines	Iowa	12	2016	160500
14496	57	West Des Moines	Iowa	1	2017	438000
14497	57	West Des Moines	Iowa	2	2017	159000
14498	57	West Des Moines	Iowa	3	2017	147000
14499	57	West Des Moines	Iowa	4	2017	148000
14500	57	West Des Moines	Iowa	5	2017	160000
14501	57	West Des Moines	Iowa	6	2017	252500
14502	57	West Des Moines	Iowa	7	2017	264000
14503	57	West Des Moines	Iowa	8	2017	257000
14504	57	West Des Moines	Iowa	9	2017	275000
14505	57	West Des Moines	Iowa	10	2017	314500
14506	57	West Des Moines	Iowa	11	2017	383000
14507	57	West Des Moines	Iowa	12	2017	273000
14508	57	West Des Moines	Iowa	1	2018	270500
14509	57	West Des Moines	Iowa	2	2018	267750
14510	57	West Des Moines	Iowa	3	2018	209000
14511	57	West Des Moines	Iowa	4	2018	265000
14512	57	West Des Moines	Iowa	5	2018	265000
14513	57	West Des Moines	Iowa	6	2018	264500
14514	57	West Des Moines	Iowa	7	2018	264000
14515	57	West Des Moines	Iowa	8	2018	405562
14516	57	West Des Moines	Iowa	9	2018	420000
14517	57	West Des Moines	Iowa	10	2018	415000
14518	57	West Des Moines	Iowa	11	2018	337000
14519	57	West Des Moines	Iowa	12	2018	231000
14520	57	West Des Moines	Iowa	1	2019	0
14521	58	Kansas City	Kansas	1	2009	0
14522	58	Kansas City	Kansas	2	2009	0
14523	58	Kansas City	Kansas	3	2009	0
14524	58	Kansas City	Kansas	4	2009	0
14525	58	Kansas City	Kansas	5	2009	0
14526	58	Kansas City	Kansas	6	2009	0
14527	58	Kansas City	Kansas	7	2009	0
14528	58	Kansas City	Kansas	8	2009	0
14529	58	Kansas City	Kansas	9	2009	0
14530	58	Kansas City	Kansas	10	2009	0
14531	58	Kansas City	Kansas	11	2009	0
14532	58	Kansas City	Kansas	12	2009	0
14533	58	Kansas City	Kansas	1	2010	0
14534	58	Kansas City	Kansas	2	2010	0
14535	58	Kansas City	Kansas	3	2010	0
14536	58	Kansas City	Kansas	4	2010	0
14537	58	Kansas City	Kansas	5	2010	0
14538	58	Kansas City	Kansas	6	2010	0
14539	58	Kansas City	Kansas	7	2010	0
14540	58	Kansas City	Kansas	8	2010	0
14541	58	Kansas City	Kansas	9	2010	0
14542	58	Kansas City	Kansas	10	2010	0
14543	58	Kansas City	Kansas	11	2010	0
14544	58	Kansas City	Kansas	12	2010	0
14545	58	Kansas City	Kansas	1	2011	0
14546	58	Kansas City	Kansas	2	2011	0
14547	58	Kansas City	Kansas	3	2011	0
14548	58	Kansas City	Kansas	4	2011	0
14549	58	Kansas City	Kansas	5	2011	0
14550	58	Kansas City	Kansas	6	2011	0
14551	58	Kansas City	Kansas	7	2011	0
14552	58	Kansas City	Kansas	8	2011	0
14553	58	Kansas City	Kansas	9	2011	0
14554	58	Kansas City	Kansas	10	2011	0
14555	58	Kansas City	Kansas	11	2011	0
14556	58	Kansas City	Kansas	12	2011	0
14557	58	Kansas City	Kansas	1	2012	30000
14558	58	Kansas City	Kansas	2	2012	28500
14559	58	Kansas City	Kansas	3	2012	25000
14560	58	Kansas City	Kansas	4	2012	27900
14561	58	Kansas City	Kansas	5	2012	34850
14562	58	Kansas City	Kansas	6	2012	37550
14563	58	Kansas City	Kansas	7	2012	35250
14564	58	Kansas City	Kansas	8	2012	32600
14565	58	Kansas City	Kansas	9	2012	43500
14566	58	Kansas City	Kansas	10	2012	42000
14567	58	Kansas City	Kansas	11	2012	57425
14568	58	Kansas City	Kansas	12	2012	44725
14569	58	Kansas City	Kansas	1	2013	39500
14570	58	Kansas City	Kansas	2	2013	29000
14571	58	Kansas City	Kansas	3	2013	30000
14572	58	Kansas City	Kansas	4	2013	30000
14573	58	Kansas City	Kansas	5	2013	33000
14574	58	Kansas City	Kansas	6	2013	38000
14575	58	Kansas City	Kansas	7	2013	41000
14576	58	Kansas City	Kansas	8	2013	44000
14577	58	Kansas City	Kansas	9	2013	42000
14578	58	Kansas City	Kansas	10	2013	61975
14579	58	Kansas City	Kansas	11	2013	40000
14580	58	Kansas City	Kansas	12	2013	39900
14581	58	Kansas City	Kansas	1	2014	39900
14582	58	Kansas City	Kansas	2	2014	34900
14583	58	Kansas City	Kansas	3	2014	33950
14584	58	Kansas City	Kansas	4	2014	41290
14585	58	Kansas City	Kansas	5	2014	64900
14586	58	Kansas City	Kansas	6	2014	64900
14587	58	Kansas City	Kansas	7	2014	70000
14588	58	Kansas City	Kansas	8	2014	59000
14589	58	Kansas City	Kansas	9	2014	58950
14590	58	Kansas City	Kansas	10	2014	64450
14591	58	Kansas City	Kansas	11	2014	74900
14592	58	Kansas City	Kansas	12	2014	75000
14593	58	Kansas City	Kansas	1	2015	82500
14594	58	Kansas City	Kansas	2	2015	71750
14595	58	Kansas City	Kansas	3	2015	82500
14596	58	Kansas City	Kansas	4	2015	68225
14597	58	Kansas City	Kansas	5	2015	60250
14598	58	Kansas City	Kansas	6	2015	55000
14599	58	Kansas City	Kansas	7	2015	53000
14600	58	Kansas City	Kansas	8	2015	77950
14601	58	Kansas City	Kansas	9	2015	82975
14602	58	Kansas City	Kansas	10	2015	74950
14603	58	Kansas City	Kansas	11	2015	69900
14604	58	Kansas City	Kansas	12	2015	74975
14605	58	Kansas City	Kansas	1	2016	79975
14606	58	Kansas City	Kansas	2	2016	72475
14607	58	Kansas City	Kansas	3	2016	60000
14608	58	Kansas City	Kansas	4	2016	59950
14609	58	Kansas City	Kansas	5	2016	57500
14610	58	Kansas City	Kansas	6	2016	69900
14611	58	Kansas City	Kansas	7	2016	55000
14612	58	Kansas City	Kansas	8	2016	85000
14613	58	Kansas City	Kansas	9	2016	85000
14614	58	Kansas City	Kansas	10	2016	89750
14615	58	Kansas City	Kansas	11	2016	92225
14616	58	Kansas City	Kansas	12	2016	89500
14617	58	Kansas City	Kansas	1	2017	89500
14618	58	Kansas City	Kansas	2	2017	87000
14619	58	Kansas City	Kansas	3	2017	69900
14620	58	Kansas City	Kansas	4	2017	80950
14621	58	Kansas City	Kansas	5	2017	75000
14622	58	Kansas City	Kansas	6	2017	80000
14623	58	Kansas City	Kansas	7	2017	92200
14624	58	Kansas City	Kansas	8	2017	105000
14625	58	Kansas City	Kansas	9	2017	112475
14626	58	Kansas City	Kansas	10	2017	104500
14627	58	Kansas City	Kansas	11	2017	110000
14628	58	Kansas City	Kansas	12	2017	92500
14629	58	Kansas City	Kansas	1	2018	96500
14630	58	Kansas City	Kansas	2	2018	88750
14631	58	Kansas City	Kansas	3	2018	98000
14632	58	Kansas City	Kansas	4	2018	94750
14633	58	Kansas City	Kansas	5	2018	111000
14634	58	Kansas City	Kansas	6	2018	107000
14635	58	Kansas City	Kansas	7	2018	107000
14636	58	Kansas City	Kansas	8	2018	107000
14637	58	Kansas City	Kansas	9	2018	105000
14638	58	Kansas City	Kansas	10	2018	105000
14639	58	Kansas City	Kansas	11	2018	105000
14640	58	Kansas City	Kansas	12	2018	123500
14641	58	Kansas City	Kansas	1	2019	0
14642	60	Jefferson	Louisiana	1	2009	0
14643	60	Jefferson	Louisiana	2	2009	0
14644	60	Jefferson	Louisiana	3	2009	0
14645	60	Jefferson	Louisiana	4	2009	0
14646	60	Jefferson	Louisiana	5	2009	0
14647	60	Jefferson	Louisiana	6	2009	0
14648	60	Jefferson	Louisiana	7	2009	0
14649	60	Jefferson	Louisiana	8	2009	0
14650	60	Jefferson	Louisiana	9	2009	0
14651	60	Jefferson	Louisiana	10	2009	0
14652	60	Jefferson	Louisiana	11	2009	0
14653	60	Jefferson	Louisiana	12	2009	0
14654	60	Jefferson	Louisiana	1	2010	0
14655	60	Jefferson	Louisiana	2	2010	0
14656	60	Jefferson	Louisiana	3	2010	0
14657	60	Jefferson	Louisiana	4	2010	0
14658	60	Jefferson	Louisiana	5	2010	0
14659	60	Jefferson	Louisiana	6	2010	0
14660	60	Jefferson	Louisiana	7	2010	0
14661	60	Jefferson	Louisiana	8	2010	0
14662	60	Jefferson	Louisiana	9	2010	0
14663	60	Jefferson	Louisiana	10	2010	0
14664	60	Jefferson	Louisiana	11	2010	0
14665	60	Jefferson	Louisiana	12	2010	0
14666	60	Jefferson	Louisiana	1	2011	0
14667	60	Jefferson	Louisiana	2	2011	0
14668	60	Jefferson	Louisiana	3	2011	0
14669	60	Jefferson	Louisiana	4	2011	0
14670	60	Jefferson	Louisiana	5	2011	0
14671	60	Jefferson	Louisiana	6	2011	0
14672	60	Jefferson	Louisiana	7	2011	0
14673	60	Jefferson	Louisiana	8	2011	0
14674	60	Jefferson	Louisiana	9	2011	0
14675	60	Jefferson	Louisiana	10	2011	0
14676	60	Jefferson	Louisiana	11	2011	0
14677	60	Jefferson	Louisiana	12	2011	0
14678	60	Jefferson	Louisiana	1	2012	184500
14679	60	Jefferson	Louisiana	2	2012	182700
14680	60	Jefferson	Louisiana	3	2012	173650
14681	60	Jefferson	Louisiana	4	2012	182000
14682	60	Jefferson	Louisiana	5	2012	183900
14683	60	Jefferson	Louisiana	6	2012	190000
14684	60	Jefferson	Louisiana	7	2012	182500
14685	60	Jefferson	Louisiana	8	2012	179950
14686	60	Jefferson	Louisiana	9	2012	179250
14687	60	Jefferson	Louisiana	10	2012	182800
14688	60	Jefferson	Louisiana	11	2012	189800
14689	60	Jefferson	Louisiana	12	2012	189700
14690	60	Jefferson	Louisiana	1	2013	187000
14691	60	Jefferson	Louisiana	2	2013	181550
14692	60	Jefferson	Louisiana	3	2013	185000
14693	60	Jefferson	Louisiana	4	2013	180600
14694	60	Jefferson	Louisiana	5	2013	181800
14695	60	Jefferson	Louisiana	6	2013	179100
14696	60	Jefferson	Louisiana	7	2013	195450
14697	60	Jefferson	Louisiana	8	2013	200400
14698	60	Jefferson	Louisiana	9	2013	202450
14699	60	Jefferson	Louisiana	10	2013	197650
14700	60	Jefferson	Louisiana	11	2013	194600
14701	60	Jefferson	Louisiana	12	2013	203950
14702	60	Jefferson	Louisiana	1	2014	195000
14703	60	Jefferson	Louisiana	2	2014	188000
14704	60	Jefferson	Louisiana	3	2014	193000
14705	60	Jefferson	Louisiana	4	2014	192500
14706	60	Jefferson	Louisiana	5	2014	199900
14707	60	Jefferson	Louisiana	6	2014	193125
14708	60	Jefferson	Louisiana	7	2014	183450
14709	60	Jefferson	Louisiana	8	2014	179250
14710	60	Jefferson	Louisiana	9	2014	184000
14711	60	Jefferson	Louisiana	10	2014	206000
14712	60	Jefferson	Louisiana	11	2014	210000
14713	60	Jefferson	Louisiana	12	2014	197500
14714	60	Jefferson	Louisiana	1	2015	190000
14715	60	Jefferson	Louisiana	2	2015	190000
14716	60	Jefferson	Louisiana	3	2015	185000
14717	60	Jefferson	Louisiana	4	2015	202950
14718	60	Jefferson	Louisiana	5	2015	215000
14719	60	Jefferson	Louisiana	6	2015	215900
14720	60	Jefferson	Louisiana	7	2015	205250
14721	60	Jefferson	Louisiana	8	2015	202540
14722	60	Jefferson	Louisiana	9	2015	203000
14723	60	Jefferson	Louisiana	10	2015	205950
14724	60	Jefferson	Louisiana	11	2015	193500
14725	60	Jefferson	Louisiana	12	2015	195000
14726	60	Jefferson	Louisiana	1	2016	192000
14727	60	Jefferson	Louisiana	2	2016	195000
14728	60	Jefferson	Louisiana	3	2016	182500
14729	60	Jefferson	Louisiana	4	2016	190500
14730	60	Jefferson	Louisiana	5	2016	193950
14731	60	Jefferson	Louisiana	6	2016	203500
14732	60	Jefferson	Louisiana	7	2016	204500
14733	60	Jefferson	Louisiana	8	2016	209950
14734	60	Jefferson	Louisiana	9	2016	210000
14735	60	Jefferson	Louisiana	10	2016	211200
14736	60	Jefferson	Louisiana	11	2016	210000
14737	60	Jefferson	Louisiana	12	2016	206720
14738	60	Jefferson	Louisiana	1	2017	207110
14739	60	Jefferson	Louisiana	2	2017	202050
14740	60	Jefferson	Louisiana	3	2017	190000
14741	60	Jefferson	Louisiana	4	2017	195500
14742	60	Jefferson	Louisiana	5	2017	198000
14743	60	Jefferson	Louisiana	6	2017	214000
14744	60	Jefferson	Louisiana	7	2017	217000
14745	60	Jefferson	Louisiana	8	2017	221000
14746	60	Jefferson	Louisiana	9	2017	212750
14747	60	Jefferson	Louisiana	10	2017	207400
14748	60	Jefferson	Louisiana	11	2017	209900
14749	60	Jefferson	Louisiana	12	2017	211900
14750	60	Jefferson	Louisiana	1	2018	211900
14751	60	Jefferson	Louisiana	2	2018	214950
14752	60	Jefferson	Louisiana	3	2018	212505
14753	60	Jefferson	Louisiana	4	2018	219850
14754	60	Jefferson	Louisiana	5	2018	215505
14755	60	Jefferson	Louisiana	6	2018	215505
14756	60	Jefferson	Louisiana	7	2018	217150
14757	60	Jefferson	Louisiana	8	2018	214950
14758	60	Jefferson	Louisiana	9	2018	215085
14759	60	Jefferson	Louisiana	10	2018	210500
14760	60	Jefferson	Louisiana	11	2018	214783
14761	60	Jefferson	Louisiana	12	2018	219368
14762	60	Jefferson	Louisiana	1	2019	0
14763	61	New Orleans	Louisiana	1	2009	0
14764	61	New Orleans	Louisiana	2	2009	0
14765	61	New Orleans	Louisiana	3	2009	0
14766	61	New Orleans	Louisiana	4	2009	0
14767	61	New Orleans	Louisiana	5	2009	0
14768	61	New Orleans	Louisiana	6	2009	0
14769	61	New Orleans	Louisiana	7	2009	0
14770	61	New Orleans	Louisiana	8	2009	0
14771	61	New Orleans	Louisiana	9	2009	0
14772	61	New Orleans	Louisiana	10	2009	0
14773	61	New Orleans	Louisiana	11	2009	0
14774	61	New Orleans	Louisiana	12	2009	0
14775	61	New Orleans	Louisiana	1	2010	0
14776	61	New Orleans	Louisiana	2	2010	0
14777	61	New Orleans	Louisiana	3	2010	0
14778	61	New Orleans	Louisiana	4	2010	0
14779	61	New Orleans	Louisiana	5	2010	0
14780	61	New Orleans	Louisiana	6	2010	0
14781	61	New Orleans	Louisiana	7	2010	0
14782	61	New Orleans	Louisiana	8	2010	0
14783	61	New Orleans	Louisiana	9	2010	0
14784	61	New Orleans	Louisiana	10	2010	0
14785	61	New Orleans	Louisiana	11	2010	0
14786	61	New Orleans	Louisiana	12	2010	0
14787	61	New Orleans	Louisiana	1	2011	154000
14788	61	New Orleans	Louisiana	2	2011	150000
14789	61	New Orleans	Louisiana	3	2011	150000
14790	61	New Orleans	Louisiana	4	2011	153500
14791	61	New Orleans	Louisiana	5	2011	164700
14792	61	New Orleans	Louisiana	6	2011	171100
14793	61	New Orleans	Louisiana	7	2011	165000
14794	61	New Orleans	Louisiana	8	2011	152000
14795	61	New Orleans	Louisiana	9	2011	158000
14796	61	New Orleans	Louisiana	10	2011	153250
14797	61	New Orleans	Louisiana	11	2011	154250
14798	61	New Orleans	Louisiana	12	2011	150000
14799	61	New Orleans	Louisiana	1	2012	140000
14800	61	New Orleans	Louisiana	2	2012	143900
14801	61	New Orleans	Louisiana	3	2012	149500
14802	61	New Orleans	Louisiana	4	2012	160700
14803	61	New Orleans	Louisiana	5	2012	160000
14804	61	New Orleans	Louisiana	6	2012	169000
14805	61	New Orleans	Louisiana	7	2012	164000
14806	61	New Orleans	Louisiana	8	2012	165000
14807	61	New Orleans	Louisiana	9	2012	162000
14808	61	New Orleans	Louisiana	10	2012	154900
14809	61	New Orleans	Louisiana	11	2012	155150
14810	61	New Orleans	Louisiana	12	2012	165000
14811	61	New Orleans	Louisiana	1	2013	159950
14812	61	New Orleans	Louisiana	2	2013	154000
14813	61	New Orleans	Louisiana	3	2013	156000
14814	61	New Orleans	Louisiana	4	2013	172500
14815	61	New Orleans	Louisiana	5	2013	179900
14816	61	New Orleans	Louisiana	6	2013	180000
14817	61	New Orleans	Louisiana	7	2013	177500
14818	61	New Orleans	Louisiana	8	2013	170000
14819	61	New Orleans	Louisiana	9	2013	160000
14820	61	New Orleans	Louisiana	10	2013	165000
14821	61	New Orleans	Louisiana	11	2013	165000
14822	61	New Orleans	Louisiana	12	2013	165000
14823	61	New Orleans	Louisiana	1	2014	163000
14824	61	New Orleans	Louisiana	2	2014	159000
14825	61	New Orleans	Louisiana	3	2014	168000
14826	61	New Orleans	Louisiana	4	2014	165000
14827	61	New Orleans	Louisiana	5	2014	175000
14828	61	New Orleans	Louisiana	6	2014	185000
14829	61	New Orleans	Louisiana	7	2014	181450
14830	61	New Orleans	Louisiana	8	2014	174000
14831	61	New Orleans	Louisiana	9	2014	169000
14832	61	New Orleans	Louisiana	10	2014	165000
14833	61	New Orleans	Louisiana	11	2014	172500
14834	61	New Orleans	Louisiana	12	2014	176000
14835	61	New Orleans	Louisiana	1	2015	160301
14836	61	New Orleans	Louisiana	2	2015	169900
14837	61	New Orleans	Louisiana	3	2015	172900
14838	61	New Orleans	Louisiana	4	2015	175000
14839	61	New Orleans	Louisiana	5	2015	188000
14840	61	New Orleans	Louisiana	6	2015	189900
14841	61	New Orleans	Louisiana	7	2015	187000
14842	61	New Orleans	Louisiana	8	2015	178000
14843	61	New Orleans	Louisiana	9	2015	180000
14844	61	New Orleans	Louisiana	10	2015	175000
14845	61	New Orleans	Louisiana	11	2015	181750
14846	61	New Orleans	Louisiana	12	2015	187000
14847	61	New Orleans	Louisiana	1	2016	170500
14848	61	New Orleans	Louisiana	2	2016	172750
14849	61	New Orleans	Louisiana	3	2016	180000
14850	61	New Orleans	Louisiana	4	2016	180000
14851	61	New Orleans	Louisiana	5	2016	200000
14852	61	New Orleans	Louisiana	6	2016	200000
14853	61	New Orleans	Louisiana	7	2016	195900
14854	61	New Orleans	Louisiana	8	2016	186000
14855	61	New Orleans	Louisiana	9	2016	184201
14856	61	New Orleans	Louisiana	10	2016	181250
14857	61	New Orleans	Louisiana	11	2016	192500
14858	61	New Orleans	Louisiana	12	2016	185000
14859	61	New Orleans	Louisiana	1	2017	180000
14860	61	New Orleans	Louisiana	2	2017	175000
14861	61	New Orleans	Louisiana	3	2017	195000
14862	61	New Orleans	Louisiana	4	2017	191000
14863	61	New Orleans	Louisiana	5	2017	205000
14864	61	New Orleans	Louisiana	6	2017	210000
14865	61	New Orleans	Louisiana	7	2017	222500
14866	61	New Orleans	Louisiana	8	2017	200000
14867	61	New Orleans	Louisiana	9	2017	192000
14868	61	New Orleans	Louisiana	10	2017	200000
14869	61	New Orleans	Louisiana	11	2017	195500
14870	61	New Orleans	Louisiana	12	2017	209000
14871	61	New Orleans	Louisiana	1	2018	191250
14872	61	New Orleans	Louisiana	2	2018	195000
14873	61	New Orleans	Louisiana	3	2018	200000
14874	61	New Orleans	Louisiana	4	2018	214450
14875	61	New Orleans	Louisiana	5	2018	215000
14876	61	New Orleans	Louisiana	6	2018	222600
14877	61	New Orleans	Louisiana	7	2018	222000
14878	61	New Orleans	Louisiana	8	2018	219900
14879	61	New Orleans	Louisiana	9	2018	207000
14880	61	New Orleans	Louisiana	10	2018	203250
14881	61	New Orleans	Louisiana	11	2018	210000
14882	61	New Orleans	Louisiana	12	2018	214450
14883	61	New Orleans	Louisiana	1	2019	0
14884	62	Annapolis	Maryland	1	2009	0
14885	62	Annapolis	Maryland	2	2009	0
14886	62	Annapolis	Maryland	3	2009	0
14887	62	Annapolis	Maryland	4	2009	0
14888	62	Annapolis	Maryland	5	2009	0
14889	62	Annapolis	Maryland	6	2009	0
14890	62	Annapolis	Maryland	7	2009	0
14891	62	Annapolis	Maryland	8	2009	0
14892	62	Annapolis	Maryland	9	2009	0
14893	62	Annapolis	Maryland	10	2009	0
14894	62	Annapolis	Maryland	11	2009	0
14895	62	Annapolis	Maryland	12	2009	0
14896	62	Annapolis	Maryland	1	2010	0
14897	62	Annapolis	Maryland	2	2010	0
14898	62	Annapolis	Maryland	3	2010	0
14899	62	Annapolis	Maryland	4	2010	0
14900	62	Annapolis	Maryland	5	2010	0
14901	62	Annapolis	Maryland	6	2010	0
14902	62	Annapolis	Maryland	7	2010	0
14903	62	Annapolis	Maryland	8	2010	0
14904	62	Annapolis	Maryland	9	2010	0
14905	62	Annapolis	Maryland	10	2010	0
14906	62	Annapolis	Maryland	11	2010	0
14907	62	Annapolis	Maryland	12	2010	0
14908	62	Annapolis	Maryland	1	2011	0
14909	62	Annapolis	Maryland	2	2011	0
14910	62	Annapolis	Maryland	3	2011	0
14911	62	Annapolis	Maryland	4	2011	0
14912	62	Annapolis	Maryland	5	2011	0
14913	62	Annapolis	Maryland	6	2011	0
14914	62	Annapolis	Maryland	7	2011	0
14915	62	Annapolis	Maryland	8	2011	0
14916	62	Annapolis	Maryland	9	2011	0
14917	62	Annapolis	Maryland	10	2011	0
14918	62	Annapolis	Maryland	11	2011	0
14919	62	Annapolis	Maryland	12	2011	0
14920	62	Annapolis	Maryland	1	2012	366500
14921	62	Annapolis	Maryland	2	2012	345000
14922	62	Annapolis	Maryland	3	2012	331593
14923	62	Annapolis	Maryland	4	2012	345500
14924	62	Annapolis	Maryland	5	2012	374950
14925	62	Annapolis	Maryland	6	2012	370000
14926	62	Annapolis	Maryland	7	2012	395000
14927	62	Annapolis	Maryland	8	2012	355000
14928	62	Annapolis	Maryland	9	2012	397500
14929	62	Annapolis	Maryland	10	2012	336000
14930	62	Annapolis	Maryland	11	2012	360200
14931	62	Annapolis	Maryland	12	2012	350000
14932	62	Annapolis	Maryland	1	2013	349000
14933	62	Annapolis	Maryland	2	2013	321500
14934	62	Annapolis	Maryland	3	2013	335000
14935	62	Annapolis	Maryland	4	2013	404000
14936	62	Annapolis	Maryland	5	2013	362000
14937	62	Annapolis	Maryland	6	2013	404000
14938	62	Annapolis	Maryland	7	2013	399500
14939	62	Annapolis	Maryland	8	2013	388500
14940	62	Annapolis	Maryland	9	2013	389900
14941	62	Annapolis	Maryland	10	2013	365000
14942	62	Annapolis	Maryland	11	2013	410000
14943	62	Annapolis	Maryland	12	2013	370000
14944	62	Annapolis	Maryland	1	2014	379950
14945	62	Annapolis	Maryland	2	2014	392000
14946	62	Annapolis	Maryland	3	2014	330000
14947	62	Annapolis	Maryland	4	2014	355000
14948	62	Annapolis	Maryland	5	2014	385000
14949	62	Annapolis	Maryland	6	2014	418000
14950	62	Annapolis	Maryland	7	2014	387750
14951	62	Annapolis	Maryland	8	2014	400000
14952	62	Annapolis	Maryland	9	2014	351750
14953	62	Annapolis	Maryland	10	2014	380000
14954	62	Annapolis	Maryland	11	2014	362500
14955	62	Annapolis	Maryland	12	2014	390000
14956	62	Annapolis	Maryland	1	2015	382000
14957	62	Annapolis	Maryland	2	2015	360000
14958	62	Annapolis	Maryland	3	2015	328100
14959	62	Annapolis	Maryland	4	2015	349200
14960	62	Annapolis	Maryland	5	2015	360000
14961	62	Annapolis	Maryland	6	2015	400000
14962	62	Annapolis	Maryland	7	2015	353000
14963	62	Annapolis	Maryland	8	2015	399450
14964	62	Annapolis	Maryland	9	2015	368000
14965	62	Annapolis	Maryland	10	2015	362900
14966	62	Annapolis	Maryland	11	2015	367500
14967	62	Annapolis	Maryland	12	2015	399950
14968	62	Annapolis	Maryland	1	2016	349000
14969	62	Annapolis	Maryland	2	2016	364450
14970	62	Annapolis	Maryland	3	2016	345000
14971	62	Annapolis	Maryland	4	2016	412450
14972	62	Annapolis	Maryland	5	2016	386300
14973	62	Annapolis	Maryland	6	2016	383125
14974	62	Annapolis	Maryland	7	2016	395000
14975	62	Annapolis	Maryland	8	2016	415000
14976	62	Annapolis	Maryland	9	2016	380500
14977	62	Annapolis	Maryland	10	2016	375000
14978	62	Annapolis	Maryland	11	2016	397250
14979	62	Annapolis	Maryland	12	2016	412000
14980	62	Annapolis	Maryland	1	2017	373500
14981	62	Annapolis	Maryland	2	2017	374950
14982	62	Annapolis	Maryland	3	2017	402500
14983	62	Annapolis	Maryland	4	2017	410000
14984	62	Annapolis	Maryland	5	2017	415000
14985	62	Annapolis	Maryland	6	2017	412500
14986	62	Annapolis	Maryland	7	2017	425000
14987	62	Annapolis	Maryland	8	2017	410000
14988	62	Annapolis	Maryland	9	2017	359900
14989	62	Annapolis	Maryland	10	2017	430000
14990	62	Annapolis	Maryland	11	2017	410000
14991	62	Annapolis	Maryland	12	2017	420000
14992	62	Annapolis	Maryland	1	2018	391150
14993	62	Annapolis	Maryland	2	2018	375000
14994	62	Annapolis	Maryland	3	2018	438850
14995	62	Annapolis	Maryland	4	2018	472000
14996	62	Annapolis	Maryland	5	2018	402500
14997	62	Annapolis	Maryland	6	2018	410000
14998	62	Annapolis	Maryland	7	2018	405000
14999	62	Annapolis	Maryland	8	2018	455000
15000	62	Annapolis	Maryland	9	2018	407450
15001	62	Annapolis	Maryland	10	2018	413500
15002	62	Annapolis	Maryland	11	2018	431000
15003	62	Annapolis	Maryland	12	2018	436450
15004	62	Annapolis	Maryland	1	2019	0
15005	64	Columbia	Maryland	1	2009	0
15006	64	Columbia	Maryland	2	2009	0
15007	64	Columbia	Maryland	3	2009	0
15008	64	Columbia	Maryland	4	2009	0
15009	64	Columbia	Maryland	5	2009	0
15010	64	Columbia	Maryland	6	2009	0
15011	64	Columbia	Maryland	7	2009	0
15012	64	Columbia	Maryland	8	2009	0
15013	64	Columbia	Maryland	9	2009	0
15014	64	Columbia	Maryland	10	2009	0
15015	64	Columbia	Maryland	11	2009	0
15016	64	Columbia	Maryland	12	2009	0
15017	64	Columbia	Maryland	1	2010	0
15018	64	Columbia	Maryland	2	2010	0
15019	64	Columbia	Maryland	3	2010	0
15020	64	Columbia	Maryland	4	2010	0
15021	64	Columbia	Maryland	5	2010	0
15022	64	Columbia	Maryland	6	2010	0
15023	64	Columbia	Maryland	7	2010	0
15024	64	Columbia	Maryland	8	2010	0
15025	64	Columbia	Maryland	9	2010	0
15026	64	Columbia	Maryland	10	2010	0
15027	64	Columbia	Maryland	11	2010	0
15028	64	Columbia	Maryland	12	2010	0
15029	64	Columbia	Maryland	1	2011	0
15030	64	Columbia	Maryland	2	2011	0
15031	64	Columbia	Maryland	3	2011	0
15032	64	Columbia	Maryland	4	2011	0
15033	64	Columbia	Maryland	5	2011	0
15034	64	Columbia	Maryland	6	2011	0
15035	64	Columbia	Maryland	7	2011	0
15036	64	Columbia	Maryland	8	2011	0
15037	64	Columbia	Maryland	9	2011	0
15038	64	Columbia	Maryland	10	2011	0
15039	64	Columbia	Maryland	11	2011	0
15040	64	Columbia	Maryland	12	2011	0
15041	64	Columbia	Maryland	1	2012	280000
15042	64	Columbia	Maryland	2	2012	293000
15043	64	Columbia	Maryland	3	2012	300000
15044	64	Columbia	Maryland	4	2012	266000
15045	64	Columbia	Maryland	5	2012	308000
15046	64	Columbia	Maryland	6	2012	326450
15047	64	Columbia	Maryland	7	2012	350000
15048	64	Columbia	Maryland	8	2012	320000
15049	64	Columbia	Maryland	9	2012	325000
15050	64	Columbia	Maryland	10	2012	268650
15051	64	Columbia	Maryland	11	2012	327000
15052	64	Columbia	Maryland	12	2012	299000
15053	64	Columbia	Maryland	1	2013	292000
15054	64	Columbia	Maryland	2	2013	295000
15055	64	Columbia	Maryland	3	2013	297500
15056	64	Columbia	Maryland	4	2013	297500
15057	64	Columbia	Maryland	5	2013	317950
15058	64	Columbia	Maryland	6	2013	311900
15059	64	Columbia	Maryland	7	2013	340500
15060	64	Columbia	Maryland	8	2013	335000
15061	64	Columbia	Maryland	9	2013	315000
15062	64	Columbia	Maryland	10	2013	320000
15063	64	Columbia	Maryland	11	2013	329250
15064	64	Columbia	Maryland	12	2013	299000
15065	64	Columbia	Maryland	1	2014	325000
15066	64	Columbia	Maryland	2	2014	270000
15067	64	Columbia	Maryland	3	2014	315000
15068	64	Columbia	Maryland	4	2014	340000
15069	64	Columbia	Maryland	5	2014	315000
15070	64	Columbia	Maryland	6	2014	321250
15071	64	Columbia	Maryland	7	2014	328000
15072	64	Columbia	Maryland	8	2014	330000
15073	64	Columbia	Maryland	9	2014	317500
15074	64	Columbia	Maryland	10	2014	299000
15075	64	Columbia	Maryland	11	2014	312000
15076	64	Columbia	Maryland	12	2014	319500
15077	64	Columbia	Maryland	1	2015	301000
15078	64	Columbia	Maryland	2	2015	302000
15079	64	Columbia	Maryland	3	2015	296500
15080	64	Columbia	Maryland	4	2015	295000
15081	64	Columbia	Maryland	5	2015	320000
15082	64	Columbia	Maryland	6	2015	322092
15083	64	Columbia	Maryland	7	2015	365000
15084	64	Columbia	Maryland	8	2015	325000
15085	64	Columbia	Maryland	9	2015	325000
15086	64	Columbia	Maryland	10	2015	320000
15087	64	Columbia	Maryland	11	2015	320000
15088	64	Columbia	Maryland	12	2015	305000
15089	64	Columbia	Maryland	1	2016	290000
15090	64	Columbia	Maryland	2	2016	300000
15091	64	Columbia	Maryland	3	2016	289000
15092	64	Columbia	Maryland	4	2016	315000
15093	64	Columbia	Maryland	5	2016	313000
15094	64	Columbia	Maryland	6	2016	335000
15095	64	Columbia	Maryland	7	2016	350000
15096	64	Columbia	Maryland	8	2016	319500
15097	64	Columbia	Maryland	9	2016	316750
15098	64	Columbia	Maryland	10	2016	315000
15099	64	Columbia	Maryland	11	2016	320000
15100	64	Columbia	Maryland	12	2016	308300
15101	64	Columbia	Maryland	1	2017	301250
15102	64	Columbia	Maryland	2	2017	315000
15103	64	Columbia	Maryland	3	2017	327500
15104	64	Columbia	Maryland	4	2017	315000
15105	64	Columbia	Maryland	5	2017	350000
15106	64	Columbia	Maryland	6	2017	345000
15107	64	Columbia	Maryland	7	2017	325000
15108	64	Columbia	Maryland	8	2017	346500
15109	64	Columbia	Maryland	9	2017	330400
15110	64	Columbia	Maryland	10	2017	320000
15111	64	Columbia	Maryland	11	2017	335000
15112	64	Columbia	Maryland	12	2017	320000
15113	64	Columbia	Maryland	1	2018	309250
15114	64	Columbia	Maryland	2	2018	315000
15115	64	Columbia	Maryland	3	2018	317500
15116	64	Columbia	Maryland	4	2018	318000
15117	64	Columbia	Maryland	5	2018	322000
15118	64	Columbia	Maryland	6	2018	360000
15119	64	Columbia	Maryland	7	2018	340000
15120	64	Columbia	Maryland	8	2018	355000
15121	64	Columbia	Maryland	9	2018	347450
15122	64	Columbia	Maryland	10	2018	345000
15123	64	Columbia	Maryland	11	2018	325000
15124	64	Columbia	Maryland	12	2018	332500
15125	64	Columbia	Maryland	1	2019	0
15126	66	Burlington	Massachusetts	1	2009	0
15127	66	Burlington	Massachusetts	2	2009	0
15128	66	Burlington	Massachusetts	3	2009	0
15129	66	Burlington	Massachusetts	4	2009	0
15130	66	Burlington	Massachusetts	5	2009	0
15131	66	Burlington	Massachusetts	6	2009	0
15132	66	Burlington	Massachusetts	7	2009	0
15133	66	Burlington	Massachusetts	8	2009	0
15134	66	Burlington	Massachusetts	9	2009	0
15135	66	Burlington	Massachusetts	10	2009	0
15136	66	Burlington	Massachusetts	11	2009	0
15137	66	Burlington	Massachusetts	12	2009	0
15138	66	Burlington	Massachusetts	1	2010	0
15139	66	Burlington	Massachusetts	2	2010	0
15140	66	Burlington	Massachusetts	3	2010	0
15141	66	Burlington	Massachusetts	4	2010	0
15142	66	Burlington	Massachusetts	5	2010	0
15143	66	Burlington	Massachusetts	6	2010	0
15144	66	Burlington	Massachusetts	7	2010	0
15145	66	Burlington	Massachusetts	8	2010	0
15146	66	Burlington	Massachusetts	9	2010	0
15147	66	Burlington	Massachusetts	10	2010	0
15148	66	Burlington	Massachusetts	11	2010	0
15149	66	Burlington	Massachusetts	12	2010	0
15150	66	Burlington	Massachusetts	1	2011	0
15151	66	Burlington	Massachusetts	2	2011	0
15152	66	Burlington	Massachusetts	3	2011	0
15153	66	Burlington	Massachusetts	4	2011	0
15154	66	Burlington	Massachusetts	5	2011	0
15155	66	Burlington	Massachusetts	6	2011	0
15156	66	Burlington	Massachusetts	7	2011	0
15157	66	Burlington	Massachusetts	8	2011	0
15158	66	Burlington	Massachusetts	9	2011	0
15159	66	Burlington	Massachusetts	10	2011	0
15160	66	Burlington	Massachusetts	11	2011	0
15161	66	Burlington	Massachusetts	12	2011	0
15162	66	Burlington	Massachusetts	1	2012	399750
15163	66	Burlington	Massachusetts	2	2012	422000
15164	66	Burlington	Massachusetts	3	2012	372500
15165	66	Burlington	Massachusetts	4	2012	354950
15166	66	Burlington	Massachusetts	5	2012	345000
15167	66	Burlington	Massachusetts	6	2012	376450
15168	66	Burlington	Massachusetts	7	2012	370000
15169	66	Burlington	Massachusetts	8	2012	392500
15170	66	Burlington	Massachusetts	9	2012	401250
15171	66	Burlington	Massachusetts	10	2012	390000
15172	66	Burlington	Massachusetts	11	2012	415000
15173	66	Burlington	Massachusetts	12	2012	358000
15174	66	Burlington	Massachusetts	1	2013	419000
15175	66	Burlington	Massachusetts	2	2013	394000
15176	66	Burlington	Massachusetts	3	2013	412000
15177	66	Burlington	Massachusetts	4	2013	582450
15178	66	Burlington	Massachusetts	5	2013	435000
15179	66	Burlington	Massachusetts	6	2013	425250
15180	66	Burlington	Massachusetts	7	2013	388500
15181	66	Burlington	Massachusetts	8	2013	427000
15182	66	Burlington	Massachusetts	9	2013	461250
15183	66	Burlington	Massachusetts	10	2013	470500
15184	66	Burlington	Massachusetts	11	2013	378500
15185	66	Burlington	Massachusetts	12	2013	400000
15186	66	Burlington	Massachusetts	1	2014	410550
15187	66	Burlington	Massachusetts	2	2014	392500
15188	66	Burlington	Massachusetts	3	2014	505000
15189	66	Burlington	Massachusetts	4	2014	437500
15190	66	Burlington	Massachusetts	5	2014	530000
15191	66	Burlington	Massachusetts	6	2014	452000
15192	66	Burlington	Massachusetts	7	2014	492000
15193	66	Burlington	Massachusetts	8	2014	460000
15194	66	Burlington	Massachusetts	9	2014	460200
15195	66	Burlington	Massachusetts	10	2014	405000
15196	66	Burlington	Massachusetts	11	2014	499500
15197	66	Burlington	Massachusetts	12	2014	382500
15198	66	Burlington	Massachusetts	1	2015	366000
15199	66	Burlington	Massachusetts	2	2015	326250
15200	66	Burlington	Massachusetts	3	2015	330000
15201	66	Burlington	Massachusetts	4	2015	434000
15202	66	Burlington	Massachusetts	5	2015	474500
15203	66	Burlington	Massachusetts	6	2015	495600
15204	66	Burlington	Massachusetts	7	2015	457500
15205	66	Burlington	Massachusetts	8	2015	444500
15206	66	Burlington	Massachusetts	9	2015	439950
15207	66	Burlington	Massachusetts	10	2015	455470
15208	66	Burlington	Massachusetts	11	2015	430000
15209	66	Burlington	Massachusetts	12	2015	412500
15210	66	Burlington	Massachusetts	1	2016	460000
15211	66	Burlington	Massachusetts	2	2016	360750
15212	66	Burlington	Massachusetts	3	2016	408500
15213	66	Burlington	Massachusetts	4	2016	466700
15214	66	Burlington	Massachusetts	5	2016	452500
15215	66	Burlington	Massachusetts	6	2016	475000
15216	66	Burlington	Massachusetts	7	2016	450000
15217	66	Burlington	Massachusetts	8	2016	455000
15218	66	Burlington	Massachusetts	9	2016	452250
15219	66	Burlington	Massachusetts	10	2016	468200
15220	66	Burlington	Massachusetts	11	2016	472000
15221	66	Burlington	Massachusetts	12	2016	430000
15222	66	Burlington	Massachusetts	1	2017	470000
15223	66	Burlington	Massachusetts	2	2017	515000
15224	66	Burlington	Massachusetts	3	2017	472900
15225	66	Burlington	Massachusetts	4	2017	585000
15226	66	Burlington	Massachusetts	5	2017	505000
15227	66	Burlington	Massachusetts	6	2017	510000
15228	66	Burlington	Massachusetts	7	2017	474500
15229	66	Burlington	Massachusetts	8	2017	495000
15230	66	Burlington	Massachusetts	9	2017	498100
15231	66	Burlington	Massachusetts	10	2017	535500
15232	66	Burlington	Massachusetts	11	2017	527500
15233	66	Burlington	Massachusetts	12	2017	497500
15234	66	Burlington	Massachusetts	1	2018	452100
15235	66	Burlington	Massachusetts	2	2018	421497
15236	66	Burlington	Massachusetts	3	2018	480000
15237	66	Burlington	Massachusetts	4	2018	480000
15238	66	Burlington	Massachusetts	5	2018	495000
15239	66	Burlington	Massachusetts	6	2018	540000
15240	66	Burlington	Massachusetts	7	2018	523500
15241	66	Burlington	Massachusetts	8	2018	510000
15242	66	Burlington	Massachusetts	9	2018	618000
15243	66	Burlington	Massachusetts	10	2018	489000
15244	66	Burlington	Massachusetts	11	2018	504500
15245	66	Burlington	Massachusetts	12	2018	439000
15246	66	Burlington	Massachusetts	1	2019	0
15247	67	Concord	Massachusetts	1	2009	0
15248	67	Concord	Massachusetts	2	2009	0
15249	67	Concord	Massachusetts	3	2009	0
15250	67	Concord	Massachusetts	4	2009	0
15251	67	Concord	Massachusetts	5	2009	0
15252	67	Concord	Massachusetts	6	2009	0
15253	67	Concord	Massachusetts	7	2009	0
15254	67	Concord	Massachusetts	8	2009	0
15255	67	Concord	Massachusetts	9	2009	0
15256	67	Concord	Massachusetts	10	2009	0
15257	67	Concord	Massachusetts	11	2009	0
15258	67	Concord	Massachusetts	12	2009	0
15259	67	Concord	Massachusetts	1	2010	0
15260	67	Concord	Massachusetts	2	2010	0
15261	67	Concord	Massachusetts	3	2010	0
15262	67	Concord	Massachusetts	4	2010	0
15263	67	Concord	Massachusetts	5	2010	0
15264	67	Concord	Massachusetts	6	2010	0
15265	67	Concord	Massachusetts	7	2010	0
15266	67	Concord	Massachusetts	8	2010	0
15267	67	Concord	Massachusetts	9	2010	0
15268	67	Concord	Massachusetts	10	2010	0
15269	67	Concord	Massachusetts	11	2010	0
15270	67	Concord	Massachusetts	12	2010	0
15271	67	Concord	Massachusetts	1	2011	0
15272	67	Concord	Massachusetts	2	2011	0
15273	67	Concord	Massachusetts	3	2011	0
15274	67	Concord	Massachusetts	4	2011	0
15275	67	Concord	Massachusetts	5	2011	0
15276	67	Concord	Massachusetts	6	2011	0
15277	67	Concord	Massachusetts	7	2011	0
15278	67	Concord	Massachusetts	8	2011	0
15279	67	Concord	Massachusetts	9	2011	0
15280	67	Concord	Massachusetts	10	2011	0
15281	67	Concord	Massachusetts	11	2011	0
15282	67	Concord	Massachusetts	12	2011	0
15283	67	Concord	Massachusetts	1	2012	611035
15284	67	Concord	Massachusetts	2	2012	500500
15285	67	Concord	Massachusetts	3	2012	427450
15286	67	Concord	Massachusetts	4	2012	424900
15287	67	Concord	Massachusetts	5	2012	497025
15288	67	Concord	Massachusetts	6	2012	545000
15289	67	Concord	Massachusetts	7	2012	570500
15290	67	Concord	Massachusetts	8	2012	576300
15291	67	Concord	Massachusetts	9	2012	611350
15292	67	Concord	Massachusetts	10	2012	611350
15293	67	Concord	Massachusetts	11	2012	499000
15294	67	Concord	Massachusetts	12	2012	520000
15295	67	Concord	Massachusetts	1	2013	500000
15296	67	Concord	Massachusetts	2	2013	500000
15297	67	Concord	Massachusetts	3	2013	363000
15298	67	Concord	Massachusetts	4	2013	564000
15299	67	Concord	Massachusetts	5	2013	668000
15300	67	Concord	Massachusetts	6	2013	699000
15301	67	Concord	Massachusetts	7	2013	628000
15302	67	Concord	Massachusetts	8	2013	559000
15303	67	Concord	Massachusetts	9	2013	502500
15304	67	Concord	Massachusetts	10	2013	457000
15305	67	Concord	Massachusetts	11	2013	459000
15306	67	Concord	Massachusetts	12	2013	491500
15307	67	Concord	Massachusetts	1	2014	547500
15308	67	Concord	Massachusetts	2	2014	560000
15309	67	Concord	Massachusetts	3	2014	517500
15310	67	Concord	Massachusetts	4	2014	366250
15311	67	Concord	Massachusetts	5	2014	575750
15312	67	Concord	Massachusetts	6	2014	618750
15313	67	Concord	Massachusetts	7	2014	695000
15314	67	Concord	Massachusetts	8	2014	720000
15315	67	Concord	Massachusetts	9	2014	746000
15316	67	Concord	Massachusetts	10	2014	523000
15317	67	Concord	Massachusetts	11	2014	545000
15318	67	Concord	Massachusetts	12	2014	562500
15319	67	Concord	Massachusetts	1	2015	707000
15320	67	Concord	Massachusetts	2	2015	516500
15321	67	Concord	Massachusetts	3	2015	494000
15322	67	Concord	Massachusetts	4	2015	704000
15323	67	Concord	Massachusetts	5	2015	739900
15324	67	Concord	Massachusetts	6	2015	721950
15325	67	Concord	Massachusetts	7	2015	749000
15326	67	Concord	Massachusetts	8	2015	725000
15327	67	Concord	Massachusetts	9	2015	735000
15328	67	Concord	Massachusetts	10	2015	594000
15329	67	Concord	Massachusetts	11	2015	562500
15330	67	Concord	Massachusetts	12	2015	580000
15331	67	Concord	Massachusetts	1	2016	672200
15332	67	Concord	Massachusetts	2	2016	644500
15333	67	Concord	Massachusetts	3	2016	630000
15334	67	Concord	Massachusetts	4	2016	641000
15335	67	Concord	Massachusetts	5	2016	675000
15336	67	Concord	Massachusetts	6	2016	741500
15337	67	Concord	Massachusetts	7	2016	605000
15338	67	Concord	Massachusetts	8	2016	631500
15339	67	Concord	Massachusetts	9	2016	545000
15340	67	Concord	Massachusetts	10	2016	602000
15341	67	Concord	Massachusetts	11	2016	540000
15342	67	Concord	Massachusetts	12	2016	526000
15343	67	Concord	Massachusetts	1	2017	509500
15344	67	Concord	Massachusetts	2	2017	517000
15345	67	Concord	Massachusetts	3	2017	499000
15346	67	Concord	Massachusetts	4	2017	779250
15347	67	Concord	Massachusetts	5	2017	779250
15348	67	Concord	Massachusetts	6	2017	766250
15349	67	Concord	Massachusetts	7	2017	762625
15350	67	Concord	Massachusetts	8	2017	773125
15351	67	Concord	Massachusetts	9	2017	760000
15352	67	Concord	Massachusetts	10	2017	715000
15353	67	Concord	Massachusetts	11	2017	620000
15354	67	Concord	Massachusetts	12	2017	640000
15355	67	Concord	Massachusetts	1	2018	632500
15356	67	Concord	Massachusetts	2	2018	625000
15357	67	Concord	Massachusetts	3	2018	638000
15358	67	Concord	Massachusetts	4	2018	749000
15359	67	Concord	Massachusetts	5	2018	767000
15360	67	Concord	Massachusetts	6	2018	745000
15361	67	Concord	Massachusetts	7	2018	650500
15362	67	Concord	Massachusetts	8	2018	694500
15363	67	Concord	Massachusetts	9	2018	709000
15364	67	Concord	Massachusetts	10	2018	749900
15365	67	Concord	Massachusetts	11	2018	600000
15366	67	Concord	Massachusetts	12	2018	650000
15367	67	Concord	Massachusetts	1	2019	0
15368	68	Manchester	Massachusetts	1	2009	0
15369	68	Manchester	Massachusetts	2	2009	0
15370	68	Manchester	Massachusetts	3	2009	0
15371	68	Manchester	Massachusetts	4	2009	0
15372	68	Manchester	Massachusetts	5	2009	0
15373	68	Manchester	Massachusetts	6	2009	0
15374	68	Manchester	Massachusetts	7	2009	0
15375	68	Manchester	Massachusetts	8	2009	0
15376	68	Manchester	Massachusetts	9	2009	0
15377	68	Manchester	Massachusetts	10	2009	0
15378	68	Manchester	Massachusetts	11	2009	0
15379	68	Manchester	Massachusetts	12	2009	0
15380	68	Manchester	Massachusetts	1	2010	0
15381	68	Manchester	Massachusetts	2	2010	0
15382	68	Manchester	Massachusetts	3	2010	0
15383	68	Manchester	Massachusetts	4	2010	0
15384	68	Manchester	Massachusetts	5	2010	0
15385	68	Manchester	Massachusetts	6	2010	0
15386	68	Manchester	Massachusetts	7	2010	0
15387	68	Manchester	Massachusetts	8	2010	0
15388	68	Manchester	Massachusetts	9	2010	0
15389	68	Manchester	Massachusetts	10	2010	0
15390	68	Manchester	Massachusetts	11	2010	0
15391	68	Manchester	Massachusetts	12	2010	0
15392	68	Manchester	Massachusetts	1	2011	0
15393	68	Manchester	Massachusetts	2	2011	0
15394	68	Manchester	Massachusetts	3	2011	0
15395	68	Manchester	Massachusetts	4	2011	0
15396	68	Manchester	Massachusetts	5	2011	0
15397	68	Manchester	Massachusetts	6	2011	0
15398	68	Manchester	Massachusetts	7	2011	0
15399	68	Manchester	Massachusetts	8	2011	0
15400	68	Manchester	Massachusetts	9	2011	0
15401	68	Manchester	Massachusetts	10	2011	0
15402	68	Manchester	Massachusetts	11	2011	0
15403	68	Manchester	Massachusetts	12	2011	0
15404	68	Manchester	Massachusetts	1	2012	704000
15405	68	Manchester	Massachusetts	2	2012	756740
15406	68	Manchester	Massachusetts	3	2012	758740
15407	68	Manchester	Massachusetts	4	2012	757480
15408	68	Manchester	Massachusetts	5	2012	560000
15409	68	Manchester	Massachusetts	6	2012	620000
15410	68	Manchester	Massachusetts	7	2012	624375
15411	68	Manchester	Massachusetts	8	2012	664725
15412	68	Manchester	Massachusetts	9	2012	594500
15413	68	Manchester	Massachusetts	10	2012	630750
15414	68	Manchester	Massachusetts	11	2012	616250
15415	68	Manchester	Massachusetts	12	2012	692500
15416	68	Manchester	Massachusetts	1	2013	692500
15417	68	Manchester	Massachusetts	2	2013	790000
15418	68	Manchester	Massachusetts	3	2013	625000
15419	68	Manchester	Massachusetts	4	2013	679000
15420	68	Manchester	Massachusetts	5	2013	462000
15421	68	Manchester	Massachusetts	6	2013	590813
15422	68	Manchester	Massachusetts	7	2013	590813
15423	68	Manchester	Massachusetts	8	2013	695000
15424	68	Manchester	Massachusetts	9	2013	662500
15425	68	Manchester	Massachusetts	10	2013	775000
15426	68	Manchester	Massachusetts	11	2013	766000
15427	68	Manchester	Massachusetts	12	2013	685000
15428	68	Manchester	Massachusetts	1	2014	612500
15429	68	Manchester	Massachusetts	2	2014	560000
15430	68	Manchester	Massachusetts	3	2014	588750
15431	68	Manchester	Massachusetts	4	2014	565000
15432	68	Manchester	Massachusetts	5	2014	575000
15433	68	Manchester	Massachusetts	6	2014	640000
15434	68	Manchester	Massachusetts	7	2014	665000
15435	68	Manchester	Massachusetts	8	2014	690000
15436	68	Manchester	Massachusetts	9	2014	769005
15437	68	Manchester	Massachusetts	10	2014	787500
15438	68	Manchester	Massachusetts	11	2014	900000
15439	68	Manchester	Massachusetts	12	2014	710000
15440	68	Manchester	Massachusetts	1	2015	710000
15441	68	Manchester	Massachusetts	2	2015	710000
15442	68	Manchester	Massachusetts	3	2015	823000
15443	68	Manchester	Massachusetts	4	2015	715000
15444	68	Manchester	Massachusetts	5	2015	629000
15445	68	Manchester	Massachusetts	6	2015	607000
15446	68	Manchester	Massachusetts	7	2015	665000
15447	68	Manchester	Massachusetts	8	2015	736250
15448	68	Manchester	Massachusetts	9	2015	763750
15449	68	Manchester	Massachusetts	10	2015	763750
15450	68	Manchester	Massachusetts	11	2015	859400
15451	68	Manchester	Massachusetts	12	2015	764400
15452	68	Manchester	Massachusetts	1	2016	680000
15453	68	Manchester	Massachusetts	2	2016	637500
15454	68	Manchester	Massachusetts	3	2016	715000
15455	68	Manchester	Massachusetts	4	2016	750000
15456	68	Manchester	Massachusetts	5	2016	900000
15457	68	Manchester	Massachusetts	6	2016	772450
15458	68	Manchester	Massachusetts	7	2016	799900
15459	68	Manchester	Massachusetts	8	2016	824950
15460	68	Manchester	Massachusetts	9	2016	900000
15461	68	Manchester	Massachusetts	10	2016	730000
15462	68	Manchester	Massachusetts	11	2016	721400
15463	68	Manchester	Massachusetts	12	2016	708200
15464	68	Manchester	Massachusetts	1	2017	680000
15465	68	Manchester	Massachusetts	2	2017	700000
15466	68	Manchester	Massachusetts	3	2017	700000
15467	68	Manchester	Massachusetts	4	2017	745000
15468	68	Manchester	Massachusetts	5	2017	689125
15469	68	Manchester	Massachusetts	6	2017	745000
15470	68	Manchester	Massachusetts	7	2017	755000
15471	68	Manchester	Massachusetts	8	2017	830000
15472	68	Manchester	Massachusetts	9	2017	899000
15473	68	Manchester	Massachusetts	10	2017	880000
15474	68	Manchester	Massachusetts	11	2017	846700
15475	68	Manchester	Massachusetts	12	2017	796700
15476	68	Manchester	Massachusetts	1	2018	888000
15477	68	Manchester	Massachusetts	2	2018	711000
15478	68	Manchester	Massachusetts	3	2018	746000
15479	68	Manchester	Massachusetts	4	2018	803500
15480	68	Manchester	Massachusetts	5	2018	995000
15481	68	Manchester	Massachusetts	6	2018	1005000
15482	68	Manchester	Massachusetts	7	2018	1056500
15483	68	Manchester	Massachusetts	8	2018	920000
15484	68	Manchester	Massachusetts	9	2018	949500
15485	68	Manchester	Massachusetts	10	2018	1015000
15486	68	Manchester	Massachusetts	11	2018	924000
15487	68	Manchester	Massachusetts	12	2018	830000
15488	68	Manchester	Massachusetts	1	2019	0
15489	69	Salem	Massachusetts	1	2009	0
15490	69	Salem	Massachusetts	2	2009	0
15491	69	Salem	Massachusetts	3	2009	0
15492	69	Salem	Massachusetts	4	2009	0
15493	69	Salem	Massachusetts	5	2009	0
15494	69	Salem	Massachusetts	6	2009	0
15495	69	Salem	Massachusetts	7	2009	0
15496	69	Salem	Massachusetts	8	2009	0
15497	69	Salem	Massachusetts	9	2009	0
15498	69	Salem	Massachusetts	10	2009	0
15499	69	Salem	Massachusetts	11	2009	0
15500	69	Salem	Massachusetts	12	2009	0
15501	69	Salem	Massachusetts	1	2010	0
15502	69	Salem	Massachusetts	2	2010	0
15503	69	Salem	Massachusetts	3	2010	0
15504	69	Salem	Massachusetts	4	2010	0
15505	69	Salem	Massachusetts	5	2010	0
15506	69	Salem	Massachusetts	6	2010	0
15507	69	Salem	Massachusetts	7	2010	0
15508	69	Salem	Massachusetts	8	2010	0
15509	69	Salem	Massachusetts	9	2010	0
15510	69	Salem	Massachusetts	10	2010	0
15511	69	Salem	Massachusetts	11	2010	0
15512	69	Salem	Massachusetts	12	2010	0
15513	69	Salem	Massachusetts	1	2011	0
15514	69	Salem	Massachusetts	2	2011	0
15515	69	Salem	Massachusetts	3	2011	0
15516	69	Salem	Massachusetts	4	2011	0
15517	69	Salem	Massachusetts	5	2011	0
15518	69	Salem	Massachusetts	6	2011	0
15519	69	Salem	Massachusetts	7	2011	0
15520	69	Salem	Massachusetts	8	2011	0
15521	69	Salem	Massachusetts	9	2011	0
15522	69	Salem	Massachusetts	10	2011	0
15523	69	Salem	Massachusetts	11	2011	0
15524	69	Salem	Massachusetts	12	2011	0
15525	69	Salem	Massachusetts	1	2012	225250
15526	69	Salem	Massachusetts	2	2012	223050
15527	69	Salem	Massachusetts	3	2012	235000
15528	69	Salem	Massachusetts	4	2012	245000
15529	69	Salem	Massachusetts	5	2012	239000
15530	69	Salem	Massachusetts	6	2012	265000
15531	69	Salem	Massachusetts	7	2012	239000
15532	69	Salem	Massachusetts	8	2012	267500
15533	69	Salem	Massachusetts	9	2012	242450
15534	69	Salem	Massachusetts	10	2012	243000
15535	69	Salem	Massachusetts	11	2012	262000
15536	69	Salem	Massachusetts	12	2012	264750
15537	69	Salem	Massachusetts	1	2013	267000
15538	69	Salem	Massachusetts	2	2013	256700
15539	69	Salem	Massachusetts	3	2013	230280
15540	69	Salem	Massachusetts	4	2013	221000
15541	69	Salem	Massachusetts	5	2013	257250
15542	69	Salem	Massachusetts	6	2013	272750
15543	69	Salem	Massachusetts	7	2013	299000
15544	69	Salem	Massachusetts	8	2013	282450
15545	69	Salem	Massachusetts	9	2013	260000
15546	69	Salem	Massachusetts	10	2013	289000
15547	69	Salem	Massachusetts	11	2013	277500
15548	69	Salem	Massachusetts	12	2013	252500
15549	69	Salem	Massachusetts	1	2014	280000
15550	69	Salem	Massachusetts	2	2014	286000
15551	69	Salem	Massachusetts	3	2014	276000
15552	69	Salem	Massachusetts	4	2014	276900
15553	69	Salem	Massachusetts	5	2014	289500
15554	69	Salem	Massachusetts	6	2014	282250
15555	69	Salem	Massachusetts	7	2014	297500
15556	69	Salem	Massachusetts	8	2014	330000
15557	69	Salem	Massachusetts	9	2014	310000
15558	69	Salem	Massachusetts	10	2014	301875
15559	69	Salem	Massachusetts	11	2014	285000
15560	69	Salem	Massachusetts	12	2014	307750
15561	69	Salem	Massachusetts	1	2015	310000
15562	69	Salem	Massachusetts	2	2015	273750
15563	69	Salem	Massachusetts	3	2015	300000
15564	69	Salem	Massachusetts	4	2015	295000
15565	69	Salem	Massachusetts	5	2015	312500
15566	69	Salem	Massachusetts	6	2015	333500
15567	69	Salem	Massachusetts	7	2015	315000
15568	69	Salem	Massachusetts	8	2015	311000
15569	69	Salem	Massachusetts	9	2015	309000
15570	69	Salem	Massachusetts	10	2015	314000
15571	69	Salem	Massachusetts	11	2015	285500
15572	69	Salem	Massachusetts	12	2015	309000
15573	69	Salem	Massachusetts	1	2016	307200
15574	69	Salem	Massachusetts	2	2016	275500
15575	69	Salem	Massachusetts	3	2016	313500
15576	69	Salem	Massachusetts	4	2016	314750
15577	69	Salem	Massachusetts	5	2016	292500
15578	69	Salem	Massachusetts	6	2016	335000
15579	69	Salem	Massachusetts	7	2016	329000
15580	69	Salem	Massachusetts	8	2016	298500
15581	69	Salem	Massachusetts	9	2016	310000
15582	69	Salem	Massachusetts	10	2016	325000
15583	69	Salem	Massachusetts	11	2016	318500
15584	69	Salem	Massachusetts	12	2016	319000
15585	69	Salem	Massachusetts	1	2017	360000
15586	69	Salem	Massachusetts	2	2017	347000
15587	69	Salem	Massachusetts	3	2017	305000
15588	69	Salem	Massachusetts	4	2017	330000
15589	69	Salem	Massachusetts	5	2017	364950
15590	69	Salem	Massachusetts	6	2017	345000
15591	69	Salem	Massachusetts	7	2017	350000
15592	69	Salem	Massachusetts	8	2017	367000
15593	69	Salem	Massachusetts	9	2017	359450
15594	69	Salem	Massachusetts	10	2017	345000
15595	69	Salem	Massachusetts	11	2017	365000
15596	69	Salem	Massachusetts	12	2017	365000
15597	69	Salem	Massachusetts	1	2018	363738
15598	69	Salem	Massachusetts	2	2018	323000
15599	69	Salem	Massachusetts	3	2018	345000
15600	69	Salem	Massachusetts	4	2018	373750
15601	69	Salem	Massachusetts	5	2018	359000
15602	69	Salem	Massachusetts	6	2018	405000
15603	69	Salem	Massachusetts	7	2018	382450
15604	69	Salem	Massachusetts	8	2018	402000
15605	69	Salem	Massachusetts	9	2018	360000
15606	69	Salem	Massachusetts	10	2018	399000
15607	69	Salem	Massachusetts	11	2018	392500
15608	69	Salem	Massachusetts	12	2018	348450
15609	69	Salem	Massachusetts	1	2019	0
15610	70	Detroit	Michigan	1	2009	0
15611	70	Detroit	Michigan	2	2009	0
15612	70	Detroit	Michigan	3	2009	0
15613	70	Detroit	Michigan	4	2009	0
15614	70	Detroit	Michigan	5	2009	0
15615	70	Detroit	Michigan	6	2009	0
15616	70	Detroit	Michigan	7	2009	0
15617	70	Detroit	Michigan	8	2009	0
15618	70	Detroit	Michigan	9	2009	0
15619	70	Detroit	Michigan	10	2009	0
15620	70	Detroit	Michigan	11	2009	0
15621	70	Detroit	Michigan	12	2009	0
15622	70	Detroit	Michigan	1	2010	0
15623	70	Detroit	Michigan	2	2010	0
15624	70	Detroit	Michigan	3	2010	0
15625	70	Detroit	Michigan	4	2010	0
15626	70	Detroit	Michigan	5	2010	0
15627	70	Detroit	Michigan	6	2010	0
15628	70	Detroit	Michigan	7	2010	0
15629	70	Detroit	Michigan	8	2010	0
15630	70	Detroit	Michigan	9	2010	0
15631	70	Detroit	Michigan	10	2010	0
15632	70	Detroit	Michigan	11	2010	0
15633	70	Detroit	Michigan	12	2010	0
15634	70	Detroit	Michigan	1	2011	0
15635	70	Detroit	Michigan	2	2011	0
15636	70	Detroit	Michigan	3	2011	0
15637	70	Detroit	Michigan	4	2011	0
15638	70	Detroit	Michigan	5	2011	0
15639	70	Detroit	Michigan	6	2011	0
15640	70	Detroit	Michigan	7	2011	0
15641	70	Detroit	Michigan	8	2011	0
15642	70	Detroit	Michigan	9	2011	0
15643	70	Detroit	Michigan	10	2011	0
15644	70	Detroit	Michigan	11	2011	0
15645	70	Detroit	Michigan	12	2011	0
15646	70	Detroit	Michigan	1	2012	0
15647	70	Detroit	Michigan	2	2012	0
15648	70	Detroit	Michigan	3	2012	0
15649	70	Detroit	Michigan	4	2012	0
15650	70	Detroit	Michigan	5	2012	0
15651	70	Detroit	Michigan	6	2012	0
15652	70	Detroit	Michigan	7	2012	0
15653	70	Detroit	Michigan	8	2012	0
15654	70	Detroit	Michigan	9	2012	0
15655	70	Detroit	Michigan	10	2012	0
15656	70	Detroit	Michigan	11	2012	0
15657	70	Detroit	Michigan	12	2012	0
15658	70	Detroit	Michigan	1	2013	44000
15659	70	Detroit	Michigan	2	2013	42500
15660	70	Detroit	Michigan	3	2013	48000
15661	70	Detroit	Michigan	4	2013	50000
15662	70	Detroit	Michigan	5	2013	57000
15663	70	Detroit	Michigan	6	2013	62500
15664	70	Detroit	Michigan	7	2013	75011
15665	70	Detroit	Michigan	8	2013	80000
15666	70	Detroit	Michigan	9	2013	76700
15667	70	Detroit	Michigan	10	2013	64900
15668	70	Detroit	Michigan	11	2013	57500
15669	70	Detroit	Michigan	12	2013	57613
15670	70	Detroit	Michigan	1	2014	55000
15671	70	Detroit	Michigan	2	2014	40000
15672	70	Detroit	Michigan	3	2014	44000
15673	70	Detroit	Michigan	4	2014	54000
15674	70	Detroit	Michigan	5	2014	65000
15675	70	Detroit	Michigan	6	2014	73300
15676	70	Detroit	Michigan	7	2014	77988
15677	70	Detroit	Michigan	8	2014	78700
15678	70	Detroit	Michigan	9	2014	77000
15679	70	Detroit	Michigan	10	2014	79450
15680	70	Detroit	Michigan	11	2014	74750
15681	70	Detroit	Michigan	12	2014	65000
15682	70	Detroit	Michigan	1	2015	63000
15683	70	Detroit	Michigan	2	2015	59900
15684	70	Detroit	Michigan	3	2015	64575
15685	70	Detroit	Michigan	4	2015	82000
15686	70	Detroit	Michigan	5	2015	81500
15687	70	Detroit	Michigan	6	2015	108000
15688	70	Detroit	Michigan	7	2015	96000
15689	70	Detroit	Michigan	8	2015	81000
15690	70	Detroit	Michigan	9	2015	92500
15691	70	Detroit	Michigan	10	2015	95000
15692	70	Detroit	Michigan	11	2015	88500
15693	70	Detroit	Michigan	12	2015	76650
15694	70	Detroit	Michigan	1	2016	82000
15695	70	Detroit	Michigan	2	2016	87950
15696	70	Detroit	Michigan	3	2016	93000
15697	70	Detroit	Michigan	4	2016	99900
15698	70	Detroit	Michigan	5	2016	110000
15699	70	Detroit	Michigan	6	2016	114500
15700	70	Detroit	Michigan	7	2016	123000
15701	70	Detroit	Michigan	8	2016	121850
15702	70	Detroit	Michigan	9	2016	115000
15703	70	Detroit	Michigan	10	2016	117250
15704	70	Detroit	Michigan	11	2016	110000
15705	70	Detroit	Michigan	12	2016	105000
15706	70	Detroit	Michigan	1	2017	104400
15707	70	Detroit	Michigan	2	2017	95400
15708	70	Detroit	Michigan	3	2017	100000
15709	70	Detroit	Michigan	4	2017	105000
15710	70	Detroit	Michigan	5	2017	118450
15711	70	Detroit	Michigan	6	2017	125000
15712	70	Detroit	Michigan	7	2017	125101
15713	70	Detroit	Michigan	8	2017	131750
15714	70	Detroit	Michigan	9	2017	125000
15715	70	Detroit	Michigan	10	2017	125000
15716	70	Detroit	Michigan	11	2017	120000
15717	70	Detroit	Michigan	12	2017	123000
15718	70	Detroit	Michigan	1	2018	112000
15719	70	Detroit	Michigan	2	2018	115000
15720	70	Detroit	Michigan	3	2018	115000
15721	70	Detroit	Michigan	4	2018	119000
15722	70	Detroit	Michigan	5	2018	130600
15723	70	Detroit	Michigan	6	2018	133250
15724	70	Detroit	Michigan	7	2018	139000
15725	70	Detroit	Michigan	8	2018	135000
15726	70	Detroit	Michigan	9	2018	130000
15727	70	Detroit	Michigan	10	2018	132000
15728	70	Detroit	Michigan	11	2018	122000
15729	70	Detroit	Michigan	12	2018	124901
15730	70	Detroit	Michigan	1	2019	0
15731	71	Birmingham	Michigan	1	2009	0
15732	71	Birmingham	Michigan	2	2009	0
15733	71	Birmingham	Michigan	3	2009	0
15734	71	Birmingham	Michigan	4	2009	0
15735	71	Birmingham	Michigan	5	2009	0
15736	71	Birmingham	Michigan	6	2009	0
15737	71	Birmingham	Michigan	7	2009	0
15738	71	Birmingham	Michigan	8	2009	0
15739	71	Birmingham	Michigan	9	2009	0
15740	71	Birmingham	Michigan	10	2009	0
15741	71	Birmingham	Michigan	11	2009	0
15742	71	Birmingham	Michigan	12	2009	0
15743	71	Birmingham	Michigan	1	2010	0
15744	71	Birmingham	Michigan	2	2010	0
15745	71	Birmingham	Michigan	3	2010	0
15746	71	Birmingham	Michigan	4	2010	0
15747	71	Birmingham	Michigan	5	2010	0
15748	71	Birmingham	Michigan	6	2010	0
15749	71	Birmingham	Michigan	7	2010	0
15750	71	Birmingham	Michigan	8	2010	0
15751	71	Birmingham	Michigan	9	2010	0
15752	71	Birmingham	Michigan	10	2010	0
15753	71	Birmingham	Michigan	11	2010	0
15754	71	Birmingham	Michigan	12	2010	0
15755	71	Birmingham	Michigan	1	2011	0
15756	71	Birmingham	Michigan	2	2011	0
15757	71	Birmingham	Michigan	3	2011	0
15758	71	Birmingham	Michigan	4	2011	0
15759	71	Birmingham	Michigan	5	2011	0
15760	71	Birmingham	Michigan	6	2011	0
15761	71	Birmingham	Michigan	7	2011	0
15762	71	Birmingham	Michigan	8	2011	0
15763	71	Birmingham	Michigan	9	2011	0
15764	71	Birmingham	Michigan	10	2011	0
15765	71	Birmingham	Michigan	11	2011	0
15766	71	Birmingham	Michigan	12	2011	0
15767	71	Birmingham	Michigan	1	2012	540000
15768	71	Birmingham	Michigan	2	2012	650000
15769	71	Birmingham	Michigan	3	2012	570000
15770	71	Birmingham	Michigan	4	2012	650000
15771	71	Birmingham	Michigan	5	2012	574000
15772	71	Birmingham	Michigan	6	2012	553750
15773	71	Birmingham	Michigan	7	2012	545000
15774	71	Birmingham	Michigan	8	2012	548750
15775	71	Birmingham	Michigan	9	2012	583000
15776	71	Birmingham	Michigan	10	2012	544500
15777	71	Birmingham	Michigan	11	2012	585000
15778	71	Birmingham	Michigan	12	2012	585000
15779	71	Birmingham	Michigan	1	2013	615000
15780	71	Birmingham	Michigan	2	2013	645000
15781	71	Birmingham	Michigan	3	2013	655000
15782	71	Birmingham	Michigan	4	2013	630750
15783	71	Birmingham	Michigan	5	2013	699000
15784	71	Birmingham	Michigan	6	2013	765000
15785	71	Birmingham	Michigan	7	2013	735000
15786	71	Birmingham	Michigan	8	2013	740000
15787	71	Birmingham	Michigan	9	2013	652500
15788	71	Birmingham	Michigan	10	2013	560000
15789	71	Birmingham	Michigan	11	2013	491000
15790	71	Birmingham	Michigan	12	2013	491000
15791	71	Birmingham	Michigan	1	2014	925000
15792	71	Birmingham	Michigan	2	2014	925000
15793	71	Birmingham	Michigan	3	2014	1042500
15794	71	Birmingham	Michigan	4	2014	738000
15795	71	Birmingham	Michigan	5	2014	726500
15796	71	Birmingham	Michigan	6	2014	622500
15797	71	Birmingham	Michigan	7	2014	538500
15798	71	Birmingham	Michigan	8	2014	495000
15799	71	Birmingham	Michigan	9	2014	611500
15800	71	Birmingham	Michigan	10	2014	740000
15801	71	Birmingham	Michigan	11	2014	740000
15802	71	Birmingham	Michigan	12	2014	550000
15803	71	Birmingham	Michigan	1	2015	515000
15804	71	Birmingham	Michigan	2	2015	427000
15805	71	Birmingham	Michigan	3	2015	545000
15806	71	Birmingham	Michigan	4	2015	613500
15807	71	Birmingham	Michigan	5	2015	662500
15808	71	Birmingham	Michigan	6	2015	700500
15809	71	Birmingham	Michigan	7	2015	586500
15810	71	Birmingham	Michigan	8	2015	575750
15811	71	Birmingham	Michigan	9	2015	640500
15812	71	Birmingham	Michigan	10	2015	715000
15813	71	Birmingham	Michigan	11	2015	799000
15814	71	Birmingham	Michigan	12	2015	691250
15815	71	Birmingham	Michigan	1	2016	710475
15816	71	Birmingham	Michigan	2	2016	710475
15817	71	Birmingham	Michigan	3	2016	781725
15818	71	Birmingham	Michigan	4	2016	688500
15819	71	Birmingham	Michigan	5	2016	677000
15820	71	Birmingham	Michigan	6	2016	630000
15821	71	Birmingham	Michigan	7	2016	750000
15822	71	Birmingham	Michigan	8	2016	850000
15823	71	Birmingham	Michigan	9	2016	860000
15824	71	Birmingham	Michigan	10	2016	727500
15825	71	Birmingham	Michigan	11	2016	715000
15826	71	Birmingham	Michigan	12	2016	825000
15827	71	Birmingham	Michigan	1	2017	855000
15828	71	Birmingham	Michigan	2	2017	814000
15829	71	Birmingham	Michigan	3	2017	710000
15830	71	Birmingham	Michigan	4	2017	710000
15831	71	Birmingham	Michigan	5	2017	650000
15832	71	Birmingham	Michigan	6	2017	740000
15833	71	Birmingham	Michigan	7	2017	747500
15834	71	Birmingham	Michigan	8	2017	747500
15835	71	Birmingham	Michigan	9	2017	647000
15836	71	Birmingham	Michigan	10	2017	620000
15837	71	Birmingham	Michigan	11	2017	715000
15838	71	Birmingham	Michigan	12	2017	670000
15839	71	Birmingham	Michigan	1	2018	1125000
15840	71	Birmingham	Michigan	2	2018	825000
15841	71	Birmingham	Michigan	3	2018	792500
15842	71	Birmingham	Michigan	4	2018	727500
15843	71	Birmingham	Michigan	5	2018	740175
15844	71	Birmingham	Michigan	6	2018	727500
15845	71	Birmingham	Michigan	7	2018	725000
15846	71	Birmingham	Michigan	8	2018	880000
15847	71	Birmingham	Michigan	9	2018	775000
15848	71	Birmingham	Michigan	10	2018	843750
15849	71	Birmingham	Michigan	11	2018	775000
15850	71	Birmingham	Michigan	12	2018	696000
15851	71	Birmingham	Michigan	1	2019	0
15852	72	Trenton	Michigan	1	2009	0
15853	72	Trenton	Michigan	2	2009	0
15854	72	Trenton	Michigan	3	2009	0
15855	72	Trenton	Michigan	4	2009	0
15856	72	Trenton	Michigan	5	2009	0
15857	72	Trenton	Michigan	6	2009	0
15858	72	Trenton	Michigan	7	2009	0
15859	72	Trenton	Michigan	8	2009	0
15860	72	Trenton	Michigan	9	2009	0
15861	72	Trenton	Michigan	10	2009	0
15862	72	Trenton	Michigan	11	2009	0
15863	72	Trenton	Michigan	12	2009	0
15864	72	Trenton	Michigan	1	2010	0
15865	72	Trenton	Michigan	2	2010	0
15866	72	Trenton	Michigan	3	2010	0
15867	72	Trenton	Michigan	4	2010	0
15868	72	Trenton	Michigan	5	2010	0
15869	72	Trenton	Michigan	6	2010	0
15870	72	Trenton	Michigan	7	2010	0
15871	72	Trenton	Michigan	8	2010	0
15872	72	Trenton	Michigan	9	2010	0
15873	72	Trenton	Michigan	10	2010	0
15874	72	Trenton	Michigan	11	2010	0
15875	72	Trenton	Michigan	12	2010	0
15876	72	Trenton	Michigan	1	2011	0
15877	72	Trenton	Michigan	2	2011	0
15878	72	Trenton	Michigan	3	2011	0
15879	72	Trenton	Michigan	4	2011	0
15880	72	Trenton	Michigan	5	2011	0
15881	72	Trenton	Michigan	6	2011	0
15882	72	Trenton	Michigan	7	2011	0
15883	72	Trenton	Michigan	8	2011	0
15884	72	Trenton	Michigan	9	2011	0
15885	72	Trenton	Michigan	10	2011	0
15886	72	Trenton	Michigan	11	2011	0
15887	72	Trenton	Michigan	12	2011	0
15888	72	Trenton	Michigan	1	2012	0
15889	72	Trenton	Michigan	2	2012	0
15890	72	Trenton	Michigan	3	2012	0
15891	72	Trenton	Michigan	4	2012	0
15892	72	Trenton	Michigan	5	2012	0
15893	72	Trenton	Michigan	6	2012	0
15894	72	Trenton	Michigan	7	2012	0
15895	72	Trenton	Michigan	8	2012	0
15896	72	Trenton	Michigan	9	2012	0
15897	72	Trenton	Michigan	10	2012	0
15898	72	Trenton	Michigan	11	2012	0
15899	72	Trenton	Michigan	12	2012	0
15900	72	Trenton	Michigan	1	2013	0
15901	72	Trenton	Michigan	2	2013	0
15902	72	Trenton	Michigan	3	2013	131100
15903	72	Trenton	Michigan	4	2013	135000
15904	72	Trenton	Michigan	5	2013	140000
15905	72	Trenton	Michigan	6	2013	145000
15906	72	Trenton	Michigan	7	2013	140000
15907	72	Trenton	Michigan	8	2013	153750
15908	72	Trenton	Michigan	9	2013	150000
15909	72	Trenton	Michigan	10	2013	153000
15910	72	Trenton	Michigan	11	2013	163000
15911	72	Trenton	Michigan	12	2013	173000
15912	72	Trenton	Michigan	1	2014	179000
15913	72	Trenton	Michigan	2	2014	160000
15914	72	Trenton	Michigan	3	2014	156500
15915	72	Trenton	Michigan	4	2014	158250
15916	72	Trenton	Michigan	5	2014	154500
15917	72	Trenton	Michigan	6	2014	148500
15918	72	Trenton	Michigan	7	2014	138000
15919	72	Trenton	Michigan	8	2014	144950
15920	72	Trenton	Michigan	9	2014	158500
15921	72	Trenton	Michigan	10	2014	168000
15922	72	Trenton	Michigan	11	2014	153500
15923	72	Trenton	Michigan	12	2014	157000
15924	72	Trenton	Michigan	1	2015	130000
15925	72	Trenton	Michigan	2	2015	160000
15926	72	Trenton	Michigan	3	2015	169000
15927	72	Trenton	Michigan	4	2015	178000
15928	72	Trenton	Michigan	5	2015	170000
15929	72	Trenton	Michigan	6	2015	154000
15930	72	Trenton	Michigan	7	2015	154000
15931	72	Trenton	Michigan	8	2015	153000
15932	72	Trenton	Michigan	9	2015	162000
15933	72	Trenton	Michigan	10	2015	149500
15934	72	Trenton	Michigan	11	2015	150000
15935	72	Trenton	Michigan	12	2015	151000
15936	72	Trenton	Michigan	1	2016	161700
15937	72	Trenton	Michigan	2	2016	174900
15938	72	Trenton	Michigan	3	2016	157750
15939	72	Trenton	Michigan	4	2016	167500
15940	72	Trenton	Michigan	5	2016	167500
15941	72	Trenton	Michigan	6	2016	180000
15942	72	Trenton	Michigan	7	2016	187500
15943	72	Trenton	Michigan	8	2016	187500
15944	72	Trenton	Michigan	9	2016	180950
15945	72	Trenton	Michigan	10	2016	173500
15946	72	Trenton	Michigan	11	2016	175750
15947	72	Trenton	Michigan	12	2016	190625
15948	72	Trenton	Michigan	1	2017	198075
15949	72	Trenton	Michigan	2	2017	212500
15950	72	Trenton	Michigan	3	2017	217500
15951	72	Trenton	Michigan	4	2017	195000
15952	72	Trenton	Michigan	5	2017	176000
15953	72	Trenton	Michigan	6	2017	190000
15954	72	Trenton	Michigan	7	2017	190000
15955	72	Trenton	Michigan	8	2017	191250
15956	72	Trenton	Michigan	9	2017	187500
15957	72	Trenton	Michigan	10	2017	188950
15958	72	Trenton	Michigan	11	2017	187900
15959	72	Trenton	Michigan	12	2017	187900
15960	72	Trenton	Michigan	1	2018	179000
15961	72	Trenton	Michigan	2	2018	179000
15962	72	Trenton	Michigan	3	2018	185000
15963	72	Trenton	Michigan	4	2018	187500
15964	72	Trenton	Michigan	5	2018	202500
15965	72	Trenton	Michigan	6	2018	215000
15966	72	Trenton	Michigan	7	2018	222000
15967	72	Trenton	Michigan	8	2018	227500
15968	72	Trenton	Michigan	9	2018	219000
15969	72	Trenton	Michigan	10	2018	194250
15970	72	Trenton	Michigan	11	2018	190000
15971	72	Trenton	Michigan	12	2018	189950
15972	72	Trenton	Michigan	1	2019	0
15973	73	Bloomington	Minnesota	1	2009	0
15974	73	Bloomington	Minnesota	2	2009	0
15975	73	Bloomington	Minnesota	3	2009	0
15976	73	Bloomington	Minnesota	4	2009	0
15977	73	Bloomington	Minnesota	5	2009	0
15978	73	Bloomington	Minnesota	6	2009	0
15979	73	Bloomington	Minnesota	7	2009	0
15980	73	Bloomington	Minnesota	8	2009	0
15981	73	Bloomington	Minnesota	9	2009	0
15982	73	Bloomington	Minnesota	10	2009	0
15983	73	Bloomington	Minnesota	11	2009	0
15984	73	Bloomington	Minnesota	12	2009	0
15985	73	Bloomington	Minnesota	1	2010	0
15986	73	Bloomington	Minnesota	2	2010	0
15987	73	Bloomington	Minnesota	3	2010	0
15988	73	Bloomington	Minnesota	4	2010	0
15989	73	Bloomington	Minnesota	5	2010	0
15990	73	Bloomington	Minnesota	6	2010	0
15991	73	Bloomington	Minnesota	7	2010	0
15992	73	Bloomington	Minnesota	8	2010	0
15993	73	Bloomington	Minnesota	9	2010	0
15994	73	Bloomington	Minnesota	10	2010	0
15995	73	Bloomington	Minnesota	11	2010	0
15996	73	Bloomington	Minnesota	12	2010	0
15997	73	Bloomington	Minnesota	1	2011	0
15998	73	Bloomington	Minnesota	2	2011	0
15999	73	Bloomington	Minnesota	3	2011	0
16000	73	Bloomington	Minnesota	4	2011	0
16001	73	Bloomington	Minnesota	5	2011	0
16002	73	Bloomington	Minnesota	6	2011	0
16003	73	Bloomington	Minnesota	7	2011	0
16004	73	Bloomington	Minnesota	8	2011	0
16005	73	Bloomington	Minnesota	9	2011	0
16006	73	Bloomington	Minnesota	10	2011	0
16007	73	Bloomington	Minnesota	11	2011	0
16008	73	Bloomington	Minnesota	12	2011	0
16009	73	Bloomington	Minnesota	1	2012	0
16010	73	Bloomington	Minnesota	2	2012	0
16011	73	Bloomington	Minnesota	3	2012	0
16012	73	Bloomington	Minnesota	4	2012	0
16013	73	Bloomington	Minnesota	5	2012	0
16014	73	Bloomington	Minnesota	6	2012	0
16015	73	Bloomington	Minnesota	7	2012	0
16016	73	Bloomington	Minnesota	8	2012	0
16017	73	Bloomington	Minnesota	9	2012	0
16018	73	Bloomington	Minnesota	10	2012	0
16019	73	Bloomington	Minnesota	11	2012	0
16020	73	Bloomington	Minnesota	12	2012	0
16021	73	Bloomington	Minnesota	1	2013	0
16022	73	Bloomington	Minnesota	2	2013	0
16023	73	Bloomington	Minnesota	3	2013	0
16024	73	Bloomington	Minnesota	4	2013	0
16025	73	Bloomington	Minnesota	5	2013	0
16026	73	Bloomington	Minnesota	6	2013	0
16027	73	Bloomington	Minnesota	7	2013	0
16028	73	Bloomington	Minnesota	8	2013	0
16029	73	Bloomington	Minnesota	9	2013	200000
16030	73	Bloomington	Minnesota	10	2013	187700
16031	73	Bloomington	Minnesota	11	2013	205900
16032	73	Bloomington	Minnesota	12	2013	179950
16033	73	Bloomington	Minnesota	1	2014	191050
16034	73	Bloomington	Minnesota	2	2014	184250
16035	73	Bloomington	Minnesota	3	2014	189000
16036	73	Bloomington	Minnesota	4	2014	198000
16037	73	Bloomington	Minnesota	5	2014	219500
16038	73	Bloomington	Minnesota	6	2014	217900
16039	73	Bloomington	Minnesota	7	2014	213825
16040	73	Bloomington	Minnesota	8	2014	222000
16041	73	Bloomington	Minnesota	9	2014	210000
16042	73	Bloomington	Minnesota	10	2014	208661
16043	73	Bloomington	Minnesota	11	2014	201000
16044	73	Bloomington	Minnesota	12	2014	198750
16045	73	Bloomington	Minnesota	1	2015	187000
16046	73	Bloomington	Minnesota	2	2015	202000
16047	73	Bloomington	Minnesota	3	2015	215000
16048	73	Bloomington	Minnesota	4	2015	212611
16049	73	Bloomington	Minnesota	5	2015	220000
16050	73	Bloomington	Minnesota	6	2015	214950
16051	73	Bloomington	Minnesota	7	2015	220000
16052	73	Bloomington	Minnesota	8	2015	220950
16053	73	Bloomington	Minnesota	9	2015	218700
16054	73	Bloomington	Minnesota	10	2015	226700
16055	73	Bloomington	Minnesota	11	2015	224900
16056	73	Bloomington	Minnesota	12	2015	210450
16057	73	Bloomington	Minnesota	1	2016	196000
16058	73	Bloomington	Minnesota	2	2016	214016
16059	73	Bloomington	Minnesota	3	2016	219000
16060	73	Bloomington	Minnesota	4	2016	235000
16061	73	Bloomington	Minnesota	5	2016	242000
16062	73	Bloomington	Minnesota	6	2016	239000
16063	73	Bloomington	Minnesota	7	2016	244000
16064	73	Bloomington	Minnesota	8	2016	242000
16065	73	Bloomington	Minnesota	9	2016	235000
16066	73	Bloomington	Minnesota	10	2016	234250
16067	73	Bloomington	Minnesota	11	2016	230500
16068	73	Bloomington	Minnesota	12	2016	232500
16069	73	Bloomington	Minnesota	1	2017	222200
16070	73	Bloomington	Minnesota	2	2017	219000
16071	73	Bloomington	Minnesota	3	2017	240000
16072	73	Bloomington	Minnesota	4	2017	252500
16073	73	Bloomington	Minnesota	5	2017	242625
16074	73	Bloomington	Minnesota	6	2017	256000
16075	73	Bloomington	Minnesota	7	2017	260950
16076	73	Bloomington	Minnesota	8	2017	250000
16077	73	Bloomington	Minnesota	9	2017	252000
16078	73	Bloomington	Minnesota	10	2017	246700
16079	73	Bloomington	Minnesota	11	2017	250000
16080	73	Bloomington	Minnesota	12	2017	259550
16081	73	Bloomington	Minnesota	1	2018	239950
16082	73	Bloomington	Minnesota	2	2018	245000
16083	73	Bloomington	Minnesota	3	2018	263000
16084	73	Bloomington	Minnesota	4	2018	248246
16085	73	Bloomington	Minnesota	5	2018	271500
16086	73	Bloomington	Minnesota	6	2018	275000
16087	73	Bloomington	Minnesota	7	2018	255000
16088	73	Bloomington	Minnesota	8	2018	262500
16089	73	Bloomington	Minnesota	9	2018	270000
16090	73	Bloomington	Minnesota	10	2018	255000
16091	73	Bloomington	Minnesota	11	2018	255750
16092	73	Bloomington	Minnesota	12	2018	255500
16093	73	Bloomington	Minnesota	1	2019	0
16094	74	Columbia Heights	Minnesota	1	2009	0
16095	74	Columbia Heights	Minnesota	2	2009	0
16096	74	Columbia Heights	Minnesota	3	2009	0
16097	74	Columbia Heights	Minnesota	4	2009	0
16098	74	Columbia Heights	Minnesota	5	2009	0
16099	74	Columbia Heights	Minnesota	6	2009	0
16100	74	Columbia Heights	Minnesota	7	2009	0
16101	74	Columbia Heights	Minnesota	8	2009	0
16102	74	Columbia Heights	Minnesota	9	2009	0
16103	74	Columbia Heights	Minnesota	10	2009	0
16104	74	Columbia Heights	Minnesota	11	2009	0
16105	74	Columbia Heights	Minnesota	12	2009	0
16106	74	Columbia Heights	Minnesota	1	2010	0
16107	74	Columbia Heights	Minnesota	2	2010	0
16108	74	Columbia Heights	Minnesota	3	2010	0
16109	74	Columbia Heights	Minnesota	4	2010	0
16110	74	Columbia Heights	Minnesota	5	2010	0
16111	74	Columbia Heights	Minnesota	6	2010	0
16112	74	Columbia Heights	Minnesota	7	2010	0
16113	74	Columbia Heights	Minnesota	8	2010	0
16114	74	Columbia Heights	Minnesota	9	2010	0
16115	74	Columbia Heights	Minnesota	10	2010	0
16116	74	Columbia Heights	Minnesota	11	2010	0
16117	74	Columbia Heights	Minnesota	12	2010	0
16118	74	Columbia Heights	Minnesota	1	2011	0
16119	74	Columbia Heights	Minnesota	2	2011	0
16120	74	Columbia Heights	Minnesota	3	2011	0
16121	74	Columbia Heights	Minnesota	4	2011	0
16122	74	Columbia Heights	Minnesota	5	2011	0
16123	74	Columbia Heights	Minnesota	6	2011	0
16124	74	Columbia Heights	Minnesota	7	2011	0
16125	74	Columbia Heights	Minnesota	8	2011	0
16126	74	Columbia Heights	Minnesota	9	2011	0
16127	74	Columbia Heights	Minnesota	10	2011	0
16128	74	Columbia Heights	Minnesota	11	2011	0
16129	74	Columbia Heights	Minnesota	12	2011	0
16130	74	Columbia Heights	Minnesota	1	2012	0
16131	74	Columbia Heights	Minnesota	2	2012	0
16132	74	Columbia Heights	Minnesota	3	2012	0
16133	74	Columbia Heights	Minnesota	4	2012	0
16134	74	Columbia Heights	Minnesota	5	2012	0
16135	74	Columbia Heights	Minnesota	6	2012	0
16136	74	Columbia Heights	Minnesota	7	2012	0
16137	74	Columbia Heights	Minnesota	8	2012	0
16138	74	Columbia Heights	Minnesota	9	2012	0
16139	74	Columbia Heights	Minnesota	10	2012	0
16140	74	Columbia Heights	Minnesota	11	2012	0
16141	74	Columbia Heights	Minnesota	12	2012	0
16142	74	Columbia Heights	Minnesota	1	2013	0
16143	74	Columbia Heights	Minnesota	2	2013	0
16144	74	Columbia Heights	Minnesota	3	2013	0
16145	74	Columbia Heights	Minnesota	4	2013	0
16146	74	Columbia Heights	Minnesota	5	2013	0
16147	74	Columbia Heights	Minnesota	6	2013	0
16148	74	Columbia Heights	Minnesota	7	2013	0
16149	74	Columbia Heights	Minnesota	8	2013	0
16150	74	Columbia Heights	Minnesota	9	2013	137500
16151	74	Columbia Heights	Minnesota	10	2013	136500
16152	74	Columbia Heights	Minnesota	11	2013	143900
16153	74	Columbia Heights	Minnesota	12	2013	132000
16154	74	Columbia Heights	Minnesota	1	2014	127750
16155	74	Columbia Heights	Minnesota	2	2014	128700
16156	74	Columbia Heights	Minnesota	3	2014	134900
16157	74	Columbia Heights	Minnesota	4	2014	137000
16158	74	Columbia Heights	Minnesota	5	2014	152785
16159	74	Columbia Heights	Minnesota	6	2014	147000
16160	74	Columbia Heights	Minnesota	7	2014	149146
16161	74	Columbia Heights	Minnesota	8	2014	142500
16162	74	Columbia Heights	Minnesota	9	2014	140000
16163	74	Columbia Heights	Minnesota	10	2014	133000
16164	74	Columbia Heights	Minnesota	11	2014	156000
16165	74	Columbia Heights	Minnesota	12	2014	145000
16166	74	Columbia Heights	Minnesota	1	2015	140700
16167	74	Columbia Heights	Minnesota	2	2015	143750
16168	74	Columbia Heights	Minnesota	3	2015	146950
16169	74	Columbia Heights	Minnesota	4	2015	165000
16170	74	Columbia Heights	Minnesota	5	2015	139900
16171	74	Columbia Heights	Minnesota	6	2015	168000
16172	74	Columbia Heights	Minnesota	7	2015	159150
16173	74	Columbia Heights	Minnesota	8	2015	172700
16174	74	Columbia Heights	Minnesota	9	2015	175000
16175	74	Columbia Heights	Minnesota	10	2015	147200
16176	74	Columbia Heights	Minnesota	11	2015	140000
16177	74	Columbia Heights	Minnesota	12	2015	161000
16178	74	Columbia Heights	Minnesota	1	2016	156450
16179	74	Columbia Heights	Minnesota	2	2016	164950
16180	74	Columbia Heights	Minnesota	3	2016	156000
16181	74	Columbia Heights	Minnesota	4	2016	168500
16182	74	Columbia Heights	Minnesota	5	2016	172550
16183	74	Columbia Heights	Minnesota	6	2016	170750
16184	74	Columbia Heights	Minnesota	7	2016	189050
16185	74	Columbia Heights	Minnesota	8	2016	182750
16186	74	Columbia Heights	Minnesota	9	2016	184900
16187	74	Columbia Heights	Minnesota	10	2016	183000
16188	74	Columbia Heights	Minnesota	11	2016	184000
16189	74	Columbia Heights	Minnesota	12	2016	170000
16190	74	Columbia Heights	Minnesota	1	2017	165250
16191	74	Columbia Heights	Minnesota	2	2017	180000
16192	74	Columbia Heights	Minnesota	3	2017	188500
16193	74	Columbia Heights	Minnesota	4	2017	180000
16194	74	Columbia Heights	Minnesota	5	2017	195000
16195	74	Columbia Heights	Minnesota	6	2017	200000
16196	74	Columbia Heights	Minnesota	7	2017	198000
16197	74	Columbia Heights	Minnesota	8	2017	200000
16198	74	Columbia Heights	Minnesota	9	2017	194200
16199	74	Columbia Heights	Minnesota	10	2017	188000
16200	74	Columbia Heights	Minnesota	11	2017	190162
16201	74	Columbia Heights	Minnesota	12	2017	198626
16202	74	Columbia Heights	Minnesota	1	2018	200000
16203	74	Columbia Heights	Minnesota	2	2018	165010
16204	74	Columbia Heights	Minnesota	3	2018	193000
16205	74	Columbia Heights	Minnesota	4	2018	221450
16206	74	Columbia Heights	Minnesota	5	2018	221500
16207	74	Columbia Heights	Minnesota	6	2018	207500
16208	74	Columbia Heights	Minnesota	7	2018	217500
16209	74	Columbia Heights	Minnesota	8	2018	210000
16210	74	Columbia Heights	Minnesota	9	2018	205000
16211	74	Columbia Heights	Minnesota	10	2018	215000
16212	74	Columbia Heights	Minnesota	11	2018	212500
16213	74	Columbia Heights	Minnesota	12	2018	194500
16214	74	Columbia Heights	Minnesota	1	2019	0
16215	76	South St Paul	Minnesota	1	2009	0
16216	76	South St Paul	Minnesota	2	2009	0
16217	76	South St Paul	Minnesota	3	2009	0
16218	76	South St Paul	Minnesota	4	2009	0
16219	76	South St Paul	Minnesota	5	2009	0
16220	76	South St Paul	Minnesota	6	2009	0
16221	76	South St Paul	Minnesota	7	2009	0
16222	76	South St Paul	Minnesota	8	2009	0
16223	76	South St Paul	Minnesota	9	2009	0
16224	76	South St Paul	Minnesota	10	2009	0
16225	76	South St Paul	Minnesota	11	2009	0
16226	76	South St Paul	Minnesota	12	2009	0
16227	76	South St Paul	Minnesota	1	2010	0
16228	76	South St Paul	Minnesota	2	2010	0
16229	76	South St Paul	Minnesota	3	2010	0
16230	76	South St Paul	Minnesota	4	2010	0
16231	76	South St Paul	Minnesota	5	2010	0
16232	76	South St Paul	Minnesota	6	2010	0
16233	76	South St Paul	Minnesota	7	2010	0
16234	76	South St Paul	Minnesota	8	2010	0
16235	76	South St Paul	Minnesota	9	2010	0
16236	76	South St Paul	Minnesota	10	2010	0
16237	76	South St Paul	Minnesota	11	2010	0
16238	76	South St Paul	Minnesota	12	2010	0
16239	76	South St Paul	Minnesota	1	2011	0
16240	76	South St Paul	Minnesota	2	2011	0
16241	76	South St Paul	Minnesota	3	2011	0
16242	76	South St Paul	Minnesota	4	2011	0
16243	76	South St Paul	Minnesota	5	2011	0
16244	76	South St Paul	Minnesota	6	2011	0
16245	76	South St Paul	Minnesota	7	2011	0
16246	76	South St Paul	Minnesota	8	2011	0
16247	76	South St Paul	Minnesota	9	2011	0
16248	76	South St Paul	Minnesota	10	2011	0
16249	76	South St Paul	Minnesota	11	2011	0
16250	76	South St Paul	Minnesota	12	2011	0
16251	76	South St Paul	Minnesota	1	2012	0
16252	76	South St Paul	Minnesota	2	2012	0
16253	76	South St Paul	Minnesota	3	2012	0
16254	76	South St Paul	Minnesota	4	2012	0
16255	76	South St Paul	Minnesota	5	2012	0
16256	76	South St Paul	Minnesota	6	2012	0
16257	76	South St Paul	Minnesota	7	2012	0
16258	76	South St Paul	Minnesota	8	2012	0
16259	76	South St Paul	Minnesota	9	2012	0
16260	76	South St Paul	Minnesota	10	2012	0
16261	76	South St Paul	Minnesota	11	2012	0
16262	76	South St Paul	Minnesota	12	2012	0
16263	76	South St Paul	Minnesota	1	2013	0
16264	76	South St Paul	Minnesota	2	2013	0
16265	76	South St Paul	Minnesota	3	2013	0
16266	76	South St Paul	Minnesota	4	2013	0
16267	76	South St Paul	Minnesota	5	2013	0
16268	76	South St Paul	Minnesota	6	2013	0
16269	76	South St Paul	Minnesota	7	2013	0
16270	76	South St Paul	Minnesota	8	2013	0
16271	76	South St Paul	Minnesota	9	2013	142450
16272	76	South St Paul	Minnesota	10	2013	137950
16273	76	South St Paul	Minnesota	11	2013	162000
16274	76	South St Paul	Minnesota	12	2013	147450
16275	76	South St Paul	Minnesota	1	2014	143250
16276	76	South St Paul	Minnesota	2	2014	144000
16277	76	South St Paul	Minnesota	3	2014	136600
16278	76	South St Paul	Minnesota	4	2014	151500
16279	76	South St Paul	Minnesota	5	2014	149700
16280	76	South St Paul	Minnesota	6	2014	153950
16281	76	South St Paul	Minnesota	7	2014	165826
16282	76	South St Paul	Minnesota	8	2014	148000
16283	76	South St Paul	Minnesota	9	2014	143500
16284	76	South St Paul	Minnesota	10	2014	149900
16285	76	South St Paul	Minnesota	11	2014	142900
16286	76	South St Paul	Minnesota	12	2014	148000
16287	76	South St Paul	Minnesota	1	2015	159900
16288	76	South St Paul	Minnesota	2	2015	140000
16289	76	South St Paul	Minnesota	3	2015	126800
16290	76	South St Paul	Minnesota	4	2015	160000
16291	76	South St Paul	Minnesota	5	2015	161750
16292	76	South St Paul	Minnesota	6	2015	164900
16293	76	South St Paul	Minnesota	7	2015	176950
16294	76	South St Paul	Minnesota	8	2015	179900
16295	76	South St Paul	Minnesota	9	2015	169900
16296	76	South St Paul	Minnesota	10	2015	164500
16297	76	South St Paul	Minnesota	11	2015	160750
16298	76	South St Paul	Minnesota	12	2015	163950
16299	76	South St Paul	Minnesota	1	2016	160950
16300	76	South St Paul	Minnesota	2	2016	211000
16301	76	South St Paul	Minnesota	3	2016	162000
16302	76	South St Paul	Minnesota	4	2016	169950
16303	76	South St Paul	Minnesota	5	2016	166750
16304	76	South St Paul	Minnesota	6	2016	185620
16305	76	South St Paul	Minnesota	7	2016	189000
16306	76	South St Paul	Minnesota	8	2016	184000
16307	76	South St Paul	Minnesota	9	2016	175000
16308	76	South St Paul	Minnesota	10	2016	182000
16309	76	South St Paul	Minnesota	11	2016	184900
16310	76	South St Paul	Minnesota	12	2016	190000
16311	76	South St Paul	Minnesota	1	2017	173000
16312	76	South St Paul	Minnesota	2	2017	190250
16313	76	South St Paul	Minnesota	3	2017	174250
16314	76	South St Paul	Minnesota	4	2017	190750
16315	76	South St Paul	Minnesota	5	2017	190500
16316	76	South St Paul	Minnesota	6	2017	194750
16317	76	South St Paul	Minnesota	7	2017	191452
16318	76	South St Paul	Minnesota	8	2017	200000
16319	76	South St Paul	Minnesota	9	2017	183250
16320	76	South St Paul	Minnesota	10	2017	189850
16321	76	South St Paul	Minnesota	11	2017	194000
16322	76	South St Paul	Minnesota	12	2017	207000
16323	76	South St Paul	Minnesota	1	2018	202500
16324	76	South St Paul	Minnesota	2	2018	197900
16325	76	South St Paul	Minnesota	3	2018	199900
16326	76	South St Paul	Minnesota	4	2018	226250
16327	76	South St Paul	Minnesota	5	2018	217000
16328	76	South St Paul	Minnesota	6	2018	219450
16329	76	South St Paul	Minnesota	7	2018	227000
16330	76	South St Paul	Minnesota	8	2018	204000
16331	76	South St Paul	Minnesota	9	2018	229900
16332	76	South St Paul	Minnesota	10	2018	213500
16333	76	South St Paul	Minnesota	11	2018	214950
16334	76	South St Paul	Minnesota	12	2018	230000
16335	76	South St Paul	Minnesota	1	2019	0
16336	77	St Paul	Minnesota	1	2009	0
16337	77	St Paul	Minnesota	2	2009	0
16338	77	St Paul	Minnesota	3	2009	0
16339	77	St Paul	Minnesota	4	2009	0
16340	77	St Paul	Minnesota	5	2009	0
16341	77	St Paul	Minnesota	6	2009	0
16342	77	St Paul	Minnesota	7	2009	0
16343	77	St Paul	Minnesota	8	2009	0
16344	77	St Paul	Minnesota	9	2009	0
16345	77	St Paul	Minnesota	10	2009	0
16346	77	St Paul	Minnesota	11	2009	0
16347	77	St Paul	Minnesota	12	2009	0
16348	77	St Paul	Minnesota	1	2010	0
16349	77	St Paul	Minnesota	2	2010	0
16350	77	St Paul	Minnesota	3	2010	0
16351	77	St Paul	Minnesota	4	2010	0
16352	77	St Paul	Minnesota	5	2010	0
16353	77	St Paul	Minnesota	6	2010	0
16354	77	St Paul	Minnesota	7	2010	0
16355	77	St Paul	Minnesota	8	2010	0
16356	77	St Paul	Minnesota	9	2010	0
16357	77	St Paul	Minnesota	10	2010	0
16358	77	St Paul	Minnesota	11	2010	0
16359	77	St Paul	Minnesota	12	2010	0
16360	77	St Paul	Minnesota	1	2011	0
16361	77	St Paul	Minnesota	2	2011	0
16362	77	St Paul	Minnesota	3	2011	0
16363	77	St Paul	Minnesota	4	2011	0
16364	77	St Paul	Minnesota	5	2011	0
16365	77	St Paul	Minnesota	6	2011	0
16366	77	St Paul	Minnesota	7	2011	0
16367	77	St Paul	Minnesota	8	2011	0
16368	77	St Paul	Minnesota	9	2011	0
16369	77	St Paul	Minnesota	10	2011	0
16370	77	St Paul	Minnesota	11	2011	0
16371	77	St Paul	Minnesota	12	2011	0
16372	77	St Paul	Minnesota	1	2012	0
16373	77	St Paul	Minnesota	2	2012	0
16374	77	St Paul	Minnesota	3	2012	0
16375	77	St Paul	Minnesota	4	2012	0
16376	77	St Paul	Minnesota	5	2012	0
16377	77	St Paul	Minnesota	6	2012	0
16378	77	St Paul	Minnesota	7	2012	0
16379	77	St Paul	Minnesota	8	2012	0
16380	77	St Paul	Minnesota	9	2012	0
16381	77	St Paul	Minnesota	10	2012	0
16382	77	St Paul	Minnesota	11	2012	0
16383	77	St Paul	Minnesota	12	2012	0
16384	77	St Paul	Minnesota	1	2013	0
16385	77	St Paul	Minnesota	2	2013	0
16386	77	St Paul	Minnesota	3	2013	0
16387	77	St Paul	Minnesota	4	2013	0
16388	77	St Paul	Minnesota	5	2013	0
16389	77	St Paul	Minnesota	6	2013	0
16390	77	St Paul	Minnesota	7	2013	0
16391	77	St Paul	Minnesota	8	2013	0
16392	77	St Paul	Minnesota	9	2013	157625
16393	77	St Paul	Minnesota	10	2013	155000
16394	77	St Paul	Minnesota	11	2013	145500
16395	77	St Paul	Minnesota	12	2013	144900
16396	77	St Paul	Minnesota	1	2014	136500
16397	77	St Paul	Minnesota	2	2014	127118
16398	77	St Paul	Minnesota	3	2014	157400
16399	77	St Paul	Minnesota	4	2014	150000
16400	77	St Paul	Minnesota	5	2014	151750
16401	77	St Paul	Minnesota	6	2014	164450
16402	77	St Paul	Minnesota	7	2014	160000
16403	77	St Paul	Minnesota	8	2014	167000
16404	77	St Paul	Minnesota	9	2014	171000
16405	77	St Paul	Minnesota	10	2014	155000
16406	77	St Paul	Minnesota	11	2014	159775
16407	77	St Paul	Minnesota	12	2014	155900
16408	77	St Paul	Minnesota	1	2015	162500
16409	77	St Paul	Minnesota	2	2015	149771
16410	77	St Paul	Minnesota	3	2015	156500
16411	77	St Paul	Minnesota	4	2015	160950
16412	77	St Paul	Minnesota	5	2015	171300
16413	77	St Paul	Minnesota	6	2015	177000
16414	77	St Paul	Minnesota	7	2015	178685
16415	77	St Paul	Minnesota	8	2015	172500
16416	77	St Paul	Minnesota	9	2015	166700
16417	77	St Paul	Minnesota	10	2015	171213
16418	77	St Paul	Minnesota	11	2015	162000
16419	77	St Paul	Minnesota	12	2015	175000
16420	77	St Paul	Minnesota	1	2016	167500
16421	77	St Paul	Minnesota	2	2016	165000
16422	77	St Paul	Minnesota	3	2016	164000
16423	77	St Paul	Minnesota	4	2016	170000
16424	77	St Paul	Minnesota	5	2016	185000
16425	77	St Paul	Minnesota	6	2016	189900
16426	77	St Paul	Minnesota	7	2016	189950
16427	77	St Paul	Minnesota	8	2016	190000
16428	77	St Paul	Minnesota	9	2016	182000
16429	77	St Paul	Minnesota	10	2016	173250
16430	77	St Paul	Minnesota	11	2016	175750
16431	77	St Paul	Minnesota	12	2016	170000
16432	77	St Paul	Minnesota	1	2017	180000
16433	77	St Paul	Minnesota	2	2017	169950
16434	77	St Paul	Minnesota	3	2017	173800
16435	77	St Paul	Minnesota	4	2017	176000
16436	77	St Paul	Minnesota	5	2017	199950
16437	77	St Paul	Minnesota	6	2017	209900
16438	77	St Paul	Minnesota	7	2017	200250
16439	77	St Paul	Minnesota	8	2017	201750
16440	77	St Paul	Minnesota	9	2017	190000
16441	77	St Paul	Minnesota	10	2017	204000
16442	77	St Paul	Minnesota	11	2017	197000
16443	77	St Paul	Minnesota	12	2017	189450
16444	77	St Paul	Minnesota	1	2018	187000
16445	77	St Paul	Minnesota	2	2018	197500
16446	77	St Paul	Minnesota	3	2018	207588
16447	77	St Paul	Minnesota	4	2018	225000
16448	77	St Paul	Minnesota	5	2018	223500
16449	77	St Paul	Minnesota	6	2018	222000
16450	77	St Paul	Minnesota	7	2018	223950
16451	77	St Paul	Minnesota	8	2018	220000
16452	77	St Paul	Minnesota	9	2018	217500
16453	77	St Paul	Minnesota	10	2018	209000
16454	77	St Paul	Minnesota	11	2018	203500
16455	77	St Paul	Minnesota	12	2018	204500
16456	77	St Paul	Minnesota	1	2019	0
16457	78	West St Paul	Minnesota	1	2009	0
16458	78	West St Paul	Minnesota	2	2009	0
16459	78	West St Paul	Minnesota	3	2009	0
16460	78	West St Paul	Minnesota	4	2009	0
16461	78	West St Paul	Minnesota	5	2009	0
16462	78	West St Paul	Minnesota	6	2009	0
16463	78	West St Paul	Minnesota	7	2009	0
16464	78	West St Paul	Minnesota	8	2009	0
16465	78	West St Paul	Minnesota	9	2009	0
16466	78	West St Paul	Minnesota	10	2009	0
16467	78	West St Paul	Minnesota	11	2009	0
16468	78	West St Paul	Minnesota	12	2009	0
16469	78	West St Paul	Minnesota	1	2010	0
16470	78	West St Paul	Minnesota	2	2010	0
16471	78	West St Paul	Minnesota	3	2010	0
16472	78	West St Paul	Minnesota	4	2010	0
16473	78	West St Paul	Minnesota	5	2010	0
16474	78	West St Paul	Minnesota	6	2010	0
16475	78	West St Paul	Minnesota	7	2010	0
16476	78	West St Paul	Minnesota	8	2010	0
16477	78	West St Paul	Minnesota	9	2010	0
16478	78	West St Paul	Minnesota	10	2010	0
16479	78	West St Paul	Minnesota	11	2010	0
16480	78	West St Paul	Minnesota	12	2010	0
16481	78	West St Paul	Minnesota	1	2011	0
16482	78	West St Paul	Minnesota	2	2011	0
16483	78	West St Paul	Minnesota	3	2011	0
16484	78	West St Paul	Minnesota	4	2011	0
16485	78	West St Paul	Minnesota	5	2011	0
16486	78	West St Paul	Minnesota	6	2011	0
16487	78	West St Paul	Minnesota	7	2011	0
16488	78	West St Paul	Minnesota	8	2011	0
16489	78	West St Paul	Minnesota	9	2011	0
16490	78	West St Paul	Minnesota	10	2011	0
16491	78	West St Paul	Minnesota	11	2011	0
16492	78	West St Paul	Minnesota	12	2011	0
16493	78	West St Paul	Minnesota	1	2012	0
16494	78	West St Paul	Minnesota	2	2012	0
16495	78	West St Paul	Minnesota	3	2012	0
16496	78	West St Paul	Minnesota	4	2012	0
16497	78	West St Paul	Minnesota	5	2012	0
16498	78	West St Paul	Minnesota	6	2012	0
16499	78	West St Paul	Minnesota	7	2012	0
16500	78	West St Paul	Minnesota	8	2012	0
16501	78	West St Paul	Minnesota	9	2012	0
16502	78	West St Paul	Minnesota	10	2012	0
16503	78	West St Paul	Minnesota	11	2012	0
16504	78	West St Paul	Minnesota	12	2012	0
16505	78	West St Paul	Minnesota	1	2013	0
16506	78	West St Paul	Minnesota	2	2013	0
16507	78	West St Paul	Minnesota	3	2013	159950
16508	78	West St Paul	Minnesota	4	2013	150000
16509	78	West St Paul	Minnesota	5	2013	0
16510	78	West St Paul	Minnesota	6	2013	0
16511	78	West St Paul	Minnesota	7	2013	0
16512	78	West St Paul	Minnesota	8	2013	0
16513	78	West St Paul	Minnesota	9	2013	178000
16514	78	West St Paul	Minnesota	10	2013	175000
16515	78	West St Paul	Minnesota	11	2013	179900
16516	78	West St Paul	Minnesota	12	2013	186725
16517	78	West St Paul	Minnesota	1	2014	181700
16518	78	West St Paul	Minnesota	2	2014	173361
16519	78	West St Paul	Minnesota	3	2014	168500
16520	78	West St Paul	Minnesota	4	2014	175000
16521	78	West St Paul	Minnesota	5	2014	184500
16522	78	West St Paul	Minnesota	6	2014	194000
16523	78	West St Paul	Minnesota	7	2014	187500
16524	78	West St Paul	Minnesota	8	2014	186000
16525	78	West St Paul	Minnesota	9	2014	181500
16526	78	West St Paul	Minnesota	10	2014	187450
16527	78	West St Paul	Minnesota	11	2014	195000
16528	78	West St Paul	Minnesota	12	2014	189950
16529	78	West St Paul	Minnesota	1	2015	169900
16530	78	West St Paul	Minnesota	2	2015	183250
16531	78	West St Paul	Minnesota	3	2015	175000
16532	78	West St Paul	Minnesota	4	2015	180000
16533	78	West St Paul	Minnesota	5	2015	200000
16534	78	West St Paul	Minnesota	6	2015	194950
16535	78	West St Paul	Minnesota	7	2015	200000
16536	78	West St Paul	Minnesota	8	2015	186000
16537	78	West St Paul	Minnesota	9	2015	196500
16538	78	West St Paul	Minnesota	10	2015	195000
16539	78	West St Paul	Minnesota	11	2015	199900
16540	78	West St Paul	Minnesota	12	2015	183500
16541	78	West St Paul	Minnesota	1	2016	182850
16542	78	West St Paul	Minnesota	2	2016	174500
16543	78	West St Paul	Minnesota	3	2016	195000
16544	78	West St Paul	Minnesota	4	2016	225000
16545	78	West St Paul	Minnesota	5	2016	225700
16546	78	West St Paul	Minnesota	6	2016	204500
16547	78	West St Paul	Minnesota	7	2016	228000
16548	78	West St Paul	Minnesota	8	2016	221500
16549	78	West St Paul	Minnesota	9	2016	195000
16550	78	West St Paul	Minnesota	10	2016	212000
16551	78	West St Paul	Minnesota	11	2016	193000
16552	78	West St Paul	Minnesota	12	2016	204500
16553	78	West St Paul	Minnesota	1	2017	212000
16554	78	West St Paul	Minnesota	2	2017	204900
16555	78	West St Paul	Minnesota	3	2017	200250
16556	78	West St Paul	Minnesota	4	2017	209950
16557	78	West St Paul	Minnesota	5	2017	220000
16558	78	West St Paul	Minnesota	6	2017	230000
16559	78	West St Paul	Minnesota	7	2017	226000
16560	78	West St Paul	Minnesota	8	2017	235250
16561	78	West St Paul	Minnesota	9	2017	232000
16562	78	West St Paul	Minnesota	10	2017	232700
16563	78	West St Paul	Minnesota	11	2017	227750
16564	78	West St Paul	Minnesota	12	2017	215000
16565	78	West St Paul	Minnesota	1	2018	233500
16566	78	West St Paul	Minnesota	2	2018	229500
16567	78	West St Paul	Minnesota	3	2018	224900
16568	78	West St Paul	Minnesota	4	2018	222222
16569	78	West St Paul	Minnesota	5	2018	250000
16570	78	West St Paul	Minnesota	6	2018	243000
16571	78	West St Paul	Minnesota	7	2018	260000
16572	78	West St Paul	Minnesota	8	2018	255000
16573	78	West St Paul	Minnesota	9	2018	238621
16574	78	West St Paul	Minnesota	10	2018	254900
16575	78	West St Paul	Minnesota	11	2018	242000
16576	78	West St Paul	Minnesota	12	2018	245000
16577	78	West St Paul	Minnesota	1	2019	0
16578	80	Manchester	Missouri	1	2009	0
16579	80	Manchester	Missouri	2	2009	0
16580	80	Manchester	Missouri	3	2009	0
16581	80	Manchester	Missouri	4	2009	0
16582	80	Manchester	Missouri	5	2009	0
16583	80	Manchester	Missouri	6	2009	0
16584	80	Manchester	Missouri	7	2009	0
16585	80	Manchester	Missouri	8	2009	0
16586	80	Manchester	Missouri	9	2009	0
16587	80	Manchester	Missouri	10	2009	0
16588	80	Manchester	Missouri	11	2009	0
16589	80	Manchester	Missouri	12	2009	0
16590	80	Manchester	Missouri	1	2010	0
16591	80	Manchester	Missouri	2	2010	0
16592	80	Manchester	Missouri	3	2010	0
16593	80	Manchester	Missouri	4	2010	0
16594	80	Manchester	Missouri	5	2010	0
16595	80	Manchester	Missouri	6	2010	0
16596	80	Manchester	Missouri	7	2010	0
16597	80	Manchester	Missouri	8	2010	0
16598	80	Manchester	Missouri	9	2010	0
16599	80	Manchester	Missouri	10	2010	0
16600	80	Manchester	Missouri	11	2010	0
16601	80	Manchester	Missouri	12	2010	0
16602	80	Manchester	Missouri	1	2011	0
16603	80	Manchester	Missouri	2	2011	0
16604	80	Manchester	Missouri	3	2011	0
16605	80	Manchester	Missouri	4	2011	0
16606	80	Manchester	Missouri	5	2011	0
16607	80	Manchester	Missouri	6	2011	0
16608	80	Manchester	Missouri	7	2011	0
16609	80	Manchester	Missouri	8	2011	0
16610	80	Manchester	Missouri	9	2011	0
16611	80	Manchester	Missouri	10	2011	0
16612	80	Manchester	Missouri	11	2011	0
16613	80	Manchester	Missouri	12	2011	0
16614	80	Manchester	Missouri	1	2012	0
16615	80	Manchester	Missouri	2	2012	0
16616	80	Manchester	Missouri	3	2012	0
16617	80	Manchester	Missouri	4	2012	0
16618	80	Manchester	Missouri	5	2012	0
16619	80	Manchester	Missouri	6	2012	0
16620	80	Manchester	Missouri	7	2012	0
16621	80	Manchester	Missouri	8	2012	0
16622	80	Manchester	Missouri	9	2012	0
16623	80	Manchester	Missouri	10	2012	0
16624	80	Manchester	Missouri	11	2012	0
16625	80	Manchester	Missouri	12	2012	0
16626	80	Manchester	Missouri	1	2013	0
16627	80	Manchester	Missouri	2	2013	0
16628	80	Manchester	Missouri	3	2013	119850
16629	80	Manchester	Missouri	4	2013	161000
16630	80	Manchester	Missouri	5	2013	161000
16631	80	Manchester	Missouri	6	2013	185000
16632	80	Manchester	Missouri	7	2013	187500
16633	80	Manchester	Missouri	8	2013	227000
16634	80	Manchester	Missouri	9	2013	186500
16635	80	Manchester	Missouri	10	2013	183000
16636	80	Manchester	Missouri	11	2013	183000
16637	80	Manchester	Missouri	12	2013	174000
16638	80	Manchester	Missouri	1	2014	174000
16639	80	Manchester	Missouri	2	2014	160000
16640	80	Manchester	Missouri	3	2014	161000
16641	80	Manchester	Missouri	4	2014	162000
16642	80	Manchester	Missouri	5	2014	194900
16643	80	Manchester	Missouri	6	2014	194900
16644	80	Manchester	Missouri	7	2014	193450
16645	80	Manchester	Missouri	8	2014	193450
16646	80	Manchester	Missouri	9	2014	200000
16647	80	Manchester	Missouri	10	2014	207450
16648	80	Manchester	Missouri	11	2014	195000
16649	80	Manchester	Missouri	12	2014	200000
16650	80	Manchester	Missouri	1	2015	195000
16651	80	Manchester	Missouri	2	2015	189950
16652	80	Manchester	Missouri	3	2015	195000
16653	80	Manchester	Missouri	4	2015	204900
16654	80	Manchester	Missouri	5	2015	204900
16655	80	Manchester	Missouri	6	2015	167950
16656	80	Manchester	Missouri	7	2015	171000
16657	80	Manchester	Missouri	8	2015	175000
16658	80	Manchester	Missouri	9	2015	184000
16659	80	Manchester	Missouri	10	2015	184600
16660	80	Manchester	Missouri	11	2015	184000
16661	80	Manchester	Missouri	12	2015	184500
16662	80	Manchester	Missouri	1	2016	205000
16663	80	Manchester	Missouri	2	2016	226950
16664	80	Manchester	Missouri	3	2016	225000
16665	80	Manchester	Missouri	4	2016	215500
16666	80	Manchester	Missouri	5	2016	183900
16667	80	Manchester	Missouri	6	2016	188700
16668	80	Manchester	Missouri	7	2016	201450
16669	80	Manchester	Missouri	8	2016	223000
16670	80	Manchester	Missouri	9	2016	225000
16671	80	Manchester	Missouri	10	2016	225000
16672	80	Manchester	Missouri	11	2016	229629
16673	80	Manchester	Missouri	12	2016	241000
16674	80	Manchester	Missouri	1	2017	207315
16675	80	Manchester	Missouri	2	2017	224000
16676	80	Manchester	Missouri	3	2017	201000
16677	80	Manchester	Missouri	4	2017	220000
16678	80	Manchester	Missouri	5	2017	230000
16679	80	Manchester	Missouri	6	2017	234450
16680	80	Manchester	Missouri	7	2017	232000
16681	80	Manchester	Missouri	8	2017	222500
16682	80	Manchester	Missouri	9	2017	249750
16683	80	Manchester	Missouri	10	2017	242400
16684	80	Manchester	Missouri	11	2017	264900
16685	80	Manchester	Missouri	12	2017	255000
16686	80	Manchester	Missouri	1	2018	240000
16687	80	Manchester	Missouri	2	2018	251000
16688	80	Manchester	Missouri	3	2018	212500
16689	80	Manchester	Missouri	4	2018	218250
16690	80	Manchester	Missouri	5	2018	218250
16691	80	Manchester	Missouri	6	2018	225200
16692	80	Manchester	Missouri	7	2018	235000
16693	80	Manchester	Missouri	8	2018	230450
16694	80	Manchester	Missouri	9	2018	261450
16695	80	Manchester	Missouri	10	2018	283000
16696	80	Manchester	Missouri	11	2018	283000
16697	80	Manchester	Missouri	12	2018	261500
16698	80	Manchester	Missouri	1	2019	0
16699	81	North Kansas City	Missouri	1	2009	0
16700	81	North Kansas City	Missouri	2	2009	0
16701	81	North Kansas City	Missouri	3	2009	0
16702	81	North Kansas City	Missouri	4	2009	0
16703	81	North Kansas City	Missouri	5	2009	0
16704	81	North Kansas City	Missouri	6	2009	0
16705	81	North Kansas City	Missouri	7	2009	0
16706	81	North Kansas City	Missouri	8	2009	0
16707	81	North Kansas City	Missouri	9	2009	0
16708	81	North Kansas City	Missouri	10	2009	0
16709	81	North Kansas City	Missouri	11	2009	0
16710	81	North Kansas City	Missouri	12	2009	0
16711	81	North Kansas City	Missouri	1	2010	0
16712	81	North Kansas City	Missouri	2	2010	0
16713	81	North Kansas City	Missouri	3	2010	0
16714	81	North Kansas City	Missouri	4	2010	0
16715	81	North Kansas City	Missouri	5	2010	0
16716	81	North Kansas City	Missouri	6	2010	0
16717	81	North Kansas City	Missouri	7	2010	0
16718	81	North Kansas City	Missouri	8	2010	0
16719	81	North Kansas City	Missouri	9	2010	0
16720	81	North Kansas City	Missouri	10	2010	0
16721	81	North Kansas City	Missouri	11	2010	0
16722	81	North Kansas City	Missouri	12	2010	0
16723	81	North Kansas City	Missouri	1	2011	0
16724	81	North Kansas City	Missouri	2	2011	0
16725	81	North Kansas City	Missouri	3	2011	0
16726	81	North Kansas City	Missouri	4	2011	0
16727	81	North Kansas City	Missouri	5	2011	0
16728	81	North Kansas City	Missouri	6	2011	0
16729	81	North Kansas City	Missouri	7	2011	0
16730	81	North Kansas City	Missouri	8	2011	0
16731	81	North Kansas City	Missouri	9	2011	0
16732	81	North Kansas City	Missouri	10	2011	0
16733	81	North Kansas City	Missouri	11	2011	0
16734	81	North Kansas City	Missouri	12	2011	0
16735	81	North Kansas City	Missouri	1	2012	0
16736	81	North Kansas City	Missouri	2	2012	65000
16737	81	North Kansas City	Missouri	3	2012	65000
16738	81	North Kansas City	Missouri	4	2012	55000
16739	81	North Kansas City	Missouri	5	2012	30500
16740	81	North Kansas City	Missouri	6	2012	42750
16741	81	North Kansas City	Missouri	7	2012	60000
16742	81	North Kansas City	Missouri	8	2012	67100
16743	81	North Kansas City	Missouri	9	2012	67100
16744	81	North Kansas City	Missouri	10	2012	73550
16745	81	North Kansas City	Missouri	11	2012	57500
16746	81	North Kansas City	Missouri	12	2012	40250
16747	81	North Kansas City	Missouri	1	2013	57500
16748	81	North Kansas City	Missouri	2	2013	83500
16749	81	North Kansas City	Missouri	3	2013	52000
16750	81	North Kansas City	Missouri	4	2013	40800
16751	81	North Kansas City	Missouri	5	2013	61850
16752	81	North Kansas City	Missouri	6	2013	45000
16753	81	North Kansas City	Missouri	7	2013	98500
16754	81	North Kansas City	Missouri	8	2013	79750
16755	81	North Kansas City	Missouri	9	2013	96200
16756	81	North Kansas City	Missouri	10	2013	80000
16757	81	North Kansas City	Missouri	11	2013	80000
16758	81	North Kansas City	Missouri	12	2013	80000
16759	81	North Kansas City	Missouri	1	2014	65000
16760	81	North Kansas City	Missouri	2	2014	63100
16761	81	North Kansas City	Missouri	3	2014	80000
16762	81	North Kansas City	Missouri	4	2014	70600
16763	81	North Kansas City	Missouri	5	2014	89250
16764	81	North Kansas City	Missouri	6	2014	89250
16765	81	North Kansas City	Missouri	7	2014	89250
16766	81	North Kansas City	Missouri	8	2014	114750
16767	81	North Kansas City	Missouri	9	2014	114750
16768	81	North Kansas City	Missouri	10	2014	110950
16769	81	North Kansas City	Missouri	11	2014	103400
16770	81	North Kansas City	Missouri	12	2014	103400
16771	81	North Kansas City	Missouri	1	2015	99900
16772	81	North Kansas City	Missouri	2	2015	103750
16773	81	North Kansas City	Missouri	3	2015	99200
16774	81	North Kansas City	Missouri	4	2015	105000
16775	81	North Kansas City	Missouri	5	2015	105000
16776	81	North Kansas City	Missouri	6	2015	107450
16777	81	North Kansas City	Missouri	7	2015	98500
16778	81	North Kansas City	Missouri	8	2015	112500
16779	81	North Kansas City	Missouri	9	2015	91200
16780	81	North Kansas City	Missouri	10	2015	97500
16781	81	North Kansas City	Missouri	11	2015	98500
16782	81	North Kansas City	Missouri	12	2015	108750
16783	81	North Kansas City	Missouri	1	2016	99500
16784	81	North Kansas City	Missouri	2	2016	93575
16785	81	North Kansas City	Missouri	3	2016	94900
16786	81	North Kansas City	Missouri	4	2016	94900
16787	81	North Kansas City	Missouri	5	2016	89950
16788	81	North Kansas City	Missouri	6	2016	99900
16789	81	North Kansas City	Missouri	7	2016	99900
16790	81	North Kansas City	Missouri	8	2016	99900
16791	81	North Kansas City	Missouri	9	2016	98700
16792	81	North Kansas City	Missouri	10	2016	97500
16793	81	North Kansas City	Missouri	11	2016	97500
16794	81	North Kansas City	Missouri	12	2016	74000
16795	81	North Kansas City	Missouri	1	2017	71950
16796	81	North Kansas City	Missouri	2	2017	70000
16797	81	North Kansas City	Missouri	3	2017	84900
16798	81	North Kansas City	Missouri	4	2017	87450
16799	81	North Kansas City	Missouri	5	2017	84900
16800	81	North Kansas City	Missouri	6	2017	113450
16801	81	North Kansas City	Missouri	7	2017	113450
16802	81	North Kansas City	Missouri	8	2017	114900
16803	81	North Kansas City	Missouri	9	2017	115000
16804	81	North Kansas City	Missouri	10	2017	115000
16805	81	North Kansas City	Missouri	11	2017	125000
16806	81	North Kansas City	Missouri	12	2017	125000
16807	81	North Kansas City	Missouri	1	2018	120000
16808	81	North Kansas City	Missouri	2	2018	115000
16809	81	North Kansas City	Missouri	3	2018	115000
16810	81	North Kansas City	Missouri	4	2018	113750
16811	81	North Kansas City	Missouri	5	2018	112500
16812	81	North Kansas City	Missouri	6	2018	135000
16813	81	North Kansas City	Missouri	7	2018	132250
16814	81	North Kansas City	Missouri	8	2018	132200
16815	81	North Kansas City	Missouri	9	2018	132200
16816	81	North Kansas City	Missouri	10	2018	130000
16817	81	North Kansas City	Missouri	11	2018	130000
16818	81	North Kansas City	Missouri	12	2018	129900
16819	81	North Kansas City	Missouri	1	2019	0
16820	84	North Las Vegas	Nevada	1	2009	0
16821	84	North Las Vegas	Nevada	2	2009	0
16822	84	North Las Vegas	Nevada	3	2009	0
16823	84	North Las Vegas	Nevada	4	2009	0
16824	84	North Las Vegas	Nevada	5	2009	0
16825	84	North Las Vegas	Nevada	6	2009	0
16826	84	North Las Vegas	Nevada	7	2009	0
16827	84	North Las Vegas	Nevada	8	2009	0
16828	84	North Las Vegas	Nevada	9	2009	0
16829	84	North Las Vegas	Nevada	10	2009	0
16830	84	North Las Vegas	Nevada	11	2009	0
16831	84	North Las Vegas	Nevada	12	2009	0
16832	84	North Las Vegas	Nevada	1	2010	0
16833	84	North Las Vegas	Nevada	2	2010	0
16834	84	North Las Vegas	Nevada	3	2010	0
16835	84	North Las Vegas	Nevada	4	2010	0
16836	84	North Las Vegas	Nevada	5	2010	0
16837	84	North Las Vegas	Nevada	6	2010	0
16838	84	North Las Vegas	Nevada	7	2010	0
16839	84	North Las Vegas	Nevada	8	2010	0
16840	84	North Las Vegas	Nevada	9	2010	0
16841	84	North Las Vegas	Nevada	10	2010	0
16842	84	North Las Vegas	Nevada	11	2010	0
16843	84	North Las Vegas	Nevada	12	2010	0
16844	84	North Las Vegas	Nevada	1	2011	0
16845	84	North Las Vegas	Nevada	2	2011	0
16846	84	North Las Vegas	Nevada	3	2011	0
16847	84	North Las Vegas	Nevada	4	2011	0
16848	84	North Las Vegas	Nevada	5	2011	0
16849	84	North Las Vegas	Nevada	6	2011	0
16850	84	North Las Vegas	Nevada	7	2011	0
16851	84	North Las Vegas	Nevada	8	2011	0
16852	84	North Las Vegas	Nevada	9	2011	0
16853	84	North Las Vegas	Nevada	10	2011	0
16854	84	North Las Vegas	Nevada	11	2011	0
16855	84	North Las Vegas	Nevada	12	2011	0
16856	84	North Las Vegas	Nevada	1	2012	90000
16857	84	North Las Vegas	Nevada	2	2012	90000
16858	84	North Las Vegas	Nevada	3	2012	93000
16859	84	North Las Vegas	Nevada	4	2012	95000
16860	84	North Las Vegas	Nevada	5	2012	100000
16861	84	North Las Vegas	Nevada	6	2012	105750
16862	84	North Las Vegas	Nevada	7	2012	108000
16863	84	North Las Vegas	Nevada	8	2012	110000
16864	84	North Las Vegas	Nevada	9	2012	110000
16865	84	North Las Vegas	Nevada	10	2012	114000
16866	84	North Las Vegas	Nevada	11	2012	120000
16867	84	North Las Vegas	Nevada	12	2012	115000
16868	84	North Las Vegas	Nevada	1	2013	115500
16869	84	North Las Vegas	Nevada	2	2013	126000
16870	84	North Las Vegas	Nevada	3	2013	130000
16871	84	North Las Vegas	Nevada	4	2013	134900
16872	84	North Las Vegas	Nevada	5	2013	135000
16873	84	North Las Vegas	Nevada	6	2013	140000
16874	84	North Las Vegas	Nevada	7	2013	150000
16875	84	North Las Vegas	Nevada	8	2013	149000
16876	84	North Las Vegas	Nevada	9	2013	150000
16877	84	North Las Vegas	Nevada	10	2013	155000
16878	84	North Las Vegas	Nevada	11	2013	150500
16879	84	North Las Vegas	Nevada	12	2013	151200
16880	84	North Las Vegas	Nevada	1	2014	153000
16881	84	North Las Vegas	Nevada	2	2014	155000
16882	84	North Las Vegas	Nevada	3	2014	160400
16883	84	North Las Vegas	Nevada	4	2014	160000
16884	84	North Las Vegas	Nevada	5	2014	155000
16885	84	North Las Vegas	Nevada	6	2014	160000
16886	84	North Las Vegas	Nevada	7	2014	164900
16887	84	North Las Vegas	Nevada	8	2014	170000
16888	84	North Las Vegas	Nevada	9	2014	168000
16889	84	North Las Vegas	Nevada	10	2014	162000
16890	84	North Las Vegas	Nevada	11	2014	165000
16891	84	North Las Vegas	Nevada	12	2014	164675
16892	84	North Las Vegas	Nevada	1	2015	158950
16893	84	North Las Vegas	Nevada	2	2015	170000
16894	84	North Las Vegas	Nevada	3	2015	170500
16895	84	North Las Vegas	Nevada	4	2015	174950
16896	84	North Las Vegas	Nevada	5	2015	174450
16897	84	North Las Vegas	Nevada	6	2015	180000
16898	84	North Las Vegas	Nevada	7	2015	175000
16899	84	North Las Vegas	Nevada	8	2015	180000
16900	84	North Las Vegas	Nevada	9	2015	176750
16901	84	North Las Vegas	Nevada	10	2015	178000
16902	84	North Las Vegas	Nevada	11	2015	175000
16903	84	North Las Vegas	Nevada	12	2015	177000
16904	84	North Las Vegas	Nevada	1	2016	180000
16905	84	North Las Vegas	Nevada	2	2016	172500
16906	84	North Las Vegas	Nevada	3	2016	188000
16907	84	North Las Vegas	Nevada	4	2016	188000
16908	84	North Las Vegas	Nevada	5	2016	190000
16909	84	North Las Vegas	Nevada	6	2016	189000
16910	84	North Las Vegas	Nevada	7	2016	190000
16911	84	North Las Vegas	Nevada	8	2016	195000
16912	84	North Las Vegas	Nevada	9	2016	195498
16913	84	North Las Vegas	Nevada	10	2016	192500
16914	84	North Las Vegas	Nevada	11	2016	195000
16915	84	North Las Vegas	Nevada	12	2016	195000
16916	84	North Las Vegas	Nevada	1	2017	195000
16917	84	North Las Vegas	Nevada	2	2017	200000
16918	84	North Las Vegas	Nevada	3	2017	206500
16919	84	North Las Vegas	Nevada	4	2017	208000
16920	84	North Las Vegas	Nevada	5	2017	211000
16921	84	North Las Vegas	Nevada	6	2017	215000
16922	84	North Las Vegas	Nevada	7	2017	224000
16923	84	North Las Vegas	Nevada	8	2017	221000
16924	84	North Las Vegas	Nevada	9	2017	225000
16925	84	North Las Vegas	Nevada	10	2017	230000
16926	84	North Las Vegas	Nevada	11	2017	225000
16927	84	North Las Vegas	Nevada	12	2017	230000
16928	84	North Las Vegas	Nevada	1	2018	235000
16929	84	North Las Vegas	Nevada	2	2018	232500
16930	84	North Las Vegas	Nevada	3	2018	243000
16931	84	North Las Vegas	Nevada	4	2018	250000
16932	84	North Las Vegas	Nevada	5	2018	250800
16933	84	North Las Vegas	Nevada	6	2018	255000
16934	84	North Las Vegas	Nevada	7	2018	258000
16935	84	North Las Vegas	Nevada	8	2018	264950
16936	84	North Las Vegas	Nevada	9	2018	260000
16937	84	North Las Vegas	Nevada	10	2018	260050
16938	84	North Las Vegas	Nevada	11	2018	257200
16939	84	North Las Vegas	Nevada	12	2018	265000
16940	84	North Las Vegas	Nevada	1	2019	0
16941	86	Salem	New Hampshire	1	2009	0
16942	86	Salem	New Hampshire	2	2009	0
16943	86	Salem	New Hampshire	3	2009	0
16944	86	Salem	New Hampshire	4	2009	0
16945	86	Salem	New Hampshire	5	2009	0
16946	86	Salem	New Hampshire	6	2009	0
16947	86	Salem	New Hampshire	7	2009	0
16948	86	Salem	New Hampshire	8	2009	0
16949	86	Salem	New Hampshire	9	2009	0
16950	86	Salem	New Hampshire	10	2009	0
16951	86	Salem	New Hampshire	11	2009	0
16952	86	Salem	New Hampshire	12	2009	0
16953	86	Salem	New Hampshire	1	2010	0
16954	86	Salem	New Hampshire	2	2010	0
16955	86	Salem	New Hampshire	3	2010	0
16956	86	Salem	New Hampshire	4	2010	0
16957	86	Salem	New Hampshire	5	2010	0
16958	86	Salem	New Hampshire	6	2010	0
16959	86	Salem	New Hampshire	7	2010	0
16960	86	Salem	New Hampshire	8	2010	0
16961	86	Salem	New Hampshire	9	2010	0
16962	86	Salem	New Hampshire	10	2010	0
16963	86	Salem	New Hampshire	11	2010	0
16964	86	Salem	New Hampshire	12	2010	0
16965	86	Salem	New Hampshire	1	2011	0
16966	86	Salem	New Hampshire	2	2011	0
16967	86	Salem	New Hampshire	3	2011	0
16968	86	Salem	New Hampshire	4	2011	0
16969	86	Salem	New Hampshire	5	2011	0
16970	86	Salem	New Hampshire	6	2011	0
16971	86	Salem	New Hampshire	7	2011	0
16972	86	Salem	New Hampshire	8	2011	0
16973	86	Salem	New Hampshire	9	2011	0
16974	86	Salem	New Hampshire	10	2011	0
16975	86	Salem	New Hampshire	11	2011	0
16976	86	Salem	New Hampshire	12	2011	0
16977	86	Salem	New Hampshire	1	2012	235000
16978	86	Salem	New Hampshire	2	2012	312500
16979	86	Salem	New Hampshire	3	2012	165900
16980	86	Salem	New Hampshire	4	2012	140450
16981	86	Salem	New Hampshire	5	2012	176700
16982	86	Salem	New Hampshire	6	2012	214750
16983	86	Salem	New Hampshire	7	2012	228500
16984	86	Salem	New Hampshire	8	2012	252500
16985	86	Salem	New Hampshire	9	2012	255000
16986	86	Salem	New Hampshire	10	2012	250500
16987	86	Salem	New Hampshire	11	2012	251650
16988	86	Salem	New Hampshire	12	2012	246000
16989	86	Salem	New Hampshire	1	2013	257300
16990	86	Salem	New Hampshire	2	2013	218750
16991	86	Salem	New Hampshire	3	2013	210000
16992	86	Salem	New Hampshire	4	2013	200000
16993	86	Salem	New Hampshire	5	2013	200000
16994	86	Salem	New Hampshire	6	2013	200000
16995	86	Salem	New Hampshire	7	2013	300000
16996	86	Salem	New Hampshire	8	2013	355000
16997	86	Salem	New Hampshire	9	2013	320000
16998	86	Salem	New Hampshire	10	2013	285000
16999	86	Salem	New Hampshire	11	2013	255000
17000	86	Salem	New Hampshire	12	2013	105000
17001	86	Salem	New Hampshire	1	2014	252450
17002	86	Salem	New Hampshire	2	2014	196767
17003	86	Salem	New Hampshire	3	2014	299267
17004	86	Salem	New Hampshire	4	2014	273533
17005	86	Salem	New Hampshire	5	2014	261250
17006	86	Salem	New Hampshire	6	2014	275000
17007	86	Salem	New Hampshire	7	2014	256250
17008	86	Salem	New Hampshire	8	2014	377500
17009	86	Salem	New Hampshire	9	2014	315000
17010	86	Salem	New Hampshire	10	2014	399000
17011	86	Salem	New Hampshire	11	2014	347000
17012	86	Salem	New Hampshire	12	2014	360000
17013	86	Salem	New Hampshire	1	2015	347000
17014	86	Salem	New Hampshire	2	2015	360000
17015	86	Salem	New Hampshire	3	2015	174000
17016	86	Salem	New Hampshire	4	2015	268000
17017	86	Salem	New Hampshire	5	2015	295000
17018	86	Salem	New Hampshire	6	2015	277500
17019	86	Salem	New Hampshire	7	2015	322500
17020	86	Salem	New Hampshire	8	2015	334000
17021	86	Salem	New Hampshire	9	2015	334933
17022	86	Salem	New Hampshire	10	2015	334467
17023	86	Salem	New Hampshire	11	2015	361333
17024	86	Salem	New Hampshire	12	2015	340667
17025	86	Salem	New Hampshire	1	2016	282200
17026	86	Salem	New Hampshire	2	2016	282200
17027	86	Salem	New Hampshire	3	2016	316233
17028	86	Salem	New Hampshire	4	2016	289933
17029	86	Salem	New Hampshire	5	2016	308267
17030	86	Salem	New Hampshire	6	2016	274000
17031	86	Salem	New Hampshire	7	2016	425000
17032	86	Salem	New Hampshire	8	2016	425000
17033	86	Salem	New Hampshire	9	2016	323467
17034	86	Salem	New Hampshire	10	2016	329933
17035	86	Salem	New Hampshire	11	2016	334200
17036	86	Salem	New Hampshire	12	2016	334200
17037	86	Salem	New Hampshire	1	2017	307000
17038	86	Salem	New Hampshire	2	2017	306000
17039	86	Salem	New Hampshire	3	2017	375000
17040	86	Salem	New Hampshire	4	2017	290367
17041	86	Salem	New Hampshire	5	2017	333800
17042	86	Salem	New Hampshire	6	2017	410410
17043	86	Salem	New Hampshire	7	2017	557500
17044	86	Salem	New Hampshire	8	2017	490000
17045	86	Salem	New Hampshire	9	2017	379900
17046	86	Salem	New Hampshire	10	2017	307533
17047	86	Salem	New Hampshire	11	2017	307533
17048	86	Salem	New Hampshire	12	2017	281267
17049	86	Salem	New Hampshire	1	2018	314933
17050	86	Salem	New Hampshire	2	2018	276067
17051	86	Salem	New Hampshire	3	2018	276067
17052	86	Salem	New Hampshire	4	2018	293600
17053	86	Salem	New Hampshire	5	2018	382667
17054	86	Salem	New Hampshire	6	2018	372500
17055	86	Salem	New Hampshire	7	2018	402450
17056	86	Salem	New Hampshire	8	2018	409900
17057	86	Salem	New Hampshire	9	2018	374450
17058	86	Salem	New Hampshire	10	2018	335000
17059	86	Salem	New Hampshire	11	2018	321000
17060	86	Salem	New Hampshire	12	2018	327000
17061	86	Salem	New Hampshire	1	2019	0
17062	87	Burlington	New Jersey	1	2009	0
17063	87	Burlington	New Jersey	2	2009	0
17064	87	Burlington	New Jersey	3	2009	0
17065	87	Burlington	New Jersey	4	2009	0
17066	87	Burlington	New Jersey	5	2009	0
17067	87	Burlington	New Jersey	6	2009	0
17068	87	Burlington	New Jersey	7	2009	0
17069	87	Burlington	New Jersey	8	2009	0
17070	87	Burlington	New Jersey	9	2009	0
17071	87	Burlington	New Jersey	10	2009	0
17072	87	Burlington	New Jersey	11	2009	0
17073	87	Burlington	New Jersey	12	2009	0
17074	87	Burlington	New Jersey	1	2010	0
17075	87	Burlington	New Jersey	2	2010	0
17076	87	Burlington	New Jersey	3	2010	0
17077	87	Burlington	New Jersey	4	2010	0
17078	87	Burlington	New Jersey	5	2010	0
17079	87	Burlington	New Jersey	6	2010	0
17080	87	Burlington	New Jersey	7	2010	0
17081	87	Burlington	New Jersey	8	2010	0
17082	87	Burlington	New Jersey	9	2010	0
17083	87	Burlington	New Jersey	10	2010	0
17084	87	Burlington	New Jersey	11	2010	0
17085	87	Burlington	New Jersey	12	2010	0
17086	87	Burlington	New Jersey	1	2011	0
17087	87	Burlington	New Jersey	2	2011	0
17088	87	Burlington	New Jersey	3	2011	0
17089	87	Burlington	New Jersey	4	2011	0
17090	87	Burlington	New Jersey	5	2011	0
17091	87	Burlington	New Jersey	6	2011	0
17092	87	Burlington	New Jersey	7	2011	0
17093	87	Burlington	New Jersey	8	2011	0
17094	87	Burlington	New Jersey	9	2011	0
17095	87	Burlington	New Jersey	10	2011	0
17096	87	Burlington	New Jersey	11	2011	0
17097	87	Burlington	New Jersey	12	2011	0
17098	87	Burlington	New Jersey	1	2012	194950
17099	87	Burlington	New Jersey	2	2012	187000
17100	87	Burlington	New Jersey	3	2012	175000
17101	87	Burlington	New Jersey	4	2012	199900
17102	87	Burlington	New Jersey	5	2012	196000
17103	87	Burlington	New Jersey	6	2012	198250
17104	87	Burlington	New Jersey	7	2012	214000
17105	87	Burlington	New Jersey	8	2012	205000
17106	87	Burlington	New Jersey	9	2012	200000
17107	87	Burlington	New Jersey	10	2012	204000
17108	87	Burlington	New Jersey	11	2012	202000
17109	87	Burlington	New Jersey	12	2012	205000
17110	87	Burlington	New Jersey	1	2013	212000
17111	87	Burlington	New Jersey	2	2013	168875
17112	87	Burlington	New Jersey	3	2013	181000
17113	87	Burlington	New Jersey	4	2013	199000
17114	87	Burlington	New Jersey	5	2013	205000
17115	87	Burlington	New Jersey	6	2013	207000
17116	87	Burlington	New Jersey	7	2013	220000
17117	87	Burlington	New Jersey	8	2013	224450
17118	87	Burlington	New Jersey	9	2013	213500
17119	87	Burlington	New Jersey	10	2013	216000
17120	87	Burlington	New Jersey	11	2013	195675
17121	87	Burlington	New Jersey	12	2013	189450
17122	87	Burlington	New Jersey	1	2014	184950
17123	87	Burlington	New Jersey	2	2014	185500
17124	87	Burlington	New Jersey	3	2014	176500
17125	87	Burlington	New Jersey	4	2014	181000
17126	87	Burlington	New Jersey	5	2014	181000
17127	87	Burlington	New Jersey	6	2014	199950
17128	87	Burlington	New Jersey	7	2014	219900
17129	87	Burlington	New Jersey	8	2014	217450
17130	87	Burlington	New Jersey	9	2014	209000
17131	87	Burlington	New Jersey	10	2014	194000
17132	87	Burlington	New Jersey	11	2014	188000
17133	87	Burlington	New Jersey	12	2014	190500
17134	87	Burlington	New Jersey	1	2015	186500
17135	87	Burlington	New Jersey	2	2015	195000
17136	87	Burlington	New Jersey	3	2015	180000
17137	87	Burlington	New Jersey	4	2015	185000
17138	87	Burlington	New Jersey	5	2015	207500
17139	87	Burlington	New Jersey	6	2015	200000
17140	87	Burlington	New Jersey	7	2015	230000
17141	87	Burlington	New Jersey	8	2015	214500
17142	87	Burlington	New Jersey	9	2015	210350
17143	87	Burlington	New Jersey	10	2015	195000
17144	87	Burlington	New Jersey	11	2015	195000
17145	87	Burlington	New Jersey	12	2015	188000
17146	87	Burlington	New Jersey	1	2016	170000
17147	87	Burlington	New Jersey	2	2016	170000
17148	87	Burlington	New Jersey	3	2016	173000
17149	87	Burlington	New Jersey	4	2016	185000
17150	87	Burlington	New Jersey	5	2016	197000
17151	87	Burlington	New Jersey	6	2016	203590
17152	87	Burlington	New Jersey	7	2016	220450
17153	87	Burlington	New Jersey	8	2016	209900
17154	87	Burlington	New Jersey	9	2016	210000
17155	87	Burlington	New Jersey	10	2016	196100
17156	87	Burlington	New Jersey	11	2016	187500
17157	87	Burlington	New Jersey	12	2016	182500
17158	87	Burlington	New Jersey	1	2017	172000
17159	87	Burlington	New Jersey	2	2017	170500
17160	87	Burlington	New Jersey	3	2017	170000
17161	87	Burlington	New Jersey	4	2017	173750
17162	87	Burlington	New Jersey	5	2017	187300
17163	87	Burlington	New Jersey	6	2017	190000
17164	87	Burlington	New Jersey	7	2017	210000
17165	87	Burlington	New Jersey	8	2017	199950
17166	87	Burlington	New Jersey	9	2017	200000
17167	87	Burlington	New Jersey	10	2017	200000
17168	87	Burlington	New Jersey	11	2017	200000
17169	87	Burlington	New Jersey	12	2017	180000
17170	87	Burlington	New Jersey	1	2018	179400
17171	87	Burlington	New Jersey	2	2018	173000
17172	87	Burlington	New Jersey	3	2018	187500
17173	87	Burlington	New Jersey	4	2018	183900
17174	87	Burlington	New Jersey	5	2018	199000
17175	87	Burlington	New Jersey	6	2018	199300
17176	87	Burlington	New Jersey	7	2018	211000
17177	87	Burlington	New Jersey	8	2018	215000
17178	87	Burlington	New Jersey	9	2018	210500
17179	87	Burlington	New Jersey	10	2018	198750
17180	87	Burlington	New Jersey	11	2018	198000
17181	87	Burlington	New Jersey	12	2018	191294
17182	87	Burlington	New Jersey	1	2019	0
17183	88	Trenton	New Jersey	1	2009	0
17184	88	Trenton	New Jersey	2	2009	0
17185	88	Trenton	New Jersey	3	2009	0
17186	88	Trenton	New Jersey	4	2009	0
17187	88	Trenton	New Jersey	5	2009	0
17188	88	Trenton	New Jersey	6	2009	0
17189	88	Trenton	New Jersey	7	2009	0
17190	88	Trenton	New Jersey	8	2009	0
17191	88	Trenton	New Jersey	9	2009	0
17192	88	Trenton	New Jersey	10	2009	0
17193	88	Trenton	New Jersey	11	2009	0
17194	88	Trenton	New Jersey	12	2009	0
17195	88	Trenton	New Jersey	1	2010	212000
17196	88	Trenton	New Jersey	2	2010	225000
17197	88	Trenton	New Jersey	3	2010	205000
17198	88	Trenton	New Jersey	4	2010	221500
17199	88	Trenton	New Jersey	5	2010	229000
17200	88	Trenton	New Jersey	6	2010	240000
17201	88	Trenton	New Jersey	7	2010	292000
17202	88	Trenton	New Jersey	8	2010	277875
17203	88	Trenton	New Jersey	9	2010	247900
17204	88	Trenton	New Jersey	10	2010	209500
17205	88	Trenton	New Jersey	11	2010	229000
17206	88	Trenton	New Jersey	12	2010	245000
17207	88	Trenton	New Jersey	1	2011	230000
17208	88	Trenton	New Jersey	2	2011	200000
17209	88	Trenton	New Jersey	3	2011	199000
17210	88	Trenton	New Jersey	4	2011	220000
17211	88	Trenton	New Jersey	5	2011	225000
17212	88	Trenton	New Jersey	6	2011	240500
17213	88	Trenton	New Jersey	7	2011	251250
17214	88	Trenton	New Jersey	8	2011	260000
17215	88	Trenton	New Jersey	9	2011	236000
17216	88	Trenton	New Jersey	10	2011	220000
17217	88	Trenton	New Jersey	11	2011	222000
17218	88	Trenton	New Jersey	12	2011	215750
17219	88	Trenton	New Jersey	1	2012	213500
17220	88	Trenton	New Jersey	2	2012	192000
17221	88	Trenton	New Jersey	3	2012	180000
17222	88	Trenton	New Jersey	4	2012	206000
17223	88	Trenton	New Jersey	5	2012	220000
17224	88	Trenton	New Jersey	6	2012	249000
17225	88	Trenton	New Jersey	7	2012	286050
17226	88	Trenton	New Jersey	8	2012	255000
17227	88	Trenton	New Jersey	9	2012	242500
17228	88	Trenton	New Jersey	10	2012	217500
17229	88	Trenton	New Jersey	11	2012	225750
17230	88	Trenton	New Jersey	12	2012	229500
17231	88	Trenton	New Jersey	1	2013	206000
17232	88	Trenton	New Jersey	2	2013	178000
17233	88	Trenton	New Jersey	3	2013	191250
17234	88	Trenton	New Jersey	4	2013	230000
17235	88	Trenton	New Jersey	5	2013	241000
17236	88	Trenton	New Jersey	6	2013	258000
17237	88	Trenton	New Jersey	7	2013	295000
17238	88	Trenton	New Jersey	8	2013	259000
17239	88	Trenton	New Jersey	9	2013	250000
17240	88	Trenton	New Jersey	10	2013	243800
17241	88	Trenton	New Jersey	11	2013	196675
17242	88	Trenton	New Jersey	12	2013	229000
17243	88	Trenton	New Jersey	1	2014	200000
17244	88	Trenton	New Jersey	2	2014	215050
17245	88	Trenton	New Jersey	3	2014	191250
17246	88	Trenton	New Jersey	4	2014	231000
17247	88	Trenton	New Jersey	5	2014	238000
17248	88	Trenton	New Jersey	6	2014	257500
17249	88	Trenton	New Jersey	7	2014	305000
17250	88	Trenton	New Jersey	8	2014	297500
17251	88	Trenton	New Jersey	9	2014	227500
17252	88	Trenton	New Jersey	10	2014	220000
17253	88	Trenton	New Jersey	11	2014	239900
17254	88	Trenton	New Jersey	12	2014	232000
17255	88	Trenton	New Jersey	1	2015	195000
17256	88	Trenton	New Jersey	2	2015	220000
17257	88	Trenton	New Jersey	3	2015	220000
17258	88	Trenton	New Jersey	4	2015	216250
17259	88	Trenton	New Jersey	5	2015	225500
17260	88	Trenton	New Jersey	6	2015	268700
17261	88	Trenton	New Jersey	7	2015	285000
17262	88	Trenton	New Jersey	8	2015	280000
17263	88	Trenton	New Jersey	9	2015	255450
17264	88	Trenton	New Jersey	10	2015	226500
17265	88	Trenton	New Jersey	11	2015	212500
17266	88	Trenton	New Jersey	12	2015	206000
17267	88	Trenton	New Jersey	1	2016	230000
17268	88	Trenton	New Jersey	2	2016	193000
17269	88	Trenton	New Jersey	3	2016	174000
17270	88	Trenton	New Jersey	4	2016	218500
17271	88	Trenton	New Jersey	5	2016	225000
17272	88	Trenton	New Jersey	6	2016	252000
17273	88	Trenton	New Jersey	7	2016	268000
17274	88	Trenton	New Jersey	8	2016	263000
17275	88	Trenton	New Jersey	9	2016	248500
17276	88	Trenton	New Jersey	10	2016	230000
17277	88	Trenton	New Jersey	11	2016	229000
17278	88	Trenton	New Jersey	12	2016	219900
17279	88	Trenton	New Jersey	1	2017	190000
17280	88	Trenton	New Jersey	2	2017	195000
17281	88	Trenton	New Jersey	3	2017	186000
17282	88	Trenton	New Jersey	4	2017	236000
17283	88	Trenton	New Jersey	5	2017	230000
17284	88	Trenton	New Jersey	6	2017	240000
17285	88	Trenton	New Jersey	7	2017	254750
17286	88	Trenton	New Jersey	8	2017	276500
17287	88	Trenton	New Jersey	9	2017	242250
17288	88	Trenton	New Jersey	10	2017	210900
17289	88	Trenton	New Jersey	11	2017	220000
17290	88	Trenton	New Jersey	12	2017	228500
17291	88	Trenton	New Jersey	1	2018	217500
17292	88	Trenton	New Jersey	2	2018	195000
17293	88	Trenton	New Jersey	3	2018	192000
17294	88	Trenton	New Jersey	4	2018	198500
17295	88	Trenton	New Jersey	5	2018	234500
17296	88	Trenton	New Jersey	6	2018	270000
17297	88	Trenton	New Jersey	7	2018	275500
17298	88	Trenton	New Jersey	8	2018	255000
17299	88	Trenton	New Jersey	9	2018	234500
17300	88	Trenton	New Jersey	10	2018	230000
17301	88	Trenton	New Jersey	11	2018	225000
17302	88	Trenton	New Jersey	12	2018	222500
17303	88	Trenton	New Jersey	1	2019	0
17304	91	Charlottee	North Carolina	1	2009	0
17305	91	Charlottee	North Carolina	2	2009	0
17306	91	Charlottee	North Carolina	3	2009	0
17307	91	Charlottee	North Carolina	4	2009	0
17308	91	Charlottee	North Carolina	5	2009	0
17309	91	Charlottee	North Carolina	6	2009	0
17310	91	Charlottee	North Carolina	7	2009	0
17311	91	Charlottee	North Carolina	8	2009	0
17312	91	Charlottee	North Carolina	9	2009	0
17313	91	Charlottee	North Carolina	10	2009	0
17314	91	Charlottee	North Carolina	11	2009	0
17315	91	Charlottee	North Carolina	12	2009	0
17316	91	Charlottee	North Carolina	1	2010	0
17317	91	Charlottee	North Carolina	2	2010	0
17318	91	Charlottee	North Carolina	3	2010	0
17319	91	Charlottee	North Carolina	4	2010	0
17320	91	Charlottee	North Carolina	5	2010	0
17321	91	Charlottee	North Carolina	6	2010	0
17322	91	Charlottee	North Carolina	7	2010	0
17323	91	Charlottee	North Carolina	8	2010	0
17324	91	Charlottee	North Carolina	9	2010	0
17325	91	Charlottee	North Carolina	10	2010	0
17326	91	Charlottee	North Carolina	11	2010	0
17327	91	Charlottee	North Carolina	12	2010	0
17328	91	Charlottee	North Carolina	1	2011	0
17329	91	Charlottee	North Carolina	2	2011	0
17330	91	Charlottee	North Carolina	3	2011	0
17331	91	Charlottee	North Carolina	4	2011	0
17332	91	Charlottee	North Carolina	5	2011	0
17333	91	Charlottee	North Carolina	6	2011	0
17334	91	Charlottee	North Carolina	7	2011	0
17335	91	Charlottee	North Carolina	8	2011	0
17336	91	Charlottee	North Carolina	9	2011	0
17337	91	Charlottee	North Carolina	10	2011	0
17338	91	Charlottee	North Carolina	11	2011	0
17339	91	Charlottee	North Carolina	12	2011	0
17340	91	Charlottee	North Carolina	1	2012	0
17341	91	Charlottee	North Carolina	2	2012	0
17342	91	Charlottee	North Carolina	3	2012	0
17343	91	Charlottee	North Carolina	4	2012	0
17344	91	Charlottee	North Carolina	5	2012	0
17345	91	Charlottee	North Carolina	6	2012	0
17346	91	Charlottee	North Carolina	7	2012	0
17347	91	Charlottee	North Carolina	8	2012	0
17348	91	Charlottee	North Carolina	9	2012	0
17349	91	Charlottee	North Carolina	10	2012	0
17350	91	Charlottee	North Carolina	11	2012	0
17351	91	Charlottee	North Carolina	12	2012	0
17352	91	Charlottee	North Carolina	1	2013	155000
17353	91	Charlottee	North Carolina	2	2013	160460
17354	91	Charlottee	North Carolina	3	2013	170000
17355	91	Charlottee	North Carolina	4	2013	172000
17356	91	Charlottee	North Carolina	5	2013	180000
17357	91	Charlottee	North Carolina	6	2013	189000
17358	91	Charlottee	North Carolina	7	2013	187500
17359	91	Charlottee	North Carolina	8	2013	186000
17360	91	Charlottee	North Carolina	9	2013	174000
17361	91	Charlottee	North Carolina	10	2013	176000
17362	91	Charlottee	North Carolina	11	2013	176500
17363	91	Charlottee	North Carolina	12	2013	180000
17364	91	Charlottee	North Carolina	1	2014	170000
17365	91	Charlottee	North Carolina	2	2014	170215
17366	91	Charlottee	North Carolina	3	2014	180000
17367	91	Charlottee	North Carolina	4	2014	182000
17368	91	Charlottee	North Carolina	5	2014	190500
17369	91	Charlottee	North Carolina	6	2014	200000
17370	91	Charlottee	North Carolina	7	2014	195000
17371	91	Charlottee	North Carolina	8	2014	190000
17372	91	Charlottee	North Carolina	9	2014	185000
17373	91	Charlottee	North Carolina	10	2014	180100
17374	91	Charlottee	North Carolina	11	2014	183000
17375	91	Charlottee	North Carolina	12	2014	189000
17376	91	Charlottee	North Carolina	1	2015	171500
17377	91	Charlottee	North Carolina	2	2015	183000
17378	91	Charlottee	North Carolina	3	2015	198000
17379	91	Charlottee	North Carolina	4	2015	196000
17380	91	Charlottee	North Carolina	5	2015	207000
17381	91	Charlottee	North Carolina	6	2015	214450
17382	91	Charlottee	North Carolina	7	2015	210000
17383	91	Charlottee	North Carolina	8	2015	205000
17384	91	Charlottee	North Carolina	9	2015	195000
17385	91	Charlottee	North Carolina	10	2015	193000
17386	91	Charlottee	North Carolina	11	2015	203000
17387	91	Charlottee	North Carolina	12	2015	195000
17388	91	Charlottee	North Carolina	1	2016	185000
17389	91	Charlottee	North Carolina	2	2016	188000
17390	91	Charlottee	North Carolina	3	2016	201826
17391	91	Charlottee	North Carolina	4	2016	207000
17392	91	Charlottee	North Carolina	5	2016	215000
17393	91	Charlottee	North Carolina	6	2016	225000
17394	91	Charlottee	North Carolina	7	2016	220000
17395	91	Charlottee	North Carolina	8	2016	225000
17396	91	Charlottee	North Carolina	9	2016	210000
17397	91	Charlottee	North Carolina	10	2016	211000
17398	91	Charlottee	North Carolina	11	2016	215000
17399	91	Charlottee	North Carolina	12	2016	217000
17400	91	Charlottee	North Carolina	1	2017	210500
17401	91	Charlottee	North Carolina	2	2017	210000
17402	91	Charlottee	North Carolina	3	2017	227000
17403	91	Charlottee	North Carolina	4	2017	233000
17404	91	Charlottee	North Carolina	5	2017	228000
17405	91	Charlottee	North Carolina	6	2017	249150
17406	91	Charlottee	North Carolina	7	2017	240000
17407	91	Charlottee	North Carolina	8	2017	232500
17408	91	Charlottee	North Carolina	9	2017	225270
17409	91	Charlottee	North Carolina	10	2017	225000
17410	91	Charlottee	North Carolina	11	2017	225750
17411	91	Charlottee	North Carolina	12	2017	238000
17412	91	Charlottee	North Carolina	1	2018	218000
17413	91	Charlottee	North Carolina	2	2018	224000
17414	91	Charlottee	North Carolina	3	2018	237000
17415	91	Charlottee	North Carolina	4	2018	245000
17416	91	Charlottee	North Carolina	5	2018	250000
17417	91	Charlottee	North Carolina	6	2018	253795
17418	91	Charlottee	North Carolina	7	2018	246000
17419	91	Charlottee	North Carolina	8	2018	249000
17420	91	Charlottee	North Carolina	9	2018	236000
17421	91	Charlottee	North Carolina	10	2018	235000
17422	91	Charlottee	North Carolina	11	2018	239000
17423	91	Charlottee	North Carolina	12	2018	239900
17424	91	Charlottee	North Carolina	1	2019	0
17425	92	Concord	North Carolina	1	2009	0
17426	92	Concord	North Carolina	2	2009	0
17427	92	Concord	North Carolina	3	2009	0
17428	92	Concord	North Carolina	4	2009	0
17429	92	Concord	North Carolina	5	2009	0
17430	92	Concord	North Carolina	6	2009	0
17431	92	Concord	North Carolina	7	2009	0
17432	92	Concord	North Carolina	8	2009	0
17433	92	Concord	North Carolina	9	2009	0
17434	92	Concord	North Carolina	10	2009	0
17435	92	Concord	North Carolina	11	2009	0
17436	92	Concord	North Carolina	12	2009	0
17437	92	Concord	North Carolina	1	2010	0
17438	92	Concord	North Carolina	2	2010	0
17439	92	Concord	North Carolina	3	2010	0
17440	92	Concord	North Carolina	4	2010	0
17441	92	Concord	North Carolina	5	2010	0
17442	92	Concord	North Carolina	6	2010	0
17443	92	Concord	North Carolina	7	2010	0
17444	92	Concord	North Carolina	8	2010	0
17445	92	Concord	North Carolina	9	2010	0
17446	92	Concord	North Carolina	10	2010	0
17447	92	Concord	North Carolina	11	2010	0
17448	92	Concord	North Carolina	12	2010	0
17449	92	Concord	North Carolina	1	2011	0
17450	92	Concord	North Carolina	2	2011	0
17451	92	Concord	North Carolina	3	2011	0
17452	92	Concord	North Carolina	4	2011	0
17453	92	Concord	North Carolina	5	2011	0
17454	92	Concord	North Carolina	6	2011	0
17455	92	Concord	North Carolina	7	2011	0
17456	92	Concord	North Carolina	8	2011	0
17457	92	Concord	North Carolina	9	2011	0
17458	92	Concord	North Carolina	10	2011	0
17459	92	Concord	North Carolina	11	2011	0
17460	92	Concord	North Carolina	12	2011	0
17461	92	Concord	North Carolina	1	2012	0
17462	92	Concord	North Carolina	2	2012	0
17463	92	Concord	North Carolina	3	2012	0
17464	92	Concord	North Carolina	4	2012	0
17465	92	Concord	North Carolina	5	2012	0
17466	92	Concord	North Carolina	6	2012	0
17467	92	Concord	North Carolina	7	2012	0
17468	92	Concord	North Carolina	8	2012	0
17469	92	Concord	North Carolina	9	2012	0
17470	92	Concord	North Carolina	10	2012	0
17471	92	Concord	North Carolina	11	2012	0
17472	92	Concord	North Carolina	12	2012	0
17473	92	Concord	North Carolina	1	2013	149750
17474	92	Concord	North Carolina	2	2013	149500
17475	92	Concord	North Carolina	3	2013	157000
17476	92	Concord	North Carolina	4	2013	152500
17477	92	Concord	North Carolina	5	2013	158000
17478	92	Concord	North Carolina	6	2013	168500
17479	92	Concord	North Carolina	7	2013	166750
17480	92	Concord	North Carolina	8	2013	169000
17481	92	Concord	North Carolina	9	2013	160000
17482	92	Concord	North Carolina	10	2013	169900
17483	92	Concord	North Carolina	11	2013	183000
17484	92	Concord	North Carolina	12	2013	168000
17485	92	Concord	North Carolina	1	2014	149000
17486	92	Concord	North Carolina	2	2014	159750
17487	92	Concord	North Carolina	3	2014	162750
17488	92	Concord	North Carolina	4	2014	175000
17489	92	Concord	North Carolina	5	2014	175000
17490	92	Concord	North Carolina	6	2014	176800
17491	92	Concord	North Carolina	7	2014	188750
17492	92	Concord	North Carolina	8	2014	165000
17493	92	Concord	North Carolina	9	2014	179000
17494	92	Concord	North Carolina	10	2014	161500
17495	92	Concord	North Carolina	11	2014	185000
17496	92	Concord	North Carolina	12	2014	180000
17497	92	Concord	North Carolina	1	2015	160000
17498	92	Concord	North Carolina	2	2015	183000
17499	92	Concord	North Carolina	3	2015	168750
17500	92	Concord	North Carolina	4	2015	177000
17501	92	Concord	North Carolina	5	2015	184000
17502	92	Concord	North Carolina	6	2015	195000
17503	92	Concord	North Carolina	7	2015	199500
17504	92	Concord	North Carolina	8	2015	187500
17505	92	Concord	North Carolina	9	2015	191000
17506	92	Concord	North Carolina	10	2015	183500
17507	92	Concord	North Carolina	11	2015	181000
17508	92	Concord	North Carolina	12	2015	177000
17509	92	Concord	North Carolina	1	2016	187000
17510	92	Concord	North Carolina	2	2016	179000
17511	92	Concord	North Carolina	3	2016	185000
17512	92	Concord	North Carolina	4	2016	194000
17513	92	Concord	North Carolina	5	2016	185000
17514	92	Concord	North Carolina	6	2016	209498
17515	92	Concord	North Carolina	7	2016	206000
17516	92	Concord	North Carolina	8	2016	191500
17517	92	Concord	North Carolina	9	2016	207140
17518	92	Concord	North Carolina	10	2016	207000
17519	92	Concord	North Carolina	11	2016	192500
17520	92	Concord	North Carolina	12	2016	203000
17521	92	Concord	North Carolina	1	2017	192500
17522	92	Concord	North Carolina	2	2017	203500
17523	92	Concord	North Carolina	3	2017	199500
17524	92	Concord	North Carolina	4	2017	200000
17525	92	Concord	North Carolina	5	2017	202495
17526	92	Concord	North Carolina	6	2017	207000
17527	92	Concord	North Carolina	7	2017	230500
17528	92	Concord	North Carolina	8	2017	209573
17529	92	Concord	North Carolina	9	2017	199000
17530	92	Concord	North Carolina	10	2017	204485
17531	92	Concord	North Carolina	11	2017	211613
17532	92	Concord	North Carolina	12	2017	225000
17533	92	Concord	North Carolina	1	2018	200000
17534	92	Concord	North Carolina	2	2018	210750
17535	92	Concord	North Carolina	3	2018	209000
17536	92	Concord	North Carolina	4	2018	225000
17537	92	Concord	North Carolina	5	2018	225000
17538	92	Concord	North Carolina	6	2018	225000
17539	92	Concord	North Carolina	7	2018	230000
17540	92	Concord	North Carolina	8	2018	224500
17541	92	Concord	North Carolina	9	2018	215000
17542	92	Concord	North Carolina	10	2018	208000
17543	92	Concord	North Carolina	11	2018	218000
17544	92	Concord	North Carolina	12	2018	228000
17545	92	Concord	North Carolina	1	2019	0
17546	93	Denver	North Carolina	1	2009	0
17547	93	Denver	North Carolina	2	2009	0
17548	93	Denver	North Carolina	3	2009	0
17549	93	Denver	North Carolina	4	2009	0
17550	93	Denver	North Carolina	5	2009	0
17551	93	Denver	North Carolina	6	2009	0
17552	93	Denver	North Carolina	7	2009	0
17553	93	Denver	North Carolina	8	2009	0
17554	93	Denver	North Carolina	9	2009	0
17555	93	Denver	North Carolina	10	2009	0
17556	93	Denver	North Carolina	11	2009	0
17557	93	Denver	North Carolina	12	2009	0
17558	93	Denver	North Carolina	1	2010	0
17559	93	Denver	North Carolina	2	2010	0
17560	93	Denver	North Carolina	3	2010	0
17561	93	Denver	North Carolina	4	2010	0
17562	93	Denver	North Carolina	5	2010	0
17563	93	Denver	North Carolina	6	2010	0
17564	93	Denver	North Carolina	7	2010	0
17565	93	Denver	North Carolina	8	2010	0
17566	93	Denver	North Carolina	9	2010	0
17567	93	Denver	North Carolina	10	2010	0
17568	93	Denver	North Carolina	11	2010	0
17569	93	Denver	North Carolina	12	2010	0
17570	93	Denver	North Carolina	1	2011	0
17571	93	Denver	North Carolina	2	2011	0
17572	93	Denver	North Carolina	3	2011	0
17573	93	Denver	North Carolina	4	2011	0
17574	93	Denver	North Carolina	5	2011	0
17575	93	Denver	North Carolina	6	2011	0
17576	93	Denver	North Carolina	7	2011	0
17577	93	Denver	North Carolina	8	2011	0
17578	93	Denver	North Carolina	9	2011	0
17579	93	Denver	North Carolina	10	2011	0
17580	93	Denver	North Carolina	11	2011	0
17581	93	Denver	North Carolina	12	2011	0
17582	93	Denver	North Carolina	1	2012	0
17583	93	Denver	North Carolina	2	2012	0
17584	93	Denver	North Carolina	3	2012	0
17585	93	Denver	North Carolina	4	2012	0
17586	93	Denver	North Carolina	5	2012	0
17587	93	Denver	North Carolina	6	2012	0
17588	93	Denver	North Carolina	7	2012	0
17589	93	Denver	North Carolina	8	2012	0
17590	93	Denver	North Carolina	9	2012	0
17591	93	Denver	North Carolina	10	2012	0
17592	93	Denver	North Carolina	11	2012	0
17593	93	Denver	North Carolina	12	2012	0
17594	93	Denver	North Carolina	1	2013	257256
17595	93	Denver	North Carolina	2	2013	330000
17596	93	Denver	North Carolina	3	2013	207000
17597	93	Denver	North Carolina	4	2013	285000
17598	93	Denver	North Carolina	5	2013	287000
17599	93	Denver	North Carolina	6	2013	247500
17600	93	Denver	North Carolina	7	2013	360000
17601	93	Denver	North Carolina	8	2013	302000
17602	93	Denver	North Carolina	9	2013	282000
17603	93	Denver	North Carolina	10	2013	360000
17604	93	Denver	North Carolina	11	2013	247767
17605	93	Denver	North Carolina	12	2013	324550
17606	93	Denver	North Carolina	1	2014	300000
17607	93	Denver	North Carolina	2	2014	215000
17608	93	Denver	North Carolina	3	2014	286500
17609	93	Denver	North Carolina	4	2014	265000
17610	93	Denver	North Carolina	5	2014	383500
17611	93	Denver	North Carolina	6	2014	335000
17612	93	Denver	North Carolina	7	2014	324000
17613	93	Denver	North Carolina	8	2014	370000
17614	93	Denver	North Carolina	9	2014	270500
17615	93	Denver	North Carolina	10	2014	283500
17616	93	Denver	North Carolina	11	2014	267193
17617	93	Denver	North Carolina	12	2014	277030
17618	93	Denver	North Carolina	1	2015	222000
17619	93	Denver	North Carolina	2	2015	265355
17620	93	Denver	North Carolina	3	2015	277565
17621	93	Denver	North Carolina	4	2015	282000
17622	93	Denver	North Carolina	5	2015	318664
17623	93	Denver	North Carolina	6	2015	325000
17624	93	Denver	North Carolina	7	2015	320610
17625	93	Denver	North Carolina	8	2015	265000
17626	93	Denver	North Carolina	9	2015	275790
17627	93	Denver	North Carolina	10	2015	314000
17628	93	Denver	North Carolina	11	2015	289030
17629	93	Denver	North Carolina	12	2015	268873
17630	93	Denver	North Carolina	1	2016	313500
17631	93	Denver	North Carolina	2	2016	390212
17632	93	Denver	North Carolina	3	2016	260253
17633	93	Denver	North Carolina	4	2016	386500
17634	93	Denver	North Carolina	5	2016	318695
17635	93	Denver	North Carolina	6	2016	332500
17636	93	Denver	North Carolina	7	2016	373500
17637	93	Denver	North Carolina	8	2016	365110
17638	93	Denver	North Carolina	9	2016	326000
17639	93	Denver	North Carolina	10	2016	334250
17640	93	Denver	North Carolina	11	2016	364200
17641	93	Denver	North Carolina	12	2016	355000
17642	93	Denver	North Carolina	1	2017	355644
17643	93	Denver	North Carolina	2	2017	377336
17644	93	Denver	North Carolina	3	2017	330000
17645	93	Denver	North Carolina	4	2017	349900
17646	93	Denver	North Carolina	5	2017	289000
17647	93	Denver	North Carolina	6	2017	334000
17648	93	Denver	North Carolina	7	2017	320000
17649	93	Denver	North Carolina	8	2017	317490
17650	93	Denver	North Carolina	9	2017	293000
17651	93	Denver	North Carolina	10	2017	335000
17652	93	Denver	North Carolina	11	2017	337000
17653	93	Denver	North Carolina	12	2017	275973
17654	93	Denver	North Carolina	1	2018	296732
17655	93	Denver	North Carolina	2	2018	343495
17656	93	Denver	North Carolina	3	2018	333312
17657	93	Denver	North Carolina	4	2018	347500
17658	93	Denver	North Carolina	5	2018	348000
17659	93	Denver	North Carolina	6	2018	367500
17660	93	Denver	North Carolina	7	2018	355000
17661	93	Denver	North Carolina	8	2018	344754
17662	93	Denver	North Carolina	9	2018	299000
17663	93	Denver	North Carolina	10	2018	346000
17664	93	Denver	North Carolina	11	2018	340000
17665	93	Denver	North Carolina	12	2018	392215
17666	93	Denver	North Carolina	1	2019	0
17667	95	Harrisburg	North Carolina	1	2009	0
17668	95	Harrisburg	North Carolina	2	2009	0
17669	95	Harrisburg	North Carolina	3	2009	0
17670	95	Harrisburg	North Carolina	4	2009	0
17671	95	Harrisburg	North Carolina	5	2009	0
17672	95	Harrisburg	North Carolina	6	2009	0
17673	95	Harrisburg	North Carolina	7	2009	0
17674	95	Harrisburg	North Carolina	8	2009	0
17675	95	Harrisburg	North Carolina	9	2009	0
17676	95	Harrisburg	North Carolina	10	2009	0
17677	95	Harrisburg	North Carolina	11	2009	0
17678	95	Harrisburg	North Carolina	12	2009	0
17679	95	Harrisburg	North Carolina	1	2010	0
17680	95	Harrisburg	North Carolina	2	2010	0
17681	95	Harrisburg	North Carolina	3	2010	0
17682	95	Harrisburg	North Carolina	4	2010	0
17683	95	Harrisburg	North Carolina	5	2010	0
17684	95	Harrisburg	North Carolina	6	2010	0
17685	95	Harrisburg	North Carolina	7	2010	0
17686	95	Harrisburg	North Carolina	8	2010	0
17687	95	Harrisburg	North Carolina	9	2010	0
17688	95	Harrisburg	North Carolina	10	2010	0
17689	95	Harrisburg	North Carolina	11	2010	0
17690	95	Harrisburg	North Carolina	12	2010	0
17691	95	Harrisburg	North Carolina	1	2011	0
17692	95	Harrisburg	North Carolina	2	2011	0
17693	95	Harrisburg	North Carolina	3	2011	0
17694	95	Harrisburg	North Carolina	4	2011	0
17695	95	Harrisburg	North Carolina	5	2011	0
17696	95	Harrisburg	North Carolina	6	2011	0
17697	95	Harrisburg	North Carolina	7	2011	0
17698	95	Harrisburg	North Carolina	8	2011	0
17699	95	Harrisburg	North Carolina	9	2011	0
17700	95	Harrisburg	North Carolina	10	2011	0
17701	95	Harrisburg	North Carolina	11	2011	0
17702	95	Harrisburg	North Carolina	12	2011	0
17703	95	Harrisburg	North Carolina	1	2012	0
17704	95	Harrisburg	North Carolina	2	2012	0
17705	95	Harrisburg	North Carolina	3	2012	0
17706	95	Harrisburg	North Carolina	4	2012	0
17707	95	Harrisburg	North Carolina	5	2012	0
17708	95	Harrisburg	North Carolina	6	2012	0
17709	95	Harrisburg	North Carolina	7	2012	0
17710	95	Harrisburg	North Carolina	8	2012	0
17711	95	Harrisburg	North Carolina	9	2012	0
17712	95	Harrisburg	North Carolina	10	2012	0
17713	95	Harrisburg	North Carolina	11	2012	0
17714	95	Harrisburg	North Carolina	12	2012	0
17715	95	Harrisburg	North Carolina	1	2013	148000
17716	95	Harrisburg	North Carolina	2	2013	168000
17717	95	Harrisburg	North Carolina	3	2013	210500
17718	95	Harrisburg	North Carolina	4	2013	240000
17719	95	Harrisburg	North Carolina	5	2013	182500
17720	95	Harrisburg	North Carolina	6	2013	208000
17721	95	Harrisburg	North Carolina	7	2013	222000
17722	95	Harrisburg	North Carolina	8	2013	193500
17723	95	Harrisburg	North Carolina	9	2013	242000
17724	95	Harrisburg	North Carolina	10	2013	207000
17725	95	Harrisburg	North Carolina	11	2013	223495
17726	95	Harrisburg	North Carolina	12	2013	227250
17727	95	Harrisburg	North Carolina	1	2014	270000
17728	95	Harrisburg	North Carolina	2	2014	195000
17729	95	Harrisburg	North Carolina	3	2014	226250
17730	95	Harrisburg	North Carolina	4	2014	178550
17731	95	Harrisburg	North Carolina	5	2014	244745
17732	95	Harrisburg	North Carolina	6	2014	248250
17733	95	Harrisburg	North Carolina	7	2014	220000
17734	95	Harrisburg	North Carolina	8	2014	207500
17735	95	Harrisburg	North Carolina	9	2014	212000
17736	95	Harrisburg	North Carolina	10	2014	186500
17737	95	Harrisburg	North Carolina	11	2014	207000
17738	95	Harrisburg	North Carolina	12	2014	224500
17739	95	Harrisburg	North Carolina	1	2015	180000
17740	95	Harrisburg	North Carolina	2	2015	207500
17741	95	Harrisburg	North Carolina	3	2015	223000
17742	95	Harrisburg	North Carolina	4	2015	207500
17743	95	Harrisburg	North Carolina	5	2015	267000
17744	95	Harrisburg	North Carolina	6	2015	235000
17745	95	Harrisburg	North Carolina	7	2015	227500
17746	95	Harrisburg	North Carolina	8	2015	275625
17747	95	Harrisburg	North Carolina	9	2015	220000
17748	95	Harrisburg	North Carolina	10	2015	255000
17749	95	Harrisburg	North Carolina	11	2015	309750
17750	95	Harrisburg	North Carolina	12	2015	227500
17751	95	Harrisburg	North Carolina	1	2016	234000
17752	95	Harrisburg	North Carolina	2	2016	252500
17753	95	Harrisburg	North Carolina	3	2016	240000
17754	95	Harrisburg	North Carolina	4	2016	210000
17755	95	Harrisburg	North Carolina	5	2016	291250
17756	95	Harrisburg	North Carolina	6	2016	247500
17757	95	Harrisburg	North Carolina	7	2016	236000
17758	95	Harrisburg	North Carolina	8	2016	241000
17759	95	Harrisburg	North Carolina	9	2016	220000
17760	95	Harrisburg	North Carolina	10	2016	231550
17761	95	Harrisburg	North Carolina	11	2016	290267
17762	95	Harrisburg	North Carolina	12	2016	281000
17763	95	Harrisburg	North Carolina	1	2017	306500
17764	95	Harrisburg	North Carolina	2	2017	311500
17765	95	Harrisburg	North Carolina	3	2017	259250
17766	95	Harrisburg	North Carolina	4	2017	267500
17767	95	Harrisburg	North Carolina	5	2017	251373
17768	95	Harrisburg	North Carolina	6	2017	268000
17769	95	Harrisburg	North Carolina	7	2017	280000
17770	95	Harrisburg	North Carolina	8	2017	279250
17771	95	Harrisburg	North Carolina	9	2017	315000
17772	95	Harrisburg	North Carolina	10	2017	241750
17773	95	Harrisburg	North Carolina	11	2017	267460
17774	95	Harrisburg	North Carolina	12	2017	317500
17775	95	Harrisburg	North Carolina	1	2018	231250
17776	95	Harrisburg	North Carolina	2	2018	220750
17777	95	Harrisburg	North Carolina	3	2018	244000
17778	95	Harrisburg	North Carolina	4	2018	290000
17779	95	Harrisburg	North Carolina	5	2018	265000
17780	95	Harrisburg	North Carolina	6	2018	290000
17781	95	Harrisburg	North Carolina	7	2018	259000
17782	95	Harrisburg	North Carolina	8	2018	264500
17783	95	Harrisburg	North Carolina	9	2018	320000
17784	95	Harrisburg	North Carolina	10	2018	250000
17785	95	Harrisburg	North Carolina	11	2018	242500
17786	95	Harrisburg	North Carolina	12	2018	312750
17787	95	Harrisburg	North Carolina	1	2019	0
17788	98	Newark	Ohio	1	2009	0
17789	98	Newark	Ohio	2	2009	0
17790	98	Newark	Ohio	3	2009	0
17791	98	Newark	Ohio	4	2009	0
17792	98	Newark	Ohio	5	2009	0
17793	98	Newark	Ohio	6	2009	0
17794	98	Newark	Ohio	7	2009	0
17795	98	Newark	Ohio	8	2009	0
17796	98	Newark	Ohio	9	2009	0
17797	98	Newark	Ohio	10	2009	0
17798	98	Newark	Ohio	11	2009	0
17799	98	Newark	Ohio	12	2009	0
17800	98	Newark	Ohio	1	2010	0
17801	98	Newark	Ohio	2	2010	0
17802	98	Newark	Ohio	3	2010	0
17803	98	Newark	Ohio	4	2010	0
17804	98	Newark	Ohio	5	2010	0
17805	98	Newark	Ohio	6	2010	0
17806	98	Newark	Ohio	7	2010	0
17807	98	Newark	Ohio	8	2010	0
17808	98	Newark	Ohio	9	2010	0
17809	98	Newark	Ohio	10	2010	0
17810	98	Newark	Ohio	11	2010	0
17811	98	Newark	Ohio	12	2010	0
17812	98	Newark	Ohio	1	2011	0
17813	98	Newark	Ohio	2	2011	0
17814	98	Newark	Ohio	3	2011	0
17815	98	Newark	Ohio	4	2011	0
17816	98	Newark	Ohio	5	2011	0
17817	98	Newark	Ohio	6	2011	0
17818	98	Newark	Ohio	7	2011	0
17819	98	Newark	Ohio	8	2011	0
17820	98	Newark	Ohio	9	2011	0
17821	98	Newark	Ohio	10	2011	0
17822	98	Newark	Ohio	11	2011	0
17823	98	Newark	Ohio	12	2011	0
17824	98	Newark	Ohio	1	2012	40000
17825	98	Newark	Ohio	2	2012	40000
17826	98	Newark	Ohio	3	2012	45000
17827	98	Newark	Ohio	4	2012	85000
17828	98	Newark	Ohio	5	2012	34500
17829	98	Newark	Ohio	6	2012	37000
17830	98	Newark	Ohio	7	2012	35000
17831	98	Newark	Ohio	8	2012	35000
17832	98	Newark	Ohio	9	2012	25000
17833	98	Newark	Ohio	10	2012	40500
17834	98	Newark	Ohio	11	2012	37500
17835	98	Newark	Ohio	12	2012	36100
17836	98	Newark	Ohio	1	2013	27997
17837	98	Newark	Ohio	2	2013	24300
17838	98	Newark	Ohio	3	2013	21300
17839	98	Newark	Ohio	4	2013	25150
17840	98	Newark	Ohio	5	2013	28150
17841	98	Newark	Ohio	6	2013	35000
17842	98	Newark	Ohio	7	2013	30300
17843	98	Newark	Ohio	8	2013	25600
17844	98	Newark	Ohio	9	2013	25250
17845	98	Newark	Ohio	10	2013	22900
17846	98	Newark	Ohio	11	2013	22900
17847	98	Newark	Ohio	12	2013	22900
17848	98	Newark	Ohio	1	2014	35750
17849	98	Newark	Ohio	2	2014	57750
17850	98	Newark	Ohio	3	2014	28500
17851	98	Newark	Ohio	4	2014	36750
17852	98	Newark	Ohio	5	2014	35000
17853	98	Newark	Ohio	6	2014	37000
17854	98	Newark	Ohio	7	2014	36000
17855	98	Newark	Ohio	8	2014	37000
17856	98	Newark	Ohio	9	2014	32000
17857	98	Newark	Ohio	10	2014	31000
17858	98	Newark	Ohio	11	2014	25450
17859	98	Newark	Ohio	12	2014	36250
17860	98	Newark	Ohio	1	2015	53600
17861	98	Newark	Ohio	2	2015	85000
17862	98	Newark	Ohio	3	2015	0
17863	98	Newark	Ohio	4	2015	35450
17864	98	Newark	Ohio	5	2015	34900
17865	98	Newark	Ohio	6	2015	31000
17866	98	Newark	Ohio	7	2015	26000
17867	98	Newark	Ohio	8	2015	25500
17868	98	Newark	Ohio	9	2015	23000
17869	98	Newark	Ohio	10	2015	25000
17870	98	Newark	Ohio	11	2015	32476
17871	98	Newark	Ohio	12	2015	37000
17872	98	Newark	Ohio	1	2016	66000
17873	98	Newark	Ohio	2	2016	30000
17874	98	Newark	Ohio	3	2016	35000
17875	98	Newark	Ohio	4	2016	37000
17876	98	Newark	Ohio	5	2016	42500
17877	98	Newark	Ohio	6	2016	43000
17878	98	Newark	Ohio	7	2016	51200
17879	98	Newark	Ohio	8	2016	49500
17880	98	Newark	Ohio	9	2016	55000
17881	98	Newark	Ohio	10	2016	45000
17882	98	Newark	Ohio	11	2016	51250
17883	98	Newark	Ohio	12	2016	47500
17884	98	Newark	Ohio	1	2017	47500
17885	98	Newark	Ohio	2	2017	42000
17886	98	Newark	Ohio	3	2017	50000
17887	98	Newark	Ohio	4	2017	50000
17888	98	Newark	Ohio	5	2017	42500
17889	98	Newark	Ohio	6	2017	63750
17890	98	Newark	Ohio	7	2017	64500
17891	98	Newark	Ohio	8	2017	72000
17892	98	Newark	Ohio	9	2017	69500
17893	98	Newark	Ohio	10	2017	62500
17894	98	Newark	Ohio	11	2017	44500
17895	98	Newark	Ohio	12	2017	44500
17896	98	Newark	Ohio	1	2018	0
17897	98	Newark	Ohio	2	2018	26450
17898	98	Newark	Ohio	3	2018	26450
17899	98	Newark	Ohio	4	2018	63175
17900	98	Newark	Ohio	5	2018	70000
17901	98	Newark	Ohio	6	2018	70000
17902	98	Newark	Ohio	7	2018	55950
17903	98	Newark	Ohio	8	2018	54900
17904	98	Newark	Ohio	9	2018	57450
17905	98	Newark	Ohio	10	2018	52640
17906	98	Newark	Ohio	11	2018	49820
17907	98	Newark	Ohio	12	2018	47000
17908	98	Newark	Ohio	1	2019	0
17909	103	Springfield	Oregon	1	2009	0
17910	103	Springfield	Oregon	2	2009	0
17911	103	Springfield	Oregon	3	2009	0
17912	103	Springfield	Oregon	4	2009	0
17913	103	Springfield	Oregon	5	2009	0
17914	103	Springfield	Oregon	6	2009	0
17915	103	Springfield	Oregon	7	2009	0
17916	103	Springfield	Oregon	8	2009	0
17917	103	Springfield	Oregon	9	2009	0
17918	103	Springfield	Oregon	10	2009	0
17919	103	Springfield	Oregon	11	2009	0
17920	103	Springfield	Oregon	12	2009	0
17921	103	Springfield	Oregon	1	2010	0
17922	103	Springfield	Oregon	2	2010	0
17923	103	Springfield	Oregon	3	2010	0
17924	103	Springfield	Oregon	4	2010	0
17925	103	Springfield	Oregon	5	2010	0
17926	103	Springfield	Oregon	6	2010	0
17927	103	Springfield	Oregon	7	2010	0
17928	103	Springfield	Oregon	8	2010	0
17929	103	Springfield	Oregon	9	2010	0
17930	103	Springfield	Oregon	10	2010	0
17931	103	Springfield	Oregon	11	2010	0
17932	103	Springfield	Oregon	12	2010	0
17933	103	Springfield	Oregon	1	2011	0
17934	103	Springfield	Oregon	2	2011	0
17935	103	Springfield	Oregon	3	2011	0
17936	103	Springfield	Oregon	4	2011	0
17937	103	Springfield	Oregon	5	2011	0
17938	103	Springfield	Oregon	6	2011	0
17939	103	Springfield	Oregon	7	2011	0
17940	103	Springfield	Oregon	8	2011	0
17941	103	Springfield	Oregon	9	2011	0
17942	103	Springfield	Oregon	10	2011	0
17943	103	Springfield	Oregon	11	2011	0
17944	103	Springfield	Oregon	12	2011	0
17945	103	Springfield	Oregon	1	2012	151495
17946	103	Springfield	Oregon	2	2012	125000
17947	103	Springfield	Oregon	3	2012	155950
17948	103	Springfield	Oregon	4	2012	144650
17949	103	Springfield	Oregon	5	2012	145500
17950	103	Springfield	Oregon	6	2012	152450
17951	103	Springfield	Oregon	7	2012	155000
17952	103	Springfield	Oregon	8	2012	153000
17953	103	Springfield	Oregon	9	2012	159900
17954	103	Springfield	Oregon	10	2012	163369
17955	103	Springfield	Oregon	11	2012	179000
17956	103	Springfield	Oregon	12	2012	158000
17957	103	Springfield	Oregon	1	2013	153500
17958	103	Springfield	Oregon	2	2013	190903
17959	103	Springfield	Oregon	3	2013	146000
17960	103	Springfield	Oregon	4	2013	177500
17961	103	Springfield	Oregon	5	2013	177500
17962	103	Springfield	Oregon	6	2013	212450
17963	103	Springfield	Oregon	7	2013	182450
17964	103	Springfield	Oregon	8	2013	177550
17965	103	Springfield	Oregon	9	2013	180050
17966	103	Springfield	Oregon	10	2013	179900
17967	103	Springfield	Oregon	11	2013	179900
17968	103	Springfield	Oregon	12	2013	190000
17969	103	Springfield	Oregon	1	2014	226500
17970	103	Springfield	Oregon	2	2014	218000
17971	103	Springfield	Oregon	3	2014	182000
17972	103	Springfield	Oregon	4	2014	172000
17973	103	Springfield	Oregon	5	2014	194000
17974	103	Springfield	Oregon	6	2014	185000
17975	103	Springfield	Oregon	7	2014	180000
17976	103	Springfield	Oregon	8	2014	192500
17977	103	Springfield	Oregon	9	2014	189000
17978	103	Springfield	Oregon	10	2014	172000
17979	103	Springfield	Oregon	11	2014	187750
17980	103	Springfield	Oregon	12	2014	189000
17981	103	Springfield	Oregon	1	2015	182450
17982	103	Springfield	Oregon	2	2015	177000
17983	103	Springfield	Oregon	3	2015	183000
17984	103	Springfield	Oregon	4	2015	199450
17985	103	Springfield	Oregon	5	2015	201440
17986	103	Springfield	Oregon	6	2015	215000
17987	103	Springfield	Oregon	7	2015	208750
17988	103	Springfield	Oregon	8	2015	216450
17989	103	Springfield	Oregon	9	2015	207250
17990	103	Springfield	Oregon	10	2015	195000
17991	103	Springfield	Oregon	11	2015	200000
17992	103	Springfield	Oregon	12	2015	194950
17993	103	Springfield	Oregon	1	2016	203000
17994	103	Springfield	Oregon	2	2016	186500
17995	103	Springfield	Oregon	3	2016	189900
17996	103	Springfield	Oregon	4	2016	210000
17997	103	Springfield	Oregon	5	2016	205750
17998	103	Springfield	Oregon	6	2016	215000
17999	103	Springfield	Oregon	7	2016	218250
18000	103	Springfield	Oregon	8	2016	226000
18001	103	Springfield	Oregon	9	2016	220000
18002	103	Springfield	Oregon	10	2016	230000
18003	103	Springfield	Oregon	11	2016	227250
18004	103	Springfield	Oregon	12	2016	202500
18005	103	Springfield	Oregon	1	2017	227587
18006	103	Springfield	Oregon	2	2017	230500
18007	103	Springfield	Oregon	3	2017	226000
18008	103	Springfield	Oregon	4	2017	240500
18009	103	Springfield	Oregon	5	2017	238500
18010	103	Springfield	Oregon	6	2017	240000
18011	103	Springfield	Oregon	7	2017	246750
18012	103	Springfield	Oregon	8	2017	242250
18013	103	Springfield	Oregon	9	2017	235000
18014	103	Springfield	Oregon	10	2017	240000
18015	103	Springfield	Oregon	11	2017	220000
18016	103	Springfield	Oregon	12	2017	240000
18017	103	Springfield	Oregon	1	2018	232250
18018	103	Springfield	Oregon	2	2018	229000
18019	103	Springfield	Oregon	3	2018	235000
18020	103	Springfield	Oregon	4	2018	236000
18021	103	Springfield	Oregon	5	2018	250000
18022	103	Springfield	Oregon	6	2018	255000
18023	103	Springfield	Oregon	7	2018	259000
18024	103	Springfield	Oregon	8	2018	262000
18025	103	Springfield	Oregon	9	2018	255000
18026	103	Springfield	Oregon	10	2018	265000
18027	103	Springfield	Oregon	11	2018	254900
18028	103	Springfield	Oregon	12	2018	264000
18029	103	Springfield	Oregon	1	2019	0
18030	106	East Greenwich	Rhode Island	1	2009	0
18031	106	East Greenwich	Rhode Island	2	2009	0
18032	106	East Greenwich	Rhode Island	3	2009	0
18033	106	East Greenwich	Rhode Island	4	2009	0
18034	106	East Greenwich	Rhode Island	5	2009	0
18035	106	East Greenwich	Rhode Island	6	2009	0
18036	106	East Greenwich	Rhode Island	7	2009	0
18037	106	East Greenwich	Rhode Island	8	2009	0
18038	106	East Greenwich	Rhode Island	9	2009	0
18039	106	East Greenwich	Rhode Island	10	2009	0
18040	106	East Greenwich	Rhode Island	11	2009	0
18041	106	East Greenwich	Rhode Island	12	2009	0
18042	106	East Greenwich	Rhode Island	1	2010	0
18043	106	East Greenwich	Rhode Island	2	2010	0
18044	106	East Greenwich	Rhode Island	3	2010	0
18045	106	East Greenwich	Rhode Island	4	2010	0
18046	106	East Greenwich	Rhode Island	5	2010	0
18047	106	East Greenwich	Rhode Island	6	2010	0
18048	106	East Greenwich	Rhode Island	7	2010	0
18049	106	East Greenwich	Rhode Island	8	2010	0
18050	106	East Greenwich	Rhode Island	9	2010	0
18051	106	East Greenwich	Rhode Island	10	2010	0
18052	106	East Greenwich	Rhode Island	11	2010	0
18053	106	East Greenwich	Rhode Island	12	2010	0
18054	106	East Greenwich	Rhode Island	1	2011	0
18055	106	East Greenwich	Rhode Island	2	2011	0
18056	106	East Greenwich	Rhode Island	3	2011	0
18057	106	East Greenwich	Rhode Island	4	2011	0
18058	106	East Greenwich	Rhode Island	5	2011	0
18059	106	East Greenwich	Rhode Island	6	2011	0
18060	106	East Greenwich	Rhode Island	7	2011	0
18061	106	East Greenwich	Rhode Island	8	2011	0
18062	106	East Greenwich	Rhode Island	9	2011	0
18063	106	East Greenwich	Rhode Island	10	2011	0
18064	106	East Greenwich	Rhode Island	11	2011	0
18065	106	East Greenwich	Rhode Island	12	2011	0
18066	106	East Greenwich	Rhode Island	1	2012	0
18067	106	East Greenwich	Rhode Island	2	2012	0
18068	106	East Greenwich	Rhode Island	3	2012	0
18069	106	East Greenwich	Rhode Island	4	2012	0
18070	106	East Greenwich	Rhode Island	5	2012	0
18071	106	East Greenwich	Rhode Island	6	2012	0
18072	106	East Greenwich	Rhode Island	7	2012	0
18073	106	East Greenwich	Rhode Island	8	2012	0
18074	106	East Greenwich	Rhode Island	9	2012	0
18075	106	East Greenwich	Rhode Island	10	2012	0
18076	106	East Greenwich	Rhode Island	11	2012	0
18077	106	East Greenwich	Rhode Island	12	2012	0
18078	106	East Greenwich	Rhode Island	1	2013	0
18079	106	East Greenwich	Rhode Island	2	2013	0
18080	106	East Greenwich	Rhode Island	3	2013	0
18081	106	East Greenwich	Rhode Island	4	2013	0
18082	106	East Greenwich	Rhode Island	5	2013	0
18083	106	East Greenwich	Rhode Island	6	2013	0
18084	106	East Greenwich	Rhode Island	7	2013	0
18085	106	East Greenwich	Rhode Island	8	2013	0
18086	106	East Greenwich	Rhode Island	9	2013	419750
18087	106	East Greenwich	Rhode Island	10	2013	0
18088	106	East Greenwich	Rhode Island	11	2013	387000
18089	106	East Greenwich	Rhode Island	12	2013	385000
18090	106	East Greenwich	Rhode Island	1	2014	297500
18091	106	East Greenwich	Rhode Island	2	2014	357450
18092	106	East Greenwich	Rhode Island	3	2014	353000
18093	106	East Greenwich	Rhode Island	4	2014	357500
18094	106	East Greenwich	Rhode Island	5	2014	405000
18095	106	East Greenwich	Rhode Island	6	2014	440000
18096	106	East Greenwich	Rhode Island	7	2014	339750
18097	106	East Greenwich	Rhode Island	8	2014	388750
18098	106	East Greenwich	Rhode Island	9	2014	275000
18099	106	East Greenwich	Rhode Island	10	2014	365000
18100	106	East Greenwich	Rhode Island	11	2014	321500
18101	106	East Greenwich	Rhode Island	12	2014	262500
18102	106	East Greenwich	Rhode Island	1	2015	477500
18103	106	East Greenwich	Rhode Island	2	2015	365000
18104	106	East Greenwich	Rhode Island	3	2015	295000
18105	106	East Greenwich	Rhode Island	4	2015	371000
18106	106	East Greenwich	Rhode Island	5	2015	290000
18107	106	East Greenwich	Rhode Island	6	2015	455000
18108	106	East Greenwich	Rhode Island	7	2015	371500
18109	106	East Greenwich	Rhode Island	8	2015	390000
18110	106	East Greenwich	Rhode Island	9	2015	289900
18111	106	East Greenwich	Rhode Island	10	2015	387500
18112	106	East Greenwich	Rhode Island	11	2015	340000
18113	106	East Greenwich	Rhode Island	12	2015	399000
18114	106	East Greenwich	Rhode Island	1	2016	260000
18115	106	East Greenwich	Rhode Island	2	2016	358500
18116	106	East Greenwich	Rhode Island	3	2016	329000
18117	106	East Greenwich	Rhode Island	4	2016	314450
18118	106	East Greenwich	Rhode Island	5	2016	425000
18119	106	East Greenwich	Rhode Island	6	2016	385000
18120	106	East Greenwich	Rhode Island	7	2016	390000
18121	106	East Greenwich	Rhode Island	8	2016	439500
18122	106	East Greenwich	Rhode Island	9	2016	329950
18123	106	East Greenwich	Rhode Island	10	2016	357000
18124	106	East Greenwich	Rhode Island	11	2016	333750
18125	106	East Greenwich	Rhode Island	12	2016	345000
18126	106	East Greenwich	Rhode Island	1	2017	375000
18127	106	East Greenwich	Rhode Island	2	2017	302000
18128	106	East Greenwich	Rhode Island	3	2017	405000
18129	106	East Greenwich	Rhode Island	4	2017	403000
18130	106	East Greenwich	Rhode Island	5	2017	415000
18131	106	East Greenwich	Rhode Island	6	2017	426300
18132	106	East Greenwich	Rhode Island	7	2017	373000
18133	106	East Greenwich	Rhode Island	8	2017	435000
18134	106	East Greenwich	Rhode Island	9	2017	448000
18135	106	East Greenwich	Rhode Island	10	2017	362000
18136	106	East Greenwich	Rhode Island	11	2017	450000
18137	106	East Greenwich	Rhode Island	12	2017	400000
18138	106	East Greenwich	Rhode Island	1	2018	440000
18139	106	East Greenwich	Rhode Island	2	2018	401200
18140	106	East Greenwich	Rhode Island	3	2018	387500
18141	106	East Greenwich	Rhode Island	4	2018	471750
18142	106	East Greenwich	Rhode Island	5	2018	394000
18143	106	East Greenwich	Rhode Island	6	2018	429900
18144	106	East Greenwich	Rhode Island	7	2018	437000
18145	106	East Greenwich	Rhode Island	8	2018	435500
18146	106	East Greenwich	Rhode Island	9	2018	557500
18147	106	East Greenwich	Rhode Island	10	2018	403750
18148	106	East Greenwich	Rhode Island	11	2018	434000
18149	106	East Greenwich	Rhode Island	12	2018	447500
18150	106	East Greenwich	Rhode Island	1	2019	0
18151	107	East Providence	Rhode Island	1	2009	0
18152	107	East Providence	Rhode Island	2	2009	0
18153	107	East Providence	Rhode Island	3	2009	0
18154	107	East Providence	Rhode Island	4	2009	0
18155	107	East Providence	Rhode Island	5	2009	0
18156	107	East Providence	Rhode Island	6	2009	0
18157	107	East Providence	Rhode Island	7	2009	0
18158	107	East Providence	Rhode Island	8	2009	0
18159	107	East Providence	Rhode Island	9	2009	0
18160	107	East Providence	Rhode Island	10	2009	0
18161	107	East Providence	Rhode Island	11	2009	0
18162	107	East Providence	Rhode Island	12	2009	0
18163	107	East Providence	Rhode Island	1	2010	0
18164	107	East Providence	Rhode Island	2	2010	0
18165	107	East Providence	Rhode Island	3	2010	0
18166	107	East Providence	Rhode Island	4	2010	0
18167	107	East Providence	Rhode Island	5	2010	0
18168	107	East Providence	Rhode Island	6	2010	0
18169	107	East Providence	Rhode Island	7	2010	0
18170	107	East Providence	Rhode Island	8	2010	0
18171	107	East Providence	Rhode Island	9	2010	0
18172	107	East Providence	Rhode Island	10	2010	0
18173	107	East Providence	Rhode Island	11	2010	0
18174	107	East Providence	Rhode Island	12	2010	0
18175	107	East Providence	Rhode Island	1	2011	0
18176	107	East Providence	Rhode Island	2	2011	0
18177	107	East Providence	Rhode Island	3	2011	0
18178	107	East Providence	Rhode Island	4	2011	0
18179	107	East Providence	Rhode Island	5	2011	0
18180	107	East Providence	Rhode Island	6	2011	0
18181	107	East Providence	Rhode Island	7	2011	0
18182	107	East Providence	Rhode Island	8	2011	0
18183	107	East Providence	Rhode Island	9	2011	0
18184	107	East Providence	Rhode Island	10	2011	0
18185	107	East Providence	Rhode Island	11	2011	0
18186	107	East Providence	Rhode Island	12	2011	0
18187	107	East Providence	Rhode Island	1	2012	150000
18188	107	East Providence	Rhode Island	2	2012	0
18189	107	East Providence	Rhode Island	3	2012	0
18190	107	East Providence	Rhode Island	4	2012	160000
18191	107	East Providence	Rhode Island	5	2012	0
18192	107	East Providence	Rhode Island	6	2012	0
18193	107	East Providence	Rhode Island	7	2012	178000
18194	107	East Providence	Rhode Island	8	2012	0
18195	107	East Providence	Rhode Island	9	2012	0
18196	107	East Providence	Rhode Island	10	2012	149500
18197	107	East Providence	Rhode Island	11	2012	0
18198	107	East Providence	Rhode Island	12	2012	0
18199	107	East Providence	Rhode Island	1	2013	0
18200	107	East Providence	Rhode Island	2	2013	0
18201	107	East Providence	Rhode Island	3	2013	0
18202	107	East Providence	Rhode Island	4	2013	0
18203	107	East Providence	Rhode Island	5	2013	0
18204	107	East Providence	Rhode Island	6	2013	0
18205	107	East Providence	Rhode Island	7	2013	180000
18206	107	East Providence	Rhode Island	8	2013	173000
18207	107	East Providence	Rhode Island	9	2013	166500
18208	107	East Providence	Rhode Island	10	2013	167900
18209	107	East Providence	Rhode Island	11	2013	176500
18210	107	East Providence	Rhode Island	12	2013	163700
18211	107	East Providence	Rhode Island	1	2014	150000
18212	107	East Providence	Rhode Island	2	2014	158000
18213	107	East Providence	Rhode Island	3	2014	155250
18214	107	East Providence	Rhode Island	4	2014	199500
18215	107	East Providence	Rhode Island	5	2014	155000
18216	107	East Providence	Rhode Island	6	2014	165000
18217	107	East Providence	Rhode Island	7	2014	163500
18218	107	East Providence	Rhode Island	8	2014	191500
18219	107	East Providence	Rhode Island	9	2014	160000
18220	107	East Providence	Rhode Island	10	2014	180000
18221	107	East Providence	Rhode Island	11	2014	167500
18222	107	East Providence	Rhode Island	12	2014	169000
18223	107	East Providence	Rhode Island	1	2015	167000
18224	107	East Providence	Rhode Island	2	2015	153000
18225	107	East Providence	Rhode Island	3	2015	175000
18226	107	East Providence	Rhode Island	4	2015	174000
18227	107	East Providence	Rhode Island	5	2015	181500
18228	107	East Providence	Rhode Island	6	2015	188950
18229	107	East Providence	Rhode Island	7	2015	204900
18230	107	East Providence	Rhode Island	8	2015	216500
18231	107	East Providence	Rhode Island	9	2015	199000
18232	107	East Providence	Rhode Island	10	2015	192000
18233	107	East Providence	Rhode Island	11	2015	160000
18234	107	East Providence	Rhode Island	12	2015	196000
18235	107	East Providence	Rhode Island	1	2016	187550
18236	107	East Providence	Rhode Island	2	2016	190000
18237	107	East Providence	Rhode Island	3	2016	183500
18238	107	East Providence	Rhode Island	4	2016	215000
18239	107	East Providence	Rhode Island	5	2016	186000
18240	107	East Providence	Rhode Island	6	2016	197000
18241	107	East Providence	Rhode Island	7	2016	216500
18242	107	East Providence	Rhode Island	8	2016	205000
18243	107	East Providence	Rhode Island	9	2016	195000
18244	107	East Providence	Rhode Island	10	2016	192500
18245	107	East Providence	Rhode Island	11	2016	226000
18246	107	East Providence	Rhode Island	12	2016	229950
18247	107	East Providence	Rhode Island	1	2017	210000
18248	107	East Providence	Rhode Island	2	2017	195500
18249	107	East Providence	Rhode Island	3	2017	204250
18250	107	East Providence	Rhode Island	4	2017	222500
18251	107	East Providence	Rhode Island	5	2017	229000
18252	107	East Providence	Rhode Island	6	2017	235500
18253	107	East Providence	Rhode Island	7	2017	234500
18254	107	East Providence	Rhode Island	8	2017	227500
18255	107	East Providence	Rhode Island	9	2017	222000
18256	107	East Providence	Rhode Island	10	2017	205000
18257	107	East Providence	Rhode Island	11	2017	232200
18258	107	East Providence	Rhode Island	12	2017	232450
18259	107	East Providence	Rhode Island	1	2018	210000
18260	107	East Providence	Rhode Island	2	2018	232000
18261	107	East Providence	Rhode Island	3	2018	214000
18262	107	East Providence	Rhode Island	4	2018	220000
18263	107	East Providence	Rhode Island	5	2018	230000
18264	107	East Providence	Rhode Island	6	2018	244000
18265	107	East Providence	Rhode Island	7	2018	245000
18266	107	East Providence	Rhode Island	8	2018	244000
18267	107	East Providence	Rhode Island	9	2018	225500
18268	107	East Providence	Rhode Island	10	2018	234000
18269	107	East Providence	Rhode Island	11	2018	231250
18270	107	East Providence	Rhode Island	12	2018	239950
18271	107	East Providence	Rhode Island	1	2019	0
18272	108	Lincoln	Rhode Island	1	2009	0
18273	108	Lincoln	Rhode Island	2	2009	0
18274	108	Lincoln	Rhode Island	3	2009	0
18275	108	Lincoln	Rhode Island	4	2009	0
18276	108	Lincoln	Rhode Island	5	2009	0
18277	108	Lincoln	Rhode Island	6	2009	0
18278	108	Lincoln	Rhode Island	7	2009	0
18279	108	Lincoln	Rhode Island	8	2009	0
18280	108	Lincoln	Rhode Island	9	2009	0
18281	108	Lincoln	Rhode Island	10	2009	0
18282	108	Lincoln	Rhode Island	11	2009	0
18283	108	Lincoln	Rhode Island	12	2009	0
18284	108	Lincoln	Rhode Island	1	2010	0
18285	108	Lincoln	Rhode Island	2	2010	0
18286	108	Lincoln	Rhode Island	3	2010	0
18287	108	Lincoln	Rhode Island	4	2010	0
18288	108	Lincoln	Rhode Island	5	2010	0
18289	108	Lincoln	Rhode Island	6	2010	0
18290	108	Lincoln	Rhode Island	7	2010	0
18291	108	Lincoln	Rhode Island	8	2010	0
18292	108	Lincoln	Rhode Island	9	2010	0
18293	108	Lincoln	Rhode Island	10	2010	0
18294	108	Lincoln	Rhode Island	11	2010	0
18295	108	Lincoln	Rhode Island	12	2010	0
18296	108	Lincoln	Rhode Island	1	2011	0
18297	108	Lincoln	Rhode Island	2	2011	0
18298	108	Lincoln	Rhode Island	3	2011	0
18299	108	Lincoln	Rhode Island	4	2011	0
18300	108	Lincoln	Rhode Island	5	2011	0
18301	108	Lincoln	Rhode Island	6	2011	0
18302	108	Lincoln	Rhode Island	7	2011	0
18303	108	Lincoln	Rhode Island	8	2011	0
18304	108	Lincoln	Rhode Island	9	2011	0
18305	108	Lincoln	Rhode Island	10	2011	0
18306	108	Lincoln	Rhode Island	11	2011	0
18307	108	Lincoln	Rhode Island	12	2011	0
18308	108	Lincoln	Rhode Island	1	2012	0
18309	108	Lincoln	Rhode Island	2	2012	0
18310	108	Lincoln	Rhode Island	3	2012	0
18311	108	Lincoln	Rhode Island	4	2012	0
18312	108	Lincoln	Rhode Island	5	2012	0
18313	108	Lincoln	Rhode Island	6	2012	0
18314	108	Lincoln	Rhode Island	7	2012	0
18315	108	Lincoln	Rhode Island	8	2012	0
18316	108	Lincoln	Rhode Island	9	2012	0
18317	108	Lincoln	Rhode Island	10	2012	0
18318	108	Lincoln	Rhode Island	11	2012	0
18319	108	Lincoln	Rhode Island	12	2012	0
18320	108	Lincoln	Rhode Island	1	2013	0
18321	108	Lincoln	Rhode Island	2	2013	0
18322	108	Lincoln	Rhode Island	3	2013	0
18323	108	Lincoln	Rhode Island	4	2013	0
18324	108	Lincoln	Rhode Island	5	2013	0
18325	108	Lincoln	Rhode Island	6	2013	0
18326	108	Lincoln	Rhode Island	7	2013	0
18327	108	Lincoln	Rhode Island	8	2013	225000
18328	108	Lincoln	Rhode Island	9	2013	0
18329	108	Lincoln	Rhode Island	10	2013	212500
18330	108	Lincoln	Rhode Island	11	2013	242000
18331	108	Lincoln	Rhode Island	12	2013	200250
18332	108	Lincoln	Rhode Island	1	2014	175000
18333	108	Lincoln	Rhode Island	2	2014	285000
18334	108	Lincoln	Rhode Island	3	2014	225000
18335	108	Lincoln	Rhode Island	4	2014	249900
18336	108	Lincoln	Rhode Island	5	2014	289000
18337	108	Lincoln	Rhode Island	6	2014	251000
18338	108	Lincoln	Rhode Island	7	2014	238700
18339	108	Lincoln	Rhode Island	8	2014	285388
18340	108	Lincoln	Rhode Island	9	2014	260000
18341	108	Lincoln	Rhode Island	10	2014	222700
18342	108	Lincoln	Rhode Island	11	2014	200000
18343	108	Lincoln	Rhode Island	12	2014	249900
18344	108	Lincoln	Rhode Island	1	2015	252450
18345	108	Lincoln	Rhode Island	2	2015	195000
18346	108	Lincoln	Rhode Island	3	2015	217000
18347	108	Lincoln	Rhode Island	4	2015	192500
18348	108	Lincoln	Rhode Island	5	2015	242500
18349	108	Lincoln	Rhode Island	6	2015	232000
18350	108	Lincoln	Rhode Island	7	2015	283500
18351	108	Lincoln	Rhode Island	8	2015	257500
18352	108	Lincoln	Rhode Island	9	2015	251500
18353	108	Lincoln	Rhode Island	10	2015	234950
18354	108	Lincoln	Rhode Island	11	2015	319900
18355	108	Lincoln	Rhode Island	12	2015	222500
18356	108	Lincoln	Rhode Island	1	2016	192000
18357	108	Lincoln	Rhode Island	2	2016	242500
18358	108	Lincoln	Rhode Island	3	2016	205500
18359	108	Lincoln	Rhode Island	4	2016	218750
18360	108	Lincoln	Rhode Island	5	2016	262500
18361	108	Lincoln	Rhode Island	6	2016	240000
18362	108	Lincoln	Rhode Island	7	2016	345000
18363	108	Lincoln	Rhode Island	8	2016	266550
18364	108	Lincoln	Rhode Island	9	2016	262500
18365	108	Lincoln	Rhode Island	10	2016	255000
18366	108	Lincoln	Rhode Island	11	2016	242000
18367	108	Lincoln	Rhode Island	12	2016	241150
18368	108	Lincoln	Rhode Island	1	2017	249900
18369	108	Lincoln	Rhode Island	2	2017	213000
18370	108	Lincoln	Rhode Island	3	2017	260000
18371	108	Lincoln	Rhode Island	4	2017	294000
18372	108	Lincoln	Rhode Island	5	2017	259900
18673	114	Nashville	Tennessee	3	2012	0
18373	108	Lincoln	Rhode Island	6	2017	250000
18374	108	Lincoln	Rhode Island	7	2017	285000
18375	108	Lincoln	Rhode Island	8	2017	316500
18376	108	Lincoln	Rhode Island	9	2017	292500
18377	108	Lincoln	Rhode Island	10	2017	315000
18378	108	Lincoln	Rhode Island	11	2017	208500
18379	108	Lincoln	Rhode Island	12	2017	272000
18380	108	Lincoln	Rhode Island	1	2018	208000
18381	108	Lincoln	Rhode Island	2	2018	263000
18382	108	Lincoln	Rhode Island	3	2018	296650
18383	108	Lincoln	Rhode Island	4	2018	310000
18384	108	Lincoln	Rhode Island	5	2018	247000
18385	108	Lincoln	Rhode Island	6	2018	272500
18386	108	Lincoln	Rhode Island	7	2018	275000
18387	108	Lincoln	Rhode Island	8	2018	257500
18388	108	Lincoln	Rhode Island	9	2018	267100
18389	108	Lincoln	Rhode Island	10	2018	290500
18390	108	Lincoln	Rhode Island	11	2018	350000
18391	108	Lincoln	Rhode Island	12	2018	264000
18392	108	Lincoln	Rhode Island	1	2019	0
18393	109	North Providence	Rhode Island	1	2009	0
18394	109	North Providence	Rhode Island	2	2009	0
18395	109	North Providence	Rhode Island	3	2009	0
18396	109	North Providence	Rhode Island	4	2009	0
18397	109	North Providence	Rhode Island	5	2009	0
18398	109	North Providence	Rhode Island	6	2009	0
18399	109	North Providence	Rhode Island	7	2009	0
18400	109	North Providence	Rhode Island	8	2009	0
18401	109	North Providence	Rhode Island	9	2009	0
18402	109	North Providence	Rhode Island	10	2009	0
18403	109	North Providence	Rhode Island	11	2009	0
18404	109	North Providence	Rhode Island	12	2009	0
18405	109	North Providence	Rhode Island	1	2010	0
18406	109	North Providence	Rhode Island	2	2010	0
18407	109	North Providence	Rhode Island	3	2010	0
18408	109	North Providence	Rhode Island	4	2010	0
18409	109	North Providence	Rhode Island	5	2010	0
18410	109	North Providence	Rhode Island	6	2010	0
18411	109	North Providence	Rhode Island	7	2010	0
18412	109	North Providence	Rhode Island	8	2010	0
18413	109	North Providence	Rhode Island	9	2010	0
18414	109	North Providence	Rhode Island	10	2010	0
18415	109	North Providence	Rhode Island	11	2010	0
18416	109	North Providence	Rhode Island	12	2010	0
18417	109	North Providence	Rhode Island	1	2011	0
18418	109	North Providence	Rhode Island	2	2011	0
18419	109	North Providence	Rhode Island	3	2011	0
18420	109	North Providence	Rhode Island	4	2011	0
18421	109	North Providence	Rhode Island	5	2011	0
18422	109	North Providence	Rhode Island	6	2011	0
18423	109	North Providence	Rhode Island	7	2011	0
18424	109	North Providence	Rhode Island	8	2011	0
18425	109	North Providence	Rhode Island	9	2011	0
18426	109	North Providence	Rhode Island	10	2011	0
18427	109	North Providence	Rhode Island	11	2011	0
18428	109	North Providence	Rhode Island	12	2011	0
18429	109	North Providence	Rhode Island	1	2012	0
18430	109	North Providence	Rhode Island	2	2012	0
18431	109	North Providence	Rhode Island	3	2012	0
18432	109	North Providence	Rhode Island	4	2012	0
18433	109	North Providence	Rhode Island	5	2012	0
18434	109	North Providence	Rhode Island	6	2012	0
18435	109	North Providence	Rhode Island	7	2012	0
18436	109	North Providence	Rhode Island	8	2012	0
18437	109	North Providence	Rhode Island	9	2012	0
18438	109	North Providence	Rhode Island	10	2012	0
18439	109	North Providence	Rhode Island	11	2012	0
18440	109	North Providence	Rhode Island	12	2012	0
18441	109	North Providence	Rhode Island	1	2013	0
18442	109	North Providence	Rhode Island	2	2013	0
18443	109	North Providence	Rhode Island	3	2013	0
18444	109	North Providence	Rhode Island	4	2013	0
18445	109	North Providence	Rhode Island	5	2013	0
18446	109	North Providence	Rhode Island	6	2013	0
18447	109	North Providence	Rhode Island	7	2013	0
18448	109	North Providence	Rhode Island	8	2013	154950
18449	109	North Providence	Rhode Island	9	2013	148950
18450	109	North Providence	Rhode Island	10	2013	149900
18451	109	North Providence	Rhode Island	11	2013	154500
18452	109	North Providence	Rhode Island	12	2013	145000
18453	109	North Providence	Rhode Island	1	2014	170000
18454	109	North Providence	Rhode Island	2	2014	116250
18455	109	North Providence	Rhode Island	3	2014	158000
18456	109	North Providence	Rhode Island	4	2014	160000
18457	109	North Providence	Rhode Island	5	2014	158400
18458	109	North Providence	Rhode Island	6	2014	166700
18459	109	North Providence	Rhode Island	7	2014	184000
18460	109	North Providence	Rhode Island	8	2014	157000
18461	109	North Providence	Rhode Island	9	2014	152000
18462	109	North Providence	Rhode Island	10	2014	156000
18463	109	North Providence	Rhode Island	11	2014	173000
18464	109	North Providence	Rhode Island	12	2014	159000
18465	109	North Providence	Rhode Island	1	2015	140500
18466	109	North Providence	Rhode Island	2	2015	176500
18467	109	North Providence	Rhode Island	3	2015	168000
18468	109	North Providence	Rhode Island	4	2015	150000
18469	109	North Providence	Rhode Island	5	2015	181000
18470	109	North Providence	Rhode Island	6	2015	172000
18471	109	North Providence	Rhode Island	7	2015	180000
18472	109	North Providence	Rhode Island	8	2015	170250
18473	109	North Providence	Rhode Island	9	2015	184200
18474	109	North Providence	Rhode Island	10	2015	182450
18475	109	North Providence	Rhode Island	11	2015	184400
18476	109	North Providence	Rhode Island	12	2015	172500
18477	109	North Providence	Rhode Island	1	2016	200000
18478	109	North Providence	Rhode Island	2	2016	160000
18479	109	North Providence	Rhode Island	3	2016	190000
18480	109	North Providence	Rhode Island	4	2016	173000
18481	109	North Providence	Rhode Island	5	2016	176200
18482	109	North Providence	Rhode Island	6	2016	197000
18483	109	North Providence	Rhode Island	7	2016	179500
18484	109	North Providence	Rhode Island	8	2016	184000
18485	109	North Providence	Rhode Island	9	2016	187500
18486	109	North Providence	Rhode Island	10	2016	196000
18487	109	North Providence	Rhode Island	11	2016	184950
18488	109	North Providence	Rhode Island	12	2016	180000
18489	109	North Providence	Rhode Island	1	2017	177000
18490	109	North Providence	Rhode Island	2	2017	205000
18491	109	North Providence	Rhode Island	3	2017	185000
18492	109	North Providence	Rhode Island	4	2017	195700
18493	109	North Providence	Rhode Island	5	2017	179500
18494	109	North Providence	Rhode Island	6	2017	210000
18495	109	North Providence	Rhode Island	7	2017	193000
18496	109	North Providence	Rhode Island	8	2017	210000
18497	109	North Providence	Rhode Island	9	2017	215250
18498	109	North Providence	Rhode Island	10	2017	205000
18499	109	North Providence	Rhode Island	11	2017	219900
18500	109	North Providence	Rhode Island	12	2017	195000
18501	109	North Providence	Rhode Island	1	2018	223750
18502	109	North Providence	Rhode Island	2	2018	208750
18503	109	North Providence	Rhode Island	3	2018	196500
18504	109	North Providence	Rhode Island	4	2018	221500
18505	109	North Providence	Rhode Island	5	2018	225000
18506	109	North Providence	Rhode Island	6	2018	206000
18507	109	North Providence	Rhode Island	7	2018	227250
18508	109	North Providence	Rhode Island	8	2018	225000
18509	109	North Providence	Rhode Island	9	2018	224450
18510	109	North Providence	Rhode Island	10	2018	209950
18511	109	North Providence	Rhode Island	11	2018	225750
18512	109	North Providence	Rhode Island	12	2018	211000
18513	109	North Providence	Rhode Island	1	2019	0
18514	112	North Charleston	South Carolina	1	2009	0
18515	112	North Charleston	South Carolina	2	2009	0
18516	112	North Charleston	South Carolina	3	2009	0
18517	112	North Charleston	South Carolina	4	2009	0
18518	112	North Charleston	South Carolina	5	2009	0
18519	112	North Charleston	South Carolina	6	2009	0
18520	112	North Charleston	South Carolina	7	2009	0
18521	112	North Charleston	South Carolina	8	2009	0
18522	112	North Charleston	South Carolina	9	2009	0
18523	112	North Charleston	South Carolina	10	2009	0
18524	112	North Charleston	South Carolina	11	2009	0
18525	112	North Charleston	South Carolina	12	2009	0
18526	112	North Charleston	South Carolina	1	2010	0
18527	112	North Charleston	South Carolina	2	2010	0
18528	112	North Charleston	South Carolina	3	2010	0
18529	112	North Charleston	South Carolina	4	2010	0
18530	112	North Charleston	South Carolina	5	2010	0
18531	112	North Charleston	South Carolina	6	2010	0
18532	112	North Charleston	South Carolina	7	2010	0
18533	112	North Charleston	South Carolina	8	2010	0
18534	112	North Charleston	South Carolina	9	2010	0
18535	112	North Charleston	South Carolina	10	2010	0
18536	112	North Charleston	South Carolina	11	2010	0
18537	112	North Charleston	South Carolina	12	2010	0
18538	112	North Charleston	South Carolina	1	2011	0
18539	112	North Charleston	South Carolina	2	2011	0
18540	112	North Charleston	South Carolina	3	2011	0
18541	112	North Charleston	South Carolina	4	2011	0
18542	112	North Charleston	South Carolina	5	2011	0
18543	112	North Charleston	South Carolina	6	2011	0
18544	112	North Charleston	South Carolina	7	2011	0
18545	112	North Charleston	South Carolina	8	2011	0
18546	112	North Charleston	South Carolina	9	2011	0
18547	112	North Charleston	South Carolina	10	2011	0
18548	112	North Charleston	South Carolina	11	2011	0
18549	112	North Charleston	South Carolina	12	2011	0
18550	112	North Charleston	South Carolina	1	2012	79365
18551	112	North Charleston	South Carolina	2	2012	79365
18552	112	North Charleston	South Carolina	3	2012	73115
18553	112	North Charleston	South Carolina	4	2012	86000
18554	112	North Charleston	South Carolina	5	2012	113750
18555	112	North Charleston	South Carolina	6	2012	134065
18556	112	North Charleston	South Carolina	7	2012	132800
18557	112	North Charleston	South Carolina	8	2012	137200
18558	112	North Charleston	South Carolina	9	2012	163000
18559	112	North Charleston	South Carolina	10	2012	178500
18560	112	North Charleston	South Carolina	11	2012	154805
18561	112	North Charleston	South Carolina	12	2012	151706
18562	112	North Charleston	South Carolina	1	2013	155750
18563	112	North Charleston	South Carolina	2	2013	189000
18564	112	North Charleston	South Carolina	3	2013	185500
18565	112	North Charleston	South Carolina	4	2013	151625
18566	112	North Charleston	South Carolina	5	2013	143409
18567	112	North Charleston	South Carolina	6	2013	139900
18568	112	North Charleston	South Carolina	7	2013	144205
18569	112	North Charleston	South Carolina	8	2013	165000
18570	112	North Charleston	South Carolina	9	2013	182427
18571	112	North Charleston	South Carolina	10	2013	165000
18572	112	North Charleston	South Carolina	11	2013	134500
18573	112	North Charleston	South Carolina	12	2013	132000
18574	112	North Charleston	South Carolina	1	2014	153900
18575	112	North Charleston	South Carolina	2	2014	182500
18576	112	North Charleston	South Carolina	3	2014	191800
18577	112	North Charleston	South Carolina	4	2014	194000
18578	112	North Charleston	South Carolina	5	2014	192400
18579	112	North Charleston	South Carolina	6	2014	195000
18580	112	North Charleston	South Carolina	7	2014	195577
18581	112	North Charleston	South Carolina	8	2014	198750
18582	112	North Charleston	South Carolina	9	2014	168750
18583	112	North Charleston	South Carolina	10	2014	164500
18584	112	North Charleston	South Carolina	11	2014	142500
18585	112	North Charleston	South Carolina	12	2014	157500
18586	112	North Charleston	South Carolina	1	2015	175000
18587	112	North Charleston	South Carolina	2	2015	193000
18588	112	North Charleston	South Carolina	3	2015	203000
18589	112	North Charleston	South Carolina	4	2015	189900
18590	112	North Charleston	South Carolina	5	2015	189900
18591	112	North Charleston	South Carolina	6	2015	189900
18592	112	North Charleston	South Carolina	7	2015	201000
18593	112	North Charleston	South Carolina	8	2015	205500
18594	112	North Charleston	South Carolina	9	2015	209000
18595	112	North Charleston	South Carolina	10	2015	200000
18596	112	North Charleston	South Carolina	11	2015	210000
18597	112	North Charleston	South Carolina	12	2015	221400
18598	112	North Charleston	South Carolina	1	2016	240000
18599	112	North Charleston	South Carolina	2	2016	250500
18600	112	North Charleston	South Carolina	3	2016	232000
18601	112	North Charleston	South Carolina	4	2016	227500
18602	112	North Charleston	South Carolina	5	2016	227500
18603	112	North Charleston	South Carolina	6	2016	239850
18604	112	North Charleston	South Carolina	7	2016	246500
18605	112	North Charleston	South Carolina	8	2016	249950
18606	112	North Charleston	South Carolina	9	2016	260000
18607	112	North Charleston	South Carolina	10	2016	239000
18608	112	North Charleston	South Carolina	11	2016	233033
18609	112	North Charleston	South Carolina	12	2016	231189
18610	112	North Charleston	South Carolina	1	2017	227000
18611	112	North Charleston	South Carolina	2	2017	231189
18612	112	North Charleston	South Carolina	3	2017	251000
18613	112	North Charleston	South Carolina	4	2017	287500
18614	112	North Charleston	South Carolina	5	2017	304500
18615	112	North Charleston	South Carolina	6	2017	275000
18616	112	North Charleston	South Carolina	7	2017	275000
18617	112	North Charleston	South Carolina	8	2017	263500
18618	112	North Charleston	South Carolina	9	2017	276000
18619	112	North Charleston	South Carolina	10	2017	260000
18620	112	North Charleston	South Carolina	11	2017	254500
18621	112	North Charleston	South Carolina	12	2017	268250
18622	112	North Charleston	South Carolina	1	2018	287500
18623	112	North Charleston	South Carolina	2	2018	300000
18624	112	North Charleston	South Carolina	3	2018	301950
18625	112	North Charleston	South Carolina	4	2018	317675
18626	112	North Charleston	South Carolina	5	2018	310000
18627	112	North Charleston	South Carolina	6	2018	315000
18628	112	North Charleston	South Carolina	7	2018	311655
18629	112	North Charleston	South Carolina	8	2018	312310
18630	112	North Charleston	South Carolina	9	2018	290000
18631	112	North Charleston	South Carolina	10	2018	280000
18632	112	North Charleston	South Carolina	11	2018	275000
18633	112	North Charleston	South Carolina	12	2018	315000
18634	112	North Charleston	South Carolina	1	2019	0
18635	114	Nashville	Tennessee	1	2009	0
18636	114	Nashville	Tennessee	2	2009	0
18637	114	Nashville	Tennessee	3	2009	0
18638	114	Nashville	Tennessee	4	2009	0
18639	114	Nashville	Tennessee	5	2009	0
18640	114	Nashville	Tennessee	6	2009	0
18641	114	Nashville	Tennessee	7	2009	0
18642	114	Nashville	Tennessee	8	2009	0
18643	114	Nashville	Tennessee	9	2009	0
18644	114	Nashville	Tennessee	10	2009	0
18645	114	Nashville	Tennessee	11	2009	0
18646	114	Nashville	Tennessee	12	2009	0
18647	114	Nashville	Tennessee	1	2010	0
18648	114	Nashville	Tennessee	2	2010	0
18649	114	Nashville	Tennessee	3	2010	0
18650	114	Nashville	Tennessee	4	2010	0
18651	114	Nashville	Tennessee	5	2010	0
18652	114	Nashville	Tennessee	6	2010	0
18653	114	Nashville	Tennessee	7	2010	0
18654	114	Nashville	Tennessee	8	2010	0
18655	114	Nashville	Tennessee	9	2010	0
18656	114	Nashville	Tennessee	10	2010	0
18657	114	Nashville	Tennessee	11	2010	0
18658	114	Nashville	Tennessee	12	2010	0
18659	114	Nashville	Tennessee	1	2011	0
18660	114	Nashville	Tennessee	2	2011	0
18661	114	Nashville	Tennessee	3	2011	0
18662	114	Nashville	Tennessee	4	2011	0
18663	114	Nashville	Tennessee	5	2011	0
18664	114	Nashville	Tennessee	6	2011	0
18665	114	Nashville	Tennessee	7	2011	0
18666	114	Nashville	Tennessee	8	2011	0
18667	114	Nashville	Tennessee	9	2011	0
18668	114	Nashville	Tennessee	10	2011	0
18669	114	Nashville	Tennessee	11	2011	0
18670	114	Nashville	Tennessee	12	2011	0
18671	114	Nashville	Tennessee	1	2012	0
18672	114	Nashville	Tennessee	2	2012	0
18674	114	Nashville	Tennessee	4	2012	0
18675	114	Nashville	Tennessee	5	2012	0
18676	114	Nashville	Tennessee	6	2012	0
18677	114	Nashville	Tennessee	7	2012	0
18678	114	Nashville	Tennessee	8	2012	0
18679	114	Nashville	Tennessee	9	2012	0
18680	114	Nashville	Tennessee	10	2012	0
18681	114	Nashville	Tennessee	11	2012	0
18682	114	Nashville	Tennessee	12	2012	0
18683	114	Nashville	Tennessee	1	2013	165000
18684	114	Nashville	Tennessee	2	2013	165301
18685	114	Nashville	Tennessee	3	2013	166917
18686	114	Nashville	Tennessee	4	2013	179900
18687	114	Nashville	Tennessee	5	2013	190000
18688	114	Nashville	Tennessee	6	2013	196600
18689	114	Nashville	Tennessee	7	2013	196500
18690	114	Nashville	Tennessee	8	2013	190000
18691	114	Nashville	Tennessee	9	2013	189000
18692	114	Nashville	Tennessee	10	2013	194000
18693	114	Nashville	Tennessee	11	2013	190000
18694	114	Nashville	Tennessee	12	2013	192115
18695	114	Nashville	Tennessee	1	2014	190000
18696	114	Nashville	Tennessee	2	2014	184000
18697	114	Nashville	Tennessee	3	2014	189970
18698	114	Nashville	Tennessee	4	2014	195000
18699	114	Nashville	Tennessee	5	2014	202900
18700	114	Nashville	Tennessee	6	2014	217900
18701	114	Nashville	Tennessee	7	2014	213000
18702	114	Nashville	Tennessee	8	2014	206950
18703	114	Nashville	Tennessee	9	2014	200000
18704	114	Nashville	Tennessee	10	2014	200000
18705	114	Nashville	Tennessee	11	2014	209900
18706	114	Nashville	Tennessee	12	2014	205000
18707	114	Nashville	Tennessee	1	2015	202700
18708	114	Nashville	Tennessee	2	2015	205000
18709	114	Nashville	Tennessee	3	2015	209000
18710	114	Nashville	Tennessee	4	2015	215900
18711	114	Nashville	Tennessee	5	2015	224450
18712	114	Nashville	Tennessee	6	2015	226000
18713	114	Nashville	Tennessee	7	2015	224000
18714	114	Nashville	Tennessee	8	2015	224900
18715	114	Nashville	Tennessee	9	2015	229275
18716	114	Nashville	Tennessee	10	2015	222000
18717	114	Nashville	Tennessee	11	2015	225900
18718	114	Nashville	Tennessee	12	2015	229900
18719	114	Nashville	Tennessee	1	2016	225000
18720	114	Nashville	Tennessee	2	2016	225400
18721	114	Nashville	Tennessee	3	2016	230000
18722	114	Nashville	Tennessee	4	2016	239900
18723	114	Nashville	Tennessee	5	2016	248218
18724	114	Nashville	Tennessee	6	2016	249000
18725	114	Nashville	Tennessee	7	2016	257000
18726	114	Nashville	Tennessee	8	2016	244300
18727	114	Nashville	Tennessee	9	2016	245000
18728	114	Nashville	Tennessee	10	2016	249995
18729	114	Nashville	Tennessee	11	2016	244000
18730	114	Nashville	Tennessee	12	2016	257750
18731	114	Nashville	Tennessee	1	2017	245000
18732	114	Nashville	Tennessee	2	2017	249250
18733	114	Nashville	Tennessee	3	2017	259922
18734	114	Nashville	Tennessee	4	2017	260000
18735	114	Nashville	Tennessee	5	2017	269489
18736	114	Nashville	Tennessee	6	2017	279000
18737	114	Nashville	Tennessee	7	2017	272000
18738	114	Nashville	Tennessee	8	2017	275000
18739	114	Nashville	Tennessee	9	2017	274735
18740	114	Nashville	Tennessee	10	2017	268000
18741	114	Nashville	Tennessee	11	2017	273976
18742	114	Nashville	Tennessee	12	2017	279500
18743	114	Nashville	Tennessee	1	2018	269900
18744	114	Nashville	Tennessee	2	2018	275000
18745	114	Nashville	Tennessee	3	2018	280000
18746	114	Nashville	Tennessee	4	2018	280821
18747	114	Nashville	Tennessee	5	2018	289000
18748	114	Nashville	Tennessee	6	2018	297100
18749	114	Nashville	Tennessee	7	2018	296834
18750	114	Nashville	Tennessee	8	2018	293000
18751	114	Nashville	Tennessee	9	2018	279900
18752	114	Nashville	Tennessee	10	2018	282500
18753	114	Nashville	Tennessee	11	2018	285000
18754	114	Nashville	Tennessee	12	2018	289500
18755	114	Nashville	Tennessee	1	2019	0
18756	119	Richmond	Texas	1	2009	0
18757	119	Richmond	Texas	2	2009	0
18758	119	Richmond	Texas	3	2009	0
18759	119	Richmond	Texas	4	2009	0
18760	119	Richmond	Texas	5	2009	0
18761	119	Richmond	Texas	6	2009	0
18762	119	Richmond	Texas	7	2009	0
18763	119	Richmond	Texas	8	2009	0
18764	119	Richmond	Texas	9	2009	0
18765	119	Richmond	Texas	10	2009	0
18766	119	Richmond	Texas	11	2009	0
18767	119	Richmond	Texas	12	2009	0
18768	119	Richmond	Texas	1	2010	0
18769	119	Richmond	Texas	2	2010	0
18770	119	Richmond	Texas	3	2010	0
18771	119	Richmond	Texas	4	2010	0
18772	119	Richmond	Texas	5	2010	0
18773	119	Richmond	Texas	6	2010	0
18774	119	Richmond	Texas	7	2010	0
18775	119	Richmond	Texas	8	2010	0
18776	119	Richmond	Texas	9	2010	0
18777	119	Richmond	Texas	10	2010	0
18778	119	Richmond	Texas	11	2010	0
18779	119	Richmond	Texas	12	2010	0
18780	119	Richmond	Texas	1	2011	0
18781	119	Richmond	Texas	2	2011	0
18782	119	Richmond	Texas	3	2011	0
18783	119	Richmond	Texas	4	2011	0
18784	119	Richmond	Texas	5	2011	0
18785	119	Richmond	Texas	6	2011	0
18786	119	Richmond	Texas	7	2011	0
18787	119	Richmond	Texas	8	2011	0
18788	119	Richmond	Texas	9	2011	0
18789	119	Richmond	Texas	10	2011	0
18790	119	Richmond	Texas	11	2011	0
18791	119	Richmond	Texas	12	2011	0
18792	119	Richmond	Texas	1	2012	0
18793	119	Richmond	Texas	2	2012	0
18794	119	Richmond	Texas	3	2012	0
18795	119	Richmond	Texas	4	2012	0
18796	119	Richmond	Texas	5	2012	0
18797	119	Richmond	Texas	6	2012	0
18798	119	Richmond	Texas	7	2012	0
18799	119	Richmond	Texas	8	2012	0
18800	119	Richmond	Texas	9	2012	0
18801	119	Richmond	Texas	10	2012	0
18802	119	Richmond	Texas	11	2012	0
18803	119	Richmond	Texas	12	2012	187000
18804	119	Richmond	Texas	1	2013	200000
18805	119	Richmond	Texas	2	2013	188500
18806	119	Richmond	Texas	3	2013	189050
18807	119	Richmond	Texas	4	2013	206441
18808	119	Richmond	Texas	5	2013	219139
18809	119	Richmond	Texas	6	2013	197675
18810	119	Richmond	Texas	7	2013	202000
18811	119	Richmond	Texas	8	2013	205000
18812	119	Richmond	Texas	9	2013	199939
18813	119	Richmond	Texas	10	2013	199000
18814	119	Richmond	Texas	11	2013	210961
18815	119	Richmond	Texas	12	2013	219625
18816	119	Richmond	Texas	1	2014	206332
18817	119	Richmond	Texas	2	2014	220000
18818	119	Richmond	Texas	3	2014	227504
18819	119	Richmond	Texas	4	2014	227725
18820	119	Richmond	Texas	5	2014	219950
18821	119	Richmond	Texas	6	2014	240000
18822	119	Richmond	Texas	7	2014	222970
18823	119	Richmond	Texas	8	2014	236500
18824	119	Richmond	Texas	9	2014	237500
18825	119	Richmond	Texas	10	2014	225000
18826	119	Richmond	Texas	11	2014	245000
18827	119	Richmond	Texas	12	2014	248750
18828	119	Richmond	Texas	1	2015	228294
18829	119	Richmond	Texas	2	2015	249320
18830	119	Richmond	Texas	3	2015	252162
18831	119	Richmond	Texas	4	2015	243625
18832	119	Richmond	Texas	5	2015	254000
18833	119	Richmond	Texas	6	2015	240000
18834	119	Richmond	Texas	7	2015	244998
18835	119	Richmond	Texas	8	2015	254032
18836	119	Richmond	Texas	9	2015	246915
18837	119	Richmond	Texas	10	2015	257401
18838	119	Richmond	Texas	11	2015	250000
18839	119	Richmond	Texas	12	2015	265000
18840	119	Richmond	Texas	1	2016	260373
18841	119	Richmond	Texas	2	2016	232000
18842	119	Richmond	Texas	3	2016	245000
18843	119	Richmond	Texas	4	2016	238500
18844	119	Richmond	Texas	5	2016	266250
18845	119	Richmond	Texas	6	2016	279000
18846	119	Richmond	Texas	7	2016	261000
18847	119	Richmond	Texas	8	2016	255000
18848	119	Richmond	Texas	9	2016	249000
18849	119	Richmond	Texas	10	2016	254716
18850	119	Richmond	Texas	11	2016	268000
18851	119	Richmond	Texas	12	2016	276095
18852	119	Richmond	Texas	1	2017	250000
18853	119	Richmond	Texas	2	2017	257000
18854	119	Richmond	Texas	3	2017	260000
18855	119	Richmond	Texas	4	2017	259225
18856	119	Richmond	Texas	5	2017	255000
18857	119	Richmond	Texas	6	2017	259596
18858	119	Richmond	Texas	7	2017	254900
18859	119	Richmond	Texas	8	2017	265250
18860	119	Richmond	Texas	9	2017	260000
18861	119	Richmond	Texas	10	2017	262000
18862	119	Richmond	Texas	11	2017	271988
18863	119	Richmond	Texas	12	2017	283463
18864	119	Richmond	Texas	1	2018	270000
18865	119	Richmond	Texas	2	2018	272000
18866	119	Richmond	Texas	3	2018	276895
18867	119	Richmond	Texas	4	2018	271892
18868	119	Richmond	Texas	5	2018	269000
18869	119	Richmond	Texas	6	2018	282000
18870	119	Richmond	Texas	7	2018	272000
18871	119	Richmond	Texas	8	2018	271320
18872	119	Richmond	Texas	9	2018	281365
18873	119	Richmond	Texas	10	2018	279500
18874	119	Richmond	Texas	11	2018	279993
18875	119	Richmond	Texas	12	2018	277990
18876	119	Richmond	Texas	1	2019	0
18877	123	South Burlington	Vermont	1	2009	0
18878	123	South Burlington	Vermont	2	2009	0
18879	123	South Burlington	Vermont	3	2009	0
18880	123	South Burlington	Vermont	4	2009	0
18881	123	South Burlington	Vermont	5	2009	0
18882	123	South Burlington	Vermont	6	2009	0
18883	123	South Burlington	Vermont	7	2009	0
18884	123	South Burlington	Vermont	8	2009	0
18885	123	South Burlington	Vermont	9	2009	0
18886	123	South Burlington	Vermont	10	2009	0
18887	123	South Burlington	Vermont	11	2009	0
18888	123	South Burlington	Vermont	12	2009	0
18889	123	South Burlington	Vermont	1	2010	0
18890	123	South Burlington	Vermont	2	2010	0
18891	123	South Burlington	Vermont	3	2010	0
18892	123	South Burlington	Vermont	4	2010	0
18893	123	South Burlington	Vermont	5	2010	0
18894	123	South Burlington	Vermont	6	2010	0
18895	123	South Burlington	Vermont	7	2010	0
18896	123	South Burlington	Vermont	8	2010	0
18897	123	South Burlington	Vermont	9	2010	0
18898	123	South Burlington	Vermont	10	2010	0
18899	123	South Burlington	Vermont	11	2010	0
18900	123	South Burlington	Vermont	12	2010	0
18901	123	South Burlington	Vermont	1	2011	0
18902	123	South Burlington	Vermont	2	2011	0
18903	123	South Burlington	Vermont	3	2011	0
18904	123	South Burlington	Vermont	4	2011	0
18905	123	South Burlington	Vermont	5	2011	0
18906	123	South Burlington	Vermont	6	2011	0
18907	123	South Burlington	Vermont	7	2011	0
18908	123	South Burlington	Vermont	8	2011	0
18909	123	South Burlington	Vermont	9	2011	0
18910	123	South Burlington	Vermont	10	2011	0
18911	123	South Burlington	Vermont	11	2011	0
18912	123	South Burlington	Vermont	12	2011	0
18913	123	South Burlington	Vermont	1	2012	251500
18914	123	South Burlington	Vermont	2	2012	220000
18915	123	South Burlington	Vermont	3	2012	206400
18916	123	South Burlington	Vermont	4	2012	182900
18917	123	South Burlington	Vermont	5	2012	229900
18918	123	South Burlington	Vermont	6	2012	229450
18919	123	South Burlington	Vermont	7	2012	247500
18920	123	South Burlington	Vermont	8	2012	247500
18921	123	South Burlington	Vermont	9	2012	282500
18922	123	South Burlington	Vermont	10	2012	314000
18923	123	South Burlington	Vermont	11	2012	290000
18924	123	South Burlington	Vermont	12	2012	275250
18925	123	South Burlington	Vermont	1	2013	274750
18926	123	South Burlington	Vermont	2	2013	239000
18927	123	South Burlington	Vermont	3	2013	222500
18928	123	South Burlington	Vermont	4	2013	242500
18929	123	South Burlington	Vermont	5	2013	253500
18930	123	South Burlington	Vermont	6	2013	273000
18931	123	South Burlington	Vermont	7	2013	297500
18932	123	South Burlington	Vermont	8	2013	270000
18933	123	South Burlington	Vermont	9	2013	269950
18934	123	South Burlington	Vermont	10	2013	270625
18935	123	South Burlington	Vermont	11	2013	277538
18936	123	South Burlington	Vermont	12	2013	233500
18937	123	South Burlington	Vermont	1	2014	205500
18938	123	South Burlington	Vermont	2	2014	195000
18939	123	South Burlington	Vermont	3	2014	254200
18940	123	South Burlington	Vermont	4	2014	265600
18941	123	South Burlington	Vermont	5	2014	296000
18942	123	South Burlington	Vermont	6	2014	274900
18943	123	South Burlington	Vermont	7	2014	283425
18944	123	South Burlington	Vermont	8	2014	278322
18945	123	South Burlington	Vermont	9	2014	293650
18946	123	South Burlington	Vermont	10	2014	279500
18947	123	South Burlington	Vermont	11	2014	252500
18948	123	South Burlington	Vermont	12	2014	266000
18949	123	South Burlington	Vermont	1	2015	266000
18950	123	South Burlington	Vermont	2	2015	267000
18951	123	South Burlington	Vermont	3	2015	261599
18952	123	South Burlington	Vermont	4	2015	275100
18953	123	South Burlington	Vermont	5	2015	278900
18954	123	South Burlington	Vermont	6	2015	293125
18955	123	South Burlington	Vermont	7	2015	278900
18956	123	South Burlington	Vermont	8	2015	268000
18957	123	South Burlington	Vermont	9	2015	249900
18958	123	South Burlington	Vermont	10	2015	238000
18959	123	South Burlington	Vermont	11	2015	264950
18960	123	South Burlington	Vermont	12	2015	302000
18961	123	South Burlington	Vermont	1	2016	299000
18962	123	South Burlington	Vermont	2	2016	299000
18963	123	South Burlington	Vermont	3	2016	252750
18964	123	South Burlington	Vermont	4	2016	311250
18965	123	South Burlington	Vermont	5	2016	299500
18966	123	South Burlington	Vermont	6	2016	294750
18967	123	South Burlington	Vermont	7	2016	295750
18968	123	South Burlington	Vermont	8	2016	290000
18969	123	South Burlington	Vermont	9	2016	313500
18970	123	South Burlington	Vermont	10	2016	290100
18971	123	South Burlington	Vermont	11	2016	298500
18972	123	South Burlington	Vermont	12	2016	236000
18973	123	South Burlington	Vermont	1	2017	236000
18974	123	South Burlington	Vermont	2	2017	240950
18975	123	South Burlington	Vermont	3	2017	298000
18976	123	South Burlington	Vermont	4	2017	324000
18977	123	South Burlington	Vermont	5	2017	345000
18978	123	South Burlington	Vermont	6	2017	298000
18979	123	South Burlington	Vermont	7	2017	289509
18980	123	South Burlington	Vermont	8	2017	293500
18981	123	South Burlington	Vermont	9	2017	335000
18982	123	South Burlington	Vermont	10	2017	322450
18983	123	South Burlington	Vermont	11	2017	320000
18984	123	South Burlington	Vermont	12	2017	264900
18985	123	South Burlington	Vermont	1	2018	286500
18986	123	South Burlington	Vermont	2	2018	296250
18987	123	South Burlington	Vermont	3	2018	290000
18988	123	South Burlington	Vermont	4	2018	275000
18989	123	South Burlington	Vermont	5	2018	262000
18990	123	South Burlington	Vermont	6	2018	289250
18991	123	South Burlington	Vermont	7	2018	283750
18992	123	South Burlington	Vermont	8	2018	293000
18993	123	South Burlington	Vermont	9	2018	305000
18994	123	South Burlington	Vermont	10	2018	315000
18995	123	South Burlington	Vermont	11	2018	346000
18996	123	South Burlington	Vermont	12	2018	325000
18997	123	South Burlington	Vermont	1	2019	0
18998	125	Virginia Beach	Virginia	1	2009	0
18999	125	Virginia Beach	Virginia	2	2009	0
19000	125	Virginia Beach	Virginia	3	2009	0
19001	125	Virginia Beach	Virginia	4	2009	0
19002	125	Virginia Beach	Virginia	5	2009	0
19003	125	Virginia Beach	Virginia	6	2009	0
19004	125	Virginia Beach	Virginia	7	2009	0
19005	125	Virginia Beach	Virginia	8	2009	0
19006	125	Virginia Beach	Virginia	9	2009	0
19007	125	Virginia Beach	Virginia	10	2009	0
19008	125	Virginia Beach	Virginia	11	2009	0
19009	125	Virginia Beach	Virginia	12	2009	0
19010	125	Virginia Beach	Virginia	1	2010	0
19011	125	Virginia Beach	Virginia	2	2010	0
19012	125	Virginia Beach	Virginia	3	2010	0
19013	125	Virginia Beach	Virginia	4	2010	0
19014	125	Virginia Beach	Virginia	5	2010	0
19015	125	Virginia Beach	Virginia	6	2010	0
19016	125	Virginia Beach	Virginia	7	2010	0
19017	125	Virginia Beach	Virginia	8	2010	0
19018	125	Virginia Beach	Virginia	9	2010	0
19019	125	Virginia Beach	Virginia	10	2010	0
19020	125	Virginia Beach	Virginia	11	2010	0
19021	125	Virginia Beach	Virginia	12	2010	0
19022	125	Virginia Beach	Virginia	1	2011	0
19023	125	Virginia Beach	Virginia	2	2011	0
19024	125	Virginia Beach	Virginia	3	2011	0
19025	125	Virginia Beach	Virginia	4	2011	0
19026	125	Virginia Beach	Virginia	5	2011	0
19027	125	Virginia Beach	Virginia	6	2011	0
19028	125	Virginia Beach	Virginia	7	2011	0
19029	125	Virginia Beach	Virginia	8	2011	0
19030	125	Virginia Beach	Virginia	9	2011	0
19031	125	Virginia Beach	Virginia	10	2011	0
19032	125	Virginia Beach	Virginia	11	2011	0
19033	125	Virginia Beach	Virginia	12	2011	0
19034	125	Virginia Beach	Virginia	1	2012	0
19035	125	Virginia Beach	Virginia	2	2012	0
19036	125	Virginia Beach	Virginia	3	2012	0
19037	125	Virginia Beach	Virginia	4	2012	0
19038	125	Virginia Beach	Virginia	5	2012	0
19039	125	Virginia Beach	Virginia	6	2012	0
19040	125	Virginia Beach	Virginia	7	2012	0
19041	125	Virginia Beach	Virginia	8	2012	0
19042	125	Virginia Beach	Virginia	9	2012	0
19043	125	Virginia Beach	Virginia	10	2012	0
19044	125	Virginia Beach	Virginia	11	2012	0
19045	125	Virginia Beach	Virginia	12	2012	0
19046	125	Virginia Beach	Virginia	1	2013	0
19047	125	Virginia Beach	Virginia	2	2013	0
19048	125	Virginia Beach	Virginia	3	2013	0
19049	125	Virginia Beach	Virginia	4	2013	0
19050	125	Virginia Beach	Virginia	5	2013	0
19051	125	Virginia Beach	Virginia	6	2013	0
19052	125	Virginia Beach	Virginia	7	2013	0
19053	125	Virginia Beach	Virginia	8	2013	0
19054	125	Virginia Beach	Virginia	9	2013	0
19055	125	Virginia Beach	Virginia	10	2013	0
19056	125	Virginia Beach	Virginia	11	2013	0
19057	125	Virginia Beach	Virginia	12	2013	0
19058	125	Virginia Beach	Virginia	1	2014	220894
19059	125	Virginia Beach	Virginia	2	2014	214000
19060	125	Virginia Beach	Virginia	3	2014	232375
19061	125	Virginia Beach	Virginia	4	2014	239450
19062	125	Virginia Beach	Virginia	5	2014	246196
19063	125	Virginia Beach	Virginia	6	2014	240750
19064	125	Virginia Beach	Virginia	7	2014	241250
19065	125	Virginia Beach	Virginia	8	2014	236625
19066	125	Virginia Beach	Virginia	9	2014	234975
19067	125	Virginia Beach	Virginia	10	2014	234400
19068	125	Virginia Beach	Virginia	11	2014	244450
19069	125	Virginia Beach	Virginia	12	2014	230000
19070	125	Virginia Beach	Virginia	1	2015	229500
19071	125	Virginia Beach	Virginia	2	2015	230750
19072	125	Virginia Beach	Virginia	3	2015	229975
19073	125	Virginia Beach	Virginia	4	2015	239900
19074	125	Virginia Beach	Virginia	5	2015	240050
19075	125	Virginia Beach	Virginia	6	2015	244659
19076	125	Virginia Beach	Virginia	7	2015	254350
19077	125	Virginia Beach	Virginia	8	2015	241500
19078	125	Virginia Beach	Virginia	9	2015	250264
19079	125	Virginia Beach	Virginia	10	2015	238900
19080	125	Virginia Beach	Virginia	11	2015	246379
19081	125	Virginia Beach	Virginia	12	2015	249900
19082	125	Virginia Beach	Virginia	1	2016	243725
19083	125	Virginia Beach	Virginia	2	2016	230775
19084	125	Virginia Beach	Virginia	3	2016	239225
19085	125	Virginia Beach	Virginia	4	2016	246630
19086	125	Virginia Beach	Virginia	5	2016	243819
19087	125	Virginia Beach	Virginia	6	2016	255000
19088	125	Virginia Beach	Virginia	7	2016	257500
19089	125	Virginia Beach	Virginia	8	2016	255975
19090	125	Virginia Beach	Virginia	9	2016	247460
19091	125	Virginia Beach	Virginia	10	2016	243500
19092	125	Virginia Beach	Virginia	11	2016	254556
19093	125	Virginia Beach	Virginia	12	2016	253741
19094	125	Virginia Beach	Virginia	1	2017	239975
19095	125	Virginia Beach	Virginia	2	2017	245158
19096	125	Virginia Beach	Virginia	3	2017	249600
19097	125	Virginia Beach	Virginia	4	2017	246500
19098	125	Virginia Beach	Virginia	5	2017	256230
19099	125	Virginia Beach	Virginia	6	2017	274468
19100	125	Virginia Beach	Virginia	7	2017	265250
19101	125	Virginia Beach	Virginia	8	2017	255350
19102	125	Virginia Beach	Virginia	9	2017	245950
19103	125	Virginia Beach	Virginia	10	2017	250000
19104	125	Virginia Beach	Virginia	11	2017	250000
19105	125	Virginia Beach	Virginia	12	2017	245000
19106	125	Virginia Beach	Virginia	1	2018	250000
19107	125	Virginia Beach	Virginia	2	2018	245000
19108	125	Virginia Beach	Virginia	3	2018	254975
19109	125	Virginia Beach	Virginia	4	2018	259225
19110	125	Virginia Beach	Virginia	5	2018	265000
19111	125	Virginia Beach	Virginia	6	2018	269450
19112	125	Virginia Beach	Virginia	7	2018	253243
19113	125	Virginia Beach	Virginia	8	2018	259950
19114	125	Virginia Beach	Virginia	9	2018	256000
19115	125	Virginia Beach	Virginia	10	2018	261750
19116	125	Virginia Beach	Virginia	11	2018	260000
19117	125	Virginia Beach	Virginia	12	2018	250000
19118	125	Virginia Beach	Virginia	1	2019	0
19119	128	Springfield	West Virginia	1	2009	0
19120	128	Springfield	West Virginia	2	2009	0
19121	128	Springfield	West Virginia	3	2009	0
19122	128	Springfield	West Virginia	4	2009	0
19123	128	Springfield	West Virginia	5	2009	0
19124	128	Springfield	West Virginia	6	2009	0
19125	128	Springfield	West Virginia	7	2009	0
19126	128	Springfield	West Virginia	8	2009	0
19127	128	Springfield	West Virginia	9	2009	0
19128	128	Springfield	West Virginia	10	2009	0
19129	128	Springfield	West Virginia	11	2009	0
19130	128	Springfield	West Virginia	12	2009	0
19131	128	Springfield	West Virginia	1	2010	0
19132	128	Springfield	West Virginia	2	2010	0
19133	128	Springfield	West Virginia	3	2010	0
19134	128	Springfield	West Virginia	4	2010	0
19135	128	Springfield	West Virginia	5	2010	0
19136	128	Springfield	West Virginia	6	2010	0
19137	128	Springfield	West Virginia	7	2010	0
19138	128	Springfield	West Virginia	8	2010	0
19139	128	Springfield	West Virginia	9	2010	0
19140	128	Springfield	West Virginia	10	2010	0
19141	128	Springfield	West Virginia	11	2010	0
19142	128	Springfield	West Virginia	12	2010	0
19143	128	Springfield	West Virginia	1	2011	0
19144	128	Springfield	West Virginia	2	2011	0
19145	128	Springfield	West Virginia	3	2011	0
19146	128	Springfield	West Virginia	4	2011	0
19147	128	Springfield	West Virginia	5	2011	0
19148	128	Springfield	West Virginia	6	2011	0
19149	128	Springfield	West Virginia	7	2011	0
19150	128	Springfield	West Virginia	8	2011	0
19151	128	Springfield	West Virginia	9	2011	0
19152	128	Springfield	West Virginia	10	2011	0
19153	128	Springfield	West Virginia	11	2011	0
19154	128	Springfield	West Virginia	12	2011	0
19155	128	Springfield	West Virginia	1	2012	324990
19156	128	Springfield	West Virginia	2	2012	357000
19157	128	Springfield	West Virginia	3	2012	340000
19158	128	Springfield	West Virginia	4	2012	375000
19159	128	Springfield	West Virginia	5	2012	399000
19160	128	Springfield	West Virginia	6	2012	418500
19161	128	Springfield	West Virginia	7	2012	426500
19162	128	Springfield	West Virginia	8	2012	394000
19163	128	Springfield	West Virginia	9	2012	385000
19164	128	Springfield	West Virginia	10	2012	365900
19165	128	Springfield	West Virginia	11	2012	348270
19166	128	Springfield	West Virginia	12	2012	334500
19167	128	Springfield	West Virginia	1	2013	367000
19168	128	Springfield	West Virginia	2	2013	355000
19169	128	Springfield	West Virginia	3	2013	369000
19170	128	Springfield	West Virginia	4	2013	370000
19171	128	Springfield	West Virginia	5	2013	435000
19172	128	Springfield	West Virginia	6	2013	437500
19173	128	Springfield	West Virginia	7	2013	452500
19174	128	Springfield	West Virginia	8	2013	438950
19175	128	Springfield	West Virginia	9	2013	405000
19176	128	Springfield	West Virginia	10	2013	401000
19177	128	Springfield	West Virginia	11	2013	402450
19178	128	Springfield	West Virginia	12	2013	400000
19179	128	Springfield	West Virginia	1	2014	397500
19180	128	Springfield	West Virginia	2	2014	370000
19181	128	Springfield	West Virginia	3	2014	411500
19182	128	Springfield	West Virginia	4	2014	460000
19183	128	Springfield	West Virginia	5	2014	475000
19184	128	Springfield	West Virginia	6	2014	427500
19185	128	Springfield	West Virginia	7	2014	435000
19186	128	Springfield	West Virginia	8	2014	442000
19187	128	Springfield	West Virginia	9	2014	476000
19188	128	Springfield	West Virginia	10	2014	385000
19189	128	Springfield	West Virginia	11	2014	445000
19190	128	Springfield	West Virginia	12	2014	429900
19191	128	Springfield	West Virginia	1	2015	380000
19192	128	Springfield	West Virginia	2	2015	390000
19193	128	Springfield	West Virginia	3	2015	406250
19194	128	Springfield	West Virginia	4	2015	431000
19195	128	Springfield	West Virginia	5	2015	469950
19196	128	Springfield	West Virginia	6	2015	460000
19197	128	Springfield	West Virginia	7	2015	458000
19198	128	Springfield	West Virginia	8	2015	425000
19199	128	Springfield	West Virginia	9	2015	427000
19200	128	Springfield	West Virginia	10	2015	385500
19201	128	Springfield	West Virginia	11	2015	422500
19202	128	Springfield	West Virginia	12	2015	425050
19203	128	Springfield	West Virginia	1	2016	384133
19204	128	Springfield	West Virginia	2	2016	450000
19205	128	Springfield	West Virginia	3	2016	412000
19206	128	Springfield	West Virginia	4	2016	403000
19207	128	Springfield	West Virginia	5	2016	470000
19208	128	Springfield	West Virginia	6	2016	472000
19209	128	Springfield	West Virginia	7	2016	461500
19210	128	Springfield	West Virginia	8	2016	465000
19211	128	Springfield	West Virginia	9	2016	390000
19212	128	Springfield	West Virginia	10	2016	400000
19213	128	Springfield	West Virginia	11	2016	440000
19214	128	Springfield	West Virginia	12	2016	453000
19215	128	Springfield	West Virginia	1	2017	410000
19216	128	Springfield	West Virginia	2	2017	406000
19217	128	Springfield	West Virginia	3	2017	465000
19218	128	Springfield	West Virginia	4	2017	424900
19219	128	Springfield	West Virginia	5	2017	529700
19220	128	Springfield	West Virginia	6	2017	505000
19221	128	Springfield	West Virginia	7	2017	477500
19222	128	Springfield	West Virginia	8	2017	475000
19223	128	Springfield	West Virginia	9	2017	438000
19224	128	Springfield	West Virginia	10	2017	425000
19225	128	Springfield	West Virginia	11	2017	472200
19226	128	Springfield	West Virginia	12	2017	439000
19227	128	Springfield	West Virginia	1	2018	439950
19228	128	Springfield	West Virginia	2	2018	461500
19229	128	Springfield	West Virginia	3	2018	432500
19230	128	Springfield	West Virginia	4	2018	512000
19231	128	Springfield	West Virginia	5	2018	480000
19232	128	Springfield	West Virginia	6	2018	495000
19233	128	Springfield	West Virginia	7	2018	495000
19234	128	Springfield	West Virginia	8	2018	470000
19235	128	Springfield	West Virginia	9	2018	440000
19236	128	Springfield	West Virginia	10	2018	469000
19237	128	Springfield	West Virginia	11	2018	435000
19238	128	Springfield	West Virginia	12	2018	500000
19239	128	Springfield	West Virginia	1	2019	0
19240	131	New Richmond	Wisconsin	1	2009	0
19241	131	New Richmond	Wisconsin	2	2009	0
19242	131	New Richmond	Wisconsin	3	2009	0
19243	131	New Richmond	Wisconsin	4	2009	0
19244	131	New Richmond	Wisconsin	5	2009	0
19245	131	New Richmond	Wisconsin	6	2009	0
19246	131	New Richmond	Wisconsin	7	2009	0
19247	131	New Richmond	Wisconsin	8	2009	0
19248	131	New Richmond	Wisconsin	9	2009	0
19249	131	New Richmond	Wisconsin	10	2009	0
19250	131	New Richmond	Wisconsin	11	2009	0
19251	131	New Richmond	Wisconsin	12	2009	0
19252	131	New Richmond	Wisconsin	1	2010	0
19253	131	New Richmond	Wisconsin	2	2010	0
19254	131	New Richmond	Wisconsin	3	2010	0
19255	131	New Richmond	Wisconsin	4	2010	0
19256	131	New Richmond	Wisconsin	5	2010	0
19257	131	New Richmond	Wisconsin	6	2010	0
19258	131	New Richmond	Wisconsin	7	2010	0
19259	131	New Richmond	Wisconsin	8	2010	0
19260	131	New Richmond	Wisconsin	9	2010	0
19261	131	New Richmond	Wisconsin	10	2010	0
19262	131	New Richmond	Wisconsin	11	2010	0
19263	131	New Richmond	Wisconsin	12	2010	0
19264	131	New Richmond	Wisconsin	1	2011	0
19265	131	New Richmond	Wisconsin	2	2011	0
19266	131	New Richmond	Wisconsin	3	2011	0
19267	131	New Richmond	Wisconsin	4	2011	0
19268	131	New Richmond	Wisconsin	5	2011	0
19269	131	New Richmond	Wisconsin	6	2011	0
19270	131	New Richmond	Wisconsin	7	2011	0
19271	131	New Richmond	Wisconsin	8	2011	0
19272	131	New Richmond	Wisconsin	9	2011	0
19273	131	New Richmond	Wisconsin	10	2011	0
19274	131	New Richmond	Wisconsin	11	2011	0
19275	131	New Richmond	Wisconsin	12	2011	0
19276	131	New Richmond	Wisconsin	1	2012	0
19277	131	New Richmond	Wisconsin	2	2012	0
19278	131	New Richmond	Wisconsin	3	2012	0
19279	131	New Richmond	Wisconsin	4	2012	0
19280	131	New Richmond	Wisconsin	5	2012	0
19281	131	New Richmond	Wisconsin	6	2012	0
19282	131	New Richmond	Wisconsin	7	2012	0
19283	131	New Richmond	Wisconsin	8	2012	0
19284	131	New Richmond	Wisconsin	9	2012	0
19285	131	New Richmond	Wisconsin	10	2012	0
19286	131	New Richmond	Wisconsin	11	2012	0
19287	131	New Richmond	Wisconsin	12	2012	0
19288	131	New Richmond	Wisconsin	1	2013	0
19289	131	New Richmond	Wisconsin	2	2013	0
19290	131	New Richmond	Wisconsin	3	2013	0
19291	131	New Richmond	Wisconsin	4	2013	0
19292	131	New Richmond	Wisconsin	5	2013	0
19293	131	New Richmond	Wisconsin	6	2013	0
19294	131	New Richmond	Wisconsin	7	2013	0
19295	131	New Richmond	Wisconsin	8	2013	0
19296	131	New Richmond	Wisconsin	9	2013	0
19297	131	New Richmond	Wisconsin	10	2013	0
19298	131	New Richmond	Wisconsin	11	2013	0
19299	131	New Richmond	Wisconsin	12	2013	0
19300	131	New Richmond	Wisconsin	1	2014	0
19301	131	New Richmond	Wisconsin	2	2014	0
19302	131	New Richmond	Wisconsin	3	2014	0
19303	131	New Richmond	Wisconsin	4	2014	0
19304	131	New Richmond	Wisconsin	5	2014	0
19305	131	New Richmond	Wisconsin	6	2014	0
19306	131	New Richmond	Wisconsin	7	2014	164450
19307	131	New Richmond	Wisconsin	8	2014	165840
19308	131	New Richmond	Wisconsin	9	2014	150000
19309	131	New Richmond	Wisconsin	10	2014	163000
19310	131	New Richmond	Wisconsin	11	2014	164950
19311	131	New Richmond	Wisconsin	12	2014	197000
19312	131	New Richmond	Wisconsin	1	2015	122000
19313	131	New Richmond	Wisconsin	2	2015	153900
19314	131	New Richmond	Wisconsin	3	2015	165500
19315	131	New Richmond	Wisconsin	4	2015	180000
19316	131	New Richmond	Wisconsin	5	2015	194450
19317	131	New Richmond	Wisconsin	6	2015	195000
19318	131	New Richmond	Wisconsin	7	2015	179450
19319	131	New Richmond	Wisconsin	8	2015	182450
19320	131	New Richmond	Wisconsin	9	2015	188000
19321	131	New Richmond	Wisconsin	10	2015	210000
19322	131	New Richmond	Wisconsin	11	2015	189000
19323	131	New Richmond	Wisconsin	12	2015	165900
19324	131	New Richmond	Wisconsin	1	2016	179750
19325	131	New Richmond	Wisconsin	2	2016	160000
19326	131	New Richmond	Wisconsin	3	2016	175000
19327	131	New Richmond	Wisconsin	4	2016	230050
19328	131	New Richmond	Wisconsin	5	2016	189300
19329	131	New Richmond	Wisconsin	6	2016	202500
19330	131	New Richmond	Wisconsin	7	2016	201800
19331	131	New Richmond	Wisconsin	8	2016	195063
19332	131	New Richmond	Wisconsin	9	2016	219900
19333	131	New Richmond	Wisconsin	10	2016	222000
19334	131	New Richmond	Wisconsin	11	2016	203200
19335	131	New Richmond	Wisconsin	12	2016	201250
19336	131	New Richmond	Wisconsin	1	2017	253500
19337	131	New Richmond	Wisconsin	2	2017	192500
19338	131	New Richmond	Wisconsin	3	2017	192400
19339	131	New Richmond	Wisconsin	4	2017	190900
19340	131	New Richmond	Wisconsin	5	2017	211800
19341	131	New Richmond	Wisconsin	6	2017	224050
19342	131	New Richmond	Wisconsin	7	2017	213000
19343	131	New Richmond	Wisconsin	8	2017	220950
19344	131	New Richmond	Wisconsin	9	2017	230500
19345	131	New Richmond	Wisconsin	10	2017	217000
19346	131	New Richmond	Wisconsin	11	2017	220000
19347	131	New Richmond	Wisconsin	12	2017	214000
19348	131	New Richmond	Wisconsin	1	2018	162250
19349	131	New Richmond	Wisconsin	2	2018	204100
19350	131	New Richmond	Wisconsin	3	2018	209000
19351	131	New Richmond	Wisconsin	4	2018	250700
19352	131	New Richmond	Wisconsin	5	2018	241000
19353	131	New Richmond	Wisconsin	6	2018	215000
19354	131	New Richmond	Wisconsin	7	2018	224000
19355	131	New Richmond	Wisconsin	8	2018	235000
19356	131	New Richmond	Wisconsin	9	2018	241000
19357	131	New Richmond	Wisconsin	10	2018	252450
19358	131	New Richmond	Wisconsin	11	2018	227500
19359	131	New Richmond	Wisconsin	12	2018	214900
19360	131	New Richmond	Wisconsin	1	2019	0
19361	26	New Haven	Connecitcut	1	2009	235000
19362	26	New Haven	Connecitcut	2	2009	0
19363	26	New Haven	Connecitcut	3	2009	50000
19364	26	New Haven	Connecitcut	4	2009	0
19365	26	New Haven	Connecitcut	5	2009	0
19366	26	New Haven	Connecitcut	6	2009	0
19367	26	New Haven	Connecitcut	7	2009	0
19368	26	New Haven	Connecitcut	8	2009	0
19369	26	New Haven	Connecitcut	9	2009	225000
19370	26	New Haven	Connecitcut	10	2009	156500
19371	26	New Haven	Connecitcut	11	2009	490000
19372	26	New Haven	Connecitcut	12	2009	0
19373	26	New Haven	Connecitcut	1	2010	130000
19374	26	New Haven	Connecitcut	2	2010	0
19375	26	New Haven	Connecitcut	3	2010	0
19376	26	New Haven	Connecitcut	4	2010	0
19377	26	New Haven	Connecitcut	5	2010	0
19378	26	New Haven	Connecitcut	6	2010	0
19379	26	New Haven	Connecitcut	7	2010	0
19380	26	New Haven	Connecitcut	8	2010	0
19381	26	New Haven	Connecitcut	9	2010	0
19382	26	New Haven	Connecitcut	10	2010	0
19383	26	New Haven	Connecitcut	11	2010	0
19384	26	New Haven	Connecitcut	12	2010	540000
19385	26	New Haven	Connecitcut	1	2011	0
19386	26	New Haven	Connecitcut	2	2011	0
19387	26	New Haven	Connecitcut	3	2011	0
19388	26	New Haven	Connecitcut	4	2011	0
19389	26	New Haven	Connecitcut	5	2011	0
19390	26	New Haven	Connecitcut	6	2011	0
19391	26	New Haven	Connecitcut	7	2011	0
19392	26	New Haven	Connecitcut	8	2011	0
19393	26	New Haven	Connecitcut	9	2011	286500
19394	26	New Haven	Connecitcut	10	2011	0
19395	26	New Haven	Connecitcut	11	2011	0
19396	26	New Haven	Connecitcut	12	2011	0
19397	26	New Haven	Connecitcut	1	2012	0
19398	26	New Haven	Connecitcut	2	2012	0
19399	26	New Haven	Connecitcut	3	2012	0
19400	26	New Haven	Connecitcut	4	2012	209000
19401	26	New Haven	Connecitcut	5	2012	0
19402	26	New Haven	Connecitcut	6	2012	245000
19403	26	New Haven	Connecitcut	7	2012	0
19404	26	New Haven	Connecitcut	8	2012	0
19405	26	New Haven	Connecitcut	9	2012	0
19406	26	New Haven	Connecitcut	10	2012	0
19407	26	New Haven	Connecitcut	11	2012	350000
19408	26	New Haven	Connecitcut	12	2012	0
19409	26	New Haven	Connecitcut	1	2013	0
19410	26	New Haven	Connecitcut	2	2013	0
19411	26	New Haven	Connecitcut	3	2013	0
19412	26	New Haven	Connecitcut	4	2013	310000
19413	26	New Haven	Connecitcut	5	2013	0
19414	26	New Haven	Connecitcut	6	2013	236000
19415	26	New Haven	Connecitcut	7	2013	114450
19416	26	New Haven	Connecitcut	8	2013	0
19417	26	New Haven	Connecitcut	9	2013	453000
19418	26	New Haven	Connecitcut	10	2013	0
19419	26	New Haven	Connecitcut	11	2013	55000
19420	26	New Haven	Connecitcut	12	2013	0
19421	26	New Haven	Connecitcut	1	2014	0
19422	26	New Haven	Connecitcut	2	2014	0
19423	26	New Haven	Connecitcut	3	2014	0
19424	26	New Haven	Connecitcut	4	2014	0
19425	26	New Haven	Connecitcut	5	2014	171000
19426	26	New Haven	Connecitcut	6	2014	0
19427	26	New Haven	Connecitcut	7	2014	0
19428	26	New Haven	Connecitcut	8	2014	0
19429	26	New Haven	Connecitcut	9	2014	0
19430	26	New Haven	Connecitcut	10	2014	220000
19431	26	New Haven	Connecitcut	11	2014	0
19432	26	New Haven	Connecitcut	12	2014	163500
19433	26	New Haven	Connecitcut	1	2015	166500
19434	26	New Haven	Connecitcut	2	2015	160000
19435	26	New Haven	Connecitcut	3	2015	160000
19436	26	New Haven	Connecitcut	4	2015	173750
19437	26	New Haven	Connecitcut	5	2015	180000
19438	26	New Haven	Connecitcut	6	2015	199900
19439	26	New Haven	Connecitcut	7	2015	195000
19440	26	New Haven	Connecitcut	8	2015	199500
19441	26	New Haven	Connecitcut	9	2015	185000
19442	26	New Haven	Connecitcut	10	2015	180000
19443	26	New Haven	Connecitcut	11	2015	170000
19444	26	New Haven	Connecitcut	12	2015	170000
19445	26	New Haven	Connecitcut	1	2016	173000
19446	26	New Haven	Connecitcut	2	2016	165500
19447	26	New Haven	Connecitcut	3	2016	167500
19448	26	New Haven	Connecitcut	4	2016	170000
19449	26	New Haven	Connecitcut	5	2016	190000
19450	26	New Haven	Connecitcut	6	2016	212500
19451	26	New Haven	Connecitcut	7	2016	210000
19452	26	New Haven	Connecitcut	8	2016	201000
19453	26	New Haven	Connecitcut	9	2016	190000
19454	26	New Haven	Connecitcut	10	2016	190000
19455	26	New Haven	Connecitcut	11	2016	185000
19456	26	New Haven	Connecitcut	12	2016	190000
19457	26	New Haven	Connecitcut	1	2017	180000
19458	26	New Haven	Connecitcut	2	2017	176500
19459	26	New Haven	Connecitcut	3	2017	169000
19460	26	New Haven	Connecitcut	4	2017	167000
19461	26	New Haven	Connecitcut	5	2017	195000
19462	26	New Haven	Connecitcut	6	2017	220000
19463	26	New Haven	Connecitcut	7	2017	210000
19464	26	New Haven	Connecitcut	8	2017	220000
19465	26	New Haven	Connecitcut	9	2017	195750
19466	26	New Haven	Connecitcut	10	2017	196000
19467	26	New Haven	Connecitcut	11	2017	190000
19468	26	New Haven	Connecitcut	12	2017	193000
19469	26	New Haven	Connecitcut	1	2018	185000
19470	26	New Haven	Connecitcut	2	2018	185000
19471	26	New Haven	Connecitcut	3	2018	185000
19472	26	New Haven	Connecitcut	4	2018	210000
19473	26	New Haven	Connecitcut	5	2018	210250
19474	26	New Haven	Connecitcut	6	2018	225000
19475	26	New Haven	Connecitcut	7	2018	230000
19476	26	New Haven	Connecitcut	8	2018	225000
19477	26	New Haven	Connecitcut	9	2018	212100
19478	26	New Haven	Connecitcut	10	2018	210000
19479	26	New Haven	Connecitcut	11	2018	195050
19480	26	New Haven	Connecitcut	12	2018	209900
19481	26	New Haven	Connecitcut	1	2019	0
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prices (price_id, city_id, median_home_price, sales_price_mom, print_date) FROM stdin;
1	1	132313	-1.38	18-Dec
2	2	274500	-5.02	18-Dec
3	3	354614	-0.03	18-Dec
4	4	318070	1.58	18-Dec
5	5	669707	1.72	18-Dec
6	6	180775	-0.27	18-Dec
7	7	176393	1.24	18-Dec
8	8	116048	16.81	18-Dec
9	9	954199	0.13	18-Dec
10	10	887500	7.25	18-Dec
11	11	783295	-0.6	18-Dec
12	12	498588	-0.07	18-Dec
13	13	409300	-0.66	18-Dec
14	14	340788	0.42	18-Dec
15	15	1465146	-0.42	18-Dec
16	16	986864	-0.72	18-Dec
17	17	1064611	4.63	18-Dec
18	18	334153	-0.6	18-Dec
19	19	710809	-0.8	18-Dec
20	20	500190	0.74	18-Dec
21	21	585000	18.78	18-Dec
22	22	289500	6.2	18-Dec
23	23	251984	-2.18	18-Dec
24	24	1571625	-4.87	18-Dec
25	25	179144	0.33	18-Dec
26	26	190299	1.74	18-Dec
27	27	158200	-7.21	18-Dec
28	28	221750	-3.59	18-Dec
29	29	151065	3.77	18-Dec
30	30	180072	1.98	18-Dec
31	31	376375	-1.47	18-Dec
32	32	355365	8.27	18-Dec
33	33	448926	-1.97	18-Dec
34	34	366000	-8.39	18-Dec
35	35	189750	-5.7	18-Dec
36	36	235753	3.25	18-Dec
37	37	487500	5.98	18-Dec
38	38	308262	1.89	18-Dec
39	39	359710	3.92	18-Dec
40	40	246500	-7.33	18-Dec
41	41	147700	-3.27	18-Dec
42	42	487000	1.46	18-Dec
43	43	1060989	4.99	18-Dec
44	44	632476	-2.8	18-Dec
45	45	337955	-0.79	18-Dec
46	46	176229	-0.96	18-Dec
47	47	289882	-0.66	18-Dec
48	48	79000	1.94	18-Dec
49	49	288500	-8.21	18-Dec
50	50	136000	17.24	18-Dec
51	51	198750	12.35	18-Dec
52	52	247750	-17.42	18-Dec
53	53	95000	-2.56	18-Dec
54	54	204900	-27.21	18-Dec
55	55	156520	0.63	18-Dec
56	56	152559	1.43	18-Dec
57	57	195250	2.73	18-Dec
58	58	127568	4.45	18-Dec
59	59	150785	5.02	18-Dec
60	60	350000	45.53	18-Dec
61	61	317000	3.8	18-Dec
62	62	436450	1.26	18-Dec
63	63	150117	7.18	18-Dec
64	64	337284	-1.48	18-Dec
65	65	678300	-0.37	18-Dec
66	66	531580	-8.55	18-Dec
67	67	650000	8.33	18-Dec
68	68	830000	-10.17	18-Dec
69	69	355064	-1.71	18-Dec
70	70	67148	5.32	18-Dec
71	71	569750	-11.36	18-Dec
72	72	189950	-0.03	18-Dec
73	73	253125	-0.84	18-Dec
74	74	208000	-4.24	18-Dec
75	75	295479	1.07	18-Dec
76	76	212000	1.9	18-Dec
77	77	219386	1.4	18-Dec
78	78	245000	1.24	18-Dec
79	79	184304	0.94	18-Dec
80	80	261500	-7.6	18-Dec
81	81	151617	2.67	18-Dec
82	82	174079	2.53	18-Dec
83	83	308441	0.66	18-Dec
84	84	227000	3.12	18-Dec
85	85	236100	-0.14	18-Dec
86	86	365942	7.12	18-Dec
87	87	152400	26.06	18-Dec
88	88	65273	6.37	18-Dec
89	89	560400	8.55	18-Dec
90	90	166833	-1.63	18-Dec
91	91	300972	4.88	18-Dec
92	92	242674	4.83	18-Dec
93	93	392215	15.36	18-Dec
94	94	295824	3.16	18-Dec
95	95	278375	15.64	18-Dec
96	96	371408	-1.11	18-Dec
97	97	183586	-0.38	18-Dec
98	98	134000	-5.66	18-Dec
99	99	170497	1.01	18-Dec
100	100	286900	1.2	18-Dec
101	101	485121	1.24	18-Dec
102	102	272550	-0.57	18-Dec
103	103	247000	1.79	18-Dec
104	104	87050	0.06	18-Dec
105	105	250062	4.71	18-Dec
106	106	447500	3.11	18-Dec
107	107	239950	3.76	18-Dec
108	108	264000	-24.57	18-Dec
109	109	213356	0.13	18-Dec
110	110	267030	0.01	18-Dec
111	111	543702	-3.75	18-Dec
112	112	315000	14.55	18-Dec
113	113	140900	4.95	18-Dec
114	114	376125	1.21	18-Dec
115	115	411662	0.45	18-Dec
116	116	447573	4.7	18-Dec
117	117	246295	2.98	18-Dec
118	118	280186	1.36	18-Dec
119	119	277990	-0.72	18-Dec
120	120	303709	6.32	18-Dec
121	121	407101	-3.23	18-Dec
122	122	340857	-2.52	18-Dec
123	123	376025	-3.71	18-Dec
124	124	287714	-0.1	18-Dec
125	125	331665	-1.38	18-Dec
126	126	330352	4.4	18-Dec
127	127	744196	-0.73	18-Dec
128	128	500000	14.94	18-Dec
129	129	320115	1.7	18-Dec
130	130	134425	3.6	18-Dec
131	131	214900	-5.54	18-Dec
132	132	359450	1.6	18-Dec
133	133	309000	-0.1	18-Dec
134	134	299900	-0.4	18-Dec
135	135	250450	2.9	18-Dec
136	136	244945	4.5	18-Dec
137	137	274900	3.9	18-Dec
138	138	202500	2.8	18-Dec
139	139	224900	4	18-Dec
140	140	274000	4.4	18-Dec
141	141	992000	8.5	18-Dec
142	142	219000	3.4	18-Dec
143	143	134900	-0.7	18-Dec
144	144	159900	1.4	18-Dec
145	145	189900	12.9	18-Dec
146	146	389000	6.5	18-Dec
147	147	287000	7.1	18-Dec
148	148	117518	5.5	18-Dec
149	149	224000	-1.8	18-Dec
150	150	244900	3.1	18-Dec
151	151	220000	4.3	18-Dec
152	152	115000	0.5	18-Dec
153	153	169000	3.2	18-Dec
154	154	149800	9.5	18-Dec
155	155	107998	2.5	18-Dec
156	156	224900	3.1	18-Dec
157	157	89100	5.9	18-Dec
158	158	178000	4.2	18-Dec
159	159	349925	7.5	18-Dec
160	160	225100	5.2	18-Dec
161	161	544000	4.8	18-Dec
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 161, true);


--
-- Name: histdata_hist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.histdata_hist_id_seq', 19481, true);


--
-- Name: prices_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prices_price_id_seq', 161, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: histdata histdata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.histdata
    ADD CONSTRAINT histdata_pkey PRIMARY KEY (hist_id);


--
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (price_id);


--
-- Name: histdata histdata_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.histdata
    ADD CONSTRAINT histdata_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- Name: prices prices_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- PostgreSQL database dump complete
--

