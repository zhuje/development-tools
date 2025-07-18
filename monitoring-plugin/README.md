
# !!! DON'T USE ROSA CLUSTER IT WON'T WORK -- BECAUSE IT'S MANAGED SERVICE!!!

### Hierarchy Tree for Monitoring-plugin: How resources are managed 
* Cluster Version Operator 
    * Cluster Monitoring Operator 
        * Monitoring-Plugin

### Option 1 to Deploy Monitoring-plugin image 
1) Set CMO to unmanaged though: https://access.redhat.com/solutions/6548111 (Red Hat associate access required)
2) and modify the CMO deployment spec to reference your image (https://github.com/openshift/cluster-monitoring-operator/blob/5d1fd1bb52eeb9b2f877c45de0cf93e2f9fffb95/manifests/0000_50_cluster-monitoring-operator_05-deployment.yaml#L76)

### Option 2 to Deploy Monitoring-plugin image 
With cluster-bot  `/launch openshift/monitoring-plugin#xxx aws` where xxx is your PR number


### Virtualization Perspective Redeployment 

#### Redeploy COO:
1. In your monitoring-plugin repository: `make build-dev-mcp-image`
2. OperatorHub > Install COO > modify Yaml to replace "ui-monitoring" image with the newly built image from 'make build-dev-mcp-image"

#### Redeploy CMO:
1. In your monitoring-plugin repository: `make build-image`
2. In this repository, set CMO to unmanaged though: `scale.sh down` 
   - source https://access.redhat.com/solutions/6548111 (Red Hat associate access required)
3. Then modify the CMO deployment spec to reference monitoring-plugin image in previous step (https://github.com/openshift/cluster-monitoring-operator/blob/5d1fd1bb52eeb9b2f877c45de0cf93e2f9fffb95/manifests/0000_50_cluster-monitoring-operator_05-deployment.yaml#L76)
4. After replacing monitoring-plugin image with your image Step 1 `make build-image`, scale up the monitoring-plugin deployment to apply the new image changes `oc scale --replicas=1 -n openshift-monitoring deployment/monitoring-plugin`  



