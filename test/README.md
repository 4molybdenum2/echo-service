# test

## Description


## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] test`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree test`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init test
kpt live apply test --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
