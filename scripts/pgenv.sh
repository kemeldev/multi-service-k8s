# Source this file: . ~/lab3/pgenv.sh
K8S="$(cd "$(dirname "${BASH_SOURCE[0]}")/../deploy/k8s" && pwd)"
export DB_NAME=$(grep '^DB_NAME=' "$K8S/base/config/python-api.env" | cut -d= -f2-)
export DB_USER=$(grep '^username=' "$K8S/overlays/kind/secrets/db-credentials.env" | cut -d= -f2-)
export TS_COLUMN=$(grep '^TS_COLUMN=' "$K8S/base/config/cleanup.env" | cut -d= -f2-)
echo "DB_NAME=$DB_NAME  DB_USER=$DB_USER  TS_COLUMN=$TS_COLUMN"
