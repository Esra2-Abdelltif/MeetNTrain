import 'package:dartz/dartz.dart';
import 'package:meet_n_train_app/core/errors/failure.dart';
import 'package:meet_n_train_app/features/data/data_sources/get_events_datasource.dart';
import 'package:meet_n_train_app/features/domain/entities/event_entity.dart';
import 'package:meet_n_train_app/features/domain/repositories/base_events_repository.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/network/network_info.dart';

class EventRepository extends BaseEventsReporsitory {
  final BaseEventsRemoteDataSource eventsRemoteDataSource;
  final NetworkInfo networkInfo;

  EventRepository({required this.eventsRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Event>>> getEvents({required int pageNumber, required String currentDate}) async {
    if (await networkInfo.isConnected) {
      try {
        final events = await eventsRemoteDataSource.getEvents(
            currentDate: currentDate, pageNumber: pageNumber);
        return Right(events);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
