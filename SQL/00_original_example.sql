-- Your original query, preserved
SELECT *
FROM preprod.containers c
WHERE c.top_level_parent_id = 90033
  AND c.container_type_id   = 174
  AND c.attribs->'Order in Group'->>'value' = '1';
