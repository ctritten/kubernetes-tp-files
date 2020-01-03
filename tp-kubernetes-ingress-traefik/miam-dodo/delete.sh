#!/bin/bash

kubectl delete deployment miam
kubectl delete service miam

kubectl delete deployment dodo
kubectl delete service dodo

kubectl delete ingress miam-dodo
