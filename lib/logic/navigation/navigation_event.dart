import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeTab extends NavigationEvent {
  final int index;

  ChangeTab(this.index);

  @override
  List<Object?> get props => [index];
}