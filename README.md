# Internal Development Platform 

## Working Locally

Stack:
- KinD 
- FluxCD
- Docker/Podman

### KinD Ingress

Add any ingress hosts to your `/etc/hosts/` file, aliasing them to `localhost`.

```
# Enable local LB
cloud-provider-kind -enable-lb-port-mapping

# Get load balancer port
LB_PORT=$(docker port $(docker ps | grep envoy | awk '{print $1}') | awk '{print $3}' | cut -d ':' -f 2 | head -n 1)
```

Next, make sure `cloud-provider-kind` is running. Once it comes up and you see an External IP assigned to your load balancer, run the second command to get the port.
