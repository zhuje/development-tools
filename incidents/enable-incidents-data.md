# Incidents 
###  Add incidents data like this:
Clone down:
https://github.com/openshift/cluster-health-analyzer/tree/main

Upload incidents:
---
oc apply -f manifests/backend -f manifests/frontend
go run ./main.go simulate
promtool tsdb create-blocks-from openmetrics cluster-health-analyzer-openmetrics.txt
for d in data/*; do
 echo $d
 kubectl cp $d openshift-monitoring/prometheus-k8s-0:/prometheus -c prometheus
done
---

the prometheus-k8s-0 name comes from the cluster you have open

Reference https://redhat-internal.slack.com/archives/C07RV4GPQSV/p1737561323553629