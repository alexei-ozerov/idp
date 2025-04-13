#!/bin/bash

flux create source git podinfo \
  --url=https://github.com/stefanprodan/podinfo \
  --branch=master \
  --interval=1m \
  --export >./fluxcd/clusters/development/podinfo-source.yaml
