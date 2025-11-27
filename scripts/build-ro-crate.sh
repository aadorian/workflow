#!/bin/bash

# Build script for RO-Crate
# This script creates/rebuilds the ro-crate directory
# by moving/copying existing folder elements

set -e

CRATE_DIR="ro-crate"

echo "Building RO-Crate in $CRATE_DIR..."

# Remove existing crate if it exists
if [ -d "$CRATE_DIR" ]; then
  echo "Removing existing RO-Crate..."
  rm -rf "$CRATE_DIR"
fi

# Create crate directory
mkdir -p "$CRATE_DIR"

# Files to include in RO-Crate
FILES_TO_COPY=(
  "pizza.cwl"
  "pizza-job.json"
  "pizza.owl"
  "README.md"
)

# Copy workflow and data files
echo "Copying project files to RO-Crate..."
for file in "${FILES_TO_COPY[@]}"; do
  if [ -f "$file" ]; then
    echo "  - Copying $file"
    cp "$file" "$CRATE_DIR/"
  else
    echo "  - Warning: $file not found, skipping"
  fi
done

# Build hasPart array for metadata
HAS_PART=""
for file in "${FILES_TO_COPY[@]}"; do
  if [ -f "$file" ]; then
    if [ -n "$HAS_PART" ]; then
      HAS_PART="$HAS_PART,"
    fi
    HAS_PART="$HAS_PART
        {
          \"@id\": \"$file\"
        }"
  fi
done

# Build file metadata entries
FILE_METADATA=""
for file in "${FILES_TO_COPY[@]}"; do
  if [ -f "$file" ]; then
    # Determine file type and encoding format
    case "$file" in
      *.cwl)
        ENCODING="text/x-yaml"
        TYPE="File"
        NAME="Pizza CWL Workflow"
        DESC="A Common Workflow Language tool definition that implements a simple echo command with pizza ontology and documentation inputs."
        CONFORMS_TO=",
      \"conformsTo\": {
        \"@id\": \"https://w3id.org/cwl/v1.2/\"
      }"
        ;;
      *.json)
        ENCODING="application/json"
        TYPE="File"
        NAME="Pizza CWL Job Input"
        DESC="A CWL job input file providing inputs for the pizza workflow including message, pizza ontology, and README."
        CONFORMS_TO=""
        ;;
      *.owl)
        ENCODING="application/rdf+xml"
        TYPE="File"
        NAME="Pizza Ontology"
        DESC="An OWL ontology about pizzas and their toppings, used as an example ontology."
        CONFORMS_TO=""
        ;;
      *.md)
        ENCODING="text/markdown"
        TYPE="File"
        NAME="README Documentation"
        DESC="Documentation for the CWL workflow example."
        CONFORMS_TO=""
        ;;
      *)
        ENCODING="text/plain"
        TYPE="File"
        NAME="${file}"
        DESC="Project file: ${file}"
        CONFORMS_TO=""
        ;;
    esac
    
    if [ -n "$FILE_METADATA" ]; then
      FILE_METADATA="$FILE_METADATA,"
    fi
    FILE_METADATA="$FILE_METADATA
    {
      \"@id\": \"$file\",
      \"@type\": \"$TYPE\",
      \"name\": \"$NAME\",
      \"description\": \"$DESC\",
      \"encodingFormat\": \"$ENCODING\"$([ -n "$CONFORMS_TO" ] && echo "$CONFORMS_TO" || echo "")
    }"
  fi
done

# Create RO-Crate metadata
echo "Creating RO-Crate metadata..."
cat > "$CRATE_DIR/ro-crate-metadata.json" << EOF
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
      "name": "CWL Workflow RO-Crate",
      "description": "A Research Object Crate containing a Common Workflow Language (CWL) example workflow with pizza ontology. This RO-Crate packages the CWL tool definition, job input file, ontology, and documentation to enable reproducible and shareable research workflows.",
      "datePublished": "$(date +%Y-%m-%d)",
      "license": {
        "@id": "https://spdx.org/licenses/Apache-2.0"
      },
      "keywords": [
        "CWL",
        "Common Workflow Language",
        "workflow",
        "reproducibility",
        "research object",
        "OWL",
        "ontology"
      ],
      "hasPart": [$HAS_PART
      ],
      "url": {
        "@id": "https://github.com/aadorian/workflow.git"
      },
      "isBasedOn": {
        "@id": "https://github.com/aadorian/workflow.git"
      },
      "creator": [
        {
          "@type": "Person",
          "name": "Workflow Author"
        }
      ]
    }$([ -n "$FILE_METADATA" ] && echo ",$FILE_METADATA" || echo ""),
    {
      "@id": "https://github.com/aadorian/workflow.git",
      "@type": "Repository",
      "name": "CWL Pizza Workflow Repository",
      "description": "GitHub repository containing the CWL workflow, pizza ontology, and RO-Crate packaging",
      "url": "https://github.com/aadorian/workflow.git",
      "codeRepository": "https://github.com/aadorian/workflow.git"
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

# Create .gitignore
echo "Creating .gitignore..."
cat > "$CRATE_DIR/.gitignore" << 'EOF'
# RO-Crate temporary files
*.tmp
.cwltool_cache/
EOF

echo ""
echo "✅ RO-Crate built successfully in $CRATE_DIR/"
echo "   Files included:"
for file in "${FILES_TO_COPY[@]}"; do
  if [ -f "$CRATE_DIR/$file" ]; then
    echo "   ✓ $file"
  fi
done
echo "   ✓ ro-crate-metadata.json"
echo "   ✓ .gitignore"

# Create git tag if in a git repository
if git rev-parse --git-dir > /dev/null 2>&1; then
  # Try to get version from package.json, fallback to timestamp
  if [ -f "package.json" ]; then
    VERSION=$(grep -o '"version": "[^"]*"' package.json | cut -d'"' -f4)
    if [ -n "$VERSION" ]; then
      TAG_NAME="ro-crate-v${VERSION}"
    else
      TAG_NAME="ro-crate-$(date +%Y%m%d-%H%M%S)"
    fi
  else
    TAG_NAME="ro-crate-$(date +%Y%m%d-%H%M%S)"
  fi
  
  # Check if tag already exists
  if git rev-parse "$TAG_NAME" > /dev/null 2>&1; then
    echo ""
    echo "⚠️  Git tag $TAG_NAME already exists, skipping tag creation"
  else
    echo ""
    echo "Creating git tag: $TAG_NAME"
    git tag -a "$TAG_NAME" -m "RO-Crate build: $(date +%Y-%m-%d\ %H:%M:%S)"
    echo "✅ Git tag created successfully"
    echo "   To push the tag, run: git push origin $TAG_NAME"
  fi
else
  echo ""
  echo "ℹ️  Not in a git repository, skipping tag creation"
fi
