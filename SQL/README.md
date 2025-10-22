# Iron-IQ OMN / SCADA SQL Pack

A curated set of PostgreSQL queries for administering and auditing an OMN-style SCADA model.
All examples assume a `preprod` schema and JSONB attribute columns (`attribs`), and follow
the same patterns as your own query:

```sql
SELECT *
FROM preprod.containers c
WHERE c.top_level_parent_id = 90033
  AND c.container_type_id   = 174
  AND c.attribs->'Order in Group'->>'value' = '1';
```

## How to use

- Open this folder in VS Code.
- Either open individual `queries/*.sql` files to run as needed, or run the omnibus script:
  - `scripts/run_all.sql` includes every query in a readable order.
- Replace parameter-style tokens like `:container_id`, `:root_id`, `:parent_id`, `:tlp_id` with concrete values
  for your environment, or adapt to your query tool's bind-variable syntax.

> Tip: If you use `psql`, you can switch to variables like `:'container_id'` or `\set container_id 123`.
For DBeaver/SQLTools, leave the `:param` markers or use `?`/`$1` depending on your driver configuration.

## Contents

- `queries/` — individual, focused .sql files (copy/paste friendly)
- `scripts/run_all.sql` — includes the whole pack for browsing
- `.vscode/extensions.json` — suggested VS Code extensions
- `LICENSE` — MIT
- `CHANGELOG.md`

## Safety

- Start with SELECTs. For any UPDATE examples, review the CTE filters and consider wrapping in a transaction.
- JSONB numeric sorts/filters should cast safely with `::int` and handle NULLs.
- Large hierarchies benefit from indexes on `parent_id` and `top_level_parent_id`.

_Last updated: 2025-10-22_
