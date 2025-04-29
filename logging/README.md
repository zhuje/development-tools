Install logging-view-plugin and LokiStack 

1. Create a OCP cluster
2. Manually Install from the OperatorHub 
    [] Red Hat OpenShift Logging Operator, 
    [] Loki Operator, 
    []  Cluster Observability Operator (COO) 
3. Run the script "start.sh" to deploy minio storage, lokistack, and clusterLogForwarder (either Otel or ViaQ), you'll be prompted which data model you want to use
```
cd components 
./start.sh
```