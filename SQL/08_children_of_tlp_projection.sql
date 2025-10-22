-- All containers of a TLP with a tidy attribute projection
SELECT c.id, c.name,
       c.container_type_id,
       c.parent_id,
       c.top_level_parent_id,
       c.attribs->'Order in Group'->>'value' AS order_in_group,
       c.attribs->'Status'->>'value'         AS status
FROM preprod.containers c
WHERE c.top_level_parent_id = :tlp_id
ORDER BY (c.attribs->'Order in Group'->>'value')::int NULLS LAST, c.name;
