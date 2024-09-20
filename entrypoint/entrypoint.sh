#!/bin/bash

# Prerequisites 
# 1) Must be logged in to an OpenShift cluster as a cluster adminstrator 

# enviornment variables  
OCP=4.18
COO=0.4.0

echo "Detected OCP version $OCP"

if [[ $(bc <<< "$OCP == 4.11") -eq 1 ]]; then
    echo "OCP 4.11 compatabile resources..."
    echo "COO: 0.2.0"
    echo "UIPlugins: dashboards\n"
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
   
    (cd  ../dashboards && ./deploy-dashboards.sh )
    pwd

else
    echo "OCP version not supported"
fi

