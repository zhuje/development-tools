## Install logging-view-plugin and LokiStack 

1. Create an OCP cluster. Navigate to the console UI. 
2. Manually Install from the OperatorHub 
    - [ ] Red Hat OpenShift Logging Operator, 
    - [ ] Loki Operator, 
    - [ ] Cluster Observability Operator (COO)
3. `oc login ...`
4. Run the script "start.sh" to deploy minio storage, lokistack, and clusterLogForwarder (either Otel or ViaQ), you'll be prompted which data model you want to use
```
$ cd components 
$ ./start.sh

Which data model do you want to configure?
a) otel b) viaQ
Enter your choice (a or b): b
 ** Data Model used wil be : viaq ** 
 ========================================== 
 ========= Minio Configuration ============ 
namespace/minio created
secret/minio created
service/minio created
deployment.apps/minio created
persistentvolumeclaim/minio created
 ========= LokiStack Configuration ======== 
Warning: resource namespaces/openshift-logging is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by oc apply. oc apply should only be used on resources created declaratively by either oc create --save-config or oc apply. The missing annotation will be patched automatically.
namespace/openshift-logging configured
secret/minio created
lokistack.loki.grafana.com/logging-loki created
 ======= Collector Configurguration ======= 
Already on project "openshift-logging" on server "https://api.sno-4xlarge-418-s82xk.dev07.red-chesterfield.com:6443".
serviceaccount/collector created
clusterrole.rbac.authorization.k8s.io/logging-collector-logs-writer added: "collector"
clusterrole.rbac.authorization.k8s.io/collect-application-logs added: "collector"
clusterrole.rbac.authorization.k8s.io/collect-audit-logs added: "collector"
clusterrole.rbac.authorization.k8s.io/collect-infrastructure-logs added: "collector"
 ==== UI-Plugin Logging Configuration ===== 
uiplugin.observability.openshift.io/logging created
 ======= ClusterLogForwarder Config ========= 
clusterlogforwarder.observability.openshift.io/collector created
(base) 
```
