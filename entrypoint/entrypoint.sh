#!/bin/bash

# Prerequisites 
# 1) Must be logged in to an OpenShift cluster as a cluster adminstrator 
# 2) Must have Cluster Observability Operator installed 

# enviornment variables  
OCP=4.18
COO=0.4.0

# Terminal output colors 
GREEN='\033[0;32m'
ENDCOLOR='\033[0m' # No Color
RED='\033[0;31m'

printf "\n"

printf "${GREEN} OCP version: $OCP ${ENDCOLOR}\n"

if [[ $(bc <<< "$OCP == 4.11") -eq 1 ]]; then
    echo "OCP 4.11 compatabile resources..."
    echo "COO: 0.2.0"
    echo "UIPlugins: dashboards\n"
    (cd  ../coo && oc apply -f ui-plugin-dashboards.yaml )
    ./../dashboards/deploy-dashboards.sh
elif [[ $(bc <<< "$OCP >= 4.12") -eq 1 ]] && [[ $(bc <<< "$OCP <= 4.15") -eq 1 ]]; then
    echo "OCP 4.12 - 4.15 compatible resources..."
    echo "COO: 0.3.0+"
    echo "UIPlugins: dashboards, distributed tracing, logging\n"
    ./../dashboards/deploy-dashboards.sh

elif [[ $(bc <<< "$OCP >= 4.16") -eq 1 ]]; then
    echo "OCP 4.16+ compatible resources..."
    echo "COO: 0.3.0+"
    echo "UIPlugins: dashboards, distributed tracing, logging, troubleshooting"

    # dashboards
    (cd  ../coo && oc apply -f ui-plugin-dashboards.yaml )
    (cd  ../dashboards && ./deploy-dashboards.sh )

    # logging, troubleshooting 
    (cd  ../coo && oc apply -f ui-plugin-logging.yaml && oc apply -f ui-plugin-troubleshooting.yaml )
    (cd  ../korrel8r && make operators && make resources)

    

    
else
    echo "OCP version not supported"
fi

