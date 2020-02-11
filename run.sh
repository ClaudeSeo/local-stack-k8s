#!/bin/sh
docker pull localstack/localstack
kubectl apply -f local-stack.yaml
echo "Pod 가 준비될 때 까지 대기합니다..."
kubectl wait --timeout=150s \
    --for=condition=Ready \
    pod/"$(kubectl get po --sort-by=.metadata.creationTimestamp | grep local-stack | grep -e "ContainerCreating" -e "Running" -e "Pending" | awk 'END{print $1}')"

./provisioning.sh
