-- zad 1
select NAZWISKO, PLACA_POD from PRACOWNICY order by placa_pod desc fetch first 3 rows only;

SELECT nazwisko, pensja
FROM (SELECT nazwisko, placa_pod AS pensja FROM pracownicy ORDER BY pensja DESC)
WHERE ROWNUM <= 3;

-- zad 2
select NAZWISKO, PLACA_POD from PRACOWNICY order by PLACA_POD desc, NAZWISKO desc offset 5 rows fetch first 5 rows only;

SELECT nazwisko, pensja
FROM (SELECT nazwisko, placa_pod AS pensja, rownum as pozycja FROM pracownicy ORDER BY pensja DESC)
WHERE pozycja between 6 and 10;

-- zad 3
with srednia as (SELECT avg(PLACA_POD) as avg, ID_ZESP as id from PRACOWNICY group by ID_ZESP)
select p.NAZWISKO, p.PLACA_POD, p.PLACA_POD - s.avg  as roznica from PRACOWNICY p, srednia s where s.id = p.ID_ZESP and p.PLACA_POD - s.avg > 0
order by p.NAZWISKO;

-- zad 4
WITH lata AS (select extract(YEAR from ZATRUDNIONY) as years from PRACOWNICY group by extract(YEAR from ZATRUDNIONY))
SELECT years, count(*) as liczba FROM lata, PRACOWNICY where years=extract(YEAR from ZATRUDNIONY) group by years order by liczba desc;

-- zad 5
WITH lata AS (select extract(YEAR from ZATRUDNIONY) as years from PRACOWNICY group by extract(YEAR from ZATRUDNIONY))
SELECT years, count(*) as liczba FROM lata, PRACOWNICY where years=extract(YEAR from ZATRUDNIONY) group by years order by liczba desc
fetch first 1 rows only;

-- zad 6
with asystenci as (select * from PRACOWNICY where ETAT='ASYSTENT'),
piotrowo as (select * from ZESPOLY where ADRES='PIOTROWO 3A')
select asystenci.NAZWISKO, asystenci.ETAT, piotrowo.NAZWA, piotrowo.ADRES from piotrowo, asystenci
where asystenci.ID_ZESP = piotrowo.ID_ZESP;

-- zad 7
with srednie as (select ID_ZESP as id, sum(PLACA_POD) as srednia from PRACOWNICY group by ID_ZESP),
maks as (select max(srednia) as maxVal from srednie),
zesp as (select ID_ZESP, NAZWA from ZESPOLY)
select zesp.NAZWA, maxVal from maks, zesp, srednie where srednia=maxVal and srednie.id=zesp.ID_ZESP;

-- zad 8
SELECT nazwisko, LEVEL AS pozycja_w_hierarichii
FROM pracownicy
CONNECT BY id_szefa = PRIOR id_prac
START WITH nazwisko = 'BRZEZINSKI'
ORDER SIBLINGS BY nazwisko;

WITH
podwladni (id_prac, id_szefa, nazwisko, poziom) AS
-- definicja korzenia hierarchii
(SELECT id_prac, id_szefa, nazwisko, 1
FROM pracownicy
WHERE nazwisko = 'BRZEZINSKI'
UNION ALL
-- rekurencyjna definicja niższych poziomów
SELECT p.id_prac, p.id_szefa, p.nazwisko, poziom+1
FROM podwladni s JOIN pracownicy p ON s.id_prac = p.id_szefa)
-- wskazanie sposobu przeszukiwania hierarchii i sortowania rekordów-dzieci
SEARCH DEPTH FIRST BY nazwisko SET porzadek_potomkow
SELECT nazwisko, poziom
FROM podwladni
ORDER BY porzadek_potomkow;



-- zad 9
SELECT concat(rpad(' ', LEVEL - 1, ' '), nazwisko), LEVEL AS pozycja_w_hierarichii
FROM pracownicy
CONNECT BY id_szefa = PRIOR id_prac
START WITH nazwisko = 'BRZEZINSKI'
ORDER SIBLINGS BY nazwisko;





