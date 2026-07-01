SHOW TABLES;
SELECT COUNT(*) FROM caract;
SELECT COUNT(*) FROM lieux;
SELECT COUNT(*) FROM vehicules;
SELECT COUNT(*) FROM usagers;
SELECT * FROM caract LIMIT 10;
SELECT * FROM lieux LIMIT 10;
SELECT * FROM usagers LIMIT 10;
SELECT * FROM vehicules LIMIT 10;
SELECT mois, COUNT(*) AS accidents
FROM caract
GROUP BY mois
ORDER BY mois;
SELECT lum, COUNT(*) AS total FROM caract
GROUP BY lum;
SELECT atm, COUNT(*) AS total
FROM caract
GROUP BY atm;
SELECT grav, COUNT(*) AS victims
FROM usagers
GROUP BY grav;
SELECT sexe, COUNT(*) AS total
FROM usagers
GROUP BY sexe;
SELECT catv, COUNT(*) AS total
FROM vehicules
GROUP BY catv
ORDER BY total DESC;
SELECT c.mois, u.grav
FROM caract c
JOIN usagers u
ON c.Num_Acc = u.Num_Acc
LIMIT 10;
SELECT COUNT(*) FROM caract;
SELECT COUNT(*) FROM usagers;
SELECT Num_Acc
FROM caract
LIMIT 5;
SELECT Num_Acc
FROM usagers
LIMIT 5;
SELECT c.mois, COUNT(*) AS victims
FROM caract c
JOIN usagers u
ON c.Num_Acc = u.Num_Acc
GROUP BY c.mois
ORDER BY c.mois;
SELECT c.mois, COUNT(*) AS fatalities
FROM caract c
JOIN usagers u
ON c.Num_Acc = u.Num_Acc
WHERE u.grav = 2
GROUP BY c.mois
ORDER BY c.mois;
SELECT mois, COUNT(DISTINCT c.Num_Acc) AS accidents
FROM caract c
GROUP BY mois
ORDER BY accidents DESC;
SELECT HOUR(STR_TO_DATE(hrmn,'%H:%i')) AS hour, COUNT(*) AS accidents
FROM caract
GROUP BY hour
ORDER BY accidents DESC;
DESCRIBE usagers;
SELECT
    2024 - an_nais AS age
FROM usagers
LIMIT 10;
SELECT
    CASE
        WHEN (2024 - an_nais) < 18 THEN '0-17'
        WHEN (2024 - an_nais) < 26 THEN '18-25'
        WHEN (2024 - an_nais) < 41 THEN '26-40'
        WHEN (2024 - an_nais) < 61 THEN '41-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS victims
FROM usagers
GROUP BY age_group
ORDER BY victims DESC;
