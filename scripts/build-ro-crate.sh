#!/bin/bash

# Build script for RO-Crate
# This script creates/rebuilds the hello_world-ro-crate directory

set -e

CRATE_DIR="hello_world-ro-crate"

echo "Building RO-Crate in $CRATE_DIR..."

# Remove existing crate if it exists
if [ -d "$CRATE_DIR" ]; then
  echo "Removing existing RO-Crate..."
  rm -rf "$CRATE_DIR"
fi

# Create crate directory
mkdir -p "$CRATE_DIR"

# Copy CWL files
echo "Copying CWL files..."
cp hello_world.cwl "$CRATE_DIR/"
cp hello_world-job.json "$CRATE_DIR/"

# Create RO-Crate metadata
echo "Creating RO-Crate metadata..."
cat > "$CRATE_DIR/ro-crate-metadata.json" << 'EOF'
{
  "@context": "https://w3id.org/ro/crate/1.1/context",
  "@graph": [
    {
      "@id": "ro-crate-metadata.json",
      "@type": "CreativeWork",
      "conformsTo": {
        "@id": "https://w3id.org/ro/crate/1.1"
      },
      "about": {
        "@id": "./"
      }
    },
    {
      "@id": "./",
      "@type": "Dataset",
      "name": "Hello World CWL Workflow RO-Crate",
      "description": "A Research Object Crate containing a Common Workflow Language (CWL) hello world example workflow. This RO-Crate packages the CWL tool definition, job input file, and documentation to enable reproducible and shareable research workflows.",
      "datePublished": "2025-01-27",
      "license": {
        "@id": "https://spdx.org/licenses/Apache-2.0"
      },
      "keywords": [
        "CWL",
        "Common Workflow Language",
        "workflow",
        "reproducibility",
        "research object"
      ],
      "hasPart": [
        {
          "@id": "hello_world.cwl"
        },
        {
          "@id": "hello_world-job.json"
        },
        {
          "@id": "README.md"
        }
      ],
      "creator": [
        {
          "@type": "Person",
          "name": "Workflow Author"
        }
      ]
    },
    {
      "@id": "hello_world.cwl",
      "@type": "File",
      "name": "Hello World CWL Tool",
      "description": "A Common Workflow Language tool definition that implements a simple echo command with a customizable message parameter.",
      "encodingFormat": "text/x-yaml",
      "conformsTo": {
        "@id": "https://w3id.org/cwl/v1.2/"
      }
    },
    {
      "@id": "hello_world-job.json",
      "@type": "File",
      "name": "Hello World CWL Job Input",
      "description": "A CWL job input file providing a custom message for the hello_world workflow.",
      "encodingFormat": "application/json"
    },
    {
      "@id": "README.md",
      "@type": "File",
      "name": "README Documentation",
      "description": "Documentation for the Hello World CWL workflow example.",
      "encodingFormat": "text/markdown"
    },
    {
      "@id": "https://w3id.org/cwl/v1.2/",
      "@type": "CreativeWork",
      "name": "Common Workflow Language v1.2"
    },
    {
      "@id": "https://spdx.org/licenses/Apache-2.0",
      "@type": "CreativeWork",
      "name": "Apache License 2.0"
    }
  ]
}
EOF

# Create README
echo "Creating README..."
cat > "$CRATE_DIR/README.md" << 'EOF'
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
EOF

# Create .gitignore
echo "Creating .gitignore..."
cat > "$CRATE_DIR/.gitignore" << 'EOF'
# RO-Crate temporary files
*.tmp
.cwltool_cache/
EOF

echo "✅ RO-Crate built successfully in $CRATE_DIR/"
echo "   Files created:"
echo "   - hello_world.cwl"
echo "   - hello_world-job.json"
echo "   - ro-crate-metadata.json"
echo "   - README.md"
echo "   - .gitignore"

