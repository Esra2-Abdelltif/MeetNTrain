import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meet_n_train_app/core/utils/string_manager.dart';
import 'package:meet_n_train_app/features/domain/use_cases/get_events_usecase.dart';
import 'package:meet_n_train_app/features/presentation/cubit/events_state.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/event_entity.dart';


class EventsCubit extends Cubit<EventsState> {
  final GetEventsUseCase getEventsUseCase ;
  EventsCubit({required this.getEventsUseCase}) : super(EventsInitial());

  static EventsCubit get(context) => BlocProvider.of(context);

  int currentPage = 1;
  bool isLastEvent = false;
  List<String> eventsdDateList = [];
  List<Event> eventsCardList = [];
  String currentDate = '';
  DateTime? showedDate ;
  Future<void> getEvent() async{

      eventsCardList = [];
      emit(EventstateLoading());
      String currentDate = DateFormat('ddMMMyyyy').format(DateTime.now());
      final Either<Failure, List<Event>> eventList =
      await getEventsUseCase(EventParameters(pageNumber: currentPage ,currentDate:currentDate));
      eventList.fold(
              (failure) => emit(EventstateError(_mapFailureToMsg(failure))),
              (event) {
                isLastEvent = event.length == 10;
                if (isLastEvent) {
                  currentPage++;
                  eventsCardList.addAll(event);
                  event.forEach((element) {
                    eventsdDateList.add(element.date);
                  });
                  emit(EventsStateLoaded(event: event));
                }

          });

  }



  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverError;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
