-- Container type distribution under a TLP
SELECT container_type_id, COUNT(*) AS n
FROM preprod.containers
WHERE top_level_parent_id = :tlp_id
GROUP BY 1
ORDER BY n DESC;
