#!/usr/bin/env bash
# Prints the total size of the app database in MB, plus the size of each table.
PG=$(kubectl get pod -l app=postgres -o jsonpath='{.items[0].metadata.name}')
DB_NAME=$(kubectl get cm python-api-config -o jsonpath='{.data.DB_NAME}')
DB_USER=$(kubectl get secret db-credentials -o jsonpath='{.data.username}' | base64 -d)

echo "== Database total =="
kubectl exec "$PG" -- psql -U "$DB_USER" -d "$DB_NAME" -At -F ' ' -c "
  SELECT current_database(),
         round(pg_database_size(current_database()) / 1048576.0, 2) || ' MB';
"

echo
echo "== Per table (data + indexes) =="
kubectl exec "$PG" -- psql -U "$DB_USER" -d "$DB_NAME" -At -F ' ' -c "
  SELECT relname,
         round(pg_total_relation_size(relid) / 1048576.0, 2) || ' MB'
  FROM pg_catalog.pg_statio_user_tables
  ORDER BY pg_total_relation_size(relid) DESC;
"
