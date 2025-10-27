-- Finds containers under a specific top-level parent (TLP) with a given container type where the JSONB attrib "Order in Group" equals '1'.
SELECT *
FROM preprod.containers c
WHERE c.top_level_parent_id = 90033
  AND c.container_type_id   = 174
  AND c.attribs->'Order in Group'->>'value' = '1';
