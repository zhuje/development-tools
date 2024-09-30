operators:
	(cd base && oc apply -f 00_projects.yaml && oc apply -f 10_operators.yaml) 
	(cd ../korrel8r && ./wait.sh subscription openshift-opentelemetry-operator opentelemetry-product)
	(cd ../korrel8r && ./wait.sh subscription openshift-tempo-operator tempo-product)

resources: 
	(cd base && oc apply -f hotrod.yaml)
	(cd base && oc apply -f k6_tracing.yaml)
	(cd base && oc apply -f minio.yaml)
	(cd base && oc apply -f openshift_user_workload_monitoring.yaml)
	(cd base && oc apply -f otel_collector_platform.yaml)
	(cd base && oc apply -f otel_collector_user.yaml)
	(cd base && oc apply -f tempo.yaml)

