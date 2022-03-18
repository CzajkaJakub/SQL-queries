-- zad 1

-- select nazwisko, substr(etat, 1, 2) || id_prac as kod from pracownicy



-- zad 2

-- select nazwisko, translate(nazwisko, 'KLM','XXX') as "WOJNA_LITEROM" from pracownicy



-- zad 3

--select nazwisko from pracownicy where INSTR(substr(nazwisko, 1, length(nazwisko)/2), 'L', 1, 1) > 1



-- zad 4

-- select nazwisko, round((placa_pod + placa_pod * 0.15), 0) as podwyzka from pracownicy



-- zad 5

-- select nazwisko, placa_pod, placa_pod * 0.2 as "INWESTYCJA", placa_pod * 0.2 * power((1 + 0.1/1), 10) as "KAPITAL", 

-- placa_pod * 0.2 * power((1 + 0.1/1), 10) - placa_pod * 0.2 as "zysk" from pracownicy



-- zad 6

--select nazwisko, zatrudniony, 2000 - extract(YEAR from zatrudniony) as "STAZ W 2000" from pracownicy



-- zad 7

--select nazwisko, to_char(zatrudniony, 'MONTH, DD YY')  as "DATA ZATRUDNIENIA" from pracownicy



-- zad 8

-- select to_char(current_date, 'DAY') as "DZIS" from dual



-- zad 9

--select nazwa, adres, case adres when 'PIOTROWO 3A' then 'NOWE MIASTO' when 'STRZELECKA 14' then 'STARE MIASTO' when 'WLODKOWICA 16' then 'GRUNWALD' 

--when 'MIELZYNSKIEGO 30' then 'SRARE MIASTO' END as "DZIELNICA" from zespoly



-- zad 10



--select nazwisko, placa_pod, case when placa_pod>480 then 'POWYZEJ 480' when placa_pod<480 then 'PONIZEJ 480' when placa_pod=480 then 'Dokladnie 480'END as "PROG" from pracownicy 

--order by placa_pod desc