#!/bin/bash

# Start green deployment
kubectl apply -f ./green.yml

# Check deployment status
ATTEMPTS=0
ROLLOUT_STATUS_CMD="kubectl rollout status deployment/green -n udacity"
until $ROLLOUT_STATUS_CMD || [ $ATTEMPTS -eq 60 ]; do
  $ROLLOUT_STATUS_CMD
  ATTEMPTS=$((attempts + 1))
  sleep 1
done
echo "Green deployment successful!"
