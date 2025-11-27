# Hello World CWL Workflow - RO-Crate

This is a Research Object Crate (RO-Crate) containing a simple "Hello World" example using the Common Workflow Language (CWL).

## What is RO-Crate?

RO-Crate is a lightweight approach to packaging research data with their metadata. It uses schema.org-based JSON-LD to describe datasets, making research Findable, Accessible, Interoperable, and Reusable (FAIR).

Learn more at: https://www.researchobject.org/ro-crate/

## Contents

This RO-Crate contains:

- **hello_world.cwl** - A CWL tool definition that implements a simple echo command
- **hello_world-job.json** - A job input file with a custom message
- **README.md** - This documentation file
- **ro-crate-metadata.json** - RO-Crate metadata describing the package

## Usage

### Prerequisites

Install a CWL runner:

```bash
pip3 install --user cwltool
```

### Running the Workflow

Run with default message:

```bash
python3 -m cwltool hello_world.cwl
```

Run with custom message:

```bash
python3 -m cwltool hello_world.cwl hello_world-job.json
```

## RO-Crate Structure

The `ro-crate-metadata.json` file contains structured metadata that:

- Describes the dataset and its purpose
- Lists all files included in the crate
- Provides file types and formats
- Links to relevant specifications (CWL v1.2)
- Includes licensing information

## Validation

To validate this RO-Crate, you can use tools like:

- [ro-crate-py](https://github.com/ResearchObject/ro-crate-py) - Python library for working with RO-Crates
- [ro-crate-ruby](https://www.researchobject.org/ro-crate-ruby/) - Ruby library for RO-Crates

## License

This RO-Crate is licensed under Apache License 2.0.
