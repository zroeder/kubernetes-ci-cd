#!/bin/bash

MINIKUBEIP=`minikube ip`

yaml="`cat applications/monitor-scale/k8s/deployment.yaml | docker run -e "MINIKUBEIP=$MINIKUBEIP" -i --rm chadmoon/envtpl:latest`"

echo "$yaml" > applications/monitor-scale/k8s/deployment-new.yaml

yaml="`cat applications/puzzle/k8s/deployment.yaml | docker run -e "MINIKUBEIP=$MINIKUBEIP" -i --rm chadmoon/envtpl:latest`"

echo "$yaml" > applications/puzzle/k8s/deployment-new.yaml

yaml="`cat applications/kr8sswordz-pages/k8s/deployment.yaml | docker run -e "MINIKUBEIP=$MINIKUBEIP" -i --rm chadmoon/envtpl:latest`"

echo "$yaml" > applications/kr8sswordz-pages/k8s/deployment-new.yaml

yaml="`cat applications/kr8sswordz-pages/src/constants.tmpl.js | docker run -e "MINIKUBEIP=$MINIKUBEIP" -i --rm chadmoon/envtpl:latest`"

echo "$yaml" > applications/kr8sswordz-pages/src/constants.js