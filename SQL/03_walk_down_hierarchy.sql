-- Walk down the hierarchy (subtree under a container)
WITH RECURSIVE down AS (
  SELECT c.*, 0 AS depth, LPAD(cast(c.id as text), 1, ' ') AS path
  FROM preprod.containers c
  WHERE c.id = :root_id
  UNION ALL
  SELECT ch.*, d.depth + 1,
         d.path || '>' || ch.id::text
  FROM preprod.containers ch
  JOIN down d ON ch.parent_id = d.id
)
SELECT id, parent_id, name, container_type_id, depth, path
FROM down
ORDER BY path;
