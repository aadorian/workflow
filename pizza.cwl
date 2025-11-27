cwlVersion: v1.2

class: CommandLineTool
label: Pizza CWL Workflow
doc: A Common Workflow Language tool definition that implements a simple echo command with pizza ontology and documentation inputs.


baseCommand: echo

# Input parameters for the workflow
inputs:
  # Message string input with default value
  message:
    type: string
    default: "Hola Mundo"
    doc: "A customizable message string to be displayed"
    inputBinding:
      position: 1
  
  # Pizza ontology file (OWL format)
  pizza_owl:
    type: File
    default:
      class: File
      path: pizza.owl
    doc: "Pizza ontology file in OWL format"
    inputBinding:
      position: 2
  
  # README documentation file
  readme:
    type: File
    default:
      class: File
      path: README.md
    doc: "Project documentation file"
    inputBinding:
      position: 3

# Outputs (empty for this simple echo example)
outputs: []

