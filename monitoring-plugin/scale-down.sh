# 1) scale down Cluster Version Operator deployment to 0

oc scale --replicas=0 -n openshift-cluster-version deployment/cluster-version-operator

# 2) Set Cluster Monitoring Operator (CMO) to unmanged 
# Resource https://access.redhat.com/solutions/6548111

oc patch clusterversion version --type json -p "$(cat disable-monitoring.yaml)"

oc scale --replicas=0 -n openshift-monitoring deployment/cluster-monitoring-operator

oc scale --replicas=0 -n openshift-monitoring deployment/monitoring-plugin

# 3) Modify the CMO deployment spec to reference your image 
# https://github.com/openshift/cluster-monitoring-operator/blob/5d1fd1bb52eeb9b2f877c45de0cf93e2f9fffb95/manifests/0000_50_cluster-monitoring-operator_05-deployment.yaml#L76


#4) Scale up the Monitoring-plugin
# oc scale --replicas=1 -n openshift-monitoring deployment/cluster-monitoring-operator

# oc scale --replicas=1 -n openshift-monitoring deployment/monitoring-plugin

