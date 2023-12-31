part of 'switch_bloc.dart';

sealed class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchOn extends SwitchEvent{}
class SwitchOff extends SwitchEvent{}