Naiscaper
=========

Remember to `make bump`, before `make build push`!

# Usage
`./naiscaper <base_dir> <override_dir> <output_dir>`
where:
- `base_dir` is a directory containing yaml files
- `override_dir` is a directory optionally containing yaml files with values that will overwrite the values from `base_dir`
- `output_dir` is a directory (which will be completely wiped!) where merged files are stored

# Example
Example file from `base_dir/file.yaml`
```yaml
key: value
setting: default
```

Example file from `override_dir/file.yaml`
```yaml
setting: specific
```

This would produce the following output `output_dir/file.yaml`:
```yaml
key: value
setting: specific
```
