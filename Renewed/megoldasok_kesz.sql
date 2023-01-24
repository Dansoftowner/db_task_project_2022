-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!

-- 1. feladat:
CREATE DATABASE szinesz 
DEFAULT CHARACTER SET utf8 
COLLATE utf8_hungarian_ci;

-- 2. feladat:
INSERT INTO tanarok (id, nev) 
  VALUES (2022, 'Kovács Edina');

-- 3. feladat:
UPDATE tanarok 
SET nev = 'Sipos Edina' 
WHERE nev = 'Kovács Edina';

-- 4. feladat:
DELETE FROM tanarok 
WHERE nev = 'Sipos Edina';

-- 5. feladat:
INSERT INTO hallgatok (id, osztalyid, nev, ferfi)
  VALUES (1091, 92, 'Bach Kata', 0);

-- 6. feladat:
SELECT kezdeseve 
FROM osztalyok 
WHERE (vegzeseve - kezdeseve) = 5 
ORDER BY kezdeseve;

-- 7. feladat:
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

-- 8. feladat:
SELECT MIN(kezdeseve+1) FROM osztalyok
WHERE kezdeseve+1 NOT IN ( SELECT kezdeseve FROM osztalyok );

-- 9. feladat:
SELECT Count(id) AS hiányzik
FROM osztalyok
WHERE id NOT IN (SELECT osztalyId FROM tanitja);

-- 10. feladat:
SELECT tanarok.nev, MIN(tanarosztaly.kezdeseve) AS kezdes
FROM tanarok, tanitja, osztalyok AS tanarosztaly, osztalyok AS hallgatoosztaly, hallgatok
WHERE tanarok.id=tanitja.tanarId
AND tanitja.osztalyId=tanarosztaly.id
AND tanarok.nev=hallgatok.nev
AND hallgatok.osztalyId=hallgatoosztaly.id
GROUP BY tanarok.nev;

-- 11. feladat:
SELECT CONCAT(kezdeseve, "-", vegzeseve) AS `Évfolyam`, nev AS `Hallgató neve`
FROM osztalyok
INNER JOIN hallgatok
ON osztalyok.id = hallgatok.osztalyId 
ORDER BY kezdeseve, nev;