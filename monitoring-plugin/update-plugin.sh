#!/usr/bin/env bash
set -euo pipefail

echo -e  " ========= Scaling Down Cluster Monitoring Operator ========= "
./scale.sh down

# Usage: ./update-plugin.sh quay.io/jezhu/monitoring-plugin:ou-848-jsx-pr2-aug18-5
NEW_IMAGE="${1:?Usage: $0 <new-image>}"
NAMESPACE="openshift-monitoring"
DEPLOYMENT="cluster-monitoring-operator"

echo -e "\n ========= Replacing current monitoring-plugin image with ${NEW_IMAGE} ========= "
# Get current deployment, replace the plugin image arg, and apply patch
oc get deployment "$DEPLOYMENT" -n "$NAMESPACE" -o json \
  | jq --arg new_image "$NEW_IMAGE" '
    .spec.template.spec.containers[0].args
    |= map(if test("^-images=monitoring-plugin=") then "-images=monitoring-plugin=\($new_image)" else . end)
  ' \
  | oc apply -f -

echo -e "\n ========= Scale Up Cluster Monitoring Operator ========= "
./scale.sh up
