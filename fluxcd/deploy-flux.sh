#!/bin/bash

flux bootstrap github \
  --token-auth \
  --owner=alexei-ozerov \
  --repository=https://github.com/alexei-ozerov/idp \
  --branch=podinfo-test \
  --path=./clusters/development \
  --personal \
  --private=false
