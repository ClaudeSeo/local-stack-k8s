#!/bin/sh

kubectl apply -f local-stack.yaml

echo "Pod 가 준비될 때 까지 대기합니다..."

kubectl wait --for=condition=Ready pod/"$(kubectl get po --sort-by=.metadata.creationTimestamp | grep local-stack | grep -e "ContainerCreating" -e "Running" | awk 'END{print $1}')"

