### Instructions to Install Perses Dashboards 
1. Log in to an OpenShift Cluster 
2. OperatorHub > Install Cluster Observability Operator 
3. oc apply -f perses_dashboard.yaml
4. oc apply -f perses_datasource.yaml 
5. oc apply -f uiplugin_monitoring_perses.yaml
