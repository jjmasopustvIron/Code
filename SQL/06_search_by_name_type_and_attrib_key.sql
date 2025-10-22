-- Quick search by name/type + attribute key existence
SELECT id, name, container_type_id, attribs
FROM preprod.containers
WHERE name ILIKE '%' || :needle || '%'
  AND (:type_id IS NULL OR container_type_id = :type_id)
  AND attribs ? :attrib_key;
