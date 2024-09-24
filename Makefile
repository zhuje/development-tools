PHONY: coo-resources
coo-resources:
	cd entrypoint && ./entrypoint.sh

PHONY: scale-up-monitoring
scale-up-monitoring:
	cd monitoring-plugin && ./scale-up.sh

PHONY: scale-down-monitoring
scale-down-monitoring:
	cd monitoring-plugin && ./scale-down.sh

PHONY: clean-monitoring
clean-monitoring:
	cd monitoring-plugin && ./clean-up.sh