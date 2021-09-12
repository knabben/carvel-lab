# carvel-lab

Lab for Carvel toolkit exploring, initial examples for Antrea 1.3.0 deployments, tools used:

1. YTT for values parsing and overlay
2. kapp for deploy tracking

## Kind cluster

Create a temp cluster:

```
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind
kind create cluster
```

## YTT

The complete Antrea is under `default/antrea.yml`, the main file is split on `splits` folder and
must be added by sequence, values are set on `values.yml`:

```
image: "projects.registry.vmware.com/antrea/antrea-ubuntu:v1.3.0"
services:
  port: 443
```

Generate the specs using YTT with this command, the final file will exists on `/tmp/output.yml`:

```
make generate
```

## Kapp deployment

Apply Antrea deployment with the following command:

```
make deploy
```