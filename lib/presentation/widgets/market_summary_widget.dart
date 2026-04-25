import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc_app/core/constants/app_colors.dart';
import '../../core/utils/date_formatter.dart';
import '../../logic/market/market_bloc.dart';
import 'market_item_widget.dart';

class MarketSummaryWidget extends StatelessWidget {
  const MarketSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketBloc, MarketState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: MarketItem(
                  title: "SENSEX",
                  subtitle:DateFormatter.getMarketFormattedTime(),
                  price: state.sensex.toStringAsFixed(2),
                  change: state.sensexChange.toStringAsFixed(2),
                  isPositive: state.sensexChange >= 0,
                ),
              ),

              const SizedBox(
                height: 60,
                child: VerticalDivider(
                  color: AppColors.divider_white,
                ),
              ),

              Expanded(
                child: MarketItem(
                  title: "NIFTY BANK",
                  price: state.nifty.toStringAsFixed(2),
                  change: "${state.niftyChange >= 0 ? '+' : ''}${state.niftyChange.toStringAsFixed(2)}",
                  isPositive: state.niftyChange >= 0,
                ),
              ),

              const SizedBox(width: 6),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        );
      },
    );
  }
}
