import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/dummy_stocks_data.dart';
import '../../data/models/stock_model.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {


  WatchlistBloc()
      : super(WatchlistState(DummyStockData.getStocks())) {
    on<ReorderStocks>(_onReorder);
    on<DeleteStock>(_onDeleteStock);
  }

  void _onReorder(ReorderStocks event, Emitter<WatchlistState> emit) {
    final list = List<Stock>.from(state.stocks);

    int newIndex = event.newIndex;
    if (event.oldIndex < newIndex) newIndex--;

    final item = list.removeAt(event.oldIndex);
    list.insert(newIndex, item);

    emit(WatchlistState(list));
  }

  void _onDeleteStock(DeleteStock event, Emitter<WatchlistState> emit) {
    final updatedList = state.stocks
        .where((s) =>
    !(s.name == event.stock.name &&
        s.exchange == event.stock.exchange))
        .toList();

    emit(WatchlistState(updatedList));
  }
}

