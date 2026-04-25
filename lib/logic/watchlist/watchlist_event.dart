part of 'watchlist_bloc.dart';

abstract class WatchlistEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReorderStocks extends WatchlistEvent {
  final int oldIndex;
  final int newIndex;

  ReorderStocks(this.oldIndex, this.newIndex);

  @override
  List<Object?> get props => [oldIndex, newIndex];
}

class DeleteStock extends WatchlistEvent {
  final Stock stock;

  DeleteStock(this.stock);

  @override
  List<Object?> get props => [stock];
}
