-- Containers of a given type missing a required attribute key
SELECT id, name
FROM preprod.containers
WHERE container_type_id = :type_id
  AND NOT (attribs ? :required_key);  -- e.g., 'PLC'
