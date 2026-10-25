# multi-service-k8s

Kubernetes deployment for the multi-service app (React frontend, FastAPI, Node API, Postgres),
built across Lab 3 and packaged with Kustomize.

## Layout
- deploy/k8s/base: the application, environment-neutral
- deploy/k8s/overlays/kind: local KinD cluster
- deploy/k8s/overlays/eks: AWS EKS (not applied yet)
- deploy/platform: Helm values for Traefik and metrics-server
- maintenance: heartbeat cleanup task image
- lab-manifests, lab-broken, scripts, docs: learning material

## Deploy to KinD
1. Create deploy/k8s/overlays/kind/secrets/db-credentials.env from the .example file (git-ignored).
2. Build the images and load them with `kind load docker-image`.
3. `kubectl apply -k deploy/k8s/overlays/kind`
