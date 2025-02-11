--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Postgres.app)
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: research; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE research WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


\connect research

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cell_line; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cell_line (
    patient_id uuid NOT NULL,
    cell_type character varying NOT NULL,
    date_frozen date NOT NULL,
    "USD_per_vial" numeric NOT NULL,
    no_of_vials integer NOT NULL,
    total_cells_per_vial_e6 numeric NOT NULL,
    percent_viability numeric NOT NULL,
    cell_line_id uuid DEFAULT public.uuid_generate_v4() NOT NULL
);


--
-- Name: patient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.patient (
    patient_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    sex character varying(1) NOT NULL,
    age integer NOT NULL,
    diagnosis text NOT NULL,
    stage integer,
    source text NOT NULL
);


--
-- Name: tissue_dissociation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tissue_dissociation (
    patient_id uuid NOT NULL,
    tumor_mass_g numeric NOT NULL,
    total_cells_e6 numeric NOT NULL,
    percent_viability numeric NOT NULL,
    dissociation_method character varying NOT NULL,
    tissue_type character varying,
    viability_method character varying NOT NULL,
    tissue_date_harvested date NOT NULL,
    tissue_date_processed date NOT NULL
);


--
-- Name: viability_result; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.viability_result (
    cell_line uuid NOT NULL,
    percent_viability numeric NOT NULL,
    viability_method character varying NOT NULL,
    total_cells_e6 numeric NOT NULL
);


--
-- Name: whole_blood_processing; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.whole_blood_processing (
    patient_id uuid NOT NULL,
    amount_of_blood_ml numeric NOT NULL,
    total_pbmc_e6 numeric NOT NULL,
    percent_viability interval NOT NULL,
    viability_method character varying NOT NULL,
    pbmc_isolation_method character varying NOT NULL,
    blood_date_drawn date NOT NULL,
    blood_date_processed date NOT NULL
);


--
-- Data for Name: cell_line; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cell_line VALUES
	('0c885c36-2b70-4ad5-a7df-051368996101', 'PBMC', '2020-11-26', 468, 7, 11, 95, '4edcbe95-f48d-4ac7-bf1d-c8c9f59cfe8c'),
	('bfa21afa-7f64-4fa2-9f16-641501e6650e', 'PBMC', '2022-12-19', 738, 3, 22, 99, 'ee882386-91cb-45b2-9389-5468399cf967'),
	('0c73df0f-e4d6-4b16-9309-3a5959176c28', 'PBMC', '2024-02-01', 512, 1, 12, 96, '6cd9a510-600c-43da-a925-3a9c872eef74'),
	('d8fc6952-52af-4976-9ef6-e5e8b5279750', 'PBMC', '2016-11-09', 592, 6, 14, 98, '427e5cb2-9cb2-4034-8417-19432dd5a2b1'),
	('da0ebe23-b891-4efa-9ff7-01264d8a1404', 'PBMC', '2015-09-19', 513, 5, 18, 95, '577b397f-8369-4816-9de0-31b5fafe51f7'),
	('f85bf050-97d1-4de9-b00e-e01d3e50a8d8', 'PBMC', '2015-05-01', 793, 3, 13, 96, 'a7cb54f8-df66-4c88-b6d6-53cbdcca6292'),
	('6b1a076b-8f57-498d-87eb-336c3b6428fb', 'PBMC', '2017-06-01', 623, 7, 23, 92, '99298f93-4677-42c5-8514-5628c60b11b8'),
	('4d0f1fb4-b533-41f7-a37e-be7152661c40', 'PBMC', '2021-07-31', 546, 3, 17, 95, '99ff2656-e2fc-416b-b7d5-c0e2f8137bcd'),
	('2c0cb4cb-03a4-4972-83f7-f5820b4ab2a9', 'PBMC', '2020-08-12', 352, 5, 15, 94, '43300a4a-1900-4f65-b93c-b01f02d5babb'),
	('84a039bc-7a27-482a-9506-c7b56fce9697', 'PBMC', '2024-05-14', 491, 6, 13, 95, '5cc964ee-8ee6-44f7-ada7-0eee6cb63dad'),
	('4d3dba1c-191b-4e04-8edc-8ab7e4311d86', 'PBMC', '2017-05-21', 650, 4, 10, 95, '22b6b6bf-b9ff-4f02-b1e4-4fe132e8ef50'),
	('8c0ccf6f-62e7-48dd-8d94-ee2bf10c6822', 'PBMC', '2018-10-03', 435, 10, 18, 97, 'f94aaf11-eef4-45f6-8038-3124eb5a9104'),
	('a3994048-0d22-4497-bade-b003b3224d05', 'PBMC', '2019-10-14', 888, 5, 25, 98, '2dab70bb-9e33-44d9-b5cd-ee6cde961a11'),
	('095de8ec-bad1-4f7c-8e43-30d666fabac0', 'PBMC', '2018-12-25', 688, 9, 25, 91, '75b8baf4-4c06-4d22-bef8-e9404ab2e078'),
	('c08148a9-6602-4e83-ba1a-3646a41dd5f9', 'PBMC', '2017-12-25', 875, 5, 19, 92, '07c268ed-7501-4484-be1a-f5be655cd7d0'),
	('4a2cfb60-6403-4965-a065-d260cd8c7678', 'PBMC', '2016-01-23', 766, 3, 11, 99, '869ff97c-e6c3-4dac-ab60-5364fe31e748'),
	('c1f6bca6-5ed4-4e29-92ab-e840d1e51e18', 'PBMC', '2020-06-20', 656, 9, 23, 96, 'df45e853-f4a4-4769-a07e-be15505941d6'),
	('58b4c7c7-97e3-4e0a-a6b3-27fd1a8f99d7', 'PBMC', '2021-01-11', 592, 8, 22, 95, '9632f2ff-b761-48d9-a5f5-3b50df95da7c'),
	('27958b38-4776-4641-acc0-5ffe0c207824', 'PBMC', '2023-07-10', 387, 6, 13, 90, '68597d13-4328-4f90-9eff-b4780d335cda'),
	('3cd81255-e5af-4fa9-9775-e3ac1008ce8b', 'PBMC', '2015-10-18', 742, 7, 16, 99, '4216fa39-bfa5-4f7e-93c2-9918020e2803'),
	('4fc0ffcc-ddb4-4be9-bccd-f7b8eb725923', 'PBMC', '2016-11-25', 936, 1, 12, 94, '0fcd71ea-6033-45e1-9e0d-a181ce211f76'),
	('c810d80f-e750-4a84-a962-e04327475020', 'PBMC', '2021-08-24', 629, 8, 12, 96, 'd258eef3-f4e0-4e03-b075-a1cc7a1f62b7'),
	('915473fa-deeb-430d-b000-82c1401724fc', 'PBMC', '2020-12-01', 659, 5, 22, 92, '9bbb00ac-27ee-4e7d-af8e-d35d50e7a622'),
	('81d1d1a4-75a0-48e7-a1ab-c05c3fc2a3e8', 'PBMC', '2016-01-20', 794, 9, 15, 91, '865c346d-6100-490f-bd4f-53bde8ce5854'),
	('a1c57603-6fbe-444a-a085-09746259a14b', 'PBMC', '2020-06-26', 936, 3, 14, 98, '92f5625d-e903-45fb-9b40-1b5c64f3fa22'),
	('8adb2517-2c8e-492f-843f-03af25fb6674', 'PBMC', '2023-10-08', 582, 2, 15, 95, '296510c0-b026-4f0d-94f5-ab61a9815bc9'),
	('2fe6dbea-7037-4306-9ade-5220b0689d81', 'PBMC', '2020-04-16', 614, 5, 14, 97, 'af03bf77-db5d-4d2e-97a5-43f5ee5b6fef'),
	('6670bb2e-c585-400a-9467-122dc13aaf41', 'PBMC', '2022-12-02', 970, 2, 13, 92, 'c58d70f4-b7e7-4eef-914e-40071c6b7f28'),
	('478ae61e-9a77-45c5-aa59-e95231280cac', 'PBMC', '2015-04-26', 535, 7, 10, 90, '397a7647-f5a9-47db-9589-2774d1f33084'),
	('ed54f0d1-c66e-4283-997c-b3989e1a9748', 'PBMC', '2024-05-15', 873, 8, 10, 99, '23f6d7f1-5e6e-4802-8ea7-8ca0bd415385'),
	('698559f6-875a-4ef7-a7d3-b24810f5f3fc', 'PBMC', '2024-05-29', 978, 4, 24, 90, 'db0fb3cd-2d3f-4748-9aa1-99ab924cafb4'),
	('84765431-fd0b-4666-a683-63d99621b40d', 'PBMC', '2018-01-21', 609, 4, 25, 96, 'd9bcc4bd-d68e-4389-bdd3-4d3343e52c77'),
	('9cd17a50-e65f-411f-af40-8ad9faada99a', 'PBMC', '2017-08-12', 332, 3, 18, 97, '3a43deb1-f338-4081-a758-afc638fdc9cf'),
	('6efebe1d-7f8f-493b-aec7-06e6e1e6afb0', 'PBMC', '2015-08-03', 352, 4, 18, 90, '08cd1114-c34e-4cbe-b148-7d95f7fdb877'),
	('90dc2702-f8bc-44f1-ae4d-0debdfb370ce', 'PBMC', '2021-01-10', 601, 6, 20, 91, '906a0536-18d4-4f56-b9f0-fa08fd23b0b1'),
	('b5b79d75-f5e5-4871-aa1f-9e3a1656cf37', 'PBMC', '2019-08-12', 624, 8, 13, 92, '2d3decc7-9894-466a-9a67-4bbe467f541f'),
	('3626ab55-31fa-4fd0-8618-b46a0de5b6cc', 'PBMC', '2018-12-30', 699, 8, 16, 90, '0b2c7919-f735-4e82-8bee-93b443806227'),
	('4947d01d-3300-4bf7-bdf2-7dd2bc5f571b', 'PBMC', '2024-12-04', 961, 10, 12, 98, '7c03f995-1a66-4e11-935d-117146dff14e'),
	('ab1b7ed5-945d-47bf-b389-d9c3b8fa5410', 'PBMC', '2017-09-02', 724, 3, 17, 99, '17f432e9-7e10-4755-b848-89dc618aaf1f'),
	('2c0712cb-0387-42bc-b8ed-c6c65a03784e', 'PBMC', '2021-01-27', 926, 9, 18, 96, '14212302-5ac8-4c4b-aacd-7868078fadd5'),
	('fe2ffbdf-f64a-41be-8d72-c0a77417b1f4', 'PBMC', '2016-06-19', 859, 1, 16, 91, 'cf29bd13-330d-43ba-9f81-8b657bd42778'),
	('4854825e-3640-4a59-956e-8dd37d8f8154', 'PBMC', '2015-10-27', 812, 4, 16, 99, 'bd653cdb-822d-4350-b710-7c6e0c9fcb1c'),
	('b3a89a89-8b67-4c56-a9d2-bc9035cf8dd8', 'PBMC', '2022-05-12', 837, 6, 17, 95, 'cba0362e-4c9e-4c54-bf09-700ed23bd520'),
	('f34abc2a-8bf5-447d-85bd-7a6c42bb8d2a', 'PBMC', '2017-11-22', 908, 9, 16, 97, 'f86a95e7-02cd-452d-bcd0-00e63ffbdc65'),
	('bab5d128-b374-4538-95ef-12bd6ff30152', 'PBMC', '2019-10-05', 561, 3, 18, 94, 'a62f3a59-45de-4270-a8cd-2da8b16fb363'),
	('0ab893a2-1e47-484a-9218-2baf2d36b649', 'PBMC', '2018-05-12', 512, 7, 18, 96, 'c5e585b4-7186-4f0f-aaed-c1c7e61e59c7'),
	('2aeab8de-e1be-4f97-96c8-ffc11ebb70e7', 'PBMC', '2021-08-29', 317, 6, 16, 91, '96d67bd6-3edc-4b6b-aa90-acfc0b0c43fc'),
	('08e445ab-e389-463c-96e6-4799ec4a724f', 'PBMC', '2021-01-09', 638, 6, 17, 96, '98d1c94b-c9dc-4e73-92b2-79e5c087be87'),
	('85c9549c-9ec1-469f-ae3b-6a499ccfd817', 'PBMC', '2017-07-10', 445, 6, 17, 92, 'a2df7f5e-d77e-405f-95b8-c3e6366982d7'),
	('437b678f-2c48-44aa-99df-4c55030c0258', 'PBMC', '2018-09-01', 638, 8, 20, 90, 'e1df270d-3c04-40ad-81d7-7fda98d6e421'),
	('0c885c36-2b70-4ad5-a7df-051368996101', 'DTC', '2020-11-26', 832, 3, 9, 37, '31d49bb8-e998-4ab8-b20d-c2294b4eaa8f'),
	('bfa21afa-7f64-4fa2-9f16-641501e6650e', 'DTC', '2022-12-19', 623, 5, 8, 12, '018c7f0e-9f4e-4999-be82-3a4b0627500c'),
	('0c73df0f-e4d6-4b16-9309-3a5959176c28', 'DTC', '2024-02-01', 861, 2, 5, 72, '28b79d95-4a67-4069-b98e-1114f27e59ec'),
	('d8fc6952-52af-4976-9ef6-e5e8b5279750', 'DTC', '2016-11-09', 384, 7, 8, 51, 'f40ee8a1-9a7f-4202-a14e-4b51c4cd4273'),
	('da0ebe23-b891-4efa-9ff7-01264d8a1404', 'DTC', '2015-09-19', 330, 2, 10, 41, '4ef92fac-585b-482f-b906-5a282ac43240'),
	('f85bf050-97d1-4de9-b00e-e01d3e50a8d8', 'DTC', '2015-05-01', 625, 8, 7, 20, '535414ff-d34f-4c8c-890e-1f6595bbe7d1'),
	('6b1a076b-8f57-498d-87eb-336c3b6428fb', 'DTC', '2017-06-01', 874, 1, 9, 63, 'f570f41b-bab4-4b08-80ef-e6966a4908ca'),
	('4d0f1fb4-b533-41f7-a37e-be7152661c40', 'DTC', '2021-07-31', 965, 3, 2, 35, 'f9d23d0c-6bc7-47ed-b06b-94b0e5c9c454'),
	('2c0cb4cb-03a4-4972-83f7-f5820b4ab2a9', 'DTC', '2020-08-12', 419, 3, 6, 44, '8641f6e7-fbed-48bd-b235-4a345723e496'),
	('84a039bc-7a27-482a-9506-c7b56fce9697', 'DTC', '2024-05-14', 532, 3, 5, 11, '8dce3a98-8dc3-4546-8a11-4680d3161429'),
	('4d3dba1c-191b-4e04-8edc-8ab7e4311d86', 'DTC', '2017-05-21', 555, 9, 6, 49, '14c729f5-4f9a-4272-b8fd-0f02d4b40abb'),
	('8c0ccf6f-62e7-48dd-8d94-ee2bf10c6822', 'DTC', '2018-10-03', 405, 9, 8, 64, '18746852-49fa-4b46-a97c-ba6b7293f420'),
	('a3994048-0d22-4497-bade-b003b3224d05', 'DTC', '2019-10-14', 936, 1, 1, 70, '5c358c4d-eb06-4b71-83e5-5bf8b5e7603e'),
	('095de8ec-bad1-4f7c-8e43-30d666fabac0', 'DTC', '2018-12-25', 912, 8, 8, 12, 'eb18e23f-1e63-4ad5-bf74-e4e87b4e6bbb'),
	('c08148a9-6602-4e83-ba1a-3646a41dd5f9', 'DTC', '2017-12-25', 538, 9, 9, 26, '0ab0ae59-fcc9-4f8f-bd94-fa2732428de8'),
	('4a2cfb60-6403-4965-a065-d260cd8c7678', 'DTC', '2016-01-23', 414, 1, 2, 75, 'ebb5c8d4-57a3-42d5-97e3-11f82db783e6'),
	('c1f6bca6-5ed4-4e29-92ab-e840d1e51e18', 'DTC', '2020-06-20', 706, 6, 3, 75, '81bcc4ea-ec0f-4ff2-be10-423e90c7ae8c'),
	('58b4c7c7-97e3-4e0a-a6b3-27fd1a8f99d7', 'DTC', '2021-01-11', 809, 10, 5, 76, '82772860-ae29-46d8-8863-05ee018a28dc'),
	('27958b38-4776-4641-acc0-5ffe0c207824', 'DTC', '2023-07-10', 672, 5, 9, 23, '3ae23163-353a-47f2-943e-2f0feadabf1b'),
	('3cd81255-e5af-4fa9-9775-e3ac1008ce8b', 'DTC', '2015-10-18', 693, 9, 3, 27, '9547bcc1-0f1a-4aee-8f6f-8f889d477854'),
	('4fc0ffcc-ddb4-4be9-bccd-f7b8eb725923', 'DTC', '2016-11-25', 464, 9, 6, 80, '7c0b8626-dd15-4cd0-a627-b808fde03a8a'),
	('c810d80f-e750-4a84-a962-e04327475020', 'DTC', '2021-08-24', 662, 4, 8, 15, 'b1da9308-abce-4785-aedc-fcd078e1480d'),
	('915473fa-deeb-430d-b000-82c1401724fc', 'DTC', '2020-12-01', 306, 4, 7, 15, 'f936f630-074f-4c41-8bed-ca02e49a7f79'),
	('81d1d1a4-75a0-48e7-a1ab-c05c3fc2a3e8', 'DTC', '2016-01-20', 932, 2, 6, 41, '0fe8a820-2b9d-409f-b657-b1f772d01c03'),
	('a1c57603-6fbe-444a-a085-09746259a14b', 'DTC', '2020-06-26', 660, 4, 8, 32, '60424477-4dcf-4180-badd-2bf64a39a68b'),
	('8adb2517-2c8e-492f-843f-03af25fb6674', 'DTC', '2023-10-08', 463, 1, 5, 12, '3ed56ddb-ba72-4f12-81f9-c3caaef89ae6'),
	('2fe6dbea-7037-4306-9ade-5220b0689d81', 'DTC', '2020-04-16', 871, 9, 5, 65, '23dd38f0-ec54-4f41-9934-26c37cafdac5'),
	('6670bb2e-c585-400a-9467-122dc13aaf41', 'DTC', '2022-12-02', 840, 7, 7, 38, '3fe9b047-175e-4db3-875d-e5999d02a139'),
	('478ae61e-9a77-45c5-aa59-e95231280cac', 'DTC', '2015-04-26', 658, 4, 10, 46, 'd41b7c87-5e0b-430a-b320-693692275daa'),
	('ed54f0d1-c66e-4283-997c-b3989e1a9748', 'DTC', '2024-05-15', 843, 9, 9, 53, '953ab66b-823c-41ca-9c76-4d4694332803'),
	('698559f6-875a-4ef7-a7d3-b24810f5f3fc', 'DTC', '2024-05-29', 617, 5, 8, 43, '8e33149f-45dd-47cd-89ac-20d1d0d15a1e'),
	('84765431-fd0b-4666-a683-63d99621b40d', 'DTC', '2018-01-21', 475, 9, 2, 77, '7638a9e3-ac53-4608-84d2-962430940a5e'),
	('9cd17a50-e65f-411f-af40-8ad9faada99a', 'DTC', '2017-08-12', 835, 10, 3, 77, '90b4213c-91ec-4807-9b5c-815412d7ab77'),
	('6efebe1d-7f8f-493b-aec7-06e6e1e6afb0', 'DTC', '2015-08-03', 996, 9, 6, 40, '5fc9a224-68e4-4316-878f-d61ea876c0bd'),
	('90dc2702-f8bc-44f1-ae4d-0debdfb370ce', 'DTC', '2021-01-10', 454, 1, 3, 11, 'f1e8f593-cf3a-4e08-8c2c-f313f090b3c7'),
	('b5b79d75-f5e5-4871-aa1f-9e3a1656cf37', 'DTC', '2019-08-12', 499, 10, 6, 63, 'add930c2-ca7a-452d-809c-4565013ac980'),
	('3626ab55-31fa-4fd0-8618-b46a0de5b6cc', 'DTC', '2018-12-30', 518, 4, 2, 67, 'c1dd5bb9-f5da-43c3-abfd-19823c7368f4'),
	('4947d01d-3300-4bf7-bdf2-7dd2bc5f571b', 'DTC', '2024-12-04', 995, 10, 3, 28, '7c1b63ee-95d0-448d-995a-08052e06a12c'),
	('ab1b7ed5-945d-47bf-b389-d9c3b8fa5410', 'DTC', '2017-09-02', 311, 5, 4, 24, 'c059e763-2d8d-4501-8847-527bd684bb4f'),
	('2c0712cb-0387-42bc-b8ed-c6c65a03784e', 'DTC', '2021-01-27', 589, 4, 10, 28, '0cecc559-4137-4938-96d4-79c0f915413d'),
	('fe2ffbdf-f64a-41be-8d72-c0a77417b1f4', 'DTC', '2016-06-19', 556, 10, 5, 42, 'f5487dbc-dd3b-4348-8418-7975cb046514'),
	('4854825e-3640-4a59-956e-8dd37d8f8154', 'DTC', '2015-10-27', 490, 1, 4, 56, '274ed2a7-5d08-4b9e-b804-742cc1d1086f'),
	('b3a89a89-8b67-4c56-a9d2-bc9035cf8dd8', 'DTC', '2022-05-12', 991, 5, 3, 43, '922804eb-df73-403d-ae05-51b9020027a7'),
	('f34abc2a-8bf5-447d-85bd-7a6c42bb8d2a', 'DTC', '2017-11-22', 706, 2, 6, 68, 'd61911af-7f2c-4306-8f1f-6c5b8ddb6156'),
	('bab5d128-b374-4538-95ef-12bd6ff30152', 'DTC', '2019-10-05', 562, 9, 8, 12, '6b4a5a10-e851-464f-9aac-78cfc019d2e0'),
	('0ab893a2-1e47-484a-9218-2baf2d36b649', 'DTC', '2018-05-12', 951, 2, 8, 17, '4d584004-ad5b-42dd-bb8b-4fb89d4f781b'),
	('2aeab8de-e1be-4f97-96c8-ffc11ebb70e7', 'DTC', '2021-08-29', 674, 8, 6, 40, '19e16d19-c759-401e-93fc-3a74fe4b6da0'),
	('08e445ab-e389-463c-96e6-4799ec4a724f', 'DTC', '2021-01-09', 666, 4, 9, 59, 'd603ff47-3af3-488c-9191-c30dd6ddc37a'),
	('85c9549c-9ec1-469f-ae3b-6a499ccfd817', 'DTC', '2017-07-10', 670, 5, 4, 70, 'f9168cb0-defb-401e-91ac-984834a0fd48'),
	('437b678f-2c48-44aa-99df-4c55030c0258', 'DTC', '2018-09-01', 823, 9, 1, 42, '7e5f0b90-e3d0-4b2f-ad3d-cc4a147c13e5');


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.patient VALUES
	('0c885c36-2b70-4ad5-a7df-051368996101', 'F', 75, 'Pancreatic Cancer', 2, 'Hospital C'),
	('bfa21afa-7f64-4fa2-9f16-641501e6650e', 'F', 65, 'Stomach Cancer', 1, 'Hospital E'),
	('0c73df0f-e4d6-4b16-9309-3a5959176c28', 'F', 35, 'NSCLC', 3, 'Hospital D'),
	('d8fc6952-52af-4976-9ef6-e5e8b5279750', 'F', 31, 'Stomach Cancer', 3, 'Hospital A'),
	('da0ebe23-b891-4efa-9ff7-01264d8a1404', 'F', 46, 'Liver Cancer', 1, 'Hopsital B'),
	('f85bf050-97d1-4de9-b00e-e01d3e50a8d8', 'F', 70, 'NSCLC', 4, 'Hopsital B'),
	('6b1a076b-8f57-498d-87eb-336c3b6428fb', 'M', 64, 'Stomach Cancer', 4, 'Hospital D'),
	('4d0f1fb4-b533-41f7-a37e-be7152661c40', 'M', 79, 'Cervical Cancer', 1, 'Hopsital B'),
	('2c0cb4cb-03a4-4972-83f7-f5820b4ab2a9', 'F', 49, 'Cervical Cancer', 2, 'Hospital D'),
	('84a039bc-7a27-482a-9506-c7b56fce9697', 'F', 80, 'Cervical Cancer', 2, 'Hospital E'),
	('4d3dba1c-191b-4e04-8edc-8ab7e4311d86', 'M', 57, 'Colorectal Cancer', 1, 'Hopsital B'),
	('8c0ccf6f-62e7-48dd-8d94-ee2bf10c6822', 'F', 57, 'Cervical Cancer', 2, 'Hopsital B'),
	('a3994048-0d22-4497-bade-b003b3224d05', 'F', 79, 'Liver Cancer', 1, 'Hospital A'),
	('095de8ec-bad1-4f7c-8e43-30d666fabac0', 'F', 27, 'NSCLC', 4, 'Hospital D'),
	('c08148a9-6602-4e83-ba1a-3646a41dd5f9', 'M', 43, 'Cervical Cancer', 1, 'Hospital C'),
	('4a2cfb60-6403-4965-a065-d260cd8c7678', 'M', 55, 'Cervical Cancer', 1, 'Hospital C'),
	('c1f6bca6-5ed4-4e29-92ab-e840d1e51e18', 'F', 64, 'NSCLC', 2, 'Hospital A'),
	('58b4c7c7-97e3-4e0a-a6b3-27fd1a8f99d7', 'F', 68, 'Colorectal Cancer', 2, 'Hospital D'),
	('27958b38-4776-4641-acc0-5ffe0c207824', 'F', 69, 'Ovarian Cancer', 2, 'Hospital D'),
	('3cd81255-e5af-4fa9-9775-e3ac1008ce8b', 'F', 77, 'Ovarian Cancer', 4, 'Hospital A'),
	('4fc0ffcc-ddb4-4be9-bccd-f7b8eb725923', 'F', 63, 'Liver Cancer', 1, 'Hospital D'),
	('c810d80f-e750-4a84-a962-e04327475020', 'F', 56, 'Cervical Cancer', 2, 'Hospital C'),
	('915473fa-deeb-430d-b000-82c1401724fc', 'M', 45, 'Pancreatic Cancer', 2, 'Hospital A'),
	('81d1d1a4-75a0-48e7-a1ab-c05c3fc2a3e8', 'M', 69, 'Colorectal Cancer', 1, 'Hopsital B'),
	('a1c57603-6fbe-444a-a085-09746259a14b', 'F', 26, 'NSCLC', 3, 'Hopsital B'),
	('8adb2517-2c8e-492f-843f-03af25fb6674', 'M', 42, 'Cervical Cancer', 1, 'Hospital C'),
	('2fe6dbea-7037-4306-9ade-5220b0689d81', 'M', 27, 'Colorectal Cancer', 3, 'Hospital E'),
	('6670bb2e-c585-400a-9467-122dc13aaf41', 'M', 48, 'Liver Cancer', 3, 'Hospital C'),
	('478ae61e-9a77-45c5-aa59-e95231280cac', 'F', 28, 'Pancreatic Cancer', 3, 'Hospital C'),
	('ed54f0d1-c66e-4283-997c-b3989e1a9748', 'M', 53, 'Stomach Cancer', 3, 'Hopsital B'),
	('698559f6-875a-4ef7-a7d3-b24810f5f3fc', 'M', 42, 'Liver Cancer', 2, 'Hospital A'),
	('84765431-fd0b-4666-a683-63d99621b40d', 'M', 47, 'Cervical Cancer', 1, 'Hospital E'),
	('9cd17a50-e65f-411f-af40-8ad9faada99a', 'M', 60, 'Cervical Cancer', 1, 'Hospital A'),
	('6efebe1d-7f8f-493b-aec7-06e6e1e6afb0', 'F', 76, 'Cervical Cancer', 2, 'Hospital A'),
	('90dc2702-f8bc-44f1-ae4d-0debdfb370ce', 'F', 63, 'NSCLC', 2, 'Hospital E'),
	('b5b79d75-f5e5-4871-aa1f-9e3a1656cf37', 'F', 61, 'Stomach Cancer', 3, 'Hospital A'),
	('3626ab55-31fa-4fd0-8618-b46a0de5b6cc', 'M', 62, 'Colorectal Cancer', 4, 'Hospital D'),
	('4947d01d-3300-4bf7-bdf2-7dd2bc5f571b', 'M', 64, 'Colorectal Cancer', 1, 'Hospital D'),
	('ab1b7ed5-945d-47bf-b389-d9c3b8fa5410', 'M', 73, 'NSCLC', 1, 'Hospital D'),
	('2c0712cb-0387-42bc-b8ed-c6c65a03784e', 'F', 73, 'Colorectal Cancer', 1, 'Hospital E'),
	('fe2ffbdf-f64a-41be-8d72-c0a77417b1f4', 'M', 47, 'Cervical Cancer', 1, 'Hospital A'),
	('4854825e-3640-4a59-956e-8dd37d8f8154', 'F', 52, 'Liver Cancer', 3, 'Hospital A'),
	('b3a89a89-8b67-4c56-a9d2-bc9035cf8dd8', 'M', 34, 'Liver Cancer', 2, 'Hospital A'),
	('f34abc2a-8bf5-447d-85bd-7a6c42bb8d2a', 'M', 49, 'Pancreatic Cancer', 3, 'Hospital D'),
	('bab5d128-b374-4538-95ef-12bd6ff30152', 'F', 29, 'Colorectal Cancer', 3, 'Hospital C'),
	('0ab893a2-1e47-484a-9218-2baf2d36b649', 'F', 52, 'Liver Cancer', 4, 'Hospital A'),
	('2aeab8de-e1be-4f97-96c8-ffc11ebb70e7', 'F', 70, 'Stomach Cancer', 1, 'Hopsital B'),
	('08e445ab-e389-463c-96e6-4799ec4a724f', 'F', 50, 'Stomach Cancer', 3, 'Hospital D'),
	('85c9549c-9ec1-469f-ae3b-6a499ccfd817', 'F', 41, 'Liver Cancer', 2, 'Hospital D'),
	('437b678f-2c48-44aa-99df-4c55030c0258', 'M', 25, 'Pancreatic Cancer', 4, 'Hospital E');


--
-- Data for Name: tissue_dissociation; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tissue_dissociation VALUES
	('0c885c36-2b70-4ad5-a7df-051368996101', 5.1, 4.8, 37, 'Dissociation Method 3', 'metastasis', 'Viability Method 1', '2020-11-25', '2020-11-26'),
	('bfa21afa-7f64-4fa2-9f16-641501e6650e', 1.7, 5.9, 12, 'Dissociation Method 2', 'metastasis', 'Viability Method 1', '2022-12-18', '2022-12-19'),
	('0c73df0f-e4d6-4b16-9309-3a5959176c28', 4.3, 5.6, 72, 'Dissociation Method 1', 'primary', 'Viability Method 1', '2024-01-31', '2024-02-01'),
	('d8fc6952-52af-4976-9ef6-e5e8b5279750', 5.9, 1.3, 51, 'Dissociation Method 1', 'metastasis', 'Viability Method 2', '2016-11-09', '2016-11-09'),
	('da0ebe23-b891-4efa-9ff7-01264d8a1404', 4.1, 5.4, 41, 'Dissociation Method 3', 'metastasis', 'Viability Method 2', '2015-09-18', '2015-09-19'),
	('f85bf050-97d1-4de9-b00e-e01d3e50a8d8', 4.3, 7.1, 20, 'Dissociation Method 2', 'primary', 'Viability Method 1', '2015-05-01', '2015-05-01'),
	('6b1a076b-8f57-498d-87eb-336c3b6428fb', 4, 3.4, 63, 'Dissociation Method 2', 'metastasis', 'Viability Method 2', '2017-06-01', '2017-06-01'),
	('4d0f1fb4-b533-41f7-a37e-be7152661c40', 2.5, 2.4, 35, 'Dissociation Method 2', 'primary', 'Viability Method 2', '2021-07-31', '2021-07-31'),
	('2c0cb4cb-03a4-4972-83f7-f5820b4ab2a9', 2.7, 5.3, 44, 'Dissociation Method 2', 'metastasis', 'Viability Method 2', '2020-08-11', '2020-08-12'),
	('84a039bc-7a27-482a-9506-c7b56fce9697', 2.5, 3.5, 11, 'Dissociation Method 1', 'primary', 'Viability Method 2', '2024-05-14', '2024-05-14'),
	('4d3dba1c-191b-4e04-8edc-8ab7e4311d86', 1.7, 4.6, 49, 'Dissociation Method 1', 'primary', 'Viability Method 1', '2017-05-20', '2017-05-21'),
	('8c0ccf6f-62e7-48dd-8d94-ee2bf10c6822', 2.6, 3.5, 64, 'Dissociation Method 3', 'primary', 'Viability Method 1', '2018-10-03', '2018-10-03'),
	('a3994048-0d22-4497-bade-b003b3224d05', 2.2, 3.2, 70, 'Dissociation Method 1', 'primary', 'Viability Method 1', '2019-10-13', '2019-10-14'),
	('095de8ec-bad1-4f7c-8e43-30d666fabac0', 4.1, 1.3, 12, 'Dissociation Method 2', 'primary', 'Viability Method 2', '2018-12-24', '2018-12-25'),
	('c08148a9-6602-4e83-ba1a-3646a41dd5f9', 3.4, 6.7, 26, 'Dissociation Method 2', 'primary', 'Viability Method 1', '2017-12-25', '2017-12-25'),
	('4a2cfb60-6403-4965-a065-d260cd8c7678', 1.4, 6.5, 75, 'Dissociation Method 3', 'metastasis', 'Viability Method 1', '2016-01-22', '2016-01-23'),
	('c1f6bca6-5ed4-4e29-92ab-e840d1e51e18', 3.3, 3, 75, 'Dissociation Method 3', 'primary', 'Viability Method 1', '2020-06-20', '2020-06-20'),
	('58b4c7c7-97e3-4e0a-a6b3-27fd1a8f99d7', 2.9, 6.3, 76, 'Dissociation Method 1', 'metastasis', 'Viability Method 2', '2021-01-10', '2021-01-11'),
	('27958b38-4776-4641-acc0-5ffe0c207824', 4.7, 4.3, 23, 'Dissociation Method 3', 'metastasis', 'Viability Method 2', '2023-07-09', '2023-07-10'),
	('3cd81255-e5af-4fa9-9775-e3ac1008ce8b', 5.8, 7.1, 27, 'Dissociation Method 2', 'metastasis', 'Viability Method 1', '2015-10-18', '2015-10-18'),
	('4fc0ffcc-ddb4-4be9-bccd-f7b8eb725923', 3.4, 2.4, 80, 'Dissociation Method 2', 'metastasis', 'Viability Method 2', '2016-11-25', '2016-11-25'),
	('c810d80f-e750-4a84-a962-e04327475020', 2.4, 6.3, 15, 'Dissociation Method 3', 'primary', 'Viability Method 2', '2021-08-24', '2021-08-24'),
	('915473fa-deeb-430d-b000-82c1401724fc', 5.3, 6.5, 15, 'Dissociation Method 3', 'primary', 'Viability Method 2', '2020-12-01', '2020-12-01'),
	('81d1d1a4-75a0-48e7-a1ab-c05c3fc2a3e8', 2.2, 7.9, 41, 'Dissociation Method 1', 'metastasis', 'Viability Method 1', '2016-01-20', '2016-01-20'),
	('a1c57603-6fbe-444a-a085-09746259a14b', 4.8, 2.7, 32, 'Dissociation Method 1', 'metastasis', 'Viability Method 1', '2020-06-26', '2020-06-26'),
	('8adb2517-2c8e-492f-843f-03af25fb6674', 3.2, 6.9, 12, 'Dissociation Method 1', 'metastasis', 'Viability Method 2', '2023-10-08', '2023-10-08'),
	('2fe6dbea-7037-4306-9ade-5220b0689d81', 1.8, 4.4, 65, 'Dissociation Method 3', 'metastasis', 'Viability Method 1', '2020-04-15', '2020-04-16'),
	('6670bb2e-c585-400a-9467-122dc13aaf41', 3.2, 1.5, 38, 'Dissociation Method 3', 'metastasis', 'Viability Method 2', '2022-12-02', '2022-12-02'),
	('478ae61e-9a77-45c5-aa59-e95231280cac', 4.9, 5.9, 46, 'Dissociation Method 2', 'metastasis', 'Viability Method 1', '2015-04-26', '2015-04-26'),
	('ed54f0d1-c66e-4283-997c-b3989e1a9748', 5.2, 5, 53, 'Dissociation Method 1', 'metastasis', 'Viability Method 1', '2024-05-14', '2024-05-15'),
	('698559f6-875a-4ef7-a7d3-b24810f5f3fc', 2.9, 2.4, 43, 'Dissociation Method 2', 'metastasis', 'Viability Method 1', '2024-05-29', '2024-05-29'),
	('84765431-fd0b-4666-a683-63d99621b40d', 3, 1.7, 77, 'Dissociation Method 1', 'metastasis', 'Viability Method 1', '2018-01-21', '2018-01-21'),
	('9cd17a50-e65f-411f-af40-8ad9faada99a', 2, 5.8, 77, 'Dissociation Method 2', 'primary', 'Viability Method 2', '2017-08-11', '2017-08-12'),
	('6efebe1d-7f8f-493b-aec7-06e6e1e6afb0', 5.8, 1.2, 40, 'Dissociation Method 2', 'primary', 'Viability Method 1', '2015-08-02', '2015-08-03'),
	('90dc2702-f8bc-44f1-ae4d-0debdfb370ce', 3.3, 6.6, 11, 'Dissociation Method 1', 'primary', 'Viability Method 1', '2021-01-09', '2021-01-10'),
	('b5b79d75-f5e5-4871-aa1f-9e3a1656cf37', 2.4, 2.9, 63, 'Dissociation Method 3', 'primary', 'Viability Method 2', '2019-08-12', '2019-08-12'),
	('3626ab55-31fa-4fd0-8618-b46a0de5b6cc', 1.9, 6.1, 67, 'Dissociation Method 2', 'primary', 'Viability Method 1', '2018-12-30', '2018-12-30'),
	('4947d01d-3300-4bf7-bdf2-7dd2bc5f571b', 1.6, 1.7, 28, 'Dissociation Method 1', 'metastasis', 'Viability Method 1', '2024-12-04', '2024-12-04'),
	('ab1b7ed5-945d-47bf-b389-d9c3b8fa5410', 1.7, 1.1, 24, 'Dissociation Method 2', 'metastasis', 'Viability Method 2', '2017-09-01', '2017-09-02'),
	('2c0712cb-0387-42bc-b8ed-c6c65a03784e', 1.6, 3.8, 28, 'Dissociation Method 3', 'metastasis', 'Viability Method 1', '2021-01-26', '2021-01-27'),
	('fe2ffbdf-f64a-41be-8d72-c0a77417b1f4', 3.9, 4.1, 42, 'Dissociation Method 2', 'primary', 'Viability Method 1', '2016-06-19', '2016-06-19'),
	('4854825e-3640-4a59-956e-8dd37d8f8154', 2.9, 6.2, 56, 'Dissociation Method 2', 'metastasis', 'Viability Method 1', '2015-10-26', '2015-10-27'),
	('b3a89a89-8b67-4c56-a9d2-bc9035cf8dd8', 2.5, 3.3, 43, 'Dissociation Method 2', 'primary', 'Viability Method 2', '2022-05-12', '2022-05-12'),
	('f34abc2a-8bf5-447d-85bd-7a6c42bb8d2a', 3.2, 5.7, 68, 'Dissociation Method 1', 'metastasis', 'Viability Method 2', '2017-11-21', '2017-11-22'),
	('bab5d128-b374-4538-95ef-12bd6ff30152', 3.9, 1.6, 12, 'Dissociation Method 2', 'metastasis', 'Viability Method 2', '2019-10-04', '2019-10-05'),
	('0ab893a2-1e47-484a-9218-2baf2d36b649', 2.2, 2.5, 17, 'Dissociation Method 2', 'metastasis', 'Viability Method 2', '2018-05-11', '2018-05-12'),
	('2aeab8de-e1be-4f97-96c8-ffc11ebb70e7', 5.1, 6, 40, 'Dissociation Method 1', 'primary', 'Viability Method 1', '2021-08-29', '2021-08-29'),
	('08e445ab-e389-463c-96e6-4799ec4a724f', 4.9, 6.4, 59, 'Dissociation Method 1', 'metastasis', 'Viability Method 1', '2021-01-08', '2021-01-09'),
	('85c9549c-9ec1-469f-ae3b-6a499ccfd817', 2.5, 2.4, 70, 'Dissociation Method 2', 'primary', 'Viability Method 2', '2017-07-10', '2017-07-10'),
	('437b678f-2c48-44aa-99df-4c55030c0258', 4.1, 7.7, 42, 'Dissociation Method 2', 'metastasis', 'Viability Method 1', '2018-08-31', '2018-09-01');


--
-- Data for Name: viability_result; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.viability_result VALUES
	('018c7f0e-9f4e-4999-be82-3a4b0627500c', 39, 'Viability Method 2', 1),
	('c1dd5bb9-f5da-43c3-abfd-19823c7368f4', 39, 'Viability Method 1', 3),
	('535414ff-d34f-4c8c-890e-1f6595bbe7d1', 76, 'Viability Method 1', 3),
	('68597d13-4328-4f90-9eff-b4780d335cda', 46, 'Viability Method 1', 8),
	('7c1b63ee-95d0-448d-995a-08052e06a12c', 78, 'Viability Method 2', 9),
	('cf29bd13-330d-43ba-9f81-8b657bd42778', 31, 'Viability Method 1', 9),
	('c58d70f4-b7e7-4eef-914e-40071c6b7f28', 85, 'Viability Method 1', 6),
	('4edcbe95-f48d-4ac7-bf1d-c8c9f59cfe8c', 48, 'Viability Method 2', 6),
	('af03bf77-db5d-4d2e-97a5-43f5ee5b6fef', 70, 'Viability Method 1', 9),
	('427e5cb2-9cb2-4034-8417-19432dd5a2b1', 68, 'Viability Method 1', 3),
	('a62f3a59-45de-4270-a8cd-2da8b16fb363', 80, 'Viability Method 1', 2),
	('3ed56ddb-ba72-4f12-81f9-c3caaef89ae6', 39, 'Viability Method 1', 5),
	('add930c2-ca7a-452d-809c-4565013ac980', 83, 'Viability Method 2', 5),
	('43300a4a-1900-4f65-b93c-b01f02d5babb', 31, 'Viability Method 2', 5),
	('7c1b63ee-95d0-448d-995a-08052e06a12c', 35, 'Viability Method 1', 7),
	('0fcd71ea-6033-45e1-9e0d-a181ce211f76', 57, 'Viability Method 2', 4),
	('eb18e23f-1e63-4ad5-bf74-e4e87b4e6bbb', 85, 'Viability Method 2', 5),
	('9632f2ff-b761-48d9-a5f5-3b50df95da7c', 98, 'Viability Method 1', 9),
	('922804eb-df73-403d-ae05-51b9020027a7', 39, 'Viability Method 1', 7),
	('7e5f0b90-e3d0-4b2f-ad3d-cc4a147c13e5', 92, 'Viability Method 1', 10),
	('28b79d95-4a67-4069-b98e-1114f27e59ec', 81, 'Viability Method 2', 2),
	('0fe8a820-2b9d-409f-b657-b1f772d01c03', 47, 'Viability Method 2', 8),
	('9547bcc1-0f1a-4aee-8f6f-8f889d477854', 94, 'Viability Method 2', 1),
	('19e16d19-c759-401e-93fc-3a74fe4b6da0', 82, 'Viability Method 1', 2),
	('31d49bb8-e998-4ab8-b20d-c2294b4eaa8f', 60, 'Viability Method 1', 2),
	('f5487dbc-dd3b-4348-8418-7975cb046514', 80, 'Viability Method 1', 2),
	('0b2c7919-f735-4e82-8bee-93b443806227', 95, 'Viability Method 2', 4),
	('ee882386-91cb-45b2-9389-5468399cf967', 64, 'Viability Method 2', 9),
	('ebb5c8d4-57a3-42d5-97e3-11f82db783e6', 37, 'Viability Method 2', 1),
	('018c7f0e-9f4e-4999-be82-3a4b0627500c', 49, 'Viability Method 2', 8),
	('922804eb-df73-403d-ae05-51b9020027a7', 55, 'Viability Method 1', 6),
	('5cc964ee-8ee6-44f7-ada7-0eee6cb63dad', 43, 'Viability Method 2', 3),
	('c059e763-2d8d-4501-8847-527bd684bb4f', 66, 'Viability Method 2', 8),
	('cf29bd13-330d-43ba-9f81-8b657bd42778', 65, 'Viability Method 1', 6),
	('cf29bd13-330d-43ba-9f81-8b657bd42778', 73, 'Viability Method 2', 9),
	('5cc964ee-8ee6-44f7-ada7-0eee6cb63dad', 74, 'Viability Method 1', 6),
	('d9bcc4bd-d68e-4389-bdd3-4d3343e52c77', 96, 'Viability Method 2', 10),
	('8e33149f-45dd-47cd-89ac-20d1d0d15a1e', 48, 'Viability Method 1', 4),
	('23f6d7f1-5e6e-4802-8ea7-8ca0bd415385', 65, 'Viability Method 1', 2),
	('535414ff-d34f-4c8c-890e-1f6595bbe7d1', 60, 'Viability Method 2', 8),
	('14212302-5ac8-4c4b-aacd-7868078fadd5', 90, 'Viability Method 1', 3),
	('19e16d19-c759-401e-93fc-3a74fe4b6da0', 45, 'Viability Method 2', 6),
	('22b6b6bf-b9ff-4f02-b1e4-4fe132e8ef50', 73, 'Viability Method 2', 9),
	('9547bcc1-0f1a-4aee-8f6f-8f889d477854', 38, 'Viability Method 1', 2),
	('98d1c94b-c9dc-4e73-92b2-79e5c087be87', 42, 'Viability Method 1', 7),
	('865c346d-6100-490f-bd4f-53bde8ce5854', 49, 'Viability Method 1', 6),
	('19e16d19-c759-401e-93fc-3a74fe4b6da0', 51, 'Viability Method 1', 3),
	('f1e8f593-cf3a-4e08-8c2c-f313f090b3c7', 37, 'Viability Method 2', 10),
	('f40ee8a1-9a7f-4202-a14e-4b51c4cd4273', 88, 'Viability Method 1', 6),
	('f40ee8a1-9a7f-4202-a14e-4b51c4cd4273', 91, 'Viability Method 2', 6),
	('14c729f5-4f9a-4272-b8fd-0f02d4b40abb', 56, 'Viability Method 1', 5),
	('8641f6e7-fbed-48bd-b235-4a345723e496', 30, 'Viability Method 1', 7),
	('d41b7c87-5e0b-430a-b320-693692275daa', 92, 'Viability Method 1', 5),
	('31d49bb8-e998-4ab8-b20d-c2294b4eaa8f', 81, 'Viability Method 2', 9),
	('07c268ed-7501-4484-be1a-f5be655cd7d0', 94, 'Viability Method 1', 9),
	('43300a4a-1900-4f65-b93c-b01f02d5babb', 72, 'Viability Method 2', 5),
	('ee882386-91cb-45b2-9389-5468399cf967', 50, 'Viability Method 1', 1),
	('f5487dbc-dd3b-4348-8418-7975cb046514', 38, 'Viability Method 1', 3),
	('869ff97c-e6c3-4dac-ab60-5364fe31e748', 40, 'Viability Method 2', 6),
	('2dab70bb-9e33-44d9-b5cd-ee6cde961a11', 93, 'Viability Method 2', 4),
	('90b4213c-91ec-4807-9b5c-815412d7ab77', 95, 'Viability Method 1', 7),
	('c059e763-2d8d-4501-8847-527bd684bb4f', 57, 'Viability Method 2', 9),
	('0fcd71ea-6033-45e1-9e0d-a181ce211f76', 63, 'Viability Method 1', 5),
	('22b6b6bf-b9ff-4f02-b1e4-4fe132e8ef50', 53, 'Viability Method 1', 9),
	('d9bcc4bd-d68e-4389-bdd3-4d3343e52c77', 40, 'Viability Method 1', 1),
	('6cd9a510-600c-43da-a925-3a9c872eef74', 41, 'Viability Method 2', 9),
	('f94aaf11-eef4-45f6-8038-3124eb5a9104', 92, 'Viability Method 2', 1),
	('d258eef3-f4e0-4e03-b075-a1cc7a1f62b7', 69, 'Viability Method 1', 4),
	('18746852-49fa-4b46-a97c-ba6b7293f420', 75, 'Viability Method 1', 8),
	('f40ee8a1-9a7f-4202-a14e-4b51c4cd4273', 41, 'Viability Method 2', 1),
	('07c268ed-7501-4484-be1a-f5be655cd7d0', 58, 'Viability Method 2', 4),
	('f5487dbc-dd3b-4348-8418-7975cb046514', 83, 'Viability Method 2', 2),
	('f86a95e7-02cd-452d-bcd0-00e63ffbdc65', 64, 'Viability Method 1', 5),
	('96d67bd6-3edc-4b6b-aa90-acfc0b0c43fc', 56, 'Viability Method 2', 8),
	('add930c2-ca7a-452d-809c-4565013ac980', 82, 'Viability Method 2', 10),
	('5c358c4d-eb06-4b71-83e5-5bf8b5e7603e', 60, 'Viability Method 2', 1),
	('f86a95e7-02cd-452d-bcd0-00e63ffbdc65', 84, 'Viability Method 2', 1),
	('d61911af-7f2c-4306-8f1f-6c5b8ddb6156', 58, 'Viability Method 2', 5),
	('a2df7f5e-d77e-405f-95b8-c3e6366982d7', 84, 'Viability Method 2', 9),
	('4216fa39-bfa5-4f7e-93c2-9918020e2803', 31, 'Viability Method 1', 8),
	('906a0536-18d4-4f56-b9f0-fa08fd23b0b1', 50, 'Viability Method 1', 4),
	('22b6b6bf-b9ff-4f02-b1e4-4fe132e8ef50', 53, 'Viability Method 1', 3),
	('8dce3a98-8dc3-4546-8a11-4680d3161429', 81, 'Viability Method 1', 9),
	('0cecc559-4137-4938-96d4-79c0f915413d', 44, 'Viability Method 1', 1),
	('17f432e9-7e10-4755-b848-89dc618aaf1f', 59, 'Viability Method 1', 1),
	('db0fb3cd-2d3f-4748-9aa1-99ab924cafb4', 98, 'Viability Method 1', 10),
	('f570f41b-bab4-4b08-80ef-e6966a4908ca', 71, 'Viability Method 2', 2),
	('d41b7c87-5e0b-430a-b320-693692275daa', 70, 'Viability Method 2', 7),
	('81bcc4ea-ec0f-4ff2-be10-423e90c7ae8c', 52, 'Viability Method 2', 9),
	('018c7f0e-9f4e-4999-be82-3a4b0627500c', 94, 'Viability Method 1', 3),
	('22b6b6bf-b9ff-4f02-b1e4-4fe132e8ef50', 87, 'Viability Method 1', 1),
	('75b8baf4-4c06-4d22-bef8-e9404ab2e078', 73, 'Viability Method 1', 3),
	('0fcd71ea-6033-45e1-9e0d-a181ce211f76', 96, 'Viability Method 2', 7),
	('274ed2a7-5d08-4b9e-b804-742cc1d1086f', 34, 'Viability Method 2', 10),
	('f94aaf11-eef4-45f6-8038-3124eb5a9104', 48, 'Viability Method 1', 7),
	('5c358c4d-eb06-4b71-83e5-5bf8b5e7603e', 87, 'Viability Method 2', 1),
	('ee882386-91cb-45b2-9389-5468399cf967', 44, 'Viability Method 2', 5),
	('c58d70f4-b7e7-4eef-914e-40071c6b7f28', 31, 'Viability Method 2', 5),
	('a7cb54f8-df66-4c88-b6d6-53cbdcca6292', 62, 'Viability Method 1', 7),
	('274ed2a7-5d08-4b9e-b804-742cc1d1086f', 79, 'Viability Method 2', 8),
	('a2df7f5e-d77e-405f-95b8-c3e6366982d7', 60, 'Viability Method 2', 7),
	('0ab0ae59-fcc9-4f8f-bd94-fa2732428de8', 90, 'Viability Method 1', 2),
	('df45e853-f4a4-4769-a07e-be15505941d6', 75, 'Viability Method 2', 3),
	('a62f3a59-45de-4270-a8cd-2da8b16fb363', 67, 'Viability Method 1', 1),
	('eb18e23f-1e63-4ad5-bf74-e4e87b4e6bbb', 74, 'Viability Method 1', 7),
	('6b4a5a10-e851-464f-9aac-78cfc019d2e0', 34, 'Viability Method 1', 3),
	('4ef92fac-585b-482f-b906-5a282ac43240', 44, 'Viability Method 1', 6);


--
-- Data for Name: whole_blood_processing; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.whole_blood_processing VALUES
	('0c885c36-2b70-4ad5-a7df-051368996101', 30, 54, '00:01:35', 'Viability Method 1', 'PBMC Isolation Method 3', '2020-11-25', '2020-11-26'),
	('bfa21afa-7f64-4fa2-9f16-641501e6650e', 10, 7, '00:01:39', 'Viability Method 1', 'PBMC Isolation Method 1', '2022-12-18', '2022-12-19'),
	('0c73df0f-e4d6-4b16-9309-3a5959176c28', 29, 87, '00:01:36', 'Viability Method 1', 'PBMC Isolation Method 3', '2024-01-31', '2024-02-01'),
	('d8fc6952-52af-4976-9ef6-e5e8b5279750', 22, 24, '00:01:38', 'Viability Method 2', 'PBMC Isolation Method 2', '2016-11-09', '2016-11-09'),
	('da0ebe23-b891-4efa-9ff7-01264d8a1404', 7, 3.5, '00:01:35', 'Viability Method 2', 'PBMC Isolation Method 3', '2015-09-18', '2015-09-19'),
	('f85bf050-97d1-4de9-b00e-e01d3e50a8d8', 13, 28, '00:01:36', 'Viability Method 1', 'PBMC Isolation Method 2', '2015-05-01', '2015-05-01'),
	('6b1a076b-8f57-498d-87eb-336c3b6428fb', 27, 27, '00:01:32', 'Viability Method 2', 'PBMC Isolation Method 2', '2017-06-01', '2017-06-01'),
	('4d0f1fb4-b533-41f7-a37e-be7152661c40', 9, 8, '00:01:35', 'Viability Method 2', 'PBMC Isolation Method 2', '2021-07-31', '2021-07-31'),
	('2c0cb4cb-03a4-4972-83f7-f5820b4ab2a9', 12, 20, '00:01:34', 'Viability Method 2', 'PBMC Isolation Method 1', '2020-08-11', '2020-08-12'),
	('84a039bc-7a27-482a-9506-c7b56fce9697', 23, 30, '00:01:35', 'Viability Method 2', 'PBMC Isolation Method 1', '2024-05-14', '2024-05-14'),
	('4d3dba1c-191b-4e04-8edc-8ab7e4311d86', 21, 42, '00:01:35', 'Viability Method 1', 'PBMC Isolation Method 2', '2017-05-20', '2017-05-21'),
	('8c0ccf6f-62e7-48dd-8d94-ee2bf10c6822', 6, 21, '00:01:37', 'Viability Method 1', 'PBMC Isolation Method 3', '2018-10-03', '2018-10-03'),
	('a3994048-0d22-4497-bade-b003b3224d05', 25, 16, '00:01:38', 'Viability Method 1', 'PBMC Isolation Method 2', '2019-10-13', '2019-10-14'),
	('095de8ec-bad1-4f7c-8e43-30d666fabac0', 26, 27, '00:01:31', 'Viability Method 2', 'PBMC Isolation Method 3', '2018-12-24', '2018-12-25'),
	('c08148a9-6602-4e83-ba1a-3646a41dd5f9', 27, 30, '00:01:32', 'Viability Method 1', 'PBMC Isolation Method 3', '2017-12-25', '2017-12-25'),
	('4a2cfb60-6403-4965-a065-d260cd8c7678', 19, 22, '00:01:39', 'Viability Method 1', 'PBMC Isolation Method 1', '2016-01-22', '2016-01-23'),
	('c1f6bca6-5ed4-4e29-92ab-e840d1e51e18', 24, 30, '00:01:36', 'Viability Method 1', 'PBMC Isolation Method 3', '2020-06-20', '2020-06-20'),
	('58b4c7c7-97e3-4e0a-a6b3-27fd1a8f99d7', 11, 40.5, '00:01:35', 'Viability Method 2', 'PBMC Isolation Method 3', '2021-01-10', '2021-01-11'),
	('27958b38-4776-4641-acc0-5ffe0c207824', 7, 84, '00:01:30', 'Viability Method 2', 'PBMC Isolation Method 2', '2023-07-09', '2023-07-10'),
	('3cd81255-e5af-4fa9-9775-e3ac1008ce8b', 29, 22, '00:01:39', 'Viability Method 1', 'PBMC Isolation Method 2', '2015-10-18', '2015-10-18'),
	('4fc0ffcc-ddb4-4be9-bccd-f7b8eb725923', 19, 43.5, '00:01:34', 'Viability Method 2', 'PBMC Isolation Method 3', '2016-11-25', '2016-11-25'),
	('c810d80f-e750-4a84-a962-e04327475020', 25, 8, '00:01:36', 'Viability Method 2', 'PBMC Isolation Method 1', '2021-08-24', '2021-08-24'),
	('915473fa-deeb-430d-b000-82c1401724fc', 7, 7, '00:01:32', 'Viability Method 2', 'PBMC Isolation Method 2', '2020-12-01', '2020-12-01'),
	('81d1d1a4-75a0-48e7-a1ab-c05c3fc2a3e8', 29, 48, '00:01:31', 'Viability Method 1', 'PBMC Isolation Method 3', '2016-01-20', '2016-01-20'),
	('a1c57603-6fbe-444a-a085-09746259a14b', 27, 5, '00:01:38', 'Viability Method 1', 'PBMC Isolation Method 2', '2020-06-26', '2020-06-26'),
	('8adb2517-2c8e-492f-843f-03af25fb6674', 23, 11, '00:01:35', 'Viability Method 2', 'PBMC Isolation Method 1', '2023-10-08', '2023-10-08'),
	('2fe6dbea-7037-4306-9ade-5220b0689d81', 23, 57.5, '00:01:37', 'Viability Method 1', 'PBMC Isolation Method 3', '2020-04-15', '2020-04-16'),
	('6670bb2e-c585-400a-9467-122dc13aaf41', 16, 63, '00:01:32', 'Viability Method 2', 'PBMC Isolation Method 1', '2022-12-02', '2022-12-02'),
	('478ae61e-9a77-45c5-aa59-e95231280cac', 30, 25, '00:01:30', 'Viability Method 1', 'PBMC Isolation Method 1', '2015-04-26', '2015-04-26'),
	('ed54f0d1-c66e-4283-997c-b3989e1a9748', 15, 10, '00:01:39', 'Viability Method 1', 'PBMC Isolation Method 1', '2024-05-14', '2024-05-15'),
	('698559f6-875a-4ef7-a7d3-b24810f5f3fc', 6, 26, '00:01:30', 'Viability Method 1', 'PBMC Isolation Method 1', '2024-05-29', '2024-05-29'),
	('84765431-fd0b-4666-a683-63d99621b40d', 22, 25, '00:01:36', 'Viability Method 1', 'PBMC Isolation Method 1', '2018-01-21', '2018-01-21'),
	('9cd17a50-e65f-411f-af40-8ad9faada99a', 30, 10, '00:01:37', 'Viability Method 2', 'PBMC Isolation Method 3', '2017-08-11', '2017-08-12'),
	('6efebe1d-7f8f-493b-aec7-06e6e1e6afb0', 19, 27, '00:01:30', 'Viability Method 1', 'PBMC Isolation Method 1', '2015-08-02', '2015-08-03'),
	('90dc2702-f8bc-44f1-ae4d-0debdfb370ce', 19, 33, '00:01:31', 'Viability Method 1', 'PBMC Isolation Method 3', '2021-01-09', '2021-01-10'),
	('b5b79d75-f5e5-4871-aa1f-9e3a1656cf37', 16, 13.5, '00:01:32', 'Viability Method 2', 'PBMC Isolation Method 3', '2019-08-12', '2019-08-12'),
	('3626ab55-31fa-4fd0-8618-b46a0de5b6cc', 26, 10.5, '00:01:30', 'Viability Method 1', 'PBMC Isolation Method 3', '2018-12-30', '2018-12-30'),
	('4947d01d-3300-4bf7-bdf2-7dd2bc5f571b', 10, 12, '00:01:38', 'Viability Method 1', 'PBMC Isolation Method 1', '2024-12-04', '2024-12-04'),
	('ab1b7ed5-945d-47bf-b389-d9c3b8fa5410', 13, 42, '00:01:39', 'Viability Method 2', 'PBMC Isolation Method 2', '2017-09-01', '2017-09-02'),
	('2c0712cb-0387-42bc-b8ed-c6c65a03784e', 23, 50, '00:01:36', 'Viability Method 1', 'PBMC Isolation Method 3', '2021-01-26', '2021-01-27'),
	('fe2ffbdf-f64a-41be-8d72-c0a77417b1f4', 23, 30, '00:01:31', 'Viability Method 1', 'PBMC Isolation Method 2', '2016-06-19', '2016-06-19'),
	('4854825e-3640-4a59-956e-8dd37d8f8154', 17, 15, '00:01:39', 'Viability Method 1', 'PBMC Isolation Method 1', '2015-10-26', '2015-10-27'),
	('b3a89a89-8b67-4c56-a9d2-bc9035cf8dd8', 23, 21, '00:01:35', 'Viability Method 2', 'PBMC Isolation Method 2', '2022-05-12', '2022-05-12'),
	('f34abc2a-8bf5-447d-85bd-7a6c42bb8d2a', 7, 90, '00:01:37', 'Viability Method 2', 'PBMC Isolation Method 1', '2017-11-21', '2017-11-22'),
	('bab5d128-b374-4538-95ef-12bd6ff30152', 22, 42, '00:01:34', 'Viability Method 2', 'PBMC Isolation Method 3', '2019-10-04', '2019-10-05'),
	('0ab893a2-1e47-484a-9218-2baf2d36b649', 23, 50, '00:01:36', 'Viability Method 2', 'PBMC Isolation Method 2', '2018-05-11', '2018-05-12'),
	('2aeab8de-e1be-4f97-96c8-ffc11ebb70e7', 12, 22.5, '00:01:31', 'Viability Method 1', 'PBMC Isolation Method 3', '2021-08-29', '2021-08-29'),
	('08e445ab-e389-463c-96e6-4799ec4a724f', 10, 24, '00:01:36', 'Viability Method 1', 'PBMC Isolation Method 2', '2021-01-08', '2021-01-09'),
	('85c9549c-9ec1-469f-ae3b-6a499ccfd817', 17, 16, '00:01:32', 'Viability Method 2', 'PBMC Isolation Method 3', '2017-07-10', '2017-07-10'),
	('437b678f-2c48-44aa-99df-4c55030c0258', 16, 15, '00:01:30', 'Viability Method 1', 'PBMC Isolation Method 3', '2018-08-31', '2018-09-01');


--
-- Name: cell_line cell_line_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cell_line
    ADD CONSTRAINT cell_line_pkey PRIMARY KEY (cell_line_id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patient_id);


--
-- Name: cell_line unique_cell_line_cell_line_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cell_line
    ADD CONSTRAINT unique_cell_line_cell_line_id UNIQUE (cell_line_id);


--
-- Name: patient unique_patient_patient_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT unique_patient_patient_id UNIQUE (patient_id);


--
-- Name: viability_result link_cell_line_viability_result; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.viability_result
    ADD CONSTRAINT link_cell_line_viability_result FOREIGN KEY (cell_line) REFERENCES public.cell_line(cell_line_id) MATCH FULL ON UPDATE CASCADE;


--
-- Name: cell_line link_patient_cell_line; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cell_line
    ADD CONSTRAINT link_patient_cell_line FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id) MATCH FULL ON UPDATE CASCADE;


--
-- Name: tissue_dissociation link_patient_tissue_dissociation; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tissue_dissociation
    ADD CONSTRAINT link_patient_tissue_dissociation FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id) MATCH FULL ON UPDATE CASCADE;


--
-- Name: whole_blood_processing link_patient_whole_blood_processing; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.whole_blood_processing
    ADD CONSTRAINT link_patient_whole_blood_processing FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id) MATCH FULL ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

