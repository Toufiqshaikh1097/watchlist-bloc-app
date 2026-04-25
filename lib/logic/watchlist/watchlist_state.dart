part of 'watchlist_bloc.dart';

class WatchlistState extends Equatable {
  final List<Stock> stocks;

  const WatchlistState(this.stocks);

  @override
  List<Object?> get props => [stocks];
}