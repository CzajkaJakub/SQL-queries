--1
--SELECT pracownicy.nazwisko, pracownicy.etat, pracownicy.id_zesp, zespoly.nazwa FROM pracownicy, zespoly WHERE pracownicy.id_zesp=zespoly.id_zesp ORDER BY nazwisko;

--2
--SELECT pracownicy.nazwisko, pracownicy.etat, pracownicy.id_zesp, zespoly.nazwa FROM pracownicy, zespoly WHERE pracownicy.id_zesp=zespoly.id_zesp AND zespoly.adres='PIOTROWO 3A' ORDER BY nazwisko;

--3
--SELECT pracownicy.nazwisko, pracownicy.etat, pracownicy.placa_pod, etaty.placa_min, etaty.placa_max FROM pracownicy INNER JOIN etaty ON etat=nazwa ORDER BY etat, nazwisko;

--4
/*SELECT pracownicy.nazwisko, pracownicy.etat, pracownicy.placa_pod, etaty.placa_min, etaty.placa_max, CASE
    WHEN pracownicy.placa_pod>=etaty.placa_min AND pracownicy.placa_pod<=etaty.placa_max THEN 'OK'
    ELSE 'NIE'
    END AS czy_pensja_ok
    FROM pracownicy INNER JOIN etaty ON etat=nazwa ORDER BY etat, nazwisko;*/
    
--5
--SELECT nazwisko AS zla_placa FROM pracownicy INNER JOIN etaty ON etat=nazwa WHERE pracownicy.placa_pod<etaty.placa_min OR pracownicy.placa_pod>etaty.placa_max ORDER BY etat, nazwisko;

--6
--SELECT pracownicy.nazwisko, pracownicy.placa_pod, pracownicy.etat, etaty.nazwa AS kat_plac, placa_min, placa_max FROM pracownicy, etaty WHERE pracownicy.placa_pod>=etaty.placa_min AND pracownicy.placa_pod<=etaty.placa_max ORDER BY nazwisko, etaty.nazwa;

--7
--SELECT pracownicy.nazwisko, pracownicy.placa_pod, pracownicy.etat, etaty.nazwa AS kat_plac, placa_min, placa_max FROM pracownicy, etaty WHERE pracownicy.placa_pod>=etaty.placa_min AND pracownicy.placa_pod<=etaty.placa_max AND etaty.nazwa='SEKRETARKA' ORDER BY nazwisko;

--8
--SELECT p.nazwisko AS pracownik, p.id_prac, s.nazwisko AS szef, p.id_szefa FROM pracownicy p INNER JOIN pracownicy s ON p.id_szefa=s.id_prac WHERE p.id_szefa IS NOT NULL ORDER BY p.nazwisko;

--9
--SELECT p.nazwisko AS pracownik, TO_CHAR(p.zatrudniony, 'YYYY.MM.DD') AS pracownik_zatrudniony, s.nazwisko AS szef, TO_CHAR(s.zatrudniony, 'YYYY.MM.DD') AS szef_zatrudniony, TO_NUMBER(SUBSTR((p.zatrudniony-s.zatrudniony)YEAR TO MONTH, 2, 2)) FROM pracownicy p INNER JOIN pracownicy s ON p.id_szefa=s.id_prac WHERE p.id_szefa IS NOT NULL AND TO_NUMBER(SUBSTR((p.zatrudniony-s.zatrudniony)YEAR TO MONTH, 2, 2))<10 ORDER BY p.zatrudniony, p.nazwisko;

--10
--SELECT z.nazwa, COUNT(*) AS liczba, AVG(p.placa_pod) AS srednia_placa FROM pracownicy p INNER JOIN zespoly z USING(id_zesp) GROUP BY id_zesp, z.nazwa ORDER BY z.nazwa;

--11
/*SELECT z.nazwa, CASE
    WHEN COUNT(*)>0 AND COUNT(*)<=2 THEN 'maly'
    WHEN COUNT(*)>=3 AND COUNT(*)<=6 THEN 'sredni'
    WHEN COUNT(*)>=7 THEN 'duzy'
    END
AS liczba FROM pracownicy p INNER JOIN zespoly z USING(id_zesp) GROUP BY id_zesp, z.nazwa ORDER BY z.nazwa;*/