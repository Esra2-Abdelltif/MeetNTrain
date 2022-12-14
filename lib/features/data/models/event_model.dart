import 'package:dartz/dartz.dart';
import 'package:meet_n_train_app/features/data/models/community_model.dart';
import 'package:meet_n_train_app/features/data/models/images_model.dart';
import 'package:meet_n_train_app/features/data/models/tag_model.dart';
import 'package:meet_n_train_app/features/data/models/user_model.dart';
import 'package:meet_n_train_app/features/domain/entities/community_entity.dart';
import 'package:meet_n_train_app/features/domain/entities/event_entity.dart';
import 'package:meet_n_train_app/features/domain/entities/images_entity.dart';
import 'package:meet_n_train_app/features/domain/entities/tag_entity.dart';
import 'package:meet_n_train_app/features/domain/entities/users_entity.dart';

class EventModel extends Event {
  EventModel({
    required int id,
    required String title,
    required String description,
    required int spots,
    required int price,
    required double lat,
    required double lon,
    required String placeName,
    required String featuredImage,
    required String date,
    required int tagId,
    required int createdBy,
    required int communityId,
    required List<Images> images,
    required String finishDate,
    required int locationId,
    required bool isPrivate,
    required String paymentMethod,
    required bool receiveUpdates,
    required String state,
    required bool isCheckedIn,
    required bool isFeatured,
    required int viewersCount,
    required List<Users> users,
    required Community community,
    required Tag tag,
    required bool isWaiting,
    required bool isJoined,
    required int joinedUsersCount,
    required int checkedInCount,
    required int paidAmount,
    required int ownerEarnings,
  }) : super(
            state: state,
            title: title,
            id: id,
            lat: lat,
            images: images,
            checkedInCount: checkedInCount,
            community: community,
            communityId: communityId,
            createdBy: createdBy,
            date: date,
            description: description,
            featuredImage: featuredImage,
            finishDate: finishDate,
            isCheckedIn: isCheckedIn,
            isFeatured: isFeatured,
            isJoined: isJoined,
            isPrivate: isPrivate,
            isWaiting: isWaiting,
            joinedUsersCount: joinedUsersCount,
            locationId: locationId,
            lon: lon,
            ownerEarnings: ownerEarnings,
            paidAmount: paidAmount,
            paymentMethod: paymentMethod,
            placeName: placeName,
            price: price,
            receiveUpdates: receiveUpdates,
            spots: spots,
            tag: tag,
            tagId: tagId,
            users: users,
            viewersCount: viewersCount);

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      spots: json['spots'],
      price: json['price'],
      lat: json['lat'],
      lon: json['lon'],
      placeName: json['placeName'],
      featuredImage: json['featuredImage'],
      date: json['date'],
      tagId: json['tagId'],
      createdBy: json['createdBy'],
      communityId: json['communityId'],
      images: json['images'].map<Images>((v) => ImagesModel.fromJson(v)).toList(),
      finishDate: json['finish_date'],
      locationId: json['location_id'],
      isPrivate: json['is_private'],
      paymentMethod: json['paymentMethod'],
      receiveUpdates: json['receiveUpdates'],
      state: json['state'],
      isCheckedIn: json['isCheckedIn'],
      isFeatured: json['isFeatured'],
      viewersCount: json['viewersCount'],
      users: json['users'].map<Users>((v) => UserModel.fromJson(v)).toList(),
      community: CommunityModel.fromJson(json['community']),
      tag: TagModel.fromJson(json['tag']),
      isWaiting: json['isWaiting'],
      isJoined: json['isJoined'],
      joinedUsersCount: json['joinedUsersCount'],
      checkedInCount: json['checkedInCount'],
      paidAmount: json['paidAmount'],
      ownerEarnings: json['ownerEarnings'],
    );
  }
}
