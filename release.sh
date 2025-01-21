#!/bin/bash

# Check if version parameter is provided
if [ -z "$1" ]; then
    echo "Please provide a version number (e.g., 0.1.2)"
    exit 1
fi

VERSION=$1

# Validate version format (x.y.z)
if ! [[ $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid version format. Please use semantic versioning (e.g., 0.1.2)"
    exit 1
fi

# Update podspec version
sed -i '' 's/spec.version *= *".*"/spec.version      = "'$VERSION'"/' Noibu.podspec

# Verify the version was updated
if ! grep -q "spec.version.*\"$VERSION\"" Noibu.podspec; then
    echo "Failed to update version in podspec"
    exit 1
fi

# Commit changes
git add .
git commit -m "chore: bump version to $VERSION"
git push

# Create and push tag
git tag -a "v$VERSION" -m "Release v$VERSION"
git push origin "v$VERSION"

# Push to CocoaPods
echo "Publishing to CocoaPods..."
pod trunk push Noibu.podspec

echo "✅ Release v$VERSION completed!" 