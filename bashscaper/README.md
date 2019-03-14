Bashscaper
=========
Bashscaper is a tool to install / upgrade multiple helm charts

*Warning*: running bashscaper will delete any release in the namespace that is not passed to bashscaper.

Remember to `make bump`, before `make build push`!

# Usage
`./bashscaper <namespace> <kube_context> <files...>`
- `namespace` is the namespace where we will install helm charts
- `kube_context` is the `kubectl config get-contexts` to use
- `files` is 1 or more files containing chart specifications on the following form:

```yaml
name: release-name
release:
  chart: nais/naisd:320.0.0
configuration:
  key: value
```

- `name` is the name override (default name will be filename without .yaml)
- `release` specified which helm chart to install
- `configuration` is the helm values

# Example
See [nais-tpa](https://github.com/navikt/nais-tpa)
