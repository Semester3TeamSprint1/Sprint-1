PGDMP         	                {            QAP1    15.1    15.1 "    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    16417    QAP1    DATABASE     h   CREATE DATABASE "QAP1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "QAP1";
                postgres    false            �            1259    16621    aircraft    TABLE     �   CREATE TABLE public.aircraft (
    id bigint NOT NULL,
    aircraft_type character varying(50) NOT NULL,
    airline_name character varying(50) NOT NULL,
    number_of_passengers character varying(5) NOT NULL
);
    DROP TABLE public.aircraft;
       public         heap    postgres    false            �            1259    16616    airport    TABLE     �   CREATE TABLE public.airport (
    id bigint NOT NULL,
    airport_name character varying(255) NOT NULL,
    airport_code character varying(10) NOT NULL,
    city_id bigint
);
    DROP TABLE public.airport;
       public         heap    postgres    false            �            1259    16693    arrival_city    TABLE     �   CREATE TABLE public.arrival_city (
    id bigint,
    city_name character varying(25),
    city_state character varying(25),
    city_population character varying(15)
);
     DROP TABLE public.arrival_city;
       public         heap    postgres    false            �            1259    16590    city    TABLE     �   CREATE TABLE public.city (
    id bigint NOT NULL,
    city_name character varying(25) NOT NULL,
    city_state character varying(25) NOT NULL,
    city_population character varying(15) NOT NULL
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    16648    flight    TABLE     �   CREATE TABLE public.flight (
    flight_id bigint NOT NULL,
    airport_id bigint NOT NULL,
    aircraft_id bigint NOT NULL,
    depart_id bigint NOT NULL,
    arrive_id bigint NOT NULL
);
    DROP TABLE public.flight;
       public         heap    postgres    false            �            1259    16611 	   passenger    TABLE     �   CREATE TABLE public.passenger (
    id bigint NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    phone_number character varying(15) NOT NULL
);
    DROP TABLE public.passenger;
       public         heap    postgres    false            �            1259    16635    passenger_aircraft    TABLE     n   CREATE TABLE public.passenger_aircraft (
    passenger_id bigint NOT NULL,
    aircraft_id bigint NOT NULL
);
 &   DROP TABLE public.passenger_aircraft;
       public         heap    postgres    false            �            1259    16696    passenger_airport    TABLE     l   CREATE TABLE public.passenger_airport (
    passenger_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
 %   DROP TABLE public.passenger_airport;
       public         heap    postgres    false            .          0    16621    aircraft 
   TABLE DATA           Y   COPY public.aircraft (id, aircraft_type, airline_name, number_of_passengers) FROM stdin;
    public          postgres    false    217   (       -          0    16616    airport 
   TABLE DATA           J   COPY public.airport (id, airport_name, airport_code, city_id) FROM stdin;
    public          postgres    false    216   �(       1          0    16693    arrival_city 
   TABLE DATA           R   COPY public.arrival_city (id, city_name, city_state, city_population) FROM stdin;
    public          postgres    false    220   *       +          0    16590    city 
   TABLE DATA           J   COPY public.city (id, city_name, city_state, city_population) FROM stdin;
    public          postgres    false    214   +       0          0    16648    flight 
   TABLE DATA           Z   COPY public.flight (flight_id, airport_id, aircraft_id, depart_id, arrive_id) FROM stdin;
    public          postgres    false    219   -,       ,          0    16611 	   passenger 
   TABLE DATA           L   COPY public.passenger (id, first_name, last_name, phone_number) FROM stdin;
    public          postgres    false    215   ,-       /          0    16635    passenger_aircraft 
   TABLE DATA           G   COPY public.passenger_aircraft (passenger_id, aircraft_id) FROM stdin;
    public          postgres    false    218   	.       2          0    16696    passenger_airport 
   TABLE DATA           E   COPY public.passenger_airport (passenger_id, airport_id) FROM stdin;
    public          postgres    false    221   ].       �           2606    16625    aircraft aircraft_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT aircraft_pkey;
       public            postgres    false    217            �           2606    16620    airport airport_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.airport
    ADD CONSTRAINT airport_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.airport DROP CONSTRAINT airport_pkey;
       public            postgres    false    216            �           2606    16596    city city_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    214            �           2606    16652    flight flight_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_pkey PRIMARY KEY (flight_id);
 <   ALTER TABLE ONLY public.flight DROP CONSTRAINT flight_pkey;
       public            postgres    false    219            �           2606    16615    passenger passenger_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.passenger DROP CONSTRAINT passenger_pkey;
       public            postgres    false    215            �           2606    16643    passenger_aircraft aircraft_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.passenger_aircraft
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);
 H   ALTER TABLE ONLY public.passenger_aircraft DROP CONSTRAINT aircraft_fk;
       public          postgres    false    217    218    3473            �           2606    16630    airport airport_city    FK CONSTRAINT     |   ALTER TABLE ONLY public.airport
    ADD CONSTRAINT airport_city FOREIGN KEY (city_id) REFERENCES public.city(id) NOT VALID;
 >   ALTER TABLE ONLY public.airport DROP CONSTRAINT airport_city;
       public          postgres    false    3467    214    216            �           2606    16678    flight flight_aircraft    FK CONSTRAINT     �   ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_aircraft FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id) NOT VALID;
 @   ALTER TABLE ONLY public.flight DROP CONSTRAINT flight_aircraft;
       public          postgres    false    219    3473    217            �           2606    16673    flight flight_airport    FK CONSTRAINT     �   ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_airport FOREIGN KEY (airport_id) REFERENCES public.airport(id) NOT VALID;
 ?   ALTER TABLE ONLY public.flight DROP CONSTRAINT flight_airport;
       public          postgres    false    3471    216    219            �           2606    16688    flight flight_arrive    FK CONSTRAINT     ~   ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_arrive FOREIGN KEY (arrive_id) REFERENCES public.city(id) NOT VALID;
 >   ALTER TABLE ONLY public.flight DROP CONSTRAINT flight_arrive;
       public          postgres    false    219    3467    214            �           2606    16683    flight flight_depart    FK CONSTRAINT     ~   ALTER TABLE ONLY public.flight
    ADD CONSTRAINT flight_depart FOREIGN KEY (depart_id) REFERENCES public.city(id) NOT VALID;
 >   ALTER TABLE ONLY public.flight DROP CONSTRAINT flight_depart;
       public          postgres    false    214    3467    219            �           2606    16704 .   passenger_airport passenger_airport_airport_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.passenger_airport
    ADD CONSTRAINT passenger_airport_airport_id FOREIGN KEY (airport_id) REFERENCES public.airport(id);
 X   ALTER TABLE ONLY public.passenger_airport DROP CONSTRAINT passenger_airport_airport_id;
       public          postgres    false    216    221    3471            �           2606    16699 0   passenger_airport passenger_airport_passenger_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.passenger_airport
    ADD CONSTRAINT passenger_airport_passenger_id FOREIGN KEY (passenger_id) REFERENCES public.passenger(id);
 Z   ALTER TABLE ONLY public.passenger_airport DROP CONSTRAINT passenger_airport_passenger_id;
       public          postgres    false    3469    221    215            �           2606    16638    passenger_aircraft passenger_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.passenger_aircraft
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passenger(id);
 I   ALTER TABLE ONLY public.passenger_aircraft DROP CONSTRAINT passenger_fk;
       public          postgres    false    218    3469    215            .   �   x�M��
�0Dϛ����6i��=���������D�X��C�0��o���'����n�`o�ag�`MP�j!Yɸ�&�D���l"�"$a7[�wPV���t�qk���SR3�4����2c.p�)f�H�zI	U�������V��ǯy�ӯ�!�<��Ղ7�f�} 67>}      -   =  x�u��n�0E�㯘��f���C u�+�������k��n�%��ܹc��	�׊H�7\�S��ӆd�B۫��d� ��N�Rˇ�/�W���p�6�J�ȋ����Z{OM<բ�J5�t��	�sX��"+��^*�
л����F��24�&>zz[c?$�9�8)'��̴�.E��A,�F���7<���qr�1�½l����+�0as�׺��j���t��0ecX*c+��]���b��!���)5]���.R�1>�1"�K:l� s��ދQ���x����ؠ��>�#(\��o���|> ��5b�}X��F      1   �   x�M�=o1�g�W��%B8w�%#��E�B�K�.)���]]����=��-K��<�	��{�(����Tc[e�F+)Ռ�1���NNj���o��y��a/p�sbI���*c6�	\-���w�j�G��s(�Oc'�ݨ6-�Kl��H�ʑ�)K�-���C�k?.֑�|��}eZ��!tp+�r��@�)��`��.ɟ��N�/��	fC�>C�n���`s�,��r~�N����]u�UxB'�&��OD��}d�      +   �   x�M�=o1�g�W��%B8w�%#��E�B�K�.)���]]����=��-K��<�	��{�(����Tc[e�F+)Ռ�1���NNj���o��y��a/p�sbI���*c6�	\-���w�j�G��s(�Oc'�ݨ6-�Kl��H�ʑ�)K�-���C�k?.֑�|��}eZ��!tp+�r��@�)��`��.ɟ��N�/��	fC�>C�n���`s�,��r~�N����]u�UxB'�&��OD��}d�      0   �   x�=�ۑ� C�Q1;���^n�u�DH&C8~����|��<��xF{�"�?1I�.�O5������sG�0�:,mK�r%�`�"���X'y�^ξ�4�`�x��(��s�g68�P�hLx^��57Pm�a*���.��&J��D�_K፰�<��q�a��9k�{"_��x�BT;;℈).%!8���_v$�yk0��S�!������l,u5D��`E}K�gl�᧦����1G�      ,   �   x�u��n�0�g�)�,D�{u�4A�v��B-�� IMාc8������x����9%���:�$YI���o8�1���F�Z�w֣�}�--��J��&��@9aP�N���5���%9m<x	���h)ye���h8M���4:�����+��4�6�c[�N��LX�BX얟k���P��֊�Q�,�i����y�5�`��7D�*9P'      /   D   x����P�3�%�E���㰋�+�qs�J�R����P��.k����f?���@�5��C���$��5]      2   G   x�%���0�jr��)��w��s�� Q�$�i.R+�]��1�����n�Q(�L�Bê���!����     