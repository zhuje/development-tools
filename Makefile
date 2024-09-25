PHONY: coo-resources
coo-resources:
	cd entrypoint && ./entrypoint.sh

PHONY: monitoring-scale-up
monitoring-scale-up:
	cd monitoring-plugin && ./scale-up.sh

PHONY: monitoring-scale-down
monitoring-scale-down:
	cd monitoring-plugin && ./scale-down.sh

PHONY: monitoring-cleanup
monitoring-cleanup:
	oc patch clusterversion version --type json -p "$(cat enable-monitoring.yaml)"