oc apply -f minio.yaml

oc apply -f loki-operator-namespace.yaml
oc apply -f loki-operator-subscription.yaml
# operator-group for loki too?

oc apply -f logging-operator-namespace.yaml
oc apply -f logging-operator-group.yaml
oc apply -f logging-operator-subscription.yaml 

# create a wait here so CRD for LokiStack are loaded
oc apply -f loki-stack.yaml
oc apply -f cluster-logging.yaml

oc get pods -n openshift-logging 