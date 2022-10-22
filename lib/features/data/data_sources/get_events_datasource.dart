import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meet_n_train_app/core/api/api_consumer.dart';
import 'package:meet_n_train_app/core/api/events_api_constantace.dart';
import 'package:meet_n_train_app/core/api/status_code.dart';
import 'package:meet_n_train_app/core/errors/exception.dart';
import 'package:meet_n_train_app/core/utils/string_manager.dart';
import 'package:meet_n_train_app/features/data/models/event_model.dart';
import 'package:meet_n_train_app/features/domain/use_cases/get_events_usecase.dart';

abstract class BaseEventsRemoteDataSource {
  Future<List<EventModel>> getEvents(EventParameters parameters);
}

class EventsRemoteDataSourceImplement implements BaseEventsRemoteDataSource {
  ApiConsumer apiConsumer;

  EventsRemoteDataSourceImplement({required this.apiConsumer});

  @override
  Future<List<EventModel>> getEvents(EventParameters parameters) async {
    String getEventsPath = '${EventApiConstance.baseUrl}?page=${parameters.pageNumber}&date_gte=${parameters.currentDate}';

    dynamic response = await apiConsumer.get(getEventsPath);

    return List.from((response).map((element) => EventModel.fromJson(element)));
  }
}

// class EventsRemoteDataSourceImplement implements BaseEventsRemoteDataSource {
//
//   @override
//   Future<List<EventModel>> getEvents({required String currentDate, required int pageNumber}) async {
//     String getEventsEndPoint = '${EventApiConstance.baseUrl}?page=$pageNumber&date_gte=$currentDate';
//
//     final response = await Dio().get(getEventsEndPoint,options: Options(
//       headers: {
//         'Authorization': EventApiConstance.authorizationToken,
//         'Content-Type': 'application/json'
//       },
//     ));
//     //if response susses
//     if (response.statusCode == StatusCode.ok) {
//       return List.from((response.data as List).map((element) => EventModel.fromJson(element)));
//     }
//     else {
//
//       throw ServerException();
//     }
//   }
//
// }
