
import 'package:equatable/equatable.dart';
import 'package:meet_n_train_app/features/domain/entities/event_entity.dart';

abstract class EventsState {}

class EventsInitial extends EventsState {}
class EventstateLoading extends EventsState {}
class EventsStateLoaded extends EventsState {
  final List<Event> event;

  EventsStateLoaded({required this.event});


  @override
  List<Object> get props => [event];
}
class EventstateError extends EventsState {
  final String message;

  EventstateError(this.message);
  @override
  List<Object> get props => [message];
}
