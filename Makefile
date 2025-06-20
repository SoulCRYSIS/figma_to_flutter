# Makefile for generating SVG and PNG icon constants in Dart

# Directories
ICONS_DIR = assets/icons
SVG_DIR = $(ICONS_DIR)/svg
PNG_DIR = $(ICONS_DIR)/png
SVG_OUTPUT_FILE = lib/icons/svg_icons.dart
PNG_OUTPUT_FILE = lib/icons/png_icons.dart
SVG_GENERATOR_SCRIPT = scripts/generate_svg_icons.py
PNG_GENERATOR_SCRIPT = scripts/generate_png_icons.py
PUBSPEC_UPDATER_SCRIPT = scripts/update_pubspec_assets.py

# Default target
.PHONY: all clean generate-icons generate-svg-icons generate-png-icons update-pubspec list-assets setup

all: generate-icons update-pubspec

# Generate both SVG and PNG icons
generate-icons: generate-svg-icons generate-png-icons

# Generate SVG icons Dart file using Python script
generate-svg-icons:
	@echo "Generating SVG icons Dart file..."
	@python3 $(SVG_GENERATOR_SCRIPT)

# Generate PNG icons Dart file using Python script
generate-png-icons:
	@echo "Generating PNG icons Dart file..."
	@python3 $(PNG_GENERATOR_SCRIPT)

# Update pubspec.yaml with all asset directories
update-pubspec:
	@echo "Updating pubspec.yaml with asset directories..."
	@python3 $(PUBSPEC_UPDATER_SCRIPT)

# List all asset directories that should be in pubspec.yaml
list-assets:
	@echo "Listing asset directories..."
	@python3 $(PUBSPEC_UPDATER_SCRIPT) --list

# Make scripts executable
setup:
	@echo "Setting up scripts..."
	@chmod +x $(SVG_GENERATOR_SCRIPT) $(PNG_GENERATOR_SCRIPT) $(PUBSPEC_UPDATER_SCRIPT)

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	@rm -f $(SVG_OUTPUT_FILE) $(PNG_OUTPUT_FILE)
	@echo "Cleaned $(SVG_OUTPUT_FILE) and $(PNG_OUTPUT_FILE)"

# Help target
help:
	@echo "Available targets:"
	@echo "  all                - Generate icons and update pubspec.yaml (default)"
	@echo "  generate-icons     - Generate both SVG and PNG icons"
	@echo "  generate-svg-icons - Generate SVG icons Dart file only"
	@echo "  generate-png-icons - Generate PNG icons Dart file only"
	@echo "  update-pubspec     - Update pubspec.yaml with all asset directories"
	@echo "  list-assets        - List all asset directories found"
	@echo "  setup             - Make scripts executable"
	@echo "  clean             - Remove generated files"
	@echo "  help              - Show this help message" 