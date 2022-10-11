import 'package:meet_n_train_app/features/domain/entities/users_entity.dart';

class UserModel extends Users {
  UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String profilePicture,
    required int points,
    required String mobile,
    required String countryCode,
    required bool isVerified,
    required bool isTrusted,
  }) : super(
            id: id,
            email: email,

            countryCode: countryCode,
            firstName: firstName,
            isTrusted: isTrusted,
            isVerified: isVerified,
            lastName: lastName,
            mobile: mobile,
            points: points,
            profilePicture: profilePicture
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      profilePicture: json['profile_picture'],
      points: json['points'],
      mobile: json['mobile'],
      countryCode: json['country_code'],
      isVerified: json['is_verified'],
      isTrusted: json['isTrusted'],
    );
  }
}
