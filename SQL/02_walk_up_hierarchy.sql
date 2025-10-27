-- “Walk up” from a container to the root: recursively follows parent_id to list the lineage (child → … → root) with depths.
WITH RECURSIVE up AS (
  SELECT c.id, c.parent_container_id, c.name, 1 AS depth
  FROM preprod.containers c
  WHERE c.id = :container_id
  UNION ALL
  SELECT p.id, p.parent_container_id, p.name, u.depth + 1
  FROM preprod.containers p
  JOIN up u ON u.parent_container_id = p.id
)
SELECT * FROM up ORDER BY depth;
