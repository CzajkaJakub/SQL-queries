-- zad1
INSERT INTO pracownicy(id_prac, nazwisko)
VALUES ((SELECT max(id_prac) + 10 FROM pracownicy), 'WOLNY'); 

 SELECT p.nazwisko, p.id_zesp, z.nazwa FROM pracownicy p left OUTER JOIN ZESPOLY z ON z.id_zesp = p.id_zesp order by p.nazwisko

-- zad2
SELECT z.nazwa, z.id_zesp, case when p.nazwisko is null then 'Brak pracownikow' else p.nazwisko end as "pracownik" FROM zespoly z left OUTER JOIN pracownicy p ON z.id_zesp = p.id_zesp order by z.nazwa, p.nazwisko


-- zad 3
SELECT
CASE
    WHEN nazwa IS NULL THEN 'brak zespołu'
    ELSE nazwa
END,
CASE
    WHEN nazwisko IS NULL THEN 'brak pracowników'
    ELSE nazwisko
END
FROM zespoly FULL OUTER JOIN pracownicy ON pracownicy.id_zesp=zespoly.id_zesp ORDER BY nazwa, nazwisko;

-- zad4
DELETE FROM pracownicy
WHERE nazwisko = 'WOLNY'; 

SELECT zespoly.nazwa, COUNT(CASE WHEN pracownicy.placa_pod IS NOT NULL THEN 1 END) AS LICZBA, SUM(pracownicy.placa_pod) AS SUMA_PLAC FROM zespoly FULL OUTER JOIN pracownicy ON pracownicy.id_zesp=zespoly.id_zesp GROUP BY zespoly.nazwa ORDER BY nazwa;


-- zad5
SELECT zespoly.nazwa FROM zespoly LEFT OUTER JOIN pracownicy ON pracownicy.id_zesp=zespoly.id_zesp GROUP BY zespoly.nazwa HAVING COUNT(pracownicy.id_prac)=0

-- zad6
SELECT p.nazwisko AS pracownik, p.id_prac, s.nazwisko AS szef, p.id_szefa FROM pracownicy p LEFT OUTER JOIN pracownicy s ON p.id_szefa=s.id_prac ORDER BY p.nazwisko;

-- zad7
 SELECT p.nazwisko AS PRACOWNIK, COUNT(s.id_prac) AS LICZBA_PRACOWNIKOW FROM pracownicy p LEFT OUTER JOIN pracownicy s ON p.id_prac=s.id_szefa GROUP BY p.nazwisko ORDER BY p.nazwisko;

-- zad8
SELECT p.nazwisko, p.etat, p.placa_pod, z.nazwa, s.nazwisko FROM pracownicy p INNER JOIN zespoly z ON p.id_zesp=z.id_zesp LEFT OUTER JOIN pracownicy s ON p.id_szefa=s.id_prac ORDER BY p.nazwisko;

-- zad9
SELECT nazwisko, nazwa FROM pracownicy, zespoly ORDER BY nazwisko, nazwa

-- zad10
SELECT COUNT(*) FROM pracownicy, zespoly, etaty

-- zad11
SELECT etat FROM pracownicy WHERE EXTRACT(YEAR FROM zatrudniony)=1992 INTERSECT SELECT etat FROM pracownicy WHERE EXTRACT(YEAR FROM zatrudniony)=1993 GROUP BY etat

-- zad12
SELECT z.id_zesp FROM zespoly z LEFT JOIN pracownicy p ON z.id_zesp=p.id_zesp
MINUS
SELECT z.id_zesp FROM zespoly z INNER JOIN pracownicy p ON z.id_zesp=p.id_zesp;

-- zad13
SELECT z.id_zesp, z.nazwa FROM zespoly z LEFT JOIN pracownicy p ON z.id_zesp=p.id_zesp
MINUS
SELECT z.id_zesp, z.nazwa FROM zespoly z INNER JOIN pracownicy p ON z.id_zesp=p.id_zesp;

-- 14
SELECT nazwisko, placa_pod, 'Poniżej 480 złotych' FROM pracownicy WHERE placa_pod<480
UNION
SELECT nazwisko, placa_pod, 'Dokładnie 480 złotych' FROM pracownicy WHERE placa_pod=480
UNION
SELECT nazwisko, placa_pod, 'Powyżej 480 złotych' FROM pracownicy WHERE placa_pod>480
ORDER BY placa_pod