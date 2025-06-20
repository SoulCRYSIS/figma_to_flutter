#!/usr/bin/env python3

import os
import re
from pathlib import Path

def find_all_asset_directories():
    """Find all subdirectories containing assets"""
    asset_dirs = set()
    
    # Find all directories under assets/icons/
    icons_dir = Path('assets/icons')
    if icons_dir.exists():
        for item in icons_dir.rglob('*'):
            if item.is_dir():
                # Add the directory path with trailing slash for Flutter
                dir_path = str(item) + '/'
                asset_dirs.add(dir_path)
    
    return sorted(asset_dirs)

def update_pubspec_yaml():
    """Update pubspec.yaml with all asset directories"""
    pubspec_path = Path('pubspec.yaml')
    
    if not pubspec_path.exists():
        print("Error: pubspec.yaml not found")
        return False
    
    # Read current pubspec.yaml
    with open(pubspec_path, 'r') as f:
        content = f.read()
    
    # Find all asset directories
    asset_dirs = find_all_asset_directories()
    
    if not asset_dirs:
        print("No asset directories found")
        return True
    
    # Create the assets section with proper indentation
    assets_section = "\n  assets:\n"
    for asset_dir in asset_dirs:
        assets_section += f"    - {asset_dir}\n"
    
    # More robust pattern to match the existing assets section
    # This pattern looks for "assets:" followed by any number of "- " lines
    pattern = r'(\s*assets:\s*\n(?:\s*-\s*[^\n]*\n)*)'
    
    if re.search(pattern, content, re.MULTILINE):
        # Replace existing assets section
        content = re.sub(pattern, assets_section, content, flags=re.MULTILINE)
        print("Replaced existing assets section")
    else:
        # Look for flutter section and add assets after it
        # Handle various flutter section formats
        flutter_patterns = [
            r'(flutter:\s*\n\s*uses-material-design:\s*true\s*)',  # with uses-material-design
            r'(flutter:\s*\n)',  # simple flutter section
        ]
        
        replaced = False
        for flutter_pattern in flutter_patterns:
            if re.search(flutter_pattern, content, re.MULTILINE):
                content = re.sub(flutter_pattern, r'\1' + assets_section, content, flags=re.MULTILINE)
                replaced = True
                print("Added assets section to existing flutter section")
                break
        
        if not replaced:
            # Add flutter section at the end if none exists
            content += f"\nflutter:\n{assets_section}"
            print("Added new flutter section with assets")
    
    # Write back to pubspec.yaml
    with open(pubspec_path, 'w') as f:
        f.write(content)
    
    print(f"Updated pubspec.yaml with {len(asset_dirs)} asset directories:")
    for asset_dir in asset_dirs:
        print(f"  - {asset_dir}")
    
    return True

def list_asset_directories():
    """List all asset directories that should be in pubspec.yaml"""
    asset_dirs = find_all_asset_directories()
    
    print("Asset directories found:")
    for asset_dir in asset_dirs:
        print(f"  - {asset_dir}")
    
    print(f"\nTotal: {len(asset_dirs)} directories")
    
    print("\nTo add to pubspec.yaml manually, add these under flutter > assets:")
    for asset_dir in asset_dirs:
        print(f"    - {asset_dir}")

if __name__ == '__main__':
    import sys
    
    if len(sys.argv) > 1 and sys.argv[1] == '--list':
        list_asset_directories()
    else:
        update_pubspec_yaml() 