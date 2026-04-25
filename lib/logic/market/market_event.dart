part of 'market_bloc.dart';

abstract class MarketEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateMarket extends MarketEvent {}