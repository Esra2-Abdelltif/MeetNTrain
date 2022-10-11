import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final int id;
  final String firstName;
   final String lastName;
  final String email;
  final String profilePicture;
  final int points;
  final String mobile;
  final String countryCode;
  final bool isVerified;
  final bool isTrusted;

  Users(
      { required this.id,
         required this.firstName,
         required this.lastName,
         required this.email,
         required this.profilePicture,
         required this.points,
         required this.mobile,
         required this.countryCode,
         required this.isVerified,
         required this.isTrusted});

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    profilePicture,
    points,
    mobile,
    countryCode,
    isVerified,
    isTrusted
  ];
}
