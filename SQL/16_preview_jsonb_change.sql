-- Preview a JSONB change safely: set 'Order in Group' to '1' where missing, under a parent
WITH target AS (
  SELECT id
  FROM preprod.containers
  WHERE parent_id = :parent_id
    AND (attribs->'Order in Group'->>'value') IS NULL
)
UPDATE preprod.containers c
SET attribs = jsonb_set(
  c.attribs,
  '{Order in Group,value}',
  to_jsonb('1'::text),
  true
)
WHERE c.id IN (SELECT id FROM target)
RETURNING c.id, c.name, c.attribs->'Order in Group'->>'value' AS new_order;
