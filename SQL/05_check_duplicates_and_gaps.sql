-- Duplicates under same parent (Order in Group)
WITH rows AS (
  SELECT parent_id,
         (attribs->'Order in Group'->>'value')::int AS ord,
         COUNT(*) AS cnt,
         ARRAY_AGG(id ORDER BY id) AS ids
  FROM preprod.containers
  WHERE parent_id IS NOT NULL
  GROUP BY 1, 2
)
SELECT * FROM rows WHERE cnt > 1;

-- Gaps for a specific parent
WITH rows AS (
  SELECT id, (attribs->'Order in Group'->>'value')::int AS ord
  FROM preprod.containers
  WHERE parent_id = :parent_id
), bounds AS (
  SELECT MIN(ord) AS mn, MAX(ord) AS mx FROM rows
)
SELECT g AS missing_ord
FROM bounds b, LATERAL generate_series(b.mn, b.mx) g
LEFT JOIN rows r ON r.ord = g
WHERE r.id IS NULL;
