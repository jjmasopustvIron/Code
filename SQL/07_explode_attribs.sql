-- One row per JSONB key/value for a container
SELECT c.id, c.name, kv.key, kv.value
FROM preprod.containers c
CROSS JOIN LATERAL jsonb_each_text(c.attribs) AS kv(key, value)
WHERE c.id = :container_id
ORDER BY kv.key;
