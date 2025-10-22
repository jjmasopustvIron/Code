-- Containers under a given TLP, matching a type and Order in Group = 1
SELECT *
FROM preprod.containers c
WHERE c.top_level_parent_id = :tlp_id
  AND c.container_type_id   = :type_id
  AND c.attribs->'Order in Group'->>'value' = '1';
