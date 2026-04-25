part of 'market_bloc.dart';

class MarketState extends Equatable {
  final double sensex;
  final double sensexChange;
  final double nifty;
  final double niftyChange;

  const MarketState({
    required this.sensex,
    required this.sensexChange,
    required this.nifty,
    required this.niftyChange,
  });

  double get sensexPercent => (sensexChange / sensex) * 100;
  double get niftyPercent => (niftyChange / nifty) * 100;

  @override
  List<Object?> get props => [sensex, sensexChange, nifty, niftyChange];
}