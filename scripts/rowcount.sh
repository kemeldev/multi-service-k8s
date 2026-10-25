#!/usr/bin/env bash
. "$(dirname "$0")/pgenv.sh" >/dev/null
kubectl exec postgres-db-0 -- psql -U "$DB_USER" -d "$DB_NAME" -At -c "
  SELECT 'py_heartbeat',   count(*), coalesce(min($TS_COLUMN)::text,'-') FROM py_heartbeat
  UNION ALL
  SELECT 'node_heartbeat', count(*), coalesce(min($TS_COLUMN)::text,'-') FROM node_heartbeat;
" | awk -F'|' '{printf "%-16s rows=%-8s oldest=%s\n", $1, $2, $3}'
