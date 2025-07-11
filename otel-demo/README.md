# Monitoring Microservices application using OpenTelemetry 
Reference Documentation: https://opentelemetry.io/docs/

### Refer the Blog for Step-by-Step Setup details
```
https://ezyinfra.dev/blog/switch-to-opentelemetry
```

### Prerequisites Installations
```
# Docker Installation

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world


# k3d installation (light weight installation)
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

k3d cluster create mycluster

# helm installation
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

```

# 1. Install and Configure Microservices Application:  

    cd opentelemetry-app
    kubectl create namespace otel-demo
    kubectl apply -f .

# 2. Install and Configure Open Telemetry Collector:  

This will collect traces from application and captures at the collector port.

    cd opentelemetry-collector
    kubectl apply -f .

# 3. Install and Configure Jaeger:  

    cd jaeger
    kubectl apply -f .

# 4. Install and Configure Prometheus:  

    cd prometheus
    kubectl apply -f .

# 5. Install and Configure Grafana:  

    cd grafana
    kubectl apply -f .
