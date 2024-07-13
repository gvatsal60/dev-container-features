# dev-container-features

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://img.shields.io/github/license/gvatsal60/dev-container-features)
[![build status](https://github.com/gvatsal60/dev-container-features/actions/workflows/readme-checker.yaml/badge.svg)](https://github.com/gvatsal60/dev-container-features/actions/workflows/readme-checker.yaml)
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

See also: https://github.com/pre-commit/pre-commit

### Using pre-commit-hooks with pre-commit

Add this to your `.pre-commit-config.yaml`

```yaml
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.6.0  # Use the ref you want to point at
    hooks:
      - id: trailing-whitespace
```

## Contributing

Contributions are welcome! Please read our
[Contribution Guidelines](https://github.com/gvatsal60/dev-container-features/blob/HEAD/CONTRIBUTING.md)
before submitting pull requests.

## License

This project is licensed under the Apache License 2.0 License - see the
[LICENSE](https://github.com/gvatsal60/dev-container-features/blob/HEAD/LICENSE) file for details.
