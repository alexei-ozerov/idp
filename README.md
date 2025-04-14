# Internal Development Platform 

This repository handles the deployment of an internal development platform to a user's Kubernetes Cluster. It is currently a work in progress and is under active development. The intention behind this repository is to learn and experiment with the tooling utilized in this repo, and enable my own personal development workflow.

## Working Locally

The default local development workflow can be set up using the following tools:
- Docker/Podman
- KinD 

Run `./platform create kind <cluster name>` to spin up a local Kubernetes cluster. 

The default configuration IDP repo configuration will spin up the following stack to your local development cluster once you run `./platform create flux github bootstrap`:
- FluxCD
- LOKI
- Prometheus

### KinD Ingress

Add any ingress hosts to your `/etc/hosts/` file, aliasing them to `localhost`.

```
# Enable local LB
cloud-provider-kind -enable-lb-port-mapping

# Get load balancer port
LB_PORT=$(docker port $(docker ps | grep envoy | awk '{print $1}') | awk '{print $3}' | cut -d ':' -f 2 | head -n 1)
```

Next, make sure `cloud-provider-kind` is running. Once it comes up and you see an External IP assigned to your load balancer, run the second command to get the port.

### Monitoring

Run the following command to enable access to Grafana:

```
kubectl -n monitoring port-forward svc/kube-prometheus-stack-grafana  3000:80 --address 0.0.0.0

```

After this, navigate to http://localhost:3000/dashboards, using the credentials "admin" and "flux" to login.

### Secrets 

[Kubeseal](https://github.com/bitnami-labs/sealed-secrets) is used to facilitate secrets management.

# (ozerova) TODO: Add this functionality into ./platform
Run the following to fetch the public key to encrypt your secrets:

```
kubeseal --fetch-cert \
--controller-name=sealed-secrets-controller \
--controller-namespace=flux-system \
> ${IDP_PROJECT_ROOT}/kubeseal/pub-${CLUSTER_NAME}-secrets.pem
```

