# Namespace rebuild test — results

Command: kubectl apply -k overlays/kind

## Came back automatically
- (fill in)

## Did not come back
- Database contents: restored from a pg_dump. Data is not configuration.
- (anything else you found)

## Required outside the repository
- deploy/k8s/overlays/kind/secrets/db-credentials.env (git-ignored by design)
- Images loaded onto the KinD nodes
- Traefik, its Gateway, and the Gateway API CRDs
- metrics-server
