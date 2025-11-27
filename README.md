# CWL Hello World Example

This is a simple "Hello World" example demonstrating the Common Workflow Language (CWL).

## What is CWL?

Common Workflow Language (CWL) is an open standard for describing how to run command line tools and connect them to create workflows.

Tools and workflows described using CWL are portable across a variety of platforms that support the CWL standards. Using CWL, it is easy to scale complex data analysis and machine learning workflows from a single developer's laptop up to massively parallel cluster, cloud and high performance computing environments.

## Key Features

- **OPEN AND FREE**: Free and open standards
- **COMMUNITY FIRST**: Community is a core principle of the CWL Project
- **INTEROPERABILITY AND PORTABILITY**: Portable and interoperable across a variety of software and deployment environments
- **VENDOR NEUTRALITY**: Developed by a multi-vendor working group of organizations and individuals/contributors
- **REUSABILITY AND REPRODUCIBILITY**: Enables scientists to reuse and reproduce their data analysis workflows
- **PARALLELIZATION AND SCALE**: Scalable from workstations to cluster, cloud, and high performance computing (HPC) environments
- **ECOSYSTEM SUPPORT**: Supported by an ecosystem of tools, libraries, and editor plugins
- **TRANSPARENT GOVERNANCE**: Designed with an open and transparent governance

## Files

- `hello_world.cwl` - The CWL tool description file
- `hello_world-job.json` - An example input file with custom message

## Prerequisites

Install a CWL runner. The most common one is `cwltool`:

```bash
pip3 install --user cwltool
```

## Usage

### Run with default message

```bash
python3 -m cwltool hello_world.cwl
```

This will output: `Hello World`

### Run with custom message

```bash
python3 -m cwltool hello_world.cwl hello_world-job.json```

This will output: `Hello from CWL!`

## Contributing

This repository uses [Conventional Commits](https://www.conventionalcommits.org/) for commit messages. See [CONVENTIONAL_COMMITS.md](CONVENTIONAL_COMMITS.md) for details.

### Example commit messages:
```bash
feat: add hello world CWL example
fix(cwl): correct output handling
docs: update README with CWL info
```

A git hook validates commit messages automatically. The CI workflow also enforces conventional commit standards on pull requests.

## Learn More

- Official Website: https://www.commonwl.org/
- CWL Specification: https://www.commonwl.org/specification/
- Getting Started Guide: https://www.commonwl.org/getting-started/
- Conventional Commits: https://www.conventionalcommits.org/


