# development-tools

https://github.com/rhobs/observability-operator/blob/main/docs/user-guides/observability-ui-plugins.md

| __COO Version__ |   __OCP Versions__  | __Dashboards__ | __Distributed Tracing__ | __Logging__ | __Troubleshooting Panel__ |
| --------------- | ------------------- | -------------- | ----------------------- | ----------- | ------------------------- |
| 0.2.0           | 4.11                |       ✔        |             ✘           |       ✘     |             ✘             |
| 0.3.0+          | 4.11 - 4.15         |       ✔        |             ✔           |       ✔     |             ✘             |
| 0.3.0+          | 4.16+               |       ✔        |             ✔           |       ✔     |             ✔             |

### ROSA Clusters 
Requires a STS role 
'ManagedOpenShift'

https://docs.openshift.com/rosa/rosa_install_access_delete_clusters/rosa-sts-creating-a-cluster-quickly.html

Logging 
Requires an AWS or minio bucket storage 

### Prerequisites 
- [OpenShift CLI (oc)](https://docs.openshift.com/container-platform/4.16/cli_reference/openshift_cli/getting-started-cli.html) 
- [operator-sdk CLI](https://sdk.operatorframework.io/docs/installation/)
- Logged into an Openshift Cluster