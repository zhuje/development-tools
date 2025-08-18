
# !!! DON'T USE ROSA CLUSTER IT WON'T WORK -- BECAUSE IT'S MANAGED SERVICE!!!

## Quick Start: Scale Down/Up Cluster Monitoring Operator 
1. Scaling down the cluster monitoring operator  (CMO) and setting it to unmanaged allows you to replace the default monitoring plugin image with your test image without the CMO overwritting the changes. 
```
./scale.sh down
```
2. Modify Deployments > Cluster Monitoring Operator to replace the default monitoring plugin image with your test image [here](https://github.com/openshift/cluster-monitoring-operator/blob/5d1fd1bb52eeb9b2f877c45de0cf93e2f9fffb95/manifests/0000_50_cluster-monitoring-operator_05-deployment.yaml#L76)

3. Then scale up the deployment/cluster-monitoring-operator and deployment/monitoring-plugin to apply your test image 
```
./scale.sh up
```

## Replacing the monitoring-plugin image in the Cluster-Monitoring-Operator 
Run `./update-plugin <INSERT-IMAGE>`

This will scale down CMO, replace the monitoring-plugin image, and then scale CMO back up. 

## Hierarchy Tree for Monitoring-plugin: How resources are managed 
* Cluster Version Operator 
    * Cluster Monitoring Operator 
        * monitoring-plugin
    * Cluster Observability Operator
        * monitoring-console- plugin

## Monitoring-plugin Redeployment 

#### Option 1 to Deploy Monitoring-plugin image 
1) Set CMO to unmanaged though: https://access.redhat.com/solutions/6548111 (Red Hat associate access required)
2) and modify the CMO deployment spec to reference your image (https://github.com/openshift/cluster-monitoring-operator/blob/5d1fd1bb52eeb9b2f877c45de0cf93e2f9fffb95/manifests/0000_50_cluster-monitoring-operator_05-deployment.yaml#L76)

#### Option 2 to Deploy Monitoring-plugin image 
With cluster-bot  `/launch openshift/monitoring-plugin#xxx aws` where xxx is your PR number


### Virtualization Perspective Redeployment 
Requires both Cluster Observability Operator (COO handles monitoring-console-plugin) and Cluster Monitoring Operator (CMO handles monitoring-plugin) to be redeployed. 

#### Redeploy COO:
1. In your monitoring-plugin repository: `make build-dev-mcp-image`
2. OperatorHub > Install COO > modify Yaml to replace "ui-monitoring" image with the newly built image from 'make build-dev-mcp-image"

#### Redeploy CMO:
1. `make build-image` in your monitoring-plugin repository
2. `./scale.sh down` in this repository, to set CMO to unmanaged 
   - source https://access.redhat.com/solutions/6548111 (Red Hat associate access required)
3. Then modify the CMO deployment spec to reference monitoring-plugin image in previous step (https://github.com/openshift/cluster-monitoring-operator/blob/5d1fd1bb52eeb9b2f877c45de0cf93e2f9fffb95/manifests/0000_50_cluster-monitoring-operator_05-deployment.yaml#L76)
4. `./scale.sh up` Scale up the monitoring-plugin deployment to apply the new image changes 

#### Enable Virtualization 
Follow instructions in this [doc](https://docs.google.com/document/d/1rBio1lFD3GzWqVP35ZLUdfVDNPwjDSxG08wy5Yo2tG8/edit?tab=t.0#heading=h.tde5tm3v47ck)


