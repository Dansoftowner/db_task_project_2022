-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!

-- 1. feladat:
CREATE DATABASE szinesz 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_hungarian_ci;

-- 3. feladat:
INSERT INTO tanarok (id, nev) 
  VALUES (2022, 'Kovács Edina');

-- 4. feladat:
UPDATE tanarok 
SET nev = 'Sipos Edina' 
WHERE nev = 'Kovács Edina';

-- 5. feladat:
DELETE FROM tanarok 
WHERE nev = 'Sipos Edina';

-- 6. feladat:
INSERT INTO hallgatok (hallgatoId, osztalyid, nev, ferfi)
  VALUES (1091, 92, 'Bach Kata', 0);

-- 7. feladat:
SELECT kezdeseve 
FROM osztalyok 
WHERE (vegzeseve - kezdeseve) = 5 
ORDER BY kezdeseve;

-- 8. feladat:
SELECT
  tanarok.nev,
  osztalyok.vegzeseve
FROM tanitja
  INNER JOIN tanarok
    ON tanitja.tanarId = tanarok.id
  INNER JOIN osztalyok
    ON tanitja.osztalyId = osztalyok.id
WHERE osztalyok.vegzeseve BETWEEN 1970 AND 1979
GROUP BY tanarok.nev
HAVING COUNT(tanarok.nev) > 1;

-- 9. feladat:
SELECT MIN(kezdeseve+1) FROM osztalyok
WHERE kezdeseve+1 NOT IN ( SELECT kezdeseve FROM osztalyok );

-- 10. feladat:
SELECT Count(osztalyId) AS hiányzik
FROM osztalyok
WHERE osztalyId NOT IN (SELECT osztalyId FROM tanitja);

-- 11. feladat:
SELECT tanarok.nev, MIN(tanarosztaly.kezdeseve) AS kezdes
FROM tanarok, tanitja, osztalyok AS tanarosztaly, osztalyok AS hallgatoosztaly, hallgatok
WHERE tanarok.tanarId=tanitja.tanarId
AND tanitja.osztalyId=tanarosztaly.osztalyId
AND tanarok.nev=hallgatok.nev
AND hallgatok.osztalyId=hallgatoosztaly.osztalyId
GROUP BY tanarok.nev;

-- 12. feladat:
SELECT CONCAT(kezdeseve, "-", vegzeseve) AS `Évfolyam`, nev AS `Hallgató neve`
FROM osztalyok
INNER JOIN hallgatok
ON osztalyok.id = hallgatok.osztalyId 
ORDER BY idoszak, nev;