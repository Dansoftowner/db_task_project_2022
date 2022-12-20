-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!

-- 1. feladat:


-- 3. feladat:
INSERT INTO hallgatok (hallgatoId, osztalyid, nev, ferfi) VALUES
(1091, 92, 'Bach Kata', 0);

-- 4. feladat:
SELECT kezdeseve 
FROM osztalyok 
WHERE (vegzeseve - kezdeseve) = 5 
ORDER BY kezdeseve;

-- 5. feladat:
SELECT
  tanarok.nev,
  osztalyok.vegzeseve
FROM tanitja
  INNER JOIN tanarok
    ON tanitja.tanarId = tanarok.tanarId
    AND tanitja.tanarId = tanarok.tanarId
  INNER JOIN osztalyok
    ON tanitja.osztalyId = osztalyok.osztalyId
    AND tanitja.osztalyId = osztalyok.osztalyId
WHERE osztalyok.vegzeseve BETWEEN 1970 AND 1979
GROUP BY tanarok.nev
HAVING COUNT(tanarok.nev) > 1

-- 6. feladat:
SELECT MIN(kezdeseve) 
FROM osztalyok 
WHERE kezdeseve = 1950

-- 7. feladat:
SELECT Count(osztalyId) AS hiányzik
FROM osztalyok
WHERE osztalyId NOT IN (SELECT osztalyId FROM tanitja);

-- 8. feladat:
SELECT tanarok.nev, MIN(tanarosztaly.kezdeseve) AS kezdes
FROM tanarok, tanitja, osztalyok AS tanarosztaly, osztalyok AS hallgatoosztaly, hallgatok
WHERE tanarok.tanarId=tanitja.tanarId
AND tanitja.osztalyId=tanarosztaly.osztalyId
AND tanarok.nev=hallgatok.nev
AND hallgatok.osztalyId=hallgatoosztaly.osztalyId
GROUP BY tanarok.nev;

-- 9. feladat:
SELECT CONCAT(kezdeseve, "-", vegzeseve) AS `Évfolyam`, nev AS `Hallgató neve`
FROM osztalyok
INNER JOIN hallgatok
ON osztalyok.id = hallgatok.osztalyId 
ORDER BY idoszak, nev;