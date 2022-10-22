import 'package:dartz/dartz.dart';
import 'package:meet_n_train_app/features/domain/use_cases/get_events_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../entities/event_entity.dart';

abstract class BaseEventsReporsitory{
   Future<Either<Failure,List<Event>>> getEvents(EventParameters parameters);

}
