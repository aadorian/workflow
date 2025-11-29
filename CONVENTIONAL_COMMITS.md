# Conventional Commits

This repository uses [Conventional Commits](https://www.conventionalcommits.org/) to ensure consistent and meaningful commit messages.

## Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

## Scope (Optional)

The scope should be the name of the package affected. Common scopes for this project:
- `cwl`: Changes to CWL workflow files
- `workflow`: Changes to workflow definitions
- `docs`: Documentation changes
- `ci`: CI/CD changes

## Examples

### Simple
```
feat: add hello world CWL example
```

### With scope
```
fix(cwl): correct output file handling
```

### With body
```
feat(workflow): add multi-step workflow example

This adds a new CWL workflow that demonstrates
chaining multiple tools together.
```

### Breaking change
```
feat!: change CWL version to v1.2

BREAKING CHANGE: This requires cwltool >= 3.0
```

## Git Hook

A pre-commit hook is installed to validate commit messages. If your commit message doesn't follow the conventional commits format, the commit will be rejected.

## GitHub Actions

The CI workflow validates that pull requests follow conventional commit standards.

## Resources

- [Conventional Commits Specification](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)


