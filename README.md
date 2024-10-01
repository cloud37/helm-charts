# Kubernetes Helm Charts

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/christianhuth)](https://artifacthub.io/packages/search?repo=christianhuth)

These charts are provided as-is with no warranties.

## Usage

[Helm](https://helm.sh) must be installed to use the charts, please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```shell
helm repo add cloud37 https://charts.cloud37.io
helm repo update
```

You can then run `helm search repo cloud37` to see the charts.

## License

[MIT License](./LICENSE).

## List of available Charts

| Chart name                                                  | Image source                                                                                | Description                                                                                                                                                |
|-------------------------------------------------------------|---------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [hetznernetes](./charts/hetznernetes)                                 | --- | Create a Kubernetes Cluster on Hetzner with Cluster API                         |
