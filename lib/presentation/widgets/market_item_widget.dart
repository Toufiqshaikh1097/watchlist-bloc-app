import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class MarketItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String price;
  final String change;
  final bool isPositive;

  const MarketItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.price,
    required this.change,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPositive ? AppColors.forest_green : AppColors.tomato_red;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  subtitle!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height:20),
        Row(
          children: [
            Text(
              price,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(width:10),
            Text(
              change,
              style: TextStyle(
                fontSize: 15,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}