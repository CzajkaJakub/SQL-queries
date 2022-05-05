-- zad 1
create table PROJEKTY (ID_PROJEKTU number(4) generated always as identity, OPIS_PROJEKTU varchar2(20),
    DATA_ROZPOCZECIA date default current_date,
    DATA_ZAKONCZENIA date,
    FUNDUSZ number(7,2));

select *
from PROJEKTY;

-- zad 2
insert into PROJEKTY (OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
values ('Indeksy bitmapowe', to_date('02-04-1999','DD-MM-YYYY'), to_date('31-08-2001','DD-MM-YYYY'), 25000);

insert into PROJEKTY (OPIS_PROJEKTU, FUNDUSZ)
values ('Sieci kręgosłupowe', 19000);

select *
from PROJEKTY;

-- zad 3
select ID_PROJEKTU, OPIS_PROJEKTU from PROJEKTY;

-- zad 4 -- nie mozna dodac id jesli jest generowane automatycznie
-- insert into PROJEKTY (ID_PROJEKTU,OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
-- values (10, 'Indeksy drzewiaste', to_date('24-12-2013','DD-MM-YYYY'), to_date('01-01-2001','DD-MM-YYYY'), 1200);

insert into PROJEKTY (OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
values ('Indeksy drzewiaste', to_date('24-12-2013','DD-MM-YYYY'), to_date('01-01-2001','DD-MM-YYYY'), 1200);

select *
from PROJEKTY;

-- zad 5 -- nie mozna ustawic automatycznie generowanego id
-- update PROJEKTY
-- set ID_PROJEKTU = 10
--where OPIS_PROJEKTU = 'Indeksy drzewiaste';

-- zad 6
create table KOPIA_PROJEKTY as select * from PROJEKTY;
select * from KOPIA_PROJEKTY;

-- zad 7
insert into KOPIA_PROJEKTY (ID_PROJEKTU, OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
values (10, 'Sieci lokalne', current_date, add_months(current_date, 12), 24500);

select *
from KOPIA_PROJEKTY;

-- zad 8
delete
from PROJEKTY
where OPIS_PROJEKTU = 'Indeksy drzewiaste';

select *
from KOPIA_PROJEKTY;

-- zad 9
SELECT table_name FROM user_tables ORDER BY table_name;
