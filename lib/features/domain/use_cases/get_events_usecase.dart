import 'package:dartz/dartz.dart';
import 'package:meet_n_train_app/features/domain/repositories/base_events_repository.dart';
import '../../../../core/errors/failure.dart';
import '../entities/event_entity.dart';

class GetEventsUseCase {
  final BaseEventsReporsitory reporsitory;
  GetEventsUseCase(this.reporsitory);

  Future<Either<Failure, List<Event>>> call({required int pageNumber,required String currentDate}) async {
    return await reporsitory.getEvents(currentDate: currentDate,pageNumber:  pageNumber);
  }
}
