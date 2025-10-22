-- Latest value per point (assuming point_values(point_id, ts, value))
SELECT DISTINCT ON (pv.point_id)
       pv.point_id, pv.ts, pv.value
FROM preprod.point_values pv
ORDER BY pv.point_id, pv.ts DESC;
