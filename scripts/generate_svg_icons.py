#!/usr/bin/env python3

import os
import re
from pathlib import Path

def to_camel_case(snake_str):
    """Convert snake_case to camelCase"""
    components = snake_str.split('_')
    return components[0] + ''.join(x.capitalize() for x in components[1:])

def clean_filename(filename):
    """Clean filename and convert to valid Dart variable name"""
    # Remove file extension
    name = filename.replace('.svg', '')
    
    # Replace special characters with underscore
    name = re.sub(r'[^a-zA-Z0-9]', '_', name)
    
    # Remove multiple underscores
    name = re.sub(r'_+', '_', name)
    
    # Remove leading/trailing underscores
    name = name.strip('_')
    
    # Convert to camelCase
    name = to_camel_case(name.lower())
    
    # Ensure it starts with lowercase letter
    if name and name[0].isupper():
        name = name[0].lower() + name[1:]
    
    return name

def generate_svg_icons():
    """Generate the SVG icons Dart file"""
    
    # Directories
    svg_dir = Path('assets/icons/svg')
    output_file = Path('lib/icons/svg_icons.dart')
    
    # Create output directory if it doesn't exist
    output_file.parent.mkdir(parents=True, exist_ok=True)
    
    # Start writing the file
    with open(output_file, 'w') as f:
        f.write("import 'package:svg_icon_widget/svg_icon_widget.dart';\n\n")
        f.write("class SvgIcons {\n")
        f.write("  SvgIcons._();\n\n")
        
        # Process regular SVG icons
        if svg_dir.exists():
            svg_files = sorted(svg_dir.glob('*.svg'))
            for svg_file in svg_files:
                var_name = clean_filename(svg_file.name)
                if var_name:  # Only add if we have a valid variable name
                    f.write(f"  static const {var_name} = SvgIconData('{svg_file}');\n")
        
        f.write("}\n")
    
    print(f"SVG icons generated successfully in {output_file}")

if __name__ == '__main__':
    generate_svg_icons() 