# Contributing Guide

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for all contributors.

## How to Contribute

### Reporting Bugs

Before creating a bug report, please:
1. Search existing issues to ensure the bug hasn't been reported
2. Check if the issue has been fixed in a recent update

When creating a bug report, use the [Bug Report template](.github/ISSUE_TEMPLATE/bug_report.md) and include:
- Clear description of the bug
- Steps to reproduce
- Expected vs actual behavior
- Environment information (OS, Python version, cwltool version, etc.)
- Error messages or logs
- CWL workflow files if applicable

See [example_bug_report.md](.github/ISSUE_TEMPLATE/example_bug_report.md) for a complete example.

### Suggesting Features

We welcome feature suggestions! Use the [Feature Request template](.github/ISSUE_TEMPLATE/feature_request.md) and include:
- Clear description of the feature
- Use case and problem it solves
- Proposed solution
- Alternatives considered

### Pull Requests

1. **Fork the repository** and create a feature branch
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Follow coding standards**:
   - Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages
   - Ensure code is properly commented
   - Follow existing code style

3. **Test your changes**:
   ```bash
   npm run cwl:build
   npm run cwl:start
   npm run ro-crate:build
   ```

4. **Update documentation** if needed (README.md, code comments, etc.)

5. **Commit your changes** using conventional commits:
   ```bash
   git commit -m "feat: add new feature"
   git commit -m "fix: resolve bug in workflow"
   git commit -m "docs: update README"
   ```

6. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create a Pull Request** on GitHub with:
   - Clear title and description
   - Reference related issues
   - Describe changes and testing done

## Development Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/aadorian/workflow.git
   cd workflow
   ```

2. **Install dependencies**:
   ```bash
   pip3 install --user cwltool
   ```

3. **Verify installation**:
   ```bash
   npm run cwl:build
   ```

## Commit Message Guidelines

This project uses [Conventional Commits](https://www.conventionalcommits.org/). Commit messages must follow this format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Examples:
```bash
feat: add pizza ontology support to workflow
fix(cwl): correct file path handling in job inputs
docs: update README with contribution guidelines
```

A git hook validates commit messages automatically.

## Testing

Before submitting a PR, ensure:
- [ ] All existing tests pass
- [ ] New features include appropriate tests
- [ ] CWL workflows validate successfully
- [ ] RO-Crate builds correctly
- [ ] Documentation is updated

## Questions?

- Open a [Discussion](https://github.com/aadorian/workflow/discussions)
- Check existing [Issues](https://github.com/aadorian/workflow/issues)
- Review the [README](README.md) for project information

Thank you for contributing! 🎉


