import 'package:meet_n_train_app/features/domain/entities/community_entity.dart';

class CommunityModel extends Community {
  CommunityModel({
    required int id,
    required String title,
    required String image,
    required String bio,
    required int points,
    required int ratingCount,
    required int connectionCount,
    required int eventCount,
    required String profilePicture,
    required String state,
  }) : super(
            profilePicture: profilePicture,
            points: points,
            bio: bio,
            id: id,
            title: title,
            image: image,
            connectionCount: connectionCount,
            eventCount: eventCount,
            ratingCount: ratingCount,
            state: state);

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      bio: json['bio'],
      points: json['points'],
      ratingCount: json['rating_count'],
      connectionCount: json['connection_count'],
      eventCount: json['event_count'],
      profilePicture: json['profile_picture'],
      state: json['state'],

    );
  }
}
