-- Orphaned points (no/invalid container)
SELECT p.*
FROM preprod.points p
LEFT JOIN preprod.containers c ON c.id = p.container_id
WHERE c.id IS NULL;
