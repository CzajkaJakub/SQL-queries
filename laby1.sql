-- zad1
select * from zespoly order by id_zesp ASC;

-- zad2
select * from pracownicy order by id_prac ASC;

-- zad3
select nazwisko, placa_pod * 12 AS "Placa roczna" from pracownicy order by nazwisko ASC;

-- zad4
select nazwisko, etat, coalesce(placa_pod, 0) + coalesce(placa_dod, 0) AS "MIESIECZNE ZAROBKI" from pracownicy order by "MIESIECZNE ZAROBKI" DESC;

-- zad5
select * from zespoly order by nazwa ASC;

-- zad6
select unique nazwa from etaty;

-- zad 7
select * from pracownicy where etat = 'ASYSTENT' order by nazwisko ASC;

-- zad 8
select id_prac, nazwisko, etat, placa_pod, id_zesp from pracownicy where id_zesp = 30 OR id_zesp = 40 order by placa_pod DESC;

-- zad 9
select nazwisko, id_zesp, placa_pod from pracownicy where placa_pod between 300 and 800 order by nazwisko ASC;

-- zad 10
select nazwisko, etat, id_zesp from pracownicy where nazwisko like '%SKI' order by nazwisko ASC;

-- zad 11
select id_prac, id_szefa, nazwisko, placa_pod from pracownicy where id_szefa is not null and placa_pod > 1000;


-- zad 12
select nazwisko, id_zesp from pracownicy where id_zesp = 20 and (nazwisko like 'M%' or nazwisko like '%SKI') order by nazwisko ASC;

-- zad 13
select nazwisko, etat, placa_pod / 160 AS "STAWKA" from pracownicy where etat != 'ADIUNKT' and etat != 'ASYSTENT' and etat != 'STAZYSTA' and placa_pod not between 400 and 800 order by STAWKA ASC;

-- zad 14
select nazwisko, etat, placa_pod, placa_dod from pracownicy where coalesce(placa_pod, 0) + coalesce(placa_dod, 0) > 1000 order by etat, nazwisko ASC;

-- zad 15
select nazwisko || ' pracuje od ' || replace(zatrudniony, '/', '-') || ' i zarabia ' || placa_pod AS "PROFESOROWIE" from pracownicy where etat = 'PROFESOR' order by placa_pod DESC;