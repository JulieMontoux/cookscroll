import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  final int current;
  final int total;

  const DotsIndicator({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
