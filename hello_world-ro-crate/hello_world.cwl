cwlVersion: v1.2
class: CommandLineTool
baseCommand: echo
inputs:
  message:
    type: string
    default: "Hola Mundo"
    inputBinding:
      position: 1
  pizza_owl:
    type: File
    default:
      class: File
      path: pizza.owl
    inputBinding:
      position: 2
outputs: []

