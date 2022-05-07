-- zad 1
create or replace view ASYSTENCI (nazwisko, placa, staz) as
    (select nazwisko, coalesce(PLACA_DOD, 0) + PLACA_POD,
            (extract(year from current_date) - extract(YEAR from ZATRUDNIONY) || ' lat ' ||
             (extract(year from current_date) - extract(YEAR from ZATRUDNIONY)) * 12 || ' miesiecy')
            from PRACOWNICY);

select nazwisko, placa, staz from ASYSTENCI;

-- zad 2
create or replace view PLACE (numer_zespolu, srednia, minimalna, maksymalna, fundusz_plac, liczba_pensji, liczba_dodatkow)
as (select ID_ZESP, round(avg(PLACA_POD + coalesce(PLACA_DOD, 0)), 2), min(PLACA_POD + coalesce(PLACA_DOD, 0)),
           max(PLACA_POD + coalesce(PLACA_DOD, 0)), sum(PLACA_POD + coalesce(PLACA_DOD, 0)), count(PLACA_POD), count(PLACA_DOD) from PRACOWNICY group by ID_ZESP);

select *
from PLACE order by numer_zespolu;

-- zad 3
select nazwisko, PLACA_POD, p.srednia from PRACOWNICY, PLACE p where PLACA_POD < p.srednia and ID_ZESP = p.numer_zespolu order by NAZWISKO;

-- zad 4
create or replace view PLACE_MINIMALNE (id_prac, nazwisko, etat, placa_pod) as
    (select ID_ZESP, NAZWISKO, ETAT, PLACA_POD from PRACOWNICY where PLACA_POD < 700) with read only;

select *
from PLACE_MINIMALNE;

-- zad 5 -- nie mozna poniewaz widok jest niemodyfikalny
update PLACE_MINIMALNE
set PLACE_MINIMALNE.placa_pod = 800
where PLACE_MINIMALNE.nazwisko = 'HAPKE';

-- zad 6
create or replace view prac_szef (id_prac, id_szefa, pracownik, etat, szef) as
    (select p.id_prac, p.id_szefa, p.nazwisko, p.etat, x.NAZWISKO from PRACOWNICY p, PRACOWNICY x where p.ID_SZEFA = x.ID_PRAC );

select *
from prac_szef order by pracownik;

INSERT INTO PRAC_SZEF (ID_PRAC, ID_SZEFA, PRACOWNIK, ETAT)
 VALUES (280,150, 'MORZY','ASYSTENT');

UPDATE PRAC_SZEF SET ID_SZEFA = 130 WHERE ID_PRAC = 280;

DELETE FROM PRAC_SZEF WHERE ID_PRAC = 280;

-- zad 7
create or replace view zarobki (id_prac, nazwisko, etat, placa_pod) as
    (select p.id_prac, p.nazwisko, p.etat, p.placa_pod from PRACOWNICY p, PRACOWNICY x where p.ID_SZEFA = x.ID_PRAC and p.PLACA_POD < x.PLACA_POD)
with check option constraint za_wysoka_placa;

select *
from zarobki order by nazwisko;

UPDATE ZAROBKI SET PLACA_POD = 2000
 WHERE NAZWISKO = 'BIALY';

-- zad 8
select column_name, updatable, insertable, deletable
from USER_UPDATABLE_COLUMNS where TABLE_NAME = 'PRAC_SZEF';





