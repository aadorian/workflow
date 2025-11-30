# Example Bug Report

This is an example bug report to demonstrate how to report issues in this project.

---

## Bug Description
The CWL workflow fails to validate when the pizza.owl file path contains spaces.

## Steps to Reproduce
1. Create a directory with spaces: `mkdir "my pizza project"`
2. Copy `pizza.owl` to that directory
3. Update `pizza-job.json` to reference the file with spaces in the path
4. Run: `npm run cwl:build`
5. Observe validation error

## Expected Behavior
The workflow should handle file paths with spaces correctly, either by:
- Automatically escaping spaces in paths
- Providing a clear error message about path handling
- Supporting quoted paths in job files

## Actual Behavior
```
ERROR: Failed to resolve file reference: my pizza project/pizza.owl
```

## Environment
- **OS**: macOS 12.6.0
- **Python Version**: 3.7.0
- **cwltool Version**: 3.1.20230906142556
- **Node Version**: 14.0.0
- **npm Version**: 6.0.0

## CWL Workflow Information
- **Workflow File**: pizza.cwl
- **Job File**: pizza-job.json
- **CWL Version**: v1.2

## Error Messages / Logs
```
[INFO] Resolved 'pizza.cwl' to 'file:///Users/example/Desktop/workFLow/pizza.cwl'
[ERROR] Failed to resolve file reference: my pizza project/pizza.owl
[ERROR] Workflow validation failed
```

## Additional Context
This issue occurs when users organize their project files in directories with spaces, which is common on macOS and Windows systems.

## Possible Solution
1. Update the build script to escape spaces in file paths
2. Add path validation in the CWL workflow
3. Update documentation to recommend avoiding spaces in directory names

## Checklist
- [x] I have searched existing issues to ensure this bug hasn't been reported
- [x] I have provided all relevant environment information
- [x] I have included steps to reproduce the issue
- [x] I have included error messages/logs if available



