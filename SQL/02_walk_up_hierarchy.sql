-- Walk up the hierarchy (container -> root)
WITH RECURSIVE up AS (
  SELECT c.id, c.parent_id, c.name, 1 AS depth
  FROM preprod.containers c
  WHERE c.id = :container_id
  UNION ALL
  SELECT p.id, p.parent_id, p.name, u.depth + 1
  FROM preprod.containers p
  JOIN up u ON u.parent_id = p.id
)
SELECT * FROM up ORDER BY depth;
