#!/bin/bash

sleep 15

Add hELM REPOS
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm update

Install kube-prometheus-stack with LoadBalancer for Prometheus and Grafana
helm install my-kube-prometheus-stack prometheus-community/kube-prometheus-stack --version 75.15.1 \
    --namespace monitoring \
    --create-namespace \
    --set prometheus.service.type=LoadBalancer \
    --set grafana.service.type=LoadBalncer \
    --set grafana.adminPassword='Kwasi1991'

echo "Installation started. Use the commands below to get LoadBalancer IPs:"
echo ""

echo "Grafana:"
echo "kubectl get svc -n monitoring kube-prometheus-stack-grafana"
echo ""
echo "kubectl get svc -n monitoring kube-prometheus-stack-prometheus"



