-- Siblings ordered by Order in Group (then name)
SELECT s.*
FROM preprod.containers s
WHERE s.parent_id = (SELECT parent_id FROM preprod.containers WHERE id = :container_id)
ORDER BY NULLIF((s.attribs->'Order in Group'->>'value')::int, NULL), s.name;
