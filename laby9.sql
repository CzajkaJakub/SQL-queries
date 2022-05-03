-- zad 1

insert into PRACOWNICY (ID_PRAC, NAZWISKO, ETAT, ZATRUDNIONY, PLACA_POD, ID_ZESP)
values (250, 'KOWALSKI', 'ASYSTENT', TO_DATE('2015-01-13', 'yyyy-mm-dd'), 1500, 10);

insert into PRACOWNICY values (260, 'ADAMSKI', 'ASYSTENT', null, TO_DATE('2014-09-10', 'yyyy-mm-dd'), 1500, null, 10);

insert into PRACOWNICY values (270, 'NOWAK', 'ADIUNKT', null, TO_DATE('1990-05-01', 'yyyy-mm-dd'), 2050, 540, 20);

select * from PRACOWNICY where ID_PRAC = 250 or ID_PRAC = 260 or ID_PRAC = 270;

-- delete
-- from PRACOWNICY
-- where ID_PRAC = 250 or ID_PRAC = 260 or ID_PRAC = 270;


-- zad 2
update PRACOWNICY
set PLACA_POD = PLACA_POD * 1.1, PLACA_DOD =
    case
    when PLACA_DOD IS NULL then 100
    when PLACA_DOD is not null then PLACA_DOD * 1.2
    end

where ID_PRAC = 250 or ID_PRAC = 260 or ID_PRAC = 270;

select * from PRACOWNICY where ID_PRAC = 250 or ID_PRAC = 260 or ID_PRAC = 270;

-- zad 3
insert into ZESPOLY (ID_ZESP, NAZWA, ADRES)
values (60, 'BAZY DANYCH', 'PIOTROWO 2');

select *
from ZESPOLY where ID_ZESP = 60;

-- zad 4
UPDATE PRACOWNICY SET ID_ZESP = (SELECT ID_ZESP FROM ZESPOLY WHERE NAZWA = 'BAZY DANYCH')
where ID_PRAC = 250 or ID_PRAC = 260 or ID_PRAC = 270;

select * from PRACOWNICY where ID_PRAC = 250 or ID_PRAC = 260 or ID_PRAC = 270;

-- ZAD 5
UPDATE PRACOWNICY SET ID_SZEFA = (SELECT ID_PRAC FROM PRACOWNICY WHERE NAZWISKO = 'MORZY')
where ID_ZESP = (SELECT ID_ZESP FROM ZESPOLY WHERE NAZWA = 'BAZY DANYCH');

select * from PRACOWNICY where ID_SZEFA = (SELECT ID_PRAC FROM PRACOWNICY WHERE NAZWISKO = 'MORZY') order by ID_PRAC;

-- zad 6 -> nie mozna poniewaz istnieja pracownicy ktorzy sa przypisani do tego zespoly
delete
from ZESPOLY
where NAZWA='BAZY DANYCH';

-- zad 7
delete
from PRACOWNICY
where ID_ZESP = (SELECT ID_ZESP FROM ZESPOLY WHERE NAZWA = 'BAZY DANYCH');

delete
from ZESPOLY
where NAZWA='BAZY DANYCH';

select *
from ZESPOLY;

select *
from PRACOWNICY;


-- zad 8
select p.NAZWISKO, p.PLACA_POD, 0.1 * (select avg(PLACA_POD) from PRACOWNICY where p.ID_ZESP = ID_ZESP group by ID_ZESP) as podwyzka  from PRACOWNICY p order by NAZWISKO;

-- zad 9    -- do dokonczenia
update PRACOWNICY p
set PLACA_POD = PLACA_POD + 0.1  * (select avg(PLACA_POD) from PRACOWNICY where p.ID_ZESP = ID_ZESP group by ID_ZESP);

select NAZWISKO, PLACA_POD from PRACOWNICY order by NAZWISKO;

-- zad 10
select * from PRACOWNICY where PLACA_POD = (select min(PLACA_POD) from PRACOWNICY);

-- zad 11
update PRACOWNICY
set PLACA_POD = round((select avg(PLACA_POD) from PRACOWNICY), 2)
where PLACA_POD = (select min(PLACA_POD) from PRACOWNICY);

select * from PRACOWNICY where ID_PRAC = 200;

-- zad 12
update PRACOWNICY
set PLACA_DOD = (select avg(PLACA_POD) from PRACOWNICY where ID_SZEFA = (select ID_PRAC from PRACOWNICY where NAZWISKO = 'MORZY'))
where ID_ZESP = 20;

select * from PRACOWNICY where ID_ZESP = 20;

-- zad 13

select NAZWISKO, PLACA_POD from PRACOWNICY, ZESPOLY where PRACOWNICY.ID_ZESP = ZESPOLY.ID_ZESP and ZESPOLY.NAZWA = 'SYSTEMY ROZPROSZONE';

update (select * from PRACOWNICY, ZESPOLY where PRACOWNICY.ID_ZESP = ZESPOLY.ID_ZESP and ZESPOLY.NAZWA = 'SYSTEMY ROZPROSZONE')
set PLACA_POD = PLACA_POD * 1.25;

select NAZWISKO, PLACA_POD from PRACOWNICY, ZESPOLY where PRACOWNICY.ID_ZESP = ZESPOLY.ID_ZESP and ZESPOLY.NAZWA = 'SYSTEMY ROZPROSZONE' order by NAZWISKO;

-- zad 14
select *
from PRACOWNICY where ID_SZEFA = (select ID_PRAC from PRACOWNICY where NAZWISKO = 'MORZY');

delete
from PRACOWNICY
where ID_SZEFA = (select ID_PRAC from PRACOWNICY where NAZWISKO = 'MORZY');


select *
from PRACOWNICY where ID_SZEFA = (select ID_PRAC from PRACOWNICY where NAZWISKO = 'MORZY');

-- zad 15
select *
from PRACOWNICY order by NAZWISKO;

-- zad 16
create sequence PRAC_SEQ start with 300 increment by 10;

-- zad 17
insert into PRACOWNICY (ID_PRAC, NAZWISKO, ETAT, PLACA_POD)
values (PRAC_SEQ.nextval, 'TRABCZYNSKI', 'STAZYSTA', 1000);

select *
from PRACOWNICY;

-- zad 18
update PRACOWNICY
set PLACA_DOD = PRAC_SEQ.currval
where NAZWISKO = 'TRABCZYNSKI';

select *
from PRACOWNICY;

-- zad 19
delete
from PRACOWNICY
where NAZWISKO = 'TRABCZYNSKI';

select *
from PRACOWNICY;

-- zad 20
create sequence mala_seq maxvalue 2;
select mala_seq.nextval from DUAL;

-- zad 21
drop sequence mala_seq;




















