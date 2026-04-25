import 'package:flutter/material.dart';
import 'package:watchlist_bloc_app/core/constants/app_colors.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.sort, color: AppColors.charcoal_grey),
          label: const Text(
            "Sort by",
            style: TextStyle(color: AppColors.charcoal_grey),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor:AppColors.cloud_grey.withOpacity(0.3),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}