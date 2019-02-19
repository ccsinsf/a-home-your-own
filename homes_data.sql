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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: CatherineScott
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    city_name character varying(25),
    state character varying(15),
    latitude real,
    longitude real
);


ALTER TABLE public.cities OWNER TO "CatherineScott";

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: CatherineScott
--

CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_city_id_seq OWNER TO "CatherineScott";

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CatherineScott
--

ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;


--
-- Name: prices; Type: TABLE; Schema: public; Owner: CatherineScott
--

CREATE TABLE public.prices (
    price_id integer NOT NULL,
    city_id integer,
    median_home_price integer,
    sales_price_mom character varying(15),
    print_date character varying(10)
);


ALTER TABLE public.prices OWNER TO "CatherineScott";

--
-- Name: prices_price_id_seq; Type: SEQUENCE; Schema: public; Owner: CatherineScott
--

CREATE SEQUENCE public.prices_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prices_price_id_seq OWNER TO "CatherineScott";

--
-- Name: prices_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CatherineScott
--

ALTER SEQUENCE public.prices_price_id_seq OWNED BY public.prices.price_id;


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: CatherineScott
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);


--
-- Name: prices price_id; Type: DEFAULT; Schema: public; Owner: CatherineScott
--

ALTER TABLE ONLY public.prices ALTER COLUMN price_id SET DEFAULT nextval('public.prices_price_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: CatherineScott
--

COPY public.cities (city_id, city_name, state, latitude, longitude) FROM stdin;
1	Birmingham	Alabama	33.5219994	-86.8069992
2	Helena	Alabama	33.2960014	-86.8434982
3	Peoria	Arizona	33.7050018	-112.281502
4	Phoenix	Arizona	33.4480019	-112.073997
5	Scottsdale	Arizona	33.4939995	-111.926003
6	Tuscon	Arizona	32.9609985	-111.556
7	Little Rock	Arkansas	34.4485703	-92.3311234
8	North Little Rock	Arkansas	34.7659988	-92.2677002
9	Los Angeles	California	34.0522003	118.242996
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
21	Layfayette	Colorado	39.9942017	-105.090462
22	Columbia	Colorado	38.9662018	-92.3361816
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
34	North Miami	Florida	-35.0606003	139.239746
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
52	North Auora	Illinois	41.8059998	-88.327301
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
83	Las Vegas	Nevada	4.58471251	-74.098999
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
95	Harrisburg	North Carolina	-35.3262482	-80.6446533
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
121	Salt Lake City	Utah	40	226.239746
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
137	Bismarck	North Dakota	48.813343	-100.779007
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
149	Memphis	Mississippi	33.7996216	-89.7971268
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
161	Columbia	North Carolina	34	-81.0350037
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: CatherineScott
--

COPY public.prices (price_id, city_id, median_home_price, sales_price_mom, print_date) FROM stdin;
1	1	132313	-1.38	42355
2	2	274500	-5.02	42355
3	3	354614	-0.03	42355
4	4	318070	1.58	42355
5	5	669707	1.72	42355
6	6	180775	-0.27	42355
7	7	176393	1.24	42355
8	8	116048	16.81	42355
9	9	954199	0.13	42355
10	10	887500	7.25	42355
11	11	783295	-0.6	42355
12	12	498588	-0.07	42355
13	13	409300	-0.66	42355
14	14	340788	0.42	42355
15	15	1465146	-0.42	42355
16	16	986864	-0.72	42355
17	17	1064611	4.63	42355
18	18	334153	-0.6	42355
19	19	710809	-0.8	42355
20	20	500190	0.74	42355
21	21	585000	18.78	42355
22	22	594690	-0.2	42355
23	23	251984	-2.18	42355
24	24	1571625	-4.87	42355
25	25	179144	0.33	42355
26	26	190299	1.74	42355
27	27	158200	-7.21	42355
28	28	221750	-3.59	42355
29	29	151065	3.77	42355
30	30	180072	1.98	42355
31	31	376375	-1.47	42355
32	32	355365	8.27	42355
33	33	448926	-1.97	42355
34	34	366000	-8.39	42355
35	35	189750	-5.7	42355
36	36	235753	3.25	42355
37	37	487500	5.98	42355
38	38	308262	1.89	42355
39	39	359710	3.92	42355
40	40	246500	-7.33	42355
41	41	147700	-3.27	42355
42	42	487000	1.46	42355
43	43	1060989	4.99	42355
44	44	632476	-2.8	42355
45	45	337955	-0.79	42355
46	46	176229	-0.96	42355
47	47	289882	-0.66	42355
48	48	79000	1.94	42355
49	49	288500	-8.21	42355
50	50	136000	17.24	42355
51	51	198750	12.35	42355
52	52	247750	-17.42	42355
53	53	95000	-2.56	42355
54	54	204900	-27.21	42355
55	55	156520	0.63	42355
56	56	152559	1.43	42355
57	57	195250	2.73	42355
58	58	127568	4.45	42355
59	59	150785	5.02	42355
60	60	350000	45.53	42355
61	61	317000	3.8	42355
62	62	436450	1.26	42355
63	63	150117	7.18	42355
64	64	337284	-1.48	42355
65	65	678300	-0.37	42355
66	66	531580	-8.55	42355
67	67	650000	8.33	42355
68	68	830000	-10.17	42355
69	69	355064	-1.71	42355
70	70	67148	5.32	42355
71	71	569750	-11.36	42355
72	72	189950	-0.03	42355
73	73	253125	-0.84	42355
74	74	208000	-4.24	42355
75	75	295479	1.07	42355
76	76	212000	1.9	42355
77	77	219386	1.4	42355
78	78	245000	1.24	42355
79	79	184304	0.94	42355
80	80	261500	-7.6	42355
81	81	151617	2.67	42355
82	82	174079	2.53	42355
83	83	308441	0.66	42355
84	84	227000	3.12	42355
85	85	236100	-0.14	42355
86	86	365942	7.12	42355
87	87	152400	26.06	42355
88	88	65273	6.37	42355
89	89	560400	8.55	42355
90	90	166833	-1.63	42355
91	91	300972	4.88	42355
92	92	242674	4.83	42355
93	93	392215	15.36	42355
94	94	295824	3.16	42355
95	95	278375	15.64	42355
96	96	371408	-1.11	42355
97	97	183586	-0.38	42355
98	98	47000	-5.66	42355
99	99	170497	1.01	42355
100	100	286900	1.2	42355
101	101	485121	1.24	42355
102	102	272550	-0.57	42355
103	103	247000	1.79	42355
104	104	87050	0.06	42355
105	105	250062	4.71	42355
106	106	447500	3.11	42355
107	107	239950	3.76	42355
108	108	264000	-24.57	42355
109	109	213356	0.13	42355
110	110	267030	0.01	42355
111	111	543702	-3.75	42355
112	112	315000	14.55	42355
113	113	140900	4.95	42355
114	114	376125	1.21	42355
115	115	411662	0.45	42355
116	116	447573	4.7	42355
117	117	246295	2.98	42355
118	118	280186	1.36	42355
119	119	277990	-0.72	42355
120	120	303709	6.32	42355
121	121	407101	-3.23	42355
122	122	340857	-2.52	42355
123	123	376025	-3.71	42355
124	124	287714	-0.1	42355
125	125	331665	-1.38	42355
126	126	330352	4.4	42355
127	127	744196	-0.73	42355
128	128	500000	14.94	42355
129	129	320115	1.7	42355
130	130	134425	3.6	42355
131	131	214900	-5.54	42355
132	132	359450	1.6	42355
133	133	309000	-0.1	42355
134	134	299900	-0.4	42355
135	135	250450	2.9	42355
136	136	244945	4.5	42355
137	137	274900	3.9	42355
138	138	202500	2.8	42355
139	139	224900	4	42355
140	140	274000	4.4	42355
141	141	992000	8.5	42355
142	142	219000	3.4	42355
143	143	134900	-0.7	42355
144	144	159900	1.4	42355
145	145	189900	12.9	42355
146	146	389000	6.5	42355
147	147	287000	7.1	42355
148	148	117518	5.5	42355
149	149	181600	4.9	42355
150	150	244900	3.1	42355
151	151	220000	4.3	42355
152	152	115000	0.5	42355
153	153	169000	3.2	42355
154	154	149800	9.5	42355
155	155	107998	2.5	42355
156	156	224900	3.1	42355
157	157	89100	5.9	42355
158	158	178000	4.2	42355
159	159	349925	7.5	42355
160	160	250000	6.3	42355
161	161	136900	3.9	42355
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CatherineScott
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 161, true);


--
-- Name: prices_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CatherineScott
--

SELECT pg_catalog.setval('public.prices_price_id_seq', 161, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: CatherineScott
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: CatherineScott
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (price_id);


--
-- Name: prices prices_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: CatherineScott
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- PostgreSQL database dump complete
--

