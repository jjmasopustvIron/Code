-- This query searches for distinct point records where the nice_name contains 'Tubing Batt', returning one record per unique nice_name.
SELECT DISTINCT ON (p.nice_name) p.*
FROM preprod.points AS p
WHERE p.nice_name ILIKE '%Tubing Batt%'
ORDER BY p.nice_name, p.id;
