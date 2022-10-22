import 'package:equatable/equatable.dart';
import 'package:meet_n_train_app/features/domain/entities/community_entity.dart';
import 'package:meet_n_train_app/features/domain/entities/images_entity.dart';
import 'package:meet_n_train_app/features/domain/entities/tag_entity.dart';
import 'package:meet_n_train_app/features/domain/entities/users_entity.dart';

class Event extends Equatable {
  final int id;
  final String title;
  final String description;
  final int spots;
  final int price;
  final double lat;
  final double lon;
  final String placeName;
  final String featuredImage;
  final String date;
  final int tagId;
  final int createdBy;
  final int communityId;
  final List<Images> images;
  final String finishDate;
  final int locationId;
  final bool isPrivate;
  final String paymentMethod;
  final bool receiveUpdates;
  final String state;
  final bool isCheckedIn;
  final bool isFeatured;
  final int viewersCount;
  final List<Users> users;
  final Community community;
  final Tag tag;
  final bool isWaiting;
  final bool isJoined;
  final int joinedUsersCount;
  final int checkedInCount;
  final int paidAmount;
  final int ownerEarnings;

  Event(
      {required this.id,
      required this.title,
      required this.description,
      required this.spots,
      required this.price,
      required this.lat,
      required this.lon,
      required this.placeName,
      required this.featuredImage,
      required this.date,
      required this.tagId,
      required this.createdBy,
      required this.communityId,
      required this.images,
      required this.finishDate,
      required this.locationId,
      required this.isPrivate,
      required this.paymentMethod,
      required this.receiveUpdates,
      required this.state,
      required this.isCheckedIn,
      required this.isFeatured,
      required this.viewersCount,
      required this.users,
      required this.community,
      required this.tag,
      required this.isWaiting,
      required this.isJoined,
      required this.joinedUsersCount,
      required this.checkedInCount,
      required this.paidAmount,
      required this.ownerEarnings});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        spots,
        price,
        lat,
        lon,
        placeName,
        featuredImage,
        date,
        tagId,
        createdBy,
        communityId,
        images,
        finishDate,
        locationId,
        isPrivate,
        paymentMethod,
        receiveUpdates,
        state,
        isCheckedIn,
        isFeatured,
        viewersCount,
        users,
        community,
        tag,
        isWaiting,
        isJoined,
        joinedUsersCount,
        checkedInCount,
        paidAmount,
        ownerEarnings
      ];
}
