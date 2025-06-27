import 'package:flutter/material.dart';
import 'package:figma_to_flutter/widgets/dropdown.dart';
import 'package:figma_to_flutter/design_tokens/figma.dart';

/// Showcase screen demonstrating the CustomDropdown widget.
class DropdownShowcaseScreen extends StatefulWidget {
  const DropdownShowcaseScreen({super.key});

  @override
  State<DropdownShowcaseScreen> createState() => _DropdownShowcaseScreenState();
}

class _DropdownShowcaseScreenState extends State<DropdownShowcaseScreen> {
  String? selectedMember1;
  String? selectedMember2;
  String? selectedMember3;
  String? selectedMember4;
  String? selectedMember5;

  final List<String> teamMembers = [
    'Phoenix Baker',
    'Olivia Rhye',
    'Lana Steiner',
    'Demi Wilkinson',
    'Candice Wu',
    'Natali Craig',
    'Drew Cano',
    'Orlando Diggs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Figma.colorModes.colorsBackgroundBgPrimary,
      appBar: AppBar(
        title: const Text('Dropdown Showcase'),
        backgroundColor: Figma.colorModes.colorsBackgroundBgPrimary,
        foregroundColor: Figma.colorModes.colorsTextTextPrimary900,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Figma.spacing.spacingLg.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dropdown Variations',
              style: TextStyle(
                fontSize: Figma.typography.fontSizeTextXl.value,
                fontWeight: FontWeight.w600,
                color: Figma.colorModes.colorsTextTextPrimary900,
              ),
            ),
            SizedBox(height: Figma.spacing.spacingXl.value),

            // Small Size - Basic
            _buildSection(
              'Small Size - Basic',
              CustomDropdown<String>(
                title: 'Team member',
                placeholder: 'Select team member',
                hintText: 'This is a hint text to help user.',
                size: DropdownSize.sm,
                items: teamMembers,
                value: selectedMember1,
                onChanged: (value) => setState(() => selectedMember1 = value),
              ),
            ),

            // Medium Size - With Required Field
            _buildSection(
              'Medium Size - Required Field',
              CustomDropdown<String>(
                title: 'Team member',
                placeholder: 'Select team member',
                hintText: 'This is a hint text to help user.',
                isRequired: true,
                size: DropdownSize.md,
                items: teamMembers,
                value: selectedMember2,
                onChanged: (value) => setState(() => selectedMember2 = value),
              ),
            ),

            // With Help Icon
            _buildSection(
              'With Help Icon & Tooltip',
              CustomDropdown<String>(
                title: 'Team member',
                placeholder: 'Select team member',
                hintText: 'This is a hint text to help user.',
                isRequired: true,
                showHelpIcon: true,
                tooltipMessage: 'Select a team member from the list',
                size: DropdownSize.md,
                items: teamMembers,
                value: selectedMember3,
                onChanged: (value) => setState(() => selectedMember3 = value),
              ),
            ),

            // With Leading Icon
            _buildSection(
              'With Leading Icon',
              CustomDropdown<String>(
                title: 'Team member',
                placeholder: 'Select team member',
                hintText: 'This is a hint text to help user.',
                isRequired: true,
                showHelpIcon: true,
                tooltipMessage: 'Select a team member from the list',
                leadingIcon: Icon(
                  Icons.person_outline,
                  size: 20,
                  color: Figma.colorModes.colorsForegroundFgQuaternary500,
                ),
                size: DropdownSize.md,
                items: teamMembers,
                value: selectedMember4,
                onChanged: (value) => setState(() => selectedMember4 = value),
              ),
            ),

            // Disabled State
            _buildSection(
              'Disabled State',
              CustomDropdown<String>(
                title: 'Team member',
                placeholder: 'Select team member',
                hintText: 'This is a hint text to help user.',
                isRequired: true,
                showHelpIcon: true,
                tooltipMessage: 'Select a team member from the list',
                leadingIcon: Icon(
                  Icons.person_outline,
                  size: 20,
                  color: Figma.colorModes.colorsForegroundFgDisabledSubtle,
                ),
                enabled: false,
                size: DropdownSize.md,
                items: teamMembers,
                value: selectedMember5,
                onChanged: (value) => setState(() => selectedMember5 = value),
              ),
            ),

            // Custom Item Builder
            _buildSection(
              'Custom Item Builder',
              CustomDropdown<String>(
                title: 'Team member',
                placeholder: 'Select team member',
                hintText: 'This is a hint text to help user.',
                isRequired: true,
                size: DropdownSize.md,
                items: teamMembers,
                value: selectedMember5,
                onChanged: (value) => setState(() => selectedMember5 = value),
                itemBuilder: (item) => Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Figma.colorModes.colorsForegroundFgBrandPrimary600,
                      child: Text(
                        item.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: Figma.spacing.spacingXs.value),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item,
                            style: TextStyle(
                              fontSize: Figma.typography.fontSizeTextMd.value,
                              fontWeight: FontWeight.w500,
                              color: Figma.colorModes.colorsTextTextPrimary900,
                            ),
                          ),
                          Text(
                            '@${item.toLowerCase().replaceAll(' ', '')}',
                            style: TextStyle(
                              fontSize: Figma.typography.fontSizeTextMd.value,
                              fontWeight: FontWeight.w400,
                              color: Figma.colorModes.colorsTextTextTertiary600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: Figma.spacing.spacing2xl.value),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: Figma.typography.fontSizeTextLg.value,
            fontWeight: FontWeight.w600,
            color: Figma.colorModes.colorsTextTextPrimary900,
          ),
        ),
        SizedBox(height: Figma.spacing.spacingMd.value),
        child,
        SizedBox(height: Figma.spacing.spacingXl.value),
      ],
    );
  }
} 