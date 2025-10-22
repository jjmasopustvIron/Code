-- Recently changed containers (last 7 days)
SELECT id, name, updated_at
FROM preprod.containers
WHERE updated_at >= NOW() - INTERVAL '7 days'
ORDER BY updated_at DESC;
