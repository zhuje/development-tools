# development-tools

### Miro Mind Map 
[https://miro.com/app/board/uXjVIHGY4-A=/](https://miro.com/app/board/uXjVIHGY4-A=/)

### Compatibility Matrix 
https://github.com/rhobs/observability-operator/blob/main/docs/user-guides/observability-ui-plugins.md

| __COO Version__ |   __OCP Versions__  | __Dashboards__ | __Distributed Tracing__ | __Logging__ | __Troubleshooting Panel__ |
| --------------- | ------------------- | -------------- | ----------------------- | ----------- | ------------------------- |
| 0.2.0           | 4.11                |       ✔        |             ✘           |       ✘     |             ✘             |
| 0.3.0+          | 4.11 - 4.15         |       ✔        |             ✔           |       ✔     |             ✘             |
| 0.3.0+          | 4.16+               |       ✔        |             ✔           |       ✔     |             ✔             |


## OpenShift Console Versions vs PatternFly Versions
https://github.com/openshift/console/blob/main/frontend/packages/console-dynamic-plugin-sdk/README.md#openshift-console-versions-vs-patternfly-versions

Each Console version supports specific version(s) of [PatternFly](https://www.patternfly.org/) in terms
of CSS styling. This table will help align compatible versions of PatternFly to versions of the OpenShift
Console.

| Console Version | PatternFly Versions | Notes                                 |
| --------------- | ------------------- | ------------------------------------- |
| 4.19.x          | 6.x + 5.x           | New dynamic plugins should use PF 6.x |
| 4.15.x - 4.18.x | 5.x + 4.x           | New dynamic plugins should use PF 5.x |
| 4.12.x - 4.14.x | 4.x                 |                                       |

Refer to [PatternFly Upgrade Notes][console-pf-upgrade-notes] containing links to PatternFly documentation.



### ROSA Clusters 
Requires a STS role 
'ManagedOpenShift'

https://docs.openshift.com/rosa/rosa_install_access_delete_clusters/rosa-sts-creating-a-cluster-quickly.html

### Prerequisites 
- OpenShift Cluster version 4.11+ 
- Logged into an OpenShift Cluster 
- [OpenShift CLI (oc)](https://docs.openshift.com/container-platform/4.16/cli_reference/openshift_cli/getting-started-cli.html) 
- [operator-sdk CLI](https://sdk.operatorframework.io/docs/installation/)
- Logged into an Openshift Cluster

### Makefile 
To pass your own image of the observability operator bundle use the flag `OPERATOR_BUNDLE`. For example: 

`make coo-resources OPERATOR_BUNDLE="quay.io/test/observability-operator-bundle"`

### Testing  
#### Monitoring Test Plan 
https://docs.google.com/document/d/1ZtGEFDOIsLDHnp8Gd0bq41RaRkm0_nrp37gj-mNo9BI/edit?usp=sharing

#### COO Acceptance Criteria 
https://docs.google.com/document/d/1rBio1lFD3GzWqVP35ZLUdfVDNPwjDSxG08wy5Yo2tG8/edit?tab=t.0#heading=h.bupciudrwmna
