-- zad1
select z.ID_ZESP, z.NAZWA, z.ADRES from ZESPOLY z where z.ID_ZESP in
                                                        (select z.ID_ZESP from PRACOWNICY p right outer join Zespoly z on Z.ID_ZESP = p.ID_ZESP
                                                                          group by z.ID_ZESP having count(p.ID_ZESP) = 0);

-- zad 2
select nazwisko, placa_pod, etat from pracownicy p where placa_pod >
(select avg(placa_pod) from pracownicy where p.etat = etat group by etat) order by placa_pod desc;

-- zad3
select p.nazwisko, p.placa_pod from pracownicy p where p.placa_pod > 0.75 * (select placa_pod from pracownicy where id_prac = p.id_szefa);

-- zad 4
select p.nazwisko from pracownicy p where etat =  'PROFESOR' and not EXISTS (select * FROM pracownicy where id_szefa = p.id_prac and etat = 'STAZYSTA');

-- zad 5
select nazwa, suma_plac from (select sum(PLACA_POD) as suma_plac, ID_ZESP as id from PRACOWNICY group by ID_ZESP),
                          (select max(sum(PLACA_POD)) as max_suma_plac from PRACOWNICY group by ID_ZESP),
                          ZESPOLY z
                          where suma_plac = max_suma_plac and z.ID_ZESP = id;

-- zad 6
 select p.nazwisko, p.placa_pod from pracownicy p where p.id_prac IN
(SELECT id_prac from pracownicy fetch first 3 ROWS ONLY) order by placa_pod desc;

-- zad 7
select extract(YEAR from p.zatrudniony) as "ROK",
count(id_prac) as liczba
from pracownicy p group by extract(YEAR from p.zatrudniony) order by liczba desc;

 -- zad 8
 select extract(YEAR from p.zatrudniony) as "ROK",
 count(id_prac) as liczba
 from pracownicy p group by extract(YEAR from p.zatrudniony)
 having count(id_prac) = (select max(count(id_prac)) from pracownicy group by extract(YEAR from zatrudniony));

-- zad 9 1 opcja w select
select p.nazwisko, p.placa_pod, p.placa_pod - (select avg(placa_pod) from pracownicy where id_zesp = p.id_zesp) as roznica from pracownicy p order by p.nazwisko;

-- zad 9 2 opcja w from
select p.NAZWISKO, p.PLACA_POD, PLACA_POD - liczba from (select avg(PLACA_POD) as liczba, ID_ZESP as id from pracownicy group by ID_ZESP) join PRACOWNICY p on id = p.ID_ZESP order by p.nazwisko;

-- zad 10
select p.nazwisko, p.placa_pod, p.placa_pod - (select avg(placa_pod) from pracownicy where id_zesp = p.id_zesp) as roznica from pracownicy p
where p.placa_pod - (select avg(placa_pod) from pracownicy where id_zesp = p.id_zesp) > 0 order by p.nazwisko;

-- zad 10 2 opcja w from
select p.NAZWISKO, p.PLACA_POD, PLACA_POD - liczba from
                                                       (select avg(PLACA_POD) as liczba, ID_ZESP as id from pracownicy group by ID_ZESP)
                                                           join PRACOWNICY p on id = p.ID_ZESP where PLACA_POD - liczba > 0 order by p.nazwisko;


-- zad 11
select p.nazwisko, z.adres, (select count(*) from PRACOWNICY where p.ID_PRAC = ID_SZEFA) as podwladni
from pracownicy p, zespoly z where etat = 'PROFESOR' and p.id_zesp = z.id_zesp and z.adres = 'PIOTROWO 3A'
order by podwladni desc;

 -- zad 12
select z.nazwa,
round((select avg(placa_pod) from pracownicy where z.ID_ZESP = id_zesp), 1) as "Srednia w zespole",
round((select avg(placa_pod) from pracownicy), 1) as "Srednia ogolnie",
case
when (select avg(placa_pod) from pracownicy where z.ID_ZESP = id_zesp) > (select avg(placa_pod) from pracownicy) then ':)'
when (select avg(placa_pod) from pracownicy where z.ID_ZESP = id_zesp) is null then '???'
else ':(' end
from ZESPOLY z order by NAZWA;

-- zad 13
select e.NAZWA, e.placa_min, e.placa_max from ETATY e order by
(SELECT COUNT(*) FROM pracownicy WHERE e.NAZWA = etat) desc, nazwa;
