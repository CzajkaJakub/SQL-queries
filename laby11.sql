-- zad 1
ALTER TABLE PROJEKTY
    MODIFY (
        ID_PROJEKTU constraint pk_key primary key,
        OPIS_PROJEKTU constraint uk_projekty UNIQUE not null,
        FUNDUSZ constraint nie_ujemne check ( FUNDUSZ >= 0 )
    );

ALTER TABLE PROJEKTY add constraint data_check check ( DATA_ZAKONCZENIA > DATA_ROZPOCZECIA );

SELECT user_constraints.constraint_name, constraint_type, SEARCH_CONDITION, COLUMN_NAME
FROM user_constraints, USER_CONS_COLUMNS
WHERE USER_CONS_COLUMNS.CONSTRAINT_NAME = USER_CONSTRAINTS.CONSTRAINT_NAME and user_constraints.table_name = 'PROJEKTY'
order by COLUMN_NAME;

-- zad 2 -- nie jestesmy w stanie dodac poniewaz nie jest to uniq value w opisie projektu
insert into PROJEKTY (OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
values ('Indeksy bitmapowe', to_date('12-04-2015', 'DD-MM-YYYY'), to_date('30-07-2016', 'DD-MM-YYYY'), 40000);

-- zad 3
create table PRZYDZIALY
        (ID_PROJEKTU number(4) constraint FK_PRZYDZIALY_01 references PROJEKTY(ID_PROJEKTU) not null,
        NR_PRACOWNIKA number(6) constraint FK_PRZyDZIALY_02 references PRACOWNICY(ID_PRAC) not null ,
        od Date default current_date,
        do Date,
        constraint chk_przedzialy_daty check ( do > od ),
        stawka number(7, 2) constraint chk_przydzialy_stawka check ( stawka > 0 ),
        CONSTRAINT PK_PRZYDZIALY PRIMARY KEY (ID_PROJEKTU, NR_PRACOWNIKA),
        rola varchar2(20) constraint chk_przydzialy_role check ( rola in ('KIERUJACY', 'ANALITYK', 'PROGRAMISTA')));


-- ZAD 4

insert into PRZYDZIALY (ID_PROJEKTU, NR_PRACOWNIKA, od, do, stawka, rola)
values ((select ID_PROJEKTU from PROJEKTY where OPIS_PROJEKTU = 'Indeksy bitmapowe'), 170, to_date('10-04-1999', 'DD-MM-YYYY'), to_date('10-05-1999', 'DD-MM-YYYY'), 1000, 'KIERUJACY');

insert
into PRZYDZIALY (ID_PROJEKTU, NR_PRACOWNIKA, od, stawka, rola)
values ((select ID_PROJEKTU from PROJEKTY where OPIS_PROJEKTU = 'Indeksy bitmapowe'), 140, to_date('01-12-2000', 'DD-MM-YYYY'), 1500, 'ANALITYK');

insert
into PRZYDZIALY (ID_PROJEKTU, NR_PRACOWNIKA, od, stawka, rola)
values ((select ID_PROJEKTU from PROJEKTY where OPIS_PROJEKTU = 'Sieci kręgosłupowe'), 140, to_date('14-09-2015', 'DD-MM-YYYY'), 2500, 'KIERUJACY');


select *
from PRZYDZIALY;

-- zad 5
-- alter table PRZYDZIALY add godziny number(5) constraint maksi check ( godziny < 9999 ) not null;

-- zad 6
alter table PRZYDZIALY add godziny number(5);
update PRZYDZIALY set godziny = 5 where NR_PRACOWNIKA = 140 or NR_PRACOWNIKA = 170;
alter table PRZYDZIALY modify godziny number(5) constraint maksymalna check ( godziny < 9999 ) not null;

-- zad 7
alter table PROJEKTY disable constraint uk_projekty;

select CONSTRAINT_NAME, STATUS
from USER_CONSTRAINTS where CONSTRAINT_NAME =  'UK_PROJEKTY';

-- ZAD 8
insert into PROJEKTY (OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
values ('Indeksy bitmapowe', to_date('12-09-2015', 'DD-MM-YYYY'), to_date('30-09-2016', 'DD-MM-YYYY'), 40000);

select *
from PROJEKTY;

-- zad 9 -- nie da sie wlaczyc poniewaz istnieja zduplikowane pola
alter table PROJEKTY enable constraint uk_projekty;

-- zad 10
update PROJEKTY
set OPIS_PROJEKTU = 'Inne bitmapowe'
where ID_PROJEKTU = 8;

alter table PROJEKTY enable constraint uk_projekty;

-- zad 11 --- same value are too big
alter table PROJEKTY modify opis_projektu varchar2(10);

-- zad 12 -- nie mozna poniewaz w przydzialach cos pobiera id projektu
delete
from PROJEKTY
where OPIS_PROJEKTU = 'Sieci kręgosłupowe';

-- zad 13
alter table PRZYDZIALY drop constraint FK_PRZYDZIALY_01;
alter table PRZYDZIALY modify ID_PROJEKTU number(4) constraint FK_PRZYDZIALY_01 references PROJEKTY(ID_PROJEKTU) on delete cascade;

delete
from PROJEKTY
where OPIS_PROJEKTU = 'Sieci kręgosłupowe';

select *
from PRZYDZIALY;

select *
from PROJEKTY;

-- zad 14
drop table PROJEKTY cascade constraints;

select CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
from USER_CONSTRAINTS;

-- zad 15
drop table KOPIA_PROJEKTY;
drop table PRZYDZIALY;

select TABLE_NAME
from USER_CONSTRAINTS;







