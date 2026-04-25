import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc_app/core/constants/app_colors.dart';
import '../../logic/watchlist/watchlist_bloc.dart';

class EditWatchlistScreen extends StatelessWidget {
  final String watchlistName;

  const EditWatchlistScreen({
  super.key,
  required this.watchlistName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background,
      appBar: AppBar(
        title: Text("Edit $watchlistName",
          style: TextStyle(
            color: AppColors.pure_black
          ),
        ),
        leading: const BackButton(),
        backgroundColor:AppColors.background,
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  watchlistName,
                  style: const TextStyle(fontSize: 16,
                    color: AppColors.pure_black
                  ),
                ),
                const Icon(Icons.edit, size: 18, color:AppColors.grey),
              ],
            ),
          ),

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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFEDEDED)),
                        ),
                      ),
                      child:Row(
                        children: [
                          ReorderableDragStartListener(
                            index: index,
                            child: const Icon(Icons.drag_handle, size: 20),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Text(
                              stock.name,
                              style: const TextStyle(
                                fontSize: 14,
                                color:AppColors.pure_black
                              ),
                            ),
                          ),

                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<WatchlistBloc>().add(
                                DeleteStock(stock),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(color:AppColors.divider_white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Edit other watchlists",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("$watchlistName saved"),
                        duration: const Duration(seconds: 2),
                      ),
                    );

                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.pure_black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Save Watchlist",
                        style: TextStyle(
                          color: AppColors.background,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),              ],
            ),
          ),
        ],
      ),
    );
  }
}