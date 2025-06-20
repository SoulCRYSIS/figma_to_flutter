#!/usr/bin/env python3

import os
import re
from pathlib import Path

def to_camel_case(snake_str):
    """Convert snake_case to camelCase"""
    components = snake_str.split('_')
    return components[0] + ''.join(x.capitalize() for x in components[1:])

def clean_folder_name(folder_name):
    """Clean folder name and convert to camelCase component"""
    # Replace special characters with underscore
    name = re.sub(r'[^a-zA-Z0-9]', '_', folder_name)
    # Remove multiple underscores
    name = re.sub(r'_+', '_', name)
    # Remove leading/trailing underscores
    name = name.strip('_')
    # Convert to camelCase
    name = to_camel_case(name.lower())
    return name

def extract_parameter_values(filename):
    """Extract parameter values from filename, ignoring parameter names"""
    # Remove file extension
    name = filename.replace('.png', '')
    
    # Find all parameter patterns like "Size=lg", "Color=Brand", "Type=Dark"
    # Extract only the values (lg, Brand, Dark)
    values = []
    
    # Split by comma and extract values after '='
    parts = name.split(',')
    for part in parts:
        part = part.strip()
        if '=' in part:
            # Extract value after '='
            value = part.split('=')[1].strip()
            # Clean the value
            clean_value = re.sub(r'[^a-zA-Z0-9]', '_', value)
            clean_value = re.sub(r'_+', '_', clean_value).strip('_')
            if clean_value:
                values.append(clean_value.lower())
        else:
            # Handle cases like "RAR" without parameter name
            clean_value = re.sub(r'[^a-zA-Z0-9]', '_', part)
            clean_value = re.sub(r'_+', '_', clean_value).strip('_')
            if clean_value:
                values.append(clean_value.lower())
    
    return values

def create_variable_name(folder_path, filename):
    """Create camelCase variable name from folder path and filename"""
    # Get folder components relative to png directory
    folder_components = []
    
    # Extract folder names from the path
    path_parts = folder_path.parts
    # Find the index of 'png' directory
    try:
        png_index = path_parts.index('png')
        # Take everything after 'png'
        folder_names = path_parts[png_index + 1:]
        
        for folder_name in folder_names:
            clean_name = clean_folder_name(folder_name)
            if clean_name:
                folder_components.append(clean_name)
    except ValueError:
        # If 'png' not found, use all folder names
        for folder_name in path_parts:
            clean_name = clean_folder_name(folder_name)
            if clean_name:
                folder_components.append(clean_name)
    
    # Extract parameter values from filename
    parameter_values = extract_parameter_values(filename)
    
    # Combine all components
    all_components = folder_components + parameter_values
    
    if not all_components:
        return None
    
    # Convert to camelCase
    variable_name = to_camel_case('_'.join(all_components))
    
    # Ensure it starts with lowercase letter
    if variable_name and variable_name[0].isupper():
        variable_name = variable_name[0].lower() + variable_name[1:]
    
    return variable_name

def generate_png_icons():
    """Generate the PNG icons Dart file"""
    
    # Directories
    png_dir = Path('assets/icons/png')
    output_file = Path('lib/icons/png_icons.dart')
    
    # Create output directory if it doesn't exist
    output_file.parent.mkdir(parents=True, exist_ok=True)
    
    # Collect all PNG files
    png_files = []
    if png_dir.exists():
        png_files = list(png_dir.rglob('*.png'))
    
    # Sort files for consistent output
    png_files.sort()
    
    # Start writing the file
    with open(output_file, 'w') as f:
        f.write("class PngIcons {\n")
        f.write("  PngIcons._();\n\n")
        
        # Process PNG files
        for png_file in png_files:
            var_name = create_variable_name(png_file.parent, png_file.name)
            if var_name:  # Only add if we have a valid variable name
                # Use forward slashes for consistency
                file_path = str(png_file).replace('\\', '/')
                f.write(f"  static const {var_name} = '{file_path}';\n")
        
        f.write("}\n")
    
    print(f"PNG icons generated successfully in {output_file}")

if __name__ == '__main__':
    generate_png_icons() 