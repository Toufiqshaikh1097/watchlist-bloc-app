import 'package:flutter/material.dart';
import 'package:watchlist_bloc_app/core/constants/app_colors.dart';

class WatchlistTabs extends StatelessWidget {
  const WatchlistTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _Tab("Watchlist 1", true),
        _Tab("Watchlist 5", false),
        _Tab("Watchlist 6", false),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  final String text;
  final bool selected;

  const _Tab(this.text, this.selected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selected ? AppColors.pure_black : AppColors.grey,
            ),
          ),
          if (selected)
            Container(height: 2, width: 40, color: Colors.black)
        ],
      ),
    );
  }
}