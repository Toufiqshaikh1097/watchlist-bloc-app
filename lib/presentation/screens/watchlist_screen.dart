import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/watchlist/watchlist_bloc.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/market_summary_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/watchlist_tabs.dart';
import '../widgets/sort_button.dart';
import '../widgets/stock_tile.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MarketSummaryWidget(),
            const SearchBarWidget(),
            const WatchlistTabs(),
            const SizedBox(height:10),
            const SortButton(),
            Expanded(
              child: BlocBuilder<WatchlistBloc, WatchlistState>(
                builder: (context, state) {
                  return ReorderableListView.builder(
                    itemCount: state.stocks.length,
                    onReorder: (oldIndex, newIndex) {
                      context.read<WatchlistBloc>().add(
                        ReorderStocks(oldIndex, newIndex),
                      );
                    },
                    itemBuilder: (context, index) {
                      final stock = state.stocks[index];
                      return Container(
                        key: ValueKey("${stock.name}_${stock.exchange}"),
                        child: StockTile(stock: stock),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}