#!/bin/bash

# Prerequisites 
# 1) Must be logged in to an OpenShift cluster as a cluster adminstrator 

# Enviornment variables  
OCP=$(oc version --output json | jq -r '.openshiftVersion')
echo $OCP
OCP_VERSION="${OCP:0:4}"
echo "$OCP_VERSION"

# OCP_VERSION=4.18
OPERATOR_BUNDLE_V04=${OPERATOR_BUNDLE_V04:="quay.io/gbernal/observability-operator-bundle:0.4.0-dev-tp"}
OPERATOR_BUNDLE_V03=${OPERATOR_BUNDLE_V03:="quay.io/gbernal/observability-operator-bundle:0.3.0-ui-v1-10"}
OPERATOR_BUNDLE_V02=${OPERATOR_BUNDLE_V02:="quay.io/gbernal/observability-operator-bundle:0.2.0-dev-3"}

# Terminal output colors 
GREEN='\033[0;32m'
ENDCOLOR='\033[0m' # No Color
RED='\033[0;31m'

deploy_observability_operator(){
    echo "Deploying Observability Operator with $1"

    operator-sdk run bundle \
    $1 \
    --install-mode AllNamespaces \
    --namespace openshift-operators \
	--security-context-config restricted
}

deploy_dashboards() {
    (cd  ../coo && oc apply -f ui-plugin-dashboards.yaml )
    (cd  ../dashboards && ./deploy-dashboards.sh )
}

deploy_korrel8r(){
    (cd  ../coo && oc apply -f ui-plugin-logging.yaml && oc apply -f ui-plugin-troubleshooting.yaml )
    (cd  ../korrel8r && cd openshift && make operators && make resources)
}

printf "\n${GREEN} OCP version: $OCP_VERSION ${ENDCOLOR}\n"


# Deploy UIPlugins and Observability Operator based on OpenShift Version 
if [[ $(bc <<< "$OCP_VERSION == 4.11") -eq 1 ]]; then
    echo "OCP 4.11 compatabile resources..."
    echo "COO: 0.2.0"
    echo "UIPlugins: dashboards\n"
    # (cd  ../coo && oc apply -f ui-plugin-dashboards.yaml )
    # ./../dashboards/deploy-dashboards.sh

elif [[ $(bc <<< "$OCP_VERSION >= 4.12") -eq 1 ]] && [[ $(bc <<< "$OCP_VERSION <= 4.15") -eq 1 ]]; then
    echo "OCP 4.12 - 4.15 compatible resources..."
    echo "COO: 0.3.0+"
    echo "UIPlugins: dashboards, distributed tracing, logging\n"
    # ./../dashboards/deploy-dashboards.sh

elif [[ $(bc <<< "$OCP_VERSION >= 4.16") -eq 1 ]]; then
    echo "OCP 4.16+ compatible resources..."
    echo "COO: 0.3.0+"
    echo "UIPlugins: dashboards, distributed tracing, logging, troubleshooting"

   # deploy_observability_operator $OPERATOR_BUNDLE_V04

    # dashboards
    # (cd  ../coo && oc apply -f ui-plugin-dashboards.yaml )
    # (cd  ../dashboards && ./deploy-dashboards.sh )

    # deploy_dashboards

    # # logging, troubleshooting, net observe  
    # # (cd  ../coo && oc apply -f ui-plugin-logging.yaml && oc apply -f ui-plugin-troubleshooting.yaml )
    # # (cd  ../korrel8r && cd openshift && make operators && make resources)

    deploy_korrel8r

else
    echo "OCP version not supported"
fi




# # operator-sdk run bundle \
# #     quay.io/gbernal/observability-operator-bundle:0.4.0-dev-tp \
# #     --install-mode AllNamespaces \
# #     --namespace openshift-operators \
# # 	--security-context-config restricted


