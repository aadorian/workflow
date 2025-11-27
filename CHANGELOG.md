# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Code of Conduct (CODE_OF_CONDUCT.md)
- Release Procedure documentation (RELEASE_PROCEDURE.md)
- Changelog file (CHANGELOG.md)
- Automated RO-Crate creation via postinstall hook
- Pre-commit hook for automatic RO-Crate building
- Setup script for installing cwltool and building RO-Crate
- Git tagging automation when RO-Crate is built

### Changed
- RO-Crate directory renamed from `hello_world-ro-crate` to `ro-crate`
- Moved `cwlVersion` to first line in pizza.cwl for validator compliance

### Fixed
- Fixed cwlVersion positioning in pizza.cwl to resolve validator errors

## [1.0.0] - 2025-01-15

### Added
- Initial release of CWL Hello World example workflow
- Pizza CWL workflow (pizza.cwl) with multiple inputs
- Pizza ontology file (pizza.owl)
- RO-Crate packaging with metadata
- npm scripts for workflow execution
- Conventional Commits support
- GitHub Actions CI/CD workflow
- Contributing guidelines
- README documentation

[Unreleased]: https://github.com/aadorian/workflow/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/aadorian/workflow/releases/tag/v1.0.0

