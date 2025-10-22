-- Validate an attribute domain (e.g., Status ∈ {Active, Inactive, Testing})
SELECT id, name, attribs->'Status'->>'value' AS status
FROM preprod.containers
WHERE attribs ? 'Status'
  AND (attribs->'Status'->>'value') NOT IN ('Active','Inactive','Testing');
