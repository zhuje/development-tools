# Terminal output colors 
GREEN='\033[0;32m'
ENDCOLOR='\033[0m' # No Color
RED='\033[0;31m'

printf "\n"

printf "${GREEN} *** Deploying Tracing : UIPlugin *** ${ENDCOLOR}\n" 
oc apply -f ui-plugin-tracing.yaml

printf "${GREEN} *** Deploying Tracing : TempoStack *** ${ENDCOLOR}\n" 
oc apply -f prometheus-datasource-example.yaml
oc apply -f prometheus-dashboard-example.yaml 

printf "\n"