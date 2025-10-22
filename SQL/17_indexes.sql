-- Indexes (create only if appropriate for your environment)
CREATE INDEX IF NOT EXISTS idx_containers_attribs_gin
  ON preprod.containers USING GIN (attribs);

CREATE INDEX IF NOT EXISTS idx_containers_tlp ON preprod.containers (top_level_parent_id);
CREATE INDEX IF NOT EXISTS idx_containers_parent ON preprod.containers (parent_id);
CREATE INDEX IF NOT EXISTS idx_containers_type ON preprod.containers (container_type_id);

CREATE INDEX IF NOT EXISTS idx_containers_order_in_group
  ON preprod.containers (((attribs->'Order in Group'->>'value')::int));
