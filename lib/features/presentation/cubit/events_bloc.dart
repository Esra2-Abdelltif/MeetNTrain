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

  static const _pageSize = 10;
  int currentPage = 1;
  bool isLastPage = false;
  List<String> eventsList = [];
  List<Event> events = [];
  String currentDate = '';
  DateTime? showedDate;
  Future<void> getEvent() async{
      events = [];
      emit(EventstateLoading());
      String currentDate = DateFormat('ddMMMyyyy').format(DateTime.now());
      showedDate = DateTime.now();
      final Either<Failure, List<Event>> eventList =
      await getEventsUseCase(
          currentDate: currentDate, pageNumber: 1);
      eventList.fold((failure) =>
              emit(EventstateError(_mapFailureToMsg(failure))),
              (event) {
                isLastPage = event.length == _pageSize;

                if (isLastPage) {
                  currentPage++;
                }
            events.addAll(event);
            event.forEach((element) {
              eventsList.add(element.date);
            });
            emit(EventsStateLoaded(event: event));
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
