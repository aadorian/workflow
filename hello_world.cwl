cwlVersion: v1.2
class: CommandLineTool
baseCommand: echo
inputs:
  message:
    type: string
    default: "Hola Mundo"
    inputBinding:
      position: 1
outputs: []

