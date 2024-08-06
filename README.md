# dev-container-features

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://img.shields.io/github/license/gvatsal60/dev-container-features)
[![DevContainer Features - Release](https://github.com/gvatsal60/dev-container-features/actions/workflows/release.yaml/badge.svg)](https://github.com/gvatsal60/dev-container-features/actions/workflows/release.yaml)
[![DevContainer Features - Test](https://github.com/gvatsal60/dev-container-features/actions/workflows/test.yaml/badge.svg)](https://github.com/gvatsal60/dev-container-features/actions/workflows/test.yaml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/gvatsal60/dev-container-features/master.svg)](https://results.pre-commit.ci/latest/github/gvatsal60/dev-container-features/HEAD)
![GitHub pull-requests](https://img.shields.io/github/issues-pr/gvatsal60/dev-container-features)
![GitHub Issues](https://img.shields.io/github/issues/gvatsal60/dev-container-features)
![GitHub forks](https://img.shields.io/github/forks/gvatsal60/dev-container-features)
![GitHub stars](https://img.shields.io/github/stars/gvatsal60/dev-container-features)

This repository demonstrates setting up a pre-commit hook in Visual Studio Code (VS Code) development container.

## Prerequisites

Make sure you have the following installed:

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker](https://www.docker.com/)
- [Remote - Containers extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Getting Started

Add this to your `devcontainer.json`

### pre-commit (via pip)

See also: <https://github.com/pre-commit/pre-commit>

```json
"features": {
    "ghcr.io/gvatsal60/dev-container-features/pre-commit": {}
}
```

### sonarlint

```json
"features": {
    "ghcr.io/gvatsal60/dev-container-features/sonarlint": {}
}
```

## Contributing

Contributions are welcome! Please read our
[Contribution Guidelines](https://github.com/gvatsal60/dev-container-features/blob/HEAD/CONTRIBUTING.md)
before submitting pull requests.

## License

This project is licensed under the Apache License 2.0 License - see the
[LICENSE](https://github.com/gvatsal60/dev-container-features/blob/HEAD/LICENSE) file for details.
