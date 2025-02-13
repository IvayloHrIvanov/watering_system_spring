PGDMP         7                z           postgres     11.14 (Raspbian 11.14-0+deb10u1)    14.3 R    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    13101    postgres    DATABASE     ]   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'bg_BG.UTF-8';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3027            �            1259    98307 	   scheduler    TABLE     a   CREATE TABLE public.scheduler (
    scheduler_id integer NOT NULL,
    state boolean NOT NULL
);
    DROP TABLE public.scheduler;
       public            postgres    false            �            1259    98305    Scheduler_scheduler_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Scheduler_scheduler_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Scheduler_scheduler_id_seq";
       public          postgres    false    215            �           0    0    Scheduler_scheduler_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Scheduler_scheduler_id_seq" OWNED BY public.scheduler.scheduler_id;
          public          postgres    false    214            �            1259    40983    configurations    TABLE     w  CREATE TABLE public.configurations (
    active_time integer NOT NULL,
    configuration_changed_by integer NOT NULL,
    valve_id integer NOT NULL,
    configuration_id integer NOT NULL,
    monday boolean,
    tuesday boolean,
    wednesday boolean,
    thursday boolean,
    friday boolean,
    saturday boolean,
    sunday boolean,
    watering_active_counter integer
);
 "   DROP TABLE public.configurations;
       public            postgres    false            �            1259    49163 #   configurations_configuration_id_seq    SEQUENCE     �   CREATE SEQUENCE public.configurations_configuration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.configurations_configuration_id_seq;
       public          postgres    false    199            �           0    0 #   configurations_configuration_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.configurations_configuration_id_seq OWNED BY public.configurations.configuration_id;
          public          postgres    false    204            �            1259    41005    devices    TABLE     �   CREATE TABLE public.devices (
    device_name character varying NOT NULL,
    device_location character varying NOT NULL,
    device_id integer NOT NULL,
    user_id integer,
    device_endpoint character varying
);
    DROP TABLE public.devices;
       public            postgres    false            �            1259    49197    devices_device_id_seq    SEQUENCE     �   CREATE SEQUENCE public.devices_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.devices_device_id_seq;
       public          postgres    false    201            �           0    0    devices_device_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.devices_device_id_seq OWNED BY public.devices.device_id;
          public          postgres    false    206            �            1259    24580    logs_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 &   DROP SEQUENCE public.logs_log_id_seq;
       public          postgres    false            �            1259    40961    logs    TABLE       CREATE TABLE public.logs (
    log_date timestamp without time zone NOT NULL,
    log_description character varying NOT NULL,
    log_level character varying NOT NULL,
    user_id integer NOT NULL,
    log_id integer DEFAULT nextval('public.logs_log_id_seq'::regclass) NOT NULL
);
    DROP TABLE public.logs;
       public            postgres    false    196            �            1259    65556    sensor_data    TABLE     �   CREATE TABLE public.sensor_data (
    sensor_data_id integer NOT NULL,
    sensor_id integer NOT NULL,
    sensor_value character varying NOT NULL,
    sensor_value_date timestamp without time zone NOT NULL
);
    DROP TABLE public.sensor_data;
       public            postgres    false            �            1259    65554    sensor_data_sensor_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sensor_data_sensor_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.sensor_data_sensor_data_id_seq;
       public          postgres    false    213            �           0    0    sensor_data_sensor_data_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.sensor_data_sensor_data_id_seq OWNED BY public.sensor_data.sensor_data_id;
          public          postgres    false    212            �            1259    49215     sensor_types_sensor_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sensor_types_sensor_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 7   DROP SEQUENCE public.sensor_types_sensor_types_id_seq;
       public          postgres    false            �            1259    41024    sensor_types    TABLE     �   CREATE TABLE public.sensor_types (
    sensor_type_id integer DEFAULT nextval('public.sensor_types_sensor_types_id_seq'::regclass) NOT NULL,
    sensor_type character varying NOT NULL,
    data_type character varying NOT NULL
);
     DROP TABLE public.sensor_types;
       public            postgres    false    207            �            1259    41013    sensors    TABLE     |   CREATE TABLE public.sensors (
    sensor_type_id integer NOT NULL,
    sensor_id integer NOT NULL,
    device_id integer
);
    DROP TABLE public.sensors;
       public            postgres    false            �            1259    49187    sensors_sensor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sensors_sensor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.sensors_sensor_id_seq;
       public          postgres    false    202            �           0    0    sensors_sensor_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.sensors_sensor_id_seq OWNED BY public.sensors.sensor_id;
          public          postgres    false    205            �            1259    49217    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false            �            1259    40969    users    TABLE     I  CREATE TABLE public.users (
    user_id integer DEFAULT nextval('public.users_user_id_seq'::regclass) NOT NULL,
    user_full_name character varying NOT NULL,
    user_login character varying NOT NULL,
    user_pass character varying NOT NULL,
    user_create_date timestamp without time zone,
    user_admin boolean NOT NULL
);
    DROP TABLE public.users;
       public            postgres    false    208            �            1259    49219    valves_valve_id_seq    SEQUENCE     �   CREATE SEQUENCE public.valves_valve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 *   DROP SEQUENCE public.valves_valve_id_seq;
       public          postgres    false            �            1259    40991    valves    TABLE     �  CREATE TABLE public.valves (
    valve_id integer DEFAULT nextval('public.valves_valve_id_seq'::regclass) NOT NULL,
    valve_name character varying NOT NULL,
    valve_failed_operation boolean,
    valve_failed_endpoint character varying,
    valve_running boolean,
    valve_failed_counter integer,
    valve_on_endpoint character varying,
    valve_off_endpoint character varying
);
    DROP TABLE public.valves;
       public            postgres    false    209            �            1259    65539    watering_hours    TABLE     �   CREATE TABLE public.watering_hours (
    watering_hours_id integer NOT NULL,
    "time" character varying NOT NULL,
    configuration_id integer NOT NULL
);
 "   DROP TABLE public.watering_hours;
       public            postgres    false            �           0    0    TABLE watering_hours    COMMENT     C   COMMENT ON TABLE public.watering_hours IS '6:30, 7:00, 7:30, ...';
          public          postgres    false    211            �            1259    65537 $   watering_hours_watering_hours_id_seq    SEQUENCE     �   CREATE SEQUENCE public.watering_hours_watering_hours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.watering_hours_watering_hours_id_seq;
       public          postgres    false    211            �           0    0 $   watering_hours_watering_hours_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.watering_hours_watering_hours_id_seq OWNED BY public.watering_hours.watering_hours_id;
          public          postgres    false    210                       2604    49165    configurations configuration_id    DEFAULT     �   ALTER TABLE ONLY public.configurations ALTER COLUMN configuration_id SET DEFAULT nextval('public.configurations_configuration_id_seq'::regclass);
 N   ALTER TABLE public.configurations ALTER COLUMN configuration_id DROP DEFAULT;
       public          postgres    false    204    199                       2604    49199    devices device_id    DEFAULT     v   ALTER TABLE ONLY public.devices ALTER COLUMN device_id SET DEFAULT nextval('public.devices_device_id_seq'::regclass);
 @   ALTER TABLE public.devices ALTER COLUMN device_id DROP DEFAULT;
       public          postgres    false    206    201                       2604    98310    scheduler scheduler_id    DEFAULT     �   ALTER TABLE ONLY public.scheduler ALTER COLUMN scheduler_id SET DEFAULT nextval('public."Scheduler_scheduler_id_seq"'::regclass);
 E   ALTER TABLE public.scheduler ALTER COLUMN scheduler_id DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    65559    sensor_data sensor_data_id    DEFAULT     �   ALTER TABLE ONLY public.sensor_data ALTER COLUMN sensor_data_id SET DEFAULT nextval('public.sensor_data_sensor_data_id_seq'::regclass);
 I   ALTER TABLE public.sensor_data ALTER COLUMN sensor_data_id DROP DEFAULT;
       public          postgres    false    212    213    213                       2604    49189    sensors sensor_id    DEFAULT     v   ALTER TABLE ONLY public.sensors ALTER COLUMN sensor_id SET DEFAULT nextval('public.sensors_sensor_id_seq'::regclass);
 @   ALTER TABLE public.sensors ALTER COLUMN sensor_id DROP DEFAULT;
       public          postgres    false    205    202                       2604    65542     watering_hours watering_hours_id    DEFAULT     �   ALTER TABLE ONLY public.watering_hours ALTER COLUMN watering_hours_id SET DEFAULT nextval('public.watering_hours_watering_hours_id_seq'::regclass);
 O   ALTER TABLE public.watering_hours ALTER COLUMN watering_hours_id DROP DEFAULT;
       public          postgres    false    211    210    211            �          0    40983    configurations 
   TABLE DATA           �   COPY public.configurations (active_time, configuration_changed_by, valve_id, configuration_id, monday, tuesday, wednesday, thursday, friday, saturday, sunday, watering_active_counter) FROM stdin;
    public          postgres    false    199   8d       �          0    41005    devices 
   TABLE DATA           d   COPY public.devices (device_name, device_location, device_id, user_id, device_endpoint) FROM stdin;
    public          postgres    false    201   dd       �          0    40961    logs 
   TABLE DATA           U   COPY public.logs (log_date, log_description, log_level, user_id, log_id) FROM stdin;
    public          postgres    false    197   �d       �          0    98307 	   scheduler 
   TABLE DATA           8   COPY public.scheduler (scheduler_id, state) FROM stdin;
    public          postgres    false    215   ,e       �          0    65556    sensor_data 
   TABLE DATA           a   COPY public.sensor_data (sensor_data_id, sensor_id, sensor_value, sensor_value_date) FROM stdin;
    public          postgres    false    213   Me       �          0    41024    sensor_types 
   TABLE DATA           N   COPY public.sensor_types (sensor_type_id, sensor_type, data_type) FROM stdin;
    public          postgres    false    203   Wl       �          0    41013    sensors 
   TABLE DATA           G   COPY public.sensors (sensor_type_id, sensor_id, device_id) FROM stdin;
    public          postgres    false    202   �l       �          0    40969    users 
   TABLE DATA           m   COPY public.users (user_id, user_full_name, user_login, user_pass, user_create_date, user_admin) FROM stdin;
    public          postgres    false    198   �l       �          0    40991    valves 
   TABLE DATA           �   COPY public.valves (valve_id, valve_name, valve_failed_operation, valve_failed_endpoint, valve_running, valve_failed_counter, valve_on_endpoint, valve_off_endpoint) FROM stdin;
    public          postgres    false    200   m       �          0    65539    watering_hours 
   TABLE DATA           U   COPY public.watering_hours (watering_hours_id, "time", configuration_id) FROM stdin;
    public          postgres    false    211   mm       �           0    0    Scheduler_scheduler_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Scheduler_scheduler_id_seq"', 1, false);
          public          postgres    false    214            �           0    0 #   configurations_configuration_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.configurations_configuration_id_seq', 3, true);
          public          postgres    false    204            �           0    0    devices_device_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.devices_device_id_seq', 2, true);
          public          postgres    false    206            �           0    0    logs_log_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.logs_log_id_seq', 1, false);
          public          postgres    false    196            �           0    0    sensor_data_sensor_data_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.sensor_data_sensor_data_id_seq', 275, true);
          public          postgres    false    212            �           0    0     sensor_types_sensor_types_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.sensor_types_sensor_types_id_seq', 5, true);
          public          postgres    false    207            �           0    0    sensors_sensor_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sensors_sensor_id_seq', 5, true);
          public          postgres    false    205            �           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);
          public          postgres    false    208            �           0    0    valves_valve_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.valves_valve_id_seq', 1, false);
          public          postgres    false    209            �           0    0 $   watering_hours_watering_hours_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.watering_hours_watering_hours_id_seq', 1, false);
          public          postgres    false    210            9           2606    98312    scheduler Scheduler_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.scheduler
    ADD CONSTRAINT "Scheduler_pkey" PRIMARY KEY (scheduler_id);
 D   ALTER TABLE ONLY public.scheduler DROP CONSTRAINT "Scheduler_pkey";
       public            postgres    false    215            %           2606    49174 "   configurations configurations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (configuration_id);
 L   ALTER TABLE ONLY public.configurations DROP CONSTRAINT configurations_pkey;
       public            postgres    false    199            *           2606    49207    devices devices_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (device_id);
 >   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_pkey;
       public            postgres    false    201            !           2606    49186    logs logs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (log_id);
 8   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
       public            postgres    false    197            7           2606    65564    sensor_data sensor_data_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sensor_data
    ADD CONSTRAINT sensor_data_pkey PRIMARY KEY (sensor_data_id);
 F   ALTER TABLE ONLY public.sensor_data DROP CONSTRAINT sensor_data_pkey;
       public            postgres    false    213            1           2606    41031    sensor_types sensor_types_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.sensor_types
    ADD CONSTRAINT sensor_types_pkey PRIMARY KEY (sensor_type_id);
 H   ALTER TABLE ONLY public.sensor_types DROP CONSTRAINT sensor_types_pkey;
       public            postgres    false    203            /           2606    49196    sensors sensors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (sensor_id);
 >   ALTER TABLE ONLY public.sensors DROP CONSTRAINT sensors_pkey;
       public            postgres    false    202            #           2606    40976    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    198            (           2606    40998    valves valves_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.valves
    ADD CONSTRAINT valves_pkey PRIMARY KEY (valve_id);
 <   ALTER TABLE ONLY public.valves DROP CONSTRAINT valves_pkey;
       public            postgres    false    200            4           2606    65544 "   watering_hours watering_hours_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.watering_hours
    ADD CONSTRAINT watering_hours_pkey PRIMARY KEY (watering_hours_id);
 L   ALTER TABLE ONLY public.watering_hours DROP CONSTRAINT watering_hours_pkey;
       public            postgres    false    211            &           1259    41004 "   fki_configurations_valves_valve_id    INDEX     a   CREATE INDEX fki_configurations_valves_valve_id ON public.configurations USING btree (valve_id);
 6   DROP INDEX public.fki_configurations_valves_valve_id;
       public            postgres    false    199            +           1259    49231    fki_devices_users_user_id    INDEX     P   CREATE INDEX fki_devices_users_user_id ON public.devices USING btree (user_id);
 -   DROP INDEX public.fki_devices_users_user_id;
       public            postgres    false    201                       1259    40982    fki_logs_users_user_id    INDEX     J   CREATE INDEX fki_logs_users_user_id ON public.logs USING btree (user_id);
 *   DROP INDEX public.fki_logs_users_user_id;
       public            postgres    false    197            5           1259    65570 !   fki_sensor_data_sensors_sensor_id    INDEX     ^   CREATE INDEX fki_sensor_data_sensors_sensor_id ON public.sensor_data USING btree (sensor_id);
 5   DROP INDEX public.fki_sensor_data_sensors_sensor_id;
       public            postgres    false    213            ,           1259    49213    fki_sensors_devices_device_id    INDEX     V   CREATE INDEX fki_sensors_devices_device_id ON public.sensors USING btree (device_id);
 1   DROP INDEX public.fki_sensors_devices_device_id;
       public            postgres    false    202            -           1259    41051 '   fki_sensors_sensor_types_sensor_type_id    INDEX     e   CREATE INDEX fki_sensors_sensor_types_sensor_type_id ON public.sensors USING btree (sensor_type_id);
 ;   DROP INDEX public.fki_sensors_sensor_types_sensor_type_id;
       public            postgres    false    202            2           1259    65553 1   fki_watering_hours_configuration_configuration_id    INDEX     x   CREATE INDEX fki_watering_hours_configuration_configuration_id ON public.watering_hours USING btree (configuration_id);
 E   DROP INDEX public.fki_watering_hours_configuration_configuration_id;
       public            postgres    false    211            ;           2606    40999 -   configurations configurations_valves_valve_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.configurations
    ADD CONSTRAINT configurations_valves_valve_id FOREIGN KEY (valve_id) REFERENCES public.valves(valve_id) NOT VALID;
 W   ALTER TABLE ONLY public.configurations DROP CONSTRAINT configurations_valves_valve_id;
       public          postgres    false    199    200    2856            <           2606    49226    devices devices_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_users_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 G   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_users_user_id;
       public          postgres    false    198    201    2851            :           2606    40977    logs logs_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_users_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 A   ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_users_user_id;
       public          postgres    false    197    198    2851            @           2606    65565 )   sensor_data sensor_data_sensors_sensor_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sensor_data
    ADD CONSTRAINT sensor_data_sensors_sensor_id FOREIGN KEY (sensor_id) REFERENCES public.sensors(sensor_id) NOT VALID;
 S   ALTER TABLE ONLY public.sensor_data DROP CONSTRAINT sensor_data_sensors_sensor_id;
       public          postgres    false    2863    213    202            >           2606    49208 !   sensors sensors_devices_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_devices_device_id FOREIGN KEY (device_id) REFERENCES public.devices(device_id) NOT VALID;
 K   ALTER TABLE ONLY public.sensors DROP CONSTRAINT sensors_devices_device_id;
       public          postgres    false    202    201    2858            =           2606    41046 +   sensors sensors_sensor_types_sensor_type_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_sensor_types_sensor_type_id FOREIGN KEY (sensor_type_id) REFERENCES public.sensor_types(sensor_type_id) NOT VALID;
 U   ALTER TABLE ONLY public.sensors DROP CONSTRAINT sensors_sensor_types_sensor_type_id;
       public          postgres    false    203    202    2865            ?           2606    65548 <   watering_hours watering_hours_configuration_configuration_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.watering_hours
    ADD CONSTRAINT watering_hours_configuration_configuration_id FOREIGN KEY (configuration_id) REFERENCES public.configurations(configuration_id) NOT VALID;
 f   ALTER TABLE ONLY public.watering_hours DROP CONSTRAINT watering_hours_configuration_configuration_id;
       public          postgres    false    199    2853    211            �      x�3�4�4��48N�4����� K��      �   N   x����Q����,�/�LO,JI�S�U(�L�(Q(�LI�4��+}}CK#=C3=C=CS�����ĒD�=... K��      �   Z   x�3202�54�5�P00�#��Ģ�̼t��<��Ĝ�T�r� �!��������!4��!����@�� ���@L	*6����� ��%      �      x�3�L����� �S      �   �  x�}�[��*E����T���H[n��qASG4��=G�X����~�\�"��H�����tG� � ?���N�'W��T�(w��cd+��^�����(�;�	C�~��/��#�&QBJ���Y�H��& �wJW�L䷈jH$"�EG$"AH�Y@sDѧ�	���*�"HS|�2��1 �"�S��4EVxc��="�"� �ف�N��m���H�7�ʕ��M�`���A$G$M"�����#ӋZ��S��@������2E�OTGE�����t����S���E���A��H��E�T97^�� "����)���\�2�-�,����d��c	E[d�Y8"mm�dGd�t!
��N��{u$~�f+�����龀�]WD�'V?����B��]�,";"3[1�r�/��ƥ�j�`��ƖP���<��}����5Í��ZB=��*�9��'���� �z�/���RDqD��#��鮀�,�;"4�A=4;���=Q8"e��v�/ ;{��"g�r�'s�94;�P�E4g&m#���_@���"�#��0Z�v¯��ّ_ �
�i��tW���H��G��鮀��):�N����RgD���p���Y��E\����QR������1��ƈ���"iO�ZB#N�k��|��7I�w|E!N�k���t�mG�3#V�/��9ekB;B���.:��Dutbz #�xHYZH�6�2GL`d�����::
1̀�,C��M3Xn�f�2B7r@�np��o�Yu�Bd�f�2Rn���s��ّ����(�|g����	ZE<5��G��i�d�DE'ha�;�-�0خ2�l�"r���1��$]oa/<�,A{��;1���<-�9endiU�XȲ�)S�y�T:�:��a������B��:H>B�y�6��q������y��Fк?H����r{�he����7.;"32��$�K��%�=A�չ�1[VF��znjS��M<�Tg�j�l[ɂȝF*b
�n�<wUgi�9��L�U*�
��k��K��0��[\����4RH���B���Z��+�i���N#�i�e���:����gF
1�[F�@� ���RHw�Ңm���90�������1K�$��/�M�քcql�[9���w�U;�Dn��������/C��h��F��nqJn����h��?B>��~#N��]� Un����Ѓ���f��p�t]ݮ�%@���iĬ�х��X�"�����r�c�c�;a:��[ 5}�n*#�H����mH2��g�K0F�u:��;b:H�/cA�8B>M{!�rVN!f� R�"�7�1˚�B�RaG�����<F�R��B�$g�b6� �� �3"��*>w�,v�,@j����g`�TGH!f� ��E�f����-[��
���0�4�x���i�,"B�/���c,�/h�X��;bV
0��x��&�n�v�;:¡�ͫ0�am�a��Ba'��y�F&W��	p�&�U'��2)�N�C䊍Wv�w�u4��0�H�.�An2a0���:�x�N��8:c(9�ǫ������(d8B>N�.w1_	d(��Y��x��Ҩ~ m�!��I5���E��/��H2��i��O�K#(ƕ�A�pA Ȱ�Ú��@9�#����a}_���N�T�����B�#�����q Į2��Z~	i�P�@p
�I�F�����y���E��B��	      �   H   x�3�I�-H-J,)-J�L��O,�2�������+�2��(��L�,��ʙp:f)�#4�������� fOK      �   !   x�3�4���2�B.#N# i�i$c���� A5�      �   "   x�3��,K����̄P�F�&�1~�%\1z\\\ �V�      �   K   x�3��M��S(K�)K�L��,�4��())���7�4�34��3�34��OεO��K��/O-R��#J��W� ��      �   &   x�3䴰20�4�2�44�2� ��9�L@b1z\\\ Z��     