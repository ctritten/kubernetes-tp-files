#!/bin/bash

kubectl create deployment miam --image=xian310/miam
kubectl expose deployment miam --port=80

kubectl create deployment dodo --image=xian310/dodo
kubectl expose deployment dodo --port=80

kubectl create -f miam-dodo-ingress.yaml
