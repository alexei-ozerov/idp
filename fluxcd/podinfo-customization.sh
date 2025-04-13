#!/bin/bash

flux create kustomization podinfo \
  --target-namespace=podinfo \
  --source=podinfo \
  --path="./kustomize" \
  --prune=true \
  --wait=true \
  --interval=30m \
  --retry-interval=2m \
  --health-check-timeout=3m \
  --export >./clusters/development/podinfo-kustomization.yaml
