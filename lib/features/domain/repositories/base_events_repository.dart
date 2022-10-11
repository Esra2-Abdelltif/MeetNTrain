import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/event_entity.dart';

abstract class BaseEventsReporsitory{
   Future<Either<Failure,List<Event>>> getEvents({required int pageNumber,required String currentDate});

}
