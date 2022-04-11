-- zad 1

select MIN(placa_pod) as "Minimum", MAX(placa_pod) as "Maksimum", max(placa_pod)-min(placa_pod) as "Roznica" from pracownicy



-- zad2

 select etat, avg(placa_pod) from pracownicy group by etat order by avg(placa_pod) desc



-- zad3

select count(*) as "PROFESOROWIE" from pracownicy where etat='PROFESOR' group by etat 



-- zad 4

select id_zesp, sum(placa_pod+coalesce(placa_dod, 0)) as "Sumaryczne place" from pracownicy group by id_zesp order by id_zesp



-- zad 5

select  max(sum(placa_pod+coalesce(placa_dod, 0))) as "Max suma plac"  from pracownicy group by id_zesp



-- zad 6

 select id_szefa, min(placa_pod) from pracownicy where id_szefa is not null group by id_szefa order by min(placa_pod) desc



-- zad 7

select id_zesp, count(*) from pracownicy group by id_zesp order by count(*) desc



-- zad 8

 select id_zesp, count(*) from pracownicy group by id_zesp having count(*) > 3 order by count(*) desc 



-- zad 9

select count(id_prac) from pracownicy group by id_prac having count(id_prac) > 1



-- zad 10

select etat, avg(placa_pod), count(etat) from pracownicy where DATE '1990-01-01' > zatrudniony group by etat order by etat





-- zad 11

-- select id_zesp, etat, round(avg(placa_pod+coalesce(placa_dod, 0)), 0), max(placa_pod) from pracownicy group by id_zesp, etat 

-- having etat = 'ASYSTENT' or etat = 'PROFESOR' order by id_zesp, etat



-- zad 12

--select extract(year from zatrudniony) as rok, count(*) as "Ilu pracownikow" from pracownicy group by extract(year from zatrudniony)

--order by extract(year from zatrudniony)



-- zad 13

-- select length(nazwisko) as "Ile liter", count(*) as "W ilu nazwiskach" from pracownicy group by length(nazwisko) order by length(nazwisko)



-- zad 14

--select count(*) as "Ile nazwisk z A" from pracownicy where nazwisko like '%A%' or nazwisko like '%a%'



-- zad 15



--select count(case when nazwisko like '%A%' or nazwisko like '%a%' then 1 end) as "Ile nazwisk z A",

--count(case when nazwisko like '%e%' or nazwisko like '%E%' then 1 end) as "Ile nazwisk z E"

--from pracownicy



-- zad 16



--select id_zesp, sum(placa_pod) as "suma plac", listagg(nazwisko || ':' || placa_pod) from pracownicy group by id_zesp order by id_zesp

