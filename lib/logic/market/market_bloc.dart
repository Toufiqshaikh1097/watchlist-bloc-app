import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  Timer? _timer;
  final Random _random = Random();


  MarketBloc()
      : super(
    const MarketState(
      sensex: 71200,
      sensexChange: 100,
      nifty: 54170,
      niftyChange: -20,
    ),
  ) {
    on<UpdateMarket>(_onUpdate);

    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      add(UpdateMarket());
    });
  }

  void _onUpdate(UpdateMarket event, Emitter<MarketState> emit) {
    final sDelta = (_random.nextDouble() * 20) - 10;
    final nDelta = (_random.nextDouble() * 20) - 10;

    emit(
      MarketState(
        sensex: state.sensex + sDelta,
        sensexChange: state.sensexChange + sDelta,
        nifty: state.nifty + nDelta,
        niftyChange: state.niftyChange + nDelta,
      ),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}