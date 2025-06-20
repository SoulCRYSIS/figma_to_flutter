import 'package:flutter/material.dart';

enum DotSize { sm, md, lg }

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    required this.color,
    required this.size,
  });

  final Color color;
  final DotSize size;

  @override
  Widget build(BuildContext context) {
    final double boxSize = switch (size) {
      DotSize.sm => 8,
      DotSize.md => 10,
      DotSize.lg => 12,
    };
    return Container(
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
