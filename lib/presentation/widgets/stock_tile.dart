import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc_app/core/constants/app_colors.dart';
import '../../data/models/stock_model.dart';
import '../../logic/watchlist/watchlist_bloc.dart';
import '../screens/edit_watchlist_screen.dart';

class StockTile extends StatelessWidget {
  final Stock stock;

  const StockTile({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.divider_white,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<WatchlistBloc>(),
                child: EditWatchlistScreen(
                    watchlistName: "Watchlist 1"
                ),
              ),
            ),
          );
        },
        title: Text(
          stock.name,
          style: const TextStyle(
            color: AppColors.pure_black
          ),
        ),
        subtitle: Text(stock.exchange),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${stock.price}",
              style: TextStyle(
                color: stock.change > 0 ?AppColors.forest_green : AppColors.tomato_red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${stock.change} (${stock.percent}%)",
              style: const TextStyle(color: AppColors.silver_grey),
            ),
          ],
        ),
      ),
    );
  }
}