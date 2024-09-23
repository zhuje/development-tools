PHONY: scale-down-monitoring
scale-down-monitoring:
	cd monitoring-plugin && ./scale-down.sh

PHONY: scale-up-monitoring
scale-up-monitoring:
	cd monitoring-plugin && ./scale-up.sh

PHONY: clean-monitoring
scale-up-monitoring:
	cd monitoring-plugin && ./clean-up.sh