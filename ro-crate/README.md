# CWL Hello World Example

This is a simple "Hello World" example demonstrating the Common Workflow Language (CWL).

## What is CWL?

Common Workflow Language (CWL) is an open standard for describing how to run command line tools and connect them to create workflows.

Tools and workflows described using CWL are portable across a variety of platforms that support the CWL standards. Using CWL, it is easy to scale complex data analysis and machine learning workflows from a single developer's laptop up to massively parallel cluster, cloud and high performance computing environments.

## Files

- `pizza.cwl` - The CWL tool description file
- `pizza-job.json` - An example input file with custom message
- `ro-crate/` - A Research Object Crate (RO-Crate) packaging of this workflow for reproducible research

## Prerequisites

- Node.js (>=14.0.0) and npm (>=6.0.0)
- Python 3.x
- Git

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/aadorian/workflow.git
cd workflow
```

### 2. Install Dependencies

The project includes automated setup that installs `cwltool` and builds the RO-Crate:

```bash
# Automatic setup (recommended)
npm install

# Or manual setup
npm run install:cwltool  # Install cwltool
npm run setup            # Install cwltool and build RO-Crate
```

### 3. Verify Installation

```bash
# Validate CWL workflow
npm run cwl:validate

# Test workflow execution
npm start
```

### 4. Build RO-Crate

The RO-Crate is automatically built during setup, but you can rebuild it manually:

```bash
npm run ro-crate:build
```

This will:
- Create/rebuild the `ro-crate/` directory
- Generate RO-Crate metadata
- Create a git tag (if it doesn't exist)

## Usage

### Using npm scripts

This project includes npm scripts for easy workflow execution:

#### CWL Workflow

```bash
# Start/run the CWL workflow
npm start
# or
npm run cwl:start

# Validate the CWL workflow (syntax check)
npm run cwl:validate

# Remove CWL cache
npm run cwl:remove
```

#### RO-Crate

```bash
# Start/run the workflow from RO-Crate
npm run ro-crate:start

# Build the RO-Crate
npm run ro-crate:build

# Remove the RO-Crate
npm run ro-crate:remove
```

### Using cwltool directly

```bash
# Run the workflow
python3 -m cwltool pizza.cwl pizza-job.json

# Validate the workflow
python3 -m cwltool --validate pizza.cwl
```

## RO-Crate Example

![Research Objects Illustration](https://www.researchobject.org/images/research-objects-illustration-1920.png)

This repository includes an [RO-Crate](https://www.researchobject.org/ro-crate/) example in the `ro-crate/` directory. RO-Crate is a lightweight approach to packaging research data with metadata, making research Findable, Accessible, Interoperable, and Reusable (FAIR).

The RO-Crate includes:
- The CWL workflow files
- Structured metadata in `ro-crate-metadata.json`
- Documentation

See `ro-crate/README.md` for more details about the RO-Crate structure and usage.

## Contributing

We welcome contributions! This repository uses [Conventional Commits](https://www.conventionalcommits.org/) for commit messages. See [CONVENTIONAL_COMMITS.md](CONVENTIONAL_COMMITS.md) for details.

Please read our [Code of Conduct](CODE_OF_CONDUCT.md) before contributing. For detailed contribution guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

### Reporting Issues

Found a bug or have a feature request? Please open an issue using our templates:
- 🐛 [Bug Report](https://github.com/aadorian/workflow/issues/new?template=bug_report.md)
- 💡 [Feature Request](https://github.com/aadorian/workflow/issues/new?template=feature_request.md)

When reporting bugs, please include:
- Steps to reproduce the issue
- Expected vs actual behavior
- Environment information (OS, Python version, cwltool version, etc.)
- Error messages or logs
- CWL workflow files if applicable

### Example commit messages:
```bash
feat: add hello world CWL example
fix(cwl): correct output handling
docs: update README with CWL info
```

A git hook validates commit messages automatically. The CI workflow also enforces conventional commit standards on pull requests.

### Development Workflow

1. **Make your changes** to CWL files, documentation, or scripts

2. **Validate your changes locally**:
   ```bash
   # Validate CWL files
   npm run cwl:validate
   
   # Build and validate RO-Crate
   npm run ro-crate:build
   
   # Test workflow execution
   npm start
   ```

3. **Stage your changes**:
   ```bash
   git add .
   ```

4. **Commit using Conventional Commits**:
   ```bash
   git commit -m "feat: add new feature"
   # or
   git commit -m "fix(cwl): fix bug in workflow"
   # or
   git commit -m "docs: update documentation"
   ```
   
   **Note**: The pre-commit hook will automatically:
   - Build the RO-Crate
   - Stage the RO-Crate directory
   - Validate your commit message format

5. **Push to remote**:
   ```bash
   git push workflow master
   # or
   git push origin master
   ```
   
   **Note**: GitHub Actions will automatically:
   - Validate all CWL files
   - Build and validate RO-Crate
   - Test workflow execution
   - Check commit message format

### CI/CD Validation

All pushes and pull requests are automatically validated:
- ✅ CWL files are validated for syntax and correctness
- ✅ RO-Crate is built and validated
- ✅ RO-Crate metadata is checked
- ✅ Workflows are tested for execution
- ✅ Conventional commit messages are enforced

See `.github/workflows/` for the complete CI/CD pipeline configuration.

**Important**: If CI validation fails, the push/merge will be blocked. Fix any validation errors before pushing again.

## Release Information

For information about releases and versioning, see [RELEASE_PROCEDURE.md](RELEASE_PROCEDURE.md). The project follows [Semantic Versioning](https://semver.org/).

All release notes are documented in [CHANGELOG.md](CHANGELOG.md).

## Troubleshooting

### CWL Validation Fails

If CWL validation fails:

```bash
# Check CWL syntax
npm run cwl:validate

# Common issues:
# - Missing cwlVersion at the top of the file
# - Invalid YAML syntax
# - Missing required fields
```

### RO-Crate Build Fails

If RO-Crate build fails:

```bash
# Rebuild RO-Crate
npm run ro-crate:remove
npm run ro-crate:build

# Check that all required files exist:
# - pizza.cwl
# - pizza-job.json
# - pizza.owl
# - README.md
```

### Commit Message Validation Fails

If your commit message is rejected:

- Use Conventional Commits format: `<type>: <description>`
- Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`
- Example: `feat: add new workflow step`

### CI/CD Validation Fails

If GitHub Actions validation fails:

1. Check the Actions tab in GitHub for detailed error messages
2. Run validation locally:
   ```bash
   npm run cwl:validate
   npm run ro-crate:build
   ```
3. Fix any errors and push again

### cwltool Not Found

If `cwltool` command is not found:

```bash
# Install cwltool
npm run install:cwltool

# Or manually
pip3 install --user cwltool

# Verify installation
python3 -m cwltool --version
```

## Learn More

- Official Website: https://www.commonwl.org/
- CWL Specification: https://www.commonwl.org/specification/
- Getting Started Guide: https://www.commonwl.org/getting-started/
- Research Objects / RO-Crate: https://www.researchobject.org/
- RO-Crate Specification: https://www.researchobject.org/ro-crate/
- Conventional Commits: https://www.conventionalcommits.org/


