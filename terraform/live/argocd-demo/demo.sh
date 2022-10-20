#!/bin/bash

set -e
# Port-forward to argocd

kubectl port-forward svc/argocd-server -n argocd 5000:80 1>/dev/null &

open -a "Google Chrome" http://localhost:5000

# Get argocd initial secret

kubectl get secrets argocd-initial-admin-secret -n argocd -o jsonpath={.data.password}| base64 -d | pbcopy .