--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: temp; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA temp;


ALTER SCHEMA temp OWNER TO postgres;

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Country" (
    cname character varying(50) NOT NULL,
    population bigint
);


ALTER TABLE "Country" OWNER TO postgres;

--
-- Name: Discover; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Discover" (
    cname character varying(50) NOT NULL,
    disease_code character varying(40) NOT NULL,
    first_enc_date date
);


ALTER TABLE "Discover" OWNER TO postgres;

--
-- Name: Disease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Disease" (
    disease_code character varying(50) NOT NULL,
    pathogen character varying(20),
    description character varying(140),
    id integer
);


ALTER TABLE "Disease" OWNER TO postgres;

--
-- Name: DiseaseType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "DiseaseType" (
    id integer NOT NULL,
    description character varying(140)
);


ALTER TABLE "DiseaseType" OWNER TO postgres;

--
-- Name: Doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Doctor" (
    email character varying(60) NOT NULL,
    degree character varying(20)
);


ALTER TABLE "Doctor" OWNER TO postgres;

--
-- Name: PublicServant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "PublicServant" (
    email character varying(60) NOT NULL,
    department character varying(50)
);


ALTER TABLE "PublicServant" OWNER TO postgres;

--
-- Name: Record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Record" (
    email character varying(60),
    cname character varying(50),
    disease_code character varying(50),
    total_deaths integer,
    total_patients integer
);


ALTER TABLE "Record" OWNER TO postgres;

--
-- Name: Specialize; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Specialize" (
    id integer,
    email character varying(60)
);


ALTER TABLE "Specialize" OWNER TO postgres;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Users" (
    email character varying(60) NOT NULL,
    name character varying(30),
    surname character varying(40),
    salary integer,
    phone character varying(20),
    cname character varying(50)
);


ALTER TABLE "Users" OWNER TO postgres;

--
-- Data for Name: Country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Country" VALUES ('Indonesia', 793348);
INSERT INTO "Country" VALUES ('French Polynesia', 8206916);
INSERT INTO "Country" VALUES ('Philippines', 6150343);
INSERT INTO "Country" VALUES ('Kazakhstan', 6828705);
INSERT INTO "Country" VALUES ('Sweden', 9027927);
INSERT INTO "Country" VALUES ('Portugal', 6373864);
INSERT INTO "Country" VALUES ('Russia', 4918645);
INSERT INTO "Country" VALUES ('China', 2270140);
INSERT INTO "Country" VALUES ('Czech Republic', 6574708);
INSERT INTO "Country" VALUES ('Thailand', 8878794);
INSERT INTO "Country" VALUES ('United States', 4775196);
INSERT INTO "Country" VALUES ('Bolivia', 5448029);
INSERT INTO "Country" VALUES ('Vietnam', 9076354);
INSERT INTO "Country" VALUES ('Tajikistan', 3280647);
INSERT INTO "Country" VALUES ('Brazil', 67442466);
INSERT INTO "Country" VALUES ('Poland', 83429491);
INSERT INTO "Country" VALUES ('Dominican Republic', 81661591);
INSERT INTO "Country" VALUES ('Georgia', 49285507);
INSERT INTO "Country" VALUES ('Ethiopia', 49667566);
INSERT INTO "Country" VALUES ('Japan', 87625465);
INSERT INTO "Country" VALUES ('Nigeria', 83974777);
INSERT INTO "Country" VALUES ('Spain', 35515758);
INSERT INTO "Country" VALUES ('Malaysia', 47453185);
INSERT INTO "Country" VALUES ('Central African Republic', 84452778);
INSERT INTO "Country" VALUES ('Palestinian Territory', 90833031);
INSERT INTO "Country" VALUES ('Colombia', 70048877);
INSERT INTO "Country" VALUES ('Ukraine', 4568092);
INSERT INTO "Country" VALUES ('Lithuania', 30560856);
INSERT INTO "Country" VALUES ('Serbia', 92844507);
INSERT INTO "Country" VALUES ('Myanmar', 80840085);
INSERT INTO "Country" VALUES ('Italy', 84437327);
INSERT INTO "Country" VALUES ('Jordan', 71221546);
INSERT INTO "Country" VALUES ('Mexico', 90808367);
INSERT INTO "Country" VALUES ('Mongolia', 72223915);
INSERT INTO "Country" VALUES ('Argentina', 30384097);
INSERT INTO "Country" VALUES ('France', 17872016);
INSERT INTO "Country" VALUES ('Albania', 68694997);
INSERT INTO "Country" VALUES ('Guatemala', 89401568);
INSERT INTO "Country" VALUES ('Netherlands', 1582350);
INSERT INTO "Country" VALUES ('North Korea', 91936233);
INSERT INTO "Country" VALUES ('Peru', 25764966);
INSERT INTO "Country" VALUES ('Macedonia', 83724648);
INSERT INTO "Country" VALUES ('Reunion', 54289092);
INSERT INTO "Country" VALUES ('Malawi', 24963415);
INSERT INTO "Country" VALUES ('Iran', 61140927);
INSERT INTO "Country" VALUES ('Croatia', 4602106);
INSERT INTO "Country" VALUES ('Estonia', 81657179);
INSERT INTO "Country" VALUES ('Bosnia and Herzegovina', 3166422);
INSERT INTO "Country" VALUES ('Zimbabwe', 82864553);
INSERT INTO "Country" VALUES ('Cambodia', 77834265);
INSERT INTO "Country" VALUES ('Tanzania', 93763938);
INSERT INTO "Country" VALUES ('Belarus', 61101264);
INSERT INTO "Country" VALUES ('Greece', 95397532);
INSERT INTO "Country" VALUES ('South Africa', 29820152);
INSERT INTO "Country" VALUES ('Egypt', 29784845);
INSERT INTO "Country" VALUES ('Mozambique', 18367866);
INSERT INTO "Country" VALUES ('Morocco', 11026331);
INSERT INTO "Country" VALUES ('Slovenia', 68327104);


--
-- Data for Name: Discover; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Discover" VALUES ('China', 'AC87N', '1972-03-12');
INSERT INTO "Discover" VALUES ('China', 'AM50Q', '1984-01-05');
INSERT INTO "Discover" VALUES ('Kazakhstan', 'CC32N', '1985-05-05');
INSERT INTO "Discover" VALUES ('Bolivia', 'CV30U', '2022-06-25');
INSERT INTO "Discover" VALUES ('China', 'DA57X', '1937-12-30');
INSERT INTO "Discover" VALUES ('Sweden', 'DR40R', '1903-03-24');
INSERT INTO "Discover" VALUES ('Portugal', 'EH89H', '1948-03-11');
INSERT INTO "Discover" VALUES ('China', 'EY50G', '1982-07-17');
INSERT INTO "Discover" VALUES ('Italy', 'FY94L', '1929-06-25');
INSERT INTO "Discover" VALUES ('Thailand', 'FZ77I', '1923-10-08');
INSERT INTO "Discover" VALUES ('China', 'FZ79W', '1934-03-23');
INSERT INTO "Discover" VALUES ('Italy', 'GC03M', '1904-04-04');
INSERT INTO "Discover" VALUES ('Indonesia', 'GM07R', '1949-08-18');
INSERT INTO "Discover" VALUES ('Brazil', 'HL55C', '1900-08-02');
INSERT INTO "Discover" VALUES ('Colombia', 'HR48O', '1996-03-11');
INSERT INTO "Discover" VALUES ('United States', 'HY10T', '1902-12-18');
INSERT INTO "Discover" VALUES ('France', 'IJ03B', '2020-06-25');
INSERT INTO "Discover" VALUES ('France', 'KI11B', '1960-02-27');
INSERT INTO "Discover" VALUES ('Russia', 'KR50R', '1969-09-27');
INSERT INTO "Discover" VALUES ('South Africa', 'KZ05V', '1995-10-21');
INSERT INTO "Discover" VALUES ('Portugal', 'MC38P', '1987-09-26');
INSERT INTO "Discover" VALUES ('Indonesia', 'ML20S', '1984-06-18');
INSERT INTO "Discover" VALUES ('Russia', 'MM76I', '1926-03-27');


--
-- Data for Name: Disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Disease" VALUES ('ML20S', 'Bacteria', 'Unspecified visual disturbance', 16);
INSERT INTO "Disease" VALUES ('AC87N', 'Viruses', 'Obstetrical blood-clot embolism', 30);
INSERT INTO "Disease" VALUES ('FZ77I', 'Bacteria', 'Transfusion reaction', 12);
INSERT INTO "Disease" VALUES ('XX40A', 'Fungi', 'Other specified pulmonary tuberculosis', 16);
INSERT INTO "Disease" VALUES ('XH03F', 'Fungi', 'Adjustment reaction with withdrawal', 6);
INSERT INTO "Disease" VALUES ('ZC86C', 'Fungi', 'Nontraffic accident involving other off-road motor vehicle injuring driver of motor vehicle other than motorcycle', 4);
INSERT INTO "Disease" VALUES ('MM76I', 'Bacteria', 'Congenital macular changes', 5);
INSERT INTO "Disease" VALUES ('KI11B', 'Fungi', 'Inguinal hernia', 7);
INSERT INTO "Disease" VALUES ('HY10T', 'Fungi', 'Urinary obstruction', 21);
INSERT INTO "Disease" VALUES ('KZ05V', 'Bacteria', 'Congenital or acquired abnormality of vagina', 22);
INSERT INTO "Disease" VALUES ('YP72L', 'Viruses', 'Family history of allergic disorders', 3);
INSERT INTO "Disease" VALUES ('UF21X', 'Protozoa', 'Obstetrical blood-clot embolism', 29);
INSERT INTO "Disease" VALUES ('GM07R', 'Fungi', 'Deformity of orbit due to trauma or surgery', 29);
INSERT INTO "Disease" VALUES ('YS40I', 'Protists', 'Other specified tuberculosis of central nervous system', 28);
INSERT INTO "Disease" VALUES ('MR60D', 'Parasitic worms', 'Observation and evaluation of newborn for suspected respiratory condition', 24);
INSERT INTO "Disease" VALUES ('AM50Q', 'Bacteria', 'Presence of cerebrospinal fluid drainage device', 1);
INSERT INTO "Disease" VALUES ('IJ03B', 'Parasitic worms', 'Necrotizing fasciitis', 4);
INSERT INTO "Disease" VALUES ('MC38P', 'Parasitic worms', 'Anemia of prematurity', 2);
INSERT INTO "Disease" VALUES ('ZL52V', 'Parasitic worms', 'Acute hepatitis C without mention of hepatic coma', 11);
INSERT INTO "Disease" VALUES ('CV30U', 'Bacteria', 'Burn of internal organs', 12);
INSERT INTO "Disease" VALUES ('EH89H', 'Parasitic worms', 'Other specified congenital anomalies of face and neck', 6);
INSERT INTO "Disease" VALUES ('SX82L', 'Fungi', 'Closed fracture of base of skull with intracranial injury of other and unspecified nature', 22);
INSERT INTO "Disease" VALUES ('DR40R', 'Bacteria', 'Tuberculosis of lung', 15);
INSERT INTO "Disease" VALUES ('FZ79W', 'Bacteria', 'Personal history of lymphoid leukemia', 4);
INSERT INTO "Disease" VALUES ('YO79N', 'Fungi', 'Palindromic rheumatism', 30);
INSERT INTO "Disease" VALUES ('KR50R', 'Parasitic worms', 'Personal history of myeloid leukemia', 5);
INSERT INTO "Disease" VALUES ('NT67F', 'Bacteria', 'Face or brow presentation', 6);
INSERT INTO "Disease" VALUES ('CC32N', 'Parasitic worms', 'Persistent hyperplasia of thymus', 6);
INSERT INTO "Disease" VALUES ('HL55C', 'Viruses', 'Other open skull fracture without mention of intracranial injury', 2);
INSERT INTO "Disease" VALUES ('ZE92L', 'Parasitic worms', 'Accidental poisoning by other specified drugs', 15);
INSERT INTO "Disease" VALUES ('DA57X', 'Fungi', 'Meningococcal endocarditis', 10);
INSERT INTO "Disease" VALUES ('QR03Z', 'Parasitic worms', 'Personal history of (corrected) congenital malformations of respiratory system', 13);
INSERT INTO "Disease" VALUES ('EY50G', 'Bacteria', 'Urethral abscess', 12);
INSERT INTO "Disease" VALUES ('GC03M', 'Parasitic worms', 'Glaucoma associated with other lens disorders', 10);
INSERT INTO "Disease" VALUES ('FY94L', 'Bacteria', 'Other gastrostomy complications', 5);
INSERT INTO "Disease" VALUES ('HR48O', 'Viruses', 'COVID-19', 2);


--
-- Data for Name: DiseaseType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "DiseaseType" VALUES (9, 'Infectious diseases with parasitic infections');
INSERT INTO "DiseaseType" VALUES (27, 'Physiological diseases');
INSERT INTO "DiseaseType" VALUES (17, 'Hereditary diseases');
INSERT INTO "DiseaseType" VALUES (18, 'Infectious diseases with fungal infections');
INSERT INTO "DiseaseType" VALUES (29, 'Deficiency diseases');
INSERT INTO "DiseaseType" VALUES (4, 'Infectious diseases with virus');
INSERT INTO "DiseaseType" VALUES (15, 'Infectious diseases with bacteria');
INSERT INTO "DiseaseType" VALUES (24, 'Virology');
INSERT INTO "DiseaseType" VALUES (28, 'Group A Streptococcal Infections');
INSERT INTO "DiseaseType" VALUES (21, 'Monkeypox');
INSERT INTO "DiseaseType" VALUES (2, 'Rocky Mountain Spotted Fever');
INSERT INTO "DiseaseType" VALUES (12, 'Autoimmune Diseases');
INSERT INTO "DiseaseType" VALUES (13, 'Lyme Disease');
INSERT INTO "DiseaseType" VALUES (25, 'HIV/AIDS');
INSERT INTO "DiseaseType" VALUES (22, 'Coronaviruses');
INSERT INTO "DiseaseType" VALUES (30, 'Food Allergy');
INSERT INTO "DiseaseType" VALUES (6, 'Schistosomiasis (Bilharzia)');
INSERT INTO "DiseaseType" VALUES (19, 'Gonorrhea');
INSERT INTO "DiseaseType" VALUES (14, 'Leishmaniasis');
INSERT INTO "DiseaseType" VALUES (20, 'Respiratory Syncytial Virus (RSV)');
INSERT INTO "DiseaseType" VALUES (26, 'Autoimmune Lymphoproliferative Syndrome (ALPS)');
INSERT INTO "DiseaseType" VALUES (8, 'Tickborne Diseases');
INSERT INTO "DiseaseType" VALUES (3, 'Dengue Fever');
INSERT INTO "DiseaseType" VALUES (10, 'Shigellosis');
INSERT INTO "DiseaseType" VALUES (7, 'Sexually Transmitted Diseases');
INSERT INTO "DiseaseType" VALUES (1, 'STAT3 Dominant-Negative Disease');
INSERT INTO "DiseaseType" VALUES (11, 'Tuberculosis');
INSERT INTO "DiseaseType" VALUES (5, 'Syphilis');
INSERT INTO "DiseaseType" VALUES (23, 'Asthma');
INSERT INTO "DiseaseType" VALUES (16, 'Smallpox');


--
-- Data for Name: Doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Doctor" VALUES ('goffiler11@blogger.com', 'osteopathic medicine');
INSERT INTO "Doctor" VALUES ('nobradden12@illinois.edu', 'dental medicine');
INSERT INTO "Doctor" VALUES ('mubanks1@state.tx.us', 'dental medicine');
INSERT INTO "Doctor" VALUES ('wfrancillo3@netscape.com', 'osteopathic medicine');
INSERT INTO "Doctor" VALUES ('mdimont7@reverbnation.com', 'dental medicine');
INSERT INTO "Doctor" VALUES ('nmethingamk@timesonline.co.uk', 'genetics engineer');
INSERT INTO "Doctor" VALUES ('cong4@google.com.au', 'respiratoral');
INSERT INTO "Doctor" VALUES ('pstandons@uol.com.br', 'biotechnology');
INSERT INTO "Doctor" VALUES ('kperrot5@yolasite.com', 'biotechnology');
INSERT INTO "Doctor" VALUES ('ndrabblep@shutterfly.com', 'biotechnology');


--
-- Data for Name: PublicServant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "PublicServant" VALUES ('jsuett2@taobao.com', 'Education');
INSERT INTO "PublicServant" VALUES ('kperrot5@yolasite.com', 'Healthcare');
INSERT INTO "PublicServant" VALUES ('amargerisonh@pen.io', 'Military');
INSERT INTO "PublicServant" VALUES ('nmethingamk@timesonline.co.uk', 'Healthcare');
INSERT INTO "PublicServant" VALUES ('ftidcombeo@twitter.com', 'Healthcare');
INSERT INTO "PublicServant" VALUES ('ndrabblep@shutterfly.com', 'Healthcare');
INSERT INTO "PublicServant" VALUES ('pstandons@uol.com.br', 'Healthcare');
INSERT INTO "PublicServant" VALUES ('msimenott@thetimes.co.uk', 'Public utilities');
INSERT INTO "PublicServant" VALUES ('agehrelsu@qq.com', 'Public transportation');
INSERT INTO "PublicServant" VALUES ('egovinlockv@earthlink.net', 'Social services');
INSERT INTO "PublicServant" VALUES ('bchesshire10@mapy.cz', 'Social services');
INSERT INTO "PublicServant" VALUES ('agatehousew@wsj.com', 'Public transportation');
INSERT INTO "PublicServant" VALUES ('mkornackig@dailymotion.com', 'Military');


--
-- Data for Name: Record; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Record" VALUES ('pstandons@uol.com.br', 'Tajikistan', 'HR48O', 11, 848488);
INSERT INTO "Record" VALUES ('nmethingamk@timesonline.co.uk', 'Portugal', 'XX40A', 14, 53);
INSERT INTO "Record" VALUES ('ndrabblep@shutterfly.com', 'Russia', 'YP72L', 8, 145);
INSERT INTO "Record" VALUES ('msimenott@thetimes.co.uk', 'Brazil', 'HR48O', 13, 11599);
INSERT INTO "Record" VALUES ('mkornackig@dailymotion.com', 'Poland', 'HR48O', 12, 1061);
INSERT INTO "Record" VALUES ('ftidcombeo@twitter.com', 'Indonesia', 'YO79N', 15, 182952);
INSERT INTO "Record" VALUES ('egovinlockv@earthlink.net', 'Dominican Republic', 'ZL52V', 16, 529426);
INSERT INTO "Record" VALUES ('bchesshire10@mapy.cz', 'Ethiopia', 'QR03Z', 8, 14381);
INSERT INTO "Record" VALUES ('amargerisonh@pen.io', 'Kazakhstan', 'HR48O', 9, 2525);
INSERT INTO "Record" VALUES ('agehrelsu@qq.com', 'Poland', 'HR48O', 6, 1114);
INSERT INTO "Record" VALUES ('agatehousew@wsj.com', 'Georgia', 'HR48O', 5, 2220);
INSERT INTO "Record" VALUES ('agatehousew@wsj.com', 'Kazakhstan', 'HR48O', 0, 115);
INSERT INTO "Record" VALUES ('amargerisonh@pen.io', 'Russia', 'HR48O', 0, 10);
INSERT INTO "Record" VALUES ('agatehousew@wsj.com', 'Brazil', 'HR48O', 2, 5);
INSERT INTO "Record" VALUES ('agatehousew@wsj.com', 'Indonesia', 'HR48O', 0, 1122);


--
-- Data for Name: Specialize; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Specialize" VALUES (1, 'goffiler11@blogger.com');
INSERT INTO "Specialize" VALUES (23, 'mubanks1@state.tx.us');
INSERT INTO "Specialize" VALUES (4, 'wfrancillo3@netscape.com');
INSERT INTO "Specialize" VALUES (16, 'nmethingamk@timesonline.co.uk');
INSERT INTO "Specialize" VALUES (10, 'cong4@google.com.au');
INSERT INTO "Specialize" VALUES (12, 'ndrabblep@shutterfly.com');
INSERT INTO "Specialize" VALUES (30, 'kperrot5@yolasite.com');
INSERT INTO "Specialize" VALUES (18, 'kperrot5@yolasite.com');
INSERT INTO "Specialize" VALUES (23, 'goffiler11@blogger.com');
INSERT INTO "Specialize" VALUES (15, 'ndrabblep@shutterfly.com');
INSERT INTO "Specialize" VALUES (1, 'kperrot5@yolasite.com');
INSERT INTO "Specialize" VALUES (6, 'ndrabblep@shutterfly.com');
INSERT INTO "Specialize" VALUES (24, 'nobradden12@illinois.edu');
INSERT INTO "Specialize" VALUES (24, 'mdimont7@reverbnation.com');
INSERT INTO "Specialize" VALUES (24, 'pstandons@uol.com.br');


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Users" VALUES ('egovinlockv@earthlink.net', 'Englebert', 'Govinlock', 620148, '+33-874-756-9075', 'France');
INSERT INTO "Users" VALUES ('bchesshire10@mapy.cz', 'Berry', 'Chesshire', 861643, '+48-112-147-2053', 'Poland');
INSERT INTO "Users" VALUES ('goffiler11@blogger.com', 'Gabbie', 'Offiler', 856826, '+52-250-422-9104', 'Mexico');
INSERT INTO "Users" VALUES ('nobradden12@illinois.edu', 'Nannie', 'O''Bradden', 212839, '+33-283-574-5262', 'France');
INSERT INTO "Users" VALUES ('mubanks1@state.tx.us', 'Martica', 'Ubanks', 987695, '+86-464-194-5337', 'China');
INSERT INTO "Users" VALUES ('wfrancillo3@netscape.com', 'Wallis', 'Francillo', 785985, '+86-697-119-6719', 'China');
INSERT INTO "Users" VALUES ('cong4@google.com.au', 'Caralie', 'Ong', 271854, '+351-896-442-6991', 'Portugal');
INSERT INTO "Users" VALUES ('agehrelsu@qq.com', 'Nurzhan', 'Gehrels', 124323, '+48-929-222-1714', 'Poland');
INSERT INTO "Users" VALUES ('pstandons@uol.com.br', 'Kate', 'Standon', 836003, '+48-810-365-1834', 'Poland');
INSERT INTO "Users" VALUES ('mdimont7@reverbnation.com', 'Mel', 'Dimont', 623702, '+7-913-769-6663', 'Russia');
INSERT INTO "Users" VALUES ('ftidcombeo@twitter.com', 'Abzalbek', 'Tidcombe', 529464, '+962-614-850-9286', 'Jordan');
INSERT INTO "Users" VALUES ('agatehousew@wsj.com', 'Alica', 'Gatehouse', 2400, '+380-490-191-9468', 'Ukraine');
INSERT INTO "Users" VALUES ('nmethingamk@timesonline.co.uk', 'Sungul', 'Methingam', 792202, '+81-991-286-3501', 'Japan');
INSERT INTO "Users" VALUES ('oseaversc@booking.com', 'Oby', 'Seavers', 357690, '+86-101-456-9786', 'China');
INSERT INTO "Users" VALUES ('oheatleyd@jugem.jp', 'Orin', 'Heatley', 765041, '+62-912-801-5538', 'Indonesia');
INSERT INTO "Users" VALUES ('aeskriggee@webeden.co.uk', 'Alison', 'Eskrigge', 837405, '+7-427-309-7189', 'Russia');
INSERT INTO "Users" VALUES ('cloomesf@instagram.com', 'Creighton', 'Loomes', 679689, '+62-828-789-1680', 'Indonesia');
INSERT INTO "Users" VALUES ('mkornackig@dailymotion.com', 'Gulzhan', 'Kornacki', 779280, '+48-751-410-8788', 'Poland');
INSERT INTO "Users" VALUES ('jsuett2@taobao.com', 'Gulsim', 'Suett', 734210, '+33-524-178-1059', 'France');
INSERT INTO "Users" VALUES ('hrennlesi@theatlantic.com', 'Harli', 'Rennles', 769089, '+62-122-547-1849', 'Indonesia');
INSERT INTO "Users" VALUES ('kperrot5@yolasite.com', 'Aigul', 'Perrot', 359615, '+57-710-738-3159', 'Colombia');
INSERT INTO "Users" VALUES ('rrookel@example.com', 'Randal', 'Rooke', 765991, '+351-131-978-7195', 'Portugal');
INSERT INTO "Users" VALUES ('trosendalen@webmd.com', 'Teodoro', 'Rosendale', 558488, '+63-838-941-7360', 'Philippines');
INSERT INTO "Users" VALUES ('amargerisonh@pen.io', 'Sunzhan', 'Margerison', 500, '+51-990-720-6207', 'Peru');
INSERT INTO "Users" VALUES ('mpetrieq@wikispaces.com', 'Maximilian', 'Petrie', 789812, '+86-296-658-8884', 'China');
INSERT INTO "Users" VALUES ('dprewr@youtu.be', 'Donaugh', 'Prew', 866603, '+62-290-213-0190', 'Indonesia');
INSERT INTO "Users" VALUES ('ndrabblep@shutterfly.com', 'Abylaibek', 'Drabble', 143317, '+51-640-381-0004', 'Peru');
INSERT INTO "Users" VALUES ('msimenott@thetimes.co.uk', 'Bekzhan', 'Simenot', 706009, '+380-532-415-3089', 'Ukraine');
INSERT INTO "Users" VALUES ('cseymourx@tripadvisor.com', 'Cathrine', 'Seymour', 802414, '+62-743-754-1560', 'Indonesia');
INSERT INTO "Users" VALUES ('aparryy@noaa.gov', 'Agosto', 'Parry', 118381, '+7-871-987-5874', 'Russia');


--
-- Name: Country Country_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Country"
    ADD CONSTRAINT "Country_pk" PRIMARY KEY (cname);


--
-- Name: DiseaseType DiseaseType_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DiseaseType"
    ADD CONSTRAINT "DiseaseType_id" PRIMARY KEY (id);


--
-- Name: DiseaseType DiseaseType_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DiseaseType"
    ADD CONSTRAINT "DiseaseType_pk" UNIQUE (description);


--
-- Name: Disease Disease_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Disease"
    ADD CONSTRAINT "Disease_pk" PRIMARY KEY (disease_code);


--
-- Name: Doctor Doctor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Doctor"
    ADD CONSTRAINT "Doctor_pk" PRIMARY KEY (email);


--
-- Name: PublicServant PublicServant_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PublicServant"
    ADD CONSTRAINT "PublicServant_pk" PRIMARY KEY (email);


--
-- Name: Users Users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pk" PRIMARY KEY (email);


--
-- Name: Discover discover_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Discover"
    ADD CONSTRAINT discover_pkey PRIMARY KEY (cname, disease_code);


--
-- Name: Disease Disease_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Disease"
    ADD CONSTRAINT "Disease_fk" FOREIGN KEY (id) REFERENCES "DiseaseType"(id);


--
-- Name: Doctor Doctor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Doctor"
    ADD CONSTRAINT "Doctor_fk" FOREIGN KEY (email) REFERENCES "Users"(email) ON DELETE CASCADE;


--
-- Name: PublicServant PublicServant_Users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PublicServant"
    ADD CONSTRAINT "PublicServant_Users_fk" FOREIGN KEY (email) REFERENCES "Users"(email) ON DELETE CASCADE;


--
-- Name: Record Record_Country_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Record"
    ADD CONSTRAINT "Record_Country_null_fk" FOREIGN KEY (cname) REFERENCES "Country"(cname);


--
-- Name: Record Record_Disease_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Record"
    ADD CONSTRAINT "Record_Disease_null_fk" FOREIGN KEY (disease_code) REFERENCES "Disease"(disease_code);


--
-- Name: Record Record_PublicServant_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Record"
    ADD CONSTRAINT "Record_PublicServant_null_fk" FOREIGN KEY (email) REFERENCES "PublicServant"(email) ON DELETE CASCADE;


--
-- Name: Specialize Specialize_DiseaseType_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Specialize"
    ADD CONSTRAINT "Specialize_DiseaseType_null_fk" FOREIGN KEY (id) REFERENCES "DiseaseType"(id);


--
-- Name: Specialize Specialize_Doctor_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Specialize"
    ADD CONSTRAINT "Specialize_Doctor_null_fk" FOREIGN KEY (email) REFERENCES "Doctor"(email) ON DELETE CASCADE;


--
-- Name: Users Users_Country_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_Country_fk" FOREIGN KEY (cname) REFERENCES "Country"(cname) ON DELETE CASCADE;


--
-- Name: Discover discover_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Discover"
    ADD CONSTRAINT discover_cname_fkey FOREIGN KEY (cname) REFERENCES "Country"(cname) ON DELETE CASCADE;


--
-- Name: Discover discover_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Discover"
    ADD CONSTRAINT discover_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES "Disease"(disease_code) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

