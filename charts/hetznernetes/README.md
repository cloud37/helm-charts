# hetznernetes

A Helm Chart for running a Cluster API based Kubernetes Cluster on Hetzner.

## TL;DR;

```console
helm repo add cloud37 https://cloud37.github.io/helm-charts
helm repo update
helm install my-cluster cloud37/hetznernetes
```

## Introduction

This chart bootstraps a [Cluster-API based]() [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager in the Hetzner Cloud.

## Prerequisites

- Kubernetes 1.19+
- Cluster API installed
- Cluster API Providers installed

## Cluster API Background

Cluster API consists of basically four components:

- Core Provider: the Cluster API controllers and components
- Infrastructure Provider: responsible for provisiong the resources in the Cloud Provider (like Hetzner Cloud)
- Bootstrap Provider: responsible for turning a server into a Kubernetes node
- Control Plane Provider: responsible for running the Kubernetes Control Plane components on the dedicated Control Plane nodes

For more information about the high level concepts, refer to [the official documentation](https://cluster-api.sigs.k8s.io/user/concepts).

## Supported Cluster API Providers

At the moment this Helm Charts supports the following Cluster API Providers:

- Bootstrap Provider:

  - [ ] Amazon Elastic Kubernetes Service (EKS)
  - [x] Kubeadm
  - [ ] MicroK8s
  - [ ] Oracle Cloud Native Environment (OCNE)
  - [ ] Talos
  - [ ] K3s
  - [ ] k0smotron/k0s

- Control Plane Provider:
  - [x] Kubeadm
  - [ ] MicroK8s
  - [ ] Nested
  - [ ] Oracle Cloud Native Environment (OCNE)
  - [ ] Talos
  - [ ] Kamaji
  - [ ] K3s
  - [ ] k0smotron/k0s

As this Chart is only intened to be used for creating Clusters on Hetzner, we only support [the Hetzner Infrastructure Provider provided by syself](https://github.com/syself/cluster-api-provider-hetzner).

## Installing the Chart

To install the chart with the release name `my-cluster`:

```console
helm repo add cloud37 https://cloud37.github.io/helm-charts
helm repo update
helm install my-cluster cloud37/hetznernetes
```

These commands deploys Baserow on the Kubernetes cluster in the default configuration. The [Values](#values) section lists the values that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall the `my-cluster` deployment:

```console
helm uninstall my-cluster
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Values

| Key                              | Type   | Default          | Description                                                                                                                                  |
| -------------------------------- | ------ | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| cluster.name                     | string | `""`             | Define the name of the cluster. If not set, `"hetznernetes.fullname"` will be used.                                                          |
| containerd.version               | string | `"1.7.17"`       | The containerd version that should be used in the form MAJOR.MINOR.PATH without a leading "v".                                               |
| fullnameOverride                 | string | `""`             | String to fully override `"hetznernetes.fullname"`                                                                                           |
| hetzner.controlPlane.imageName   | string | `"ubuntu-22.04"` | image that should be used to install the control plane                                                                                       |
| hetzner.controlPlane.serverType  | string | `"cpx21"`        | server type that should be used for the control plane                                                                                        |
| hetzner.region                   | string | `"nbg1"`         | contains the name of the HCloud location where all components (VMs, LoadBalancer) will be running. Valid values: fsn1, hel1, nbg1, ash, hil. |
| hetzner.sshKeys.hcloud           | list   | `[]`             | Defines the SSH keys used for hcloud.                                                                                                        |
| hetzner.workerPlane.imageName    | string | `"ubuntu-22.04"` | image that should be used to install the control plane                                                                                       |
| hetzner.workerPlane.serverType   | string | `"cpx31"`        | server type that should be used for the control plane                                                                                        |
| kubernetes.controlPlane.replicas | int    | `3`              | How many control-planes should be running                                                                                                    |
| kubernetes.version               | string | `"1.31.0"`       | The Kubernetes version that should be used in the form MAJOR.MINOR.PATH without a leading "v".                                               |
| kubernetes.workerPlane.replicas  | int    | `3`              | How many worker-planes should be running                                                                                                     |
| nameOverride                     | string | `""`             | Provide a name in place of `hetznernetes`                                                                                                    |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-cluster -f values.yaml cloud37/hetznernetes
```
