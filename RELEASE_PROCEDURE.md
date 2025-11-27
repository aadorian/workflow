# Release Procedure

This document outlines the procedure for creating releases of this project. Following this procedure ensures consistent, reproducible, and well-documented releases.

## Version Numbering

This project follows [Semantic Versioning](https://semver.org/) (SemVer):

- **MAJOR** version (X.0.0): Incompatible API changes
- **MINOR** version (0.X.0): New functionality in a backwards-compatible manner
- **PATCH** version (0.0.X): Backwards-compatible bug fixes

Example: `1.2.3` = Major 1, Minor 2, Patch 3

## Pre-Release Checklist

Before creating a release, ensure:

- [ ] All tests pass (`npm run cwl:validate`)
- [ ] CWL workflows validate successfully
- [ ] RO-Crate builds correctly (`npm run ro-crate:build`)
- [ ] Documentation is up to date (README.md, CHANGELOG.md)
- [ ] All changes are committed and pushed
- [ ] CI/CD pipeline passes
- [ ] No breaking changes (or they are documented)

## Release Steps

### 1. Update Version Number

Update the version in `package.json`:

```bash
# For a patch release (1.0.0 -> 1.0.1)
npm version patch

# For a minor release (1.0.0 -> 1.1.0)
npm version minor

# For a major release (1.0.0 -> 2.0.0)
npm version major
```

This command will:
- Update `package.json` version
- Create a git commit with the version change
- Create a git tag (e.g., `v1.0.1`)

**Note**: If you prefer manual versioning, edit `package.json` directly and commit:

```bash
# Edit package.json manually, then:
git add package.json
git commit -m "chore: bump version to X.Y.Z"
git tag vX.Y.Z
```

### 2. Update CHANGELOG.md

Create or update `CHANGELOG.md` with the new release information:

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- New feature description

### Changed
- Change description

### Fixed
- Bug fix description

### Removed
- Removed feature description (if any)
```

Follow the [Keep a Changelog](https://keepachangelog.com/) format.

### 3. Build RO-Crate

The RO-Crate is automatically built by the `prepublishOnly` script, but you can build it manually:

```bash
npm run ro-crate:build
```

This will:
- Create/rebuild the `ro-crate/` directory
- Generate `ro-crate-metadata.json` with current date
- Create a git tag `ro-crate-vX.Y.Z` (if it doesn't already exist)

### 4. Commit Release Changes

Commit all release-related changes:

```bash
git add package.json CHANGELOG.md ro-crate/
git commit -m "chore: release vX.Y.Z"
```

### 5. Push to Remote

Push commits and tags to the remote repository:

```bash
# Push commits
git push workflow master

# Push tags (including version tag and RO-Crate tag)
git push workflow --tags
```

### 6. Create GitHub Release

1. Go to the [Releases page](https://github.com/aadorian/workflow/releases) on GitHub
2. Click "Draft a new release"
3. Select the tag you just created (e.g., `v1.0.1`)
4. Set the release title to the version number (e.g., `v1.0.1`)
5. Copy the relevant section from `CHANGELOG.md` into the release description
6. Optionally attach the RO-Crate as a release asset:
   - Download the `ro-crate/` directory as a zip file
   - Upload it as a release asset
7. Mark as "Latest release" if this is the newest version
8. Click "Publish release"

### 7. Verify Release

After publishing, verify:

- [ ] GitHub release is published
- [ ] Release notes are correct
- [ ] RO-Crate tag was created (`ro-crate-vX.Y.Z`)
- [ ] CI/CD pipeline passed
- [ ] RO-Crate can be downloaded and validated

## Automated Release (Future Enhancement)

For future automation, consider:

- GitHub Actions workflow for automated releases
- Automated CHANGELOG generation from commits
- Automated RO-Crate packaging and upload
- Automated version bumping based on conventional commits

## Release Types

### Patch Release (X.Y.Z -> X.Y.Z+1)

Use for:
- Bug fixes
- Documentation updates
- Minor improvements

Example:
```bash
npm version patch
# Updates 1.0.0 -> 1.0.1
```

### Minor Release (X.Y.Z -> X.Y+1.0)

Use for:
- New features
- New CWL workflows
- Backwards-compatible changes

Example:
```bash
npm version minor
# Updates 1.0.0 -> 1.1.0
```

### Major Release (X.Y.Z -> X+1.0.0)

Use for:
- Breaking changes
- Major refactoring
- Incompatible API changes

Example:
```bash
npm version major
# Updates 1.0.0 -> 2.0.0
```

## Post-Release

After a successful release:

1. **Update Documentation**: Ensure README.md reflects the latest version
2. **Announce**: Share the release on relevant channels (if applicable)
3. **Monitor**: Watch for issues or feedback related to the release
4. **Plan Next Release**: Start planning the next release cycle

## Emergency Releases

For critical bug fixes that need immediate release:

1. Create a hotfix branch from the current release tag
2. Apply the fix
3. Follow the normal release procedure
4. Merge the hotfix back into main/master

## RO-Crate Release Tags

Each release automatically creates two tags:

- `vX.Y.Z` - Standard version tag
- `ro-crate-vX.Y.Z` - RO-Crate build tag (created during `ro-crate:build`)

Both tags should be pushed to the remote repository.

## Troubleshooting

### Tag Already Exists

If a tag already exists, the build script will skip tag creation. To force a new tag:

```bash
git tag -d vX.Y.Z  # Delete local tag
git push workflow :refs/tags/vX.Y.Z  # Delete remote tag
# Then re-run the release procedure
```

### RO-Crate Build Fails

If RO-Crate build fails:

1. Check that all required files exist
2. Verify CWL files are valid
3. Check build script permissions: `chmod +x scripts/build-ro-crate.sh`
4. Review build script output for errors

### Version Not Updated

If `npm version` doesn't work:

1. Ensure `package.json` is valid JSON
2. Check git status (must be clean or have staged changes)
3. Manually edit `package.json` and commit

## Resources

- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Git Tagging Best Practices](https://git-scm.com/book/en/v2/Git-Basics-Tagging)

