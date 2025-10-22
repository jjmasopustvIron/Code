-- Points under a subtree (assuming points.container_id FK)
WITH RECURSIVE sub AS (
  SELECT id FROM preprod.containers WHERE id = :root_id
  UNION ALL
  SELECT c.id
  FROM preprod.containers c
  JOIN sub s ON c.parent_id = s.id
)
SELECT p.*
FROM preprod.points p
JOIN sub s ON p.container_id = s.id
ORDER BY p.name;
