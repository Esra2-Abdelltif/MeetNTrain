import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meet_n_train_app/features/domain/repositories/base_events_repository.dart';
import '../../../../core/errors/failure.dart';
import '../../../core/useCases/base_useCase.dart';
import '../entities/event_entity.dart';

class GetEventsUseCase  extends BaseUseCases<List<Event>,EventParameters> {
  final BaseEventsReporsitory reporsitory;
  GetEventsUseCase({required this.reporsitory});

  @override
  Future<Either<Failure, List<Event>>> call(EventParameters parameters) async {
    return await reporsitory.getEvents(parameters);
  }
}


class EventParameters extends Equatable{
  final int pageNumber;
  final String currentDate;

  EventParameters({required this.pageNumber,required this.currentDate});

  @override
  // TODO: implement props
  List<Object> get props =>[pageNumber,currentDate];
}
