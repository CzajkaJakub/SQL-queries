-- zad1
select NAZWISKO, ETAT, ID_ZESP from PRACOWNICY where ID_ZESP = (select ID_ZESP from PRACOWNICY where NAZWISKO = 'BRZEZINSKI') order by NAZWISKO;

-- zad2
select p.NAZWISKO, p.ETAT, z.nazwa from PRACOWNICY p, ZESPOLY z where p.ID_ZESP=z.ID_ZESP and p.ID_ZESP = (select ID_ZESP from PRACOWNICY where NAZWISKO = 'BRZEZINSKI') order by NAZWISKO;

-- zad3
-- INSERT INTO pracownicy(id_prac, nazwisko, etat, zatrudniony)
-- VALUES ((SELECT max(id_prac) + 1 FROM pracownicy),
-- 'WOLNY', 'ASYSTENT', DATE '1968-07-01');

select NAZWISKO, ETAT, ZATRUDNIONY from PRACOWNICY where ETAT='PROFESOR' and ZATRUDNIONY = (select min(ZATRUDNIONY) from PRACOWNICY where ETAT='PROFESOR');

-- zad4
select NAZWISKO, ZATRUDNIONY, ID_ZESP from PRACOWNICY where ZATRUDNIONY in (select max(ZATRUDNIONY) from PRACOWNICY group by ID_ZESP) order by ZATRUDNIONY;


-- zad5
select z.ID_ZESP, z.NAZWA, z.ADRES from ZESPOLY z where z.ID_ZESP = (select z.ID_ZESP from PRACOWNICY p right outer join ZESPOLY Z on Z.ID_ZESP = p.ID_ZESP group by z.ID_ZESP having count(p.ID_ZESP) = 0);
-- DELETE FROM pracownicy
-- WHERE nazwisko = 'WOLNY';

-- zad6
select NAZWISKO from PRACOWNICY where ETAT = 'PROFESOR' and ID_PRAC not in (select ID_SZEFA from PRACOWNICY where ETAT='STAZYSTA');

-- zad7
select ID_ZESP, sum(PLACA_POD) from PRACOWNICY having sum(PLACA_POD) = (select max(sum(PLACA_POD)) from PRACOWNICY group by ID_ZESP) group by ID_ZESP;

-- zad8
select NAZWA, sum(PLACA_POD) from PRACOWNICY left join ZESPOLY Z on Z.ID_ZESP = PRACOWNICY.ID_ZESP having sum(PLACA_POD) = (select max(sum(PLACA_POD)) from PRACOWNICY group by ID_ZESP) group by NAZWA;


-- zad9
select  z2.NAZWA , count(*) as "Ilu pracownikow" from PRACOWNICY join ZESPOLY Z2 on Z2.ID_ZESP = PRACOWNICY.ID_ZESP group by z2.NAZWA having count(*) > (select count(*) from PRACOWNICY join ZESPOLY Z on Z.ID_ZESP = PRACOWNICY.ID_ZESP where NAZWA = 'ADMINISTRACJA');

-- zad10
select ETAT from PRACOWNICY group by ETAT having count(*) = (select max(count(*)) from PRACOWNICY group by ETAT);

-- zad11
SELECT ETAT, LISTAGG(nazwisko, ', ') FROM PRACOWNICY where ETAT IN
(select ETAT from PRACOWNICY group by ETAT having count(*) =
(select max(count(*)) from PRACOWNICY group by ETAT)) group by ETAT;

-- zad12
select p.NAZWISKO, s.nazwisko from PRACOWNICY p, PRACOWNICY s where p.ID_SZEFA = s.ID_PRAC and s.PLACA_POD-p.PLACA_POD =
(select min(s.PLACA_POD-p.PLACA_POD) from PRACOWNICY p, PRACOWNICY s where p.ID_SZEFA = s.ID_PRAC);






