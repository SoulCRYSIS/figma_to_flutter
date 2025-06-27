import 'package:flutter/material.dart';
import 'package:figma_to_flutter/design_tokens/figma.dart';

/// Custom dropdown widget based on Untitled-UI design system.
/// 
/// **Figma Reference:**
/// - Small size: https://www.figma.com/design/w6tEcAwj9Eaq0ej29C8F4M/%E2%9D%96-Untitled-UI-%E2%80%93-PRO-VARIABLES--v6.0----Testing-Token?node-id=24081-551173
/// - Medium size: https://www.figma.com/design/w6tEcAwj9Eaq0ej29C8F4M/%E2%9D%96-Untitled-UI-%E2%80%93-PRO-VARIABLES--v6.0----Testing-Token?node-id=24083-551319
/// 
/// **Purpose:**
/// A fully customizable dropdown widget that supports two sizes (sm/md), 
/// title with optional required asterisk, placeholder text, hint text, 
/// help icon with tooltips, leading icons, and enable/disable states.
/// 
/// **Features:**
/// - Two sizes: small (sm) and medium (md)
/// - Optional title with required field indicator (purple asterisk)
/// - Placeholder text when no value is selected
/// - Hint text below the dropdown
/// - Help icon with tooltip support
/// - Leading icon (can be any widget)
/// - Enable/disable states with visual feedback
/// - Smooth animation when opening/closing dropdown
/// 
/// **Example Usage:**
/// ```dart
/// CustomDropdown<String>(
///   title: 'Team member',
///   placeholder: 'Select team member',
///   hintText: 'This is a hint text to help user.',
///   isRequired: true,
///   showHelpIcon: true,
///   tooltipMessage: 'Help tooltip message',
///   leadingIcon: SvgIcons.user01,
///   size: DropdownSize.md,
///   items: ['Option 1', 'Option 2', 'Option 3'],
///   onChanged: (value) => print('Selected: $value'),
/// )
/// ```
class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.title,
    this.placeholder,
    this.hintText,
    this.isRequired = false,
    this.showHelpIcon = false,
    this.tooltipMessage,
    this.leadingIcon,
    this.enabled = true,
    this.size = DropdownSize.md,
    required this.items,
    this.value,
    this.onChanged,
    this.itemBuilder,
  });

  /// Title/label text displayed above the dropdown
  final String? title;

  /// Placeholder text shown when no value is selected
  final String? placeholder;

  /// Hint text displayed below the dropdown
  final String? hintText;

  /// Whether the field is required (shows purple asterisk)
  final bool isRequired;

  /// Whether to show the help icon
  final bool showHelpIcon;

  /// Tooltip message for the help icon
  final String? tooltipMessage;

  /// Leading icon widget (can be any widget, not just Icon)
  final Widget? leadingIcon;

  /// Whether the dropdown is enabled
  final bool enabled;

  /// Size variant of the dropdown
  final DropdownSize size;

  /// List of items to display in the dropdown
  final List<T> items;

  /// Currently selected value
  final T? value;

  /// Callback when value changes
  final ValueChanged<T?>? onChanged;

  /// Custom item builder function
  final Widget Function(T item)? itemBuilder;

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  bool _isOpen = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _closeDropdown();
    super.dispose();
  }

  void _toggleDropdown() {
    if (!widget.enabled) return;
    
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _animationController.forward();
    _isOpen = true;
    
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeDropdown() {
    _animationController.reverse();
    _isOpen = false;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + Figma.spacing.spacingXs.value),
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(Figma.radius.radiusMd.value),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 320),
              decoration: BoxDecoration(
                color: Figma.colorModes.colorsBackgroundBgPrimary,
                borderRadius: BorderRadius.circular(Figma.radius.radiusMd.value),
                border: Border.all(
                  color: Figma.colorModes.colorsBorderBorderSecondary,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x140A0D12),
                    offset: const Offset(0, 12),
                    blurRadius: 16,
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color: const Color(0x080A0D12),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -2,
                  ),
                  BoxShadow(
                    color: const Color(0x0A0A0D12),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: Figma.spacing.spacingXs.value),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  final isSelected = widget.value == item;

                  return _DropdownItem<T>(
                    item: item,
                    isSelected: isSelected,
                    size: widget.size,
                    onTap: () => _onItemTap(item),
                    itemBuilder: widget.itemBuilder,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTap(T item) {
    widget.onChanged?.call(item);
    _closeDropdown();
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = _DropdownDimensions.forSize(widget.size);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          _buildLabel(),
          SizedBox(height: Figma.spacing.spacingXs.value),
        ],
        CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            key: _dropdownKey,
            onTap: _toggleDropdown,
            child: Container(
              width: double.infinity,
              padding: dimensions.padding,
              decoration: BoxDecoration(
                color: widget.enabled 
                    ? Figma.colorModes.colorsBackgroundBgPrimary
                    : Figma.colorModes.colorsBackgroundBgDisabledSubtle,
                borderRadius: BorderRadius.circular(Figma.radius.radiusMd.value),
                border: Border.all(
                  color: _isOpen 
                      ? Figma.colorModes.colorsBorderBorderBrand
                      : Figma.colorModes.colorsBorderBorderPrimary,
                  width: _isOpen ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0D0A0D12),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  if (widget.leadingIcon != null) ...[
                    SizedBox(
                      width: dimensions.iconSize,
                      height: dimensions.iconSize,
                      child: widget.leadingIcon,
                    ),
                    SizedBox(width: Figma.spacing.spacingXs.value),
                  ],
                  Expanded(
                    child: _buildContent(dimensions),
                  ),
                  SizedBox(width: Figma.spacing.spacingXs.value),
                  AnimatedBuilder(
                    animation: _rotationAnimation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _rotationAnimation.value * 3.14159,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: dimensions.iconSize,
                          color: widget.enabled 
                              ? Figma.colorModes.colorsForegroundFgQuaternary500
                              : Figma.colorModes.colorsForegroundFgDisabledSubtle,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        if (widget.hintText != null) ...[
          SizedBox(height: Figma.spacing.spacingXs.value),
          _buildHintText(),
        ],
      ],
    );
  }

  Widget _buildLabel() {
    return Row(
      children: [
        Text(
          widget.title!,
          style: TextStyle(
            fontSize: Figma.typography.fontSizeTextSm.value,
            fontWeight: FontWeight.w500,
            height: Figma.typography.lineHeightTextSm.value / 
                   Figma.typography.fontSizeTextSm.value,
            color: Figma.colorModes.colorsTextTextSecondary700,
          ),
        ),
        if (widget.isRequired) ...[
          Text(
            '*',
            style: TextStyle(
              fontSize: Figma.typography.fontSizeTextSm.value,
              fontWeight: FontWeight.w500,
              height: Figma.typography.lineHeightTextSm.value / 
                     Figma.typography.fontSizeTextSm.value,
              color: Figma.colorModes.colorsTextTextBrandTertiary600,
            ),
          ),
        ],
        if (widget.showHelpIcon) ...[
          SizedBox(width: Figma.spacing.spacingXxs.value),
          Tooltip(
            message: widget.tooltipMessage ?? '',
            child: Icon(
              Icons.help_outline,
              size: 16,
              color: Figma.colorModes.colorsForegroundFgQuinary400,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildContent(_DropdownDimensions dimensions) {
    final hasValue = widget.value != null;

    if (!hasValue) {
      return Text(
        widget.placeholder ?? 'Select option',
        style: TextStyle(
          fontSize: dimensions.fontSize,
          fontWeight: FontWeight.w400,
          height: dimensions.lineHeight / dimensions.fontSize,
          color: widget.enabled 
              ? Figma.colorModes.colorsTextTextPlaceholder
              : Figma.colorModes.colorsTextTextDisabled,
        ),
      );
    }

    return Text(
      widget.value.toString(),
      style: TextStyle(
        fontSize: dimensions.fontSize,
        fontWeight: FontWeight.w500,
        height: dimensions.lineHeight / dimensions.fontSize,
        color: widget.enabled 
            ? Figma.colorModes.colorsTextTextPrimary900
            : Figma.colorModes.colorsTextTextDisabled,
      ),
    );
  }

  Widget _buildHintText() {
    return Text(
      widget.hintText!,
      style: TextStyle(
        fontSize: Figma.typography.fontSizeTextSm.value,
        fontWeight: FontWeight.w400,
        height: Figma.typography.lineHeightTextSm.value / 
               Figma.typography.fontSizeTextSm.value,
        color: Figma.colorModes.colorsTextTextTertiary600,
      ),
    );
  }
}

/// Size variants for the dropdown
enum DropdownSize { sm, md }

/// Dimensions configuration for different dropdown sizes
class _DropdownDimensions {
  const _DropdownDimensions({
    required this.padding,
    required this.fontSize,
    required this.lineHeight,
    required this.iconSize,
  });

  final EdgeInsets padding;
  final double fontSize;
  final double lineHeight;
  final double iconSize;

  static _DropdownDimensions forSize(DropdownSize size) {
    switch (size) {
      case DropdownSize.sm:
        return _DropdownDimensions(
          padding: EdgeInsets.symmetric(
            horizontal: Figma.spacing.spacingSm.value,
            vertical: Figma.spacing.spacingXs.value,
          ),
          fontSize: Figma.typography.fontSizeTextMd.value,
          lineHeight: Figma.typography.lineHeightTextMd.value,
          iconSize: 20,
        );
      case DropdownSize.md:
        return _DropdownDimensions(
          padding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          fontSize: Figma.typography.fontSizeTextMd.value,
          lineHeight: Figma.typography.lineHeightTextMd.value,
          iconSize: 20,
        );
    }
  }
}

/// Individual dropdown item widget
class _DropdownItem<T> extends StatefulWidget {
  const _DropdownItem({
    required this.item,
    required this.isSelected,
    required this.size,
    required this.onTap,
    this.itemBuilder,
  });

  final T item;
  final bool isSelected;
  final DropdownSize size;
  final VoidCallback onTap;
  final Widget Function(T item)? itemBuilder;

  @override
  State<_DropdownItem<T>> createState() => _DropdownItemState<T>();
}

class _DropdownItemState<T> extends State<_DropdownItem<T>> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final dimensions = _DropdownDimensions.forSize(widget.size);
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: Figma.spacing.spacingXs.value,
            vertical: 1,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Figma.spacing.spacingXs.value,
              vertical: dimensions.padding.vertical,
            ),
            decoration: BoxDecoration(
              color: widget.isSelected 
                  ? Figma.colorModes.colorsBackgroundBgActive
                  : _isHovered 
                      ? Figma.colorModes.colorsBackgroundBgActive
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(Figma.spacing.spacingXs.value),
            ),
            child: Row(
              children: [
                if (widget.itemBuilder != null) ...[
                  widget.itemBuilder!(widget.item),
                ] else ...[
                  Icon(
                    Icons.person_outline,
                    size: dimensions.iconSize,
                    color: Figma.colorModes.colorsForegroundFgQuaternary500,
                  ),
                  SizedBox(width: Figma.spacing.spacingXs.value),
                  Expanded(
                    child: Text(
                      widget.item.toString(),
                      style: TextStyle(
                        fontSize: dimensions.fontSize,
                        fontWeight: FontWeight.w500,
                        height: dimensions.lineHeight / dimensions.fontSize,
                        color: Figma.colorModes.colorsTextTextPrimary900,
                      ),
                    ),
                  ),
                ],
                if (widget.isSelected) ...[
                  SizedBox(width: Figma.spacing.spacingXs.value),
                  Icon(
                    Icons.check,
                    size: dimensions.iconSize,
                    color: Figma.colorModes.colorsForegroundFgBrandPrimary600,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
} 