import 'package:flutter/material.dart';
import 'package:meet_n_train_app/core/utils/color_manager.dart';
import 'package:meet_n_train_app/features/domain/entities/users_entity.dart';
import '../../domain/entities/event_entity.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key, required this.users}): super(key: key);
  final List<Users> users;
  final double overlap = 20.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: List.generate(
      users.length,
      (index) => Padding(
          padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppColor.white,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://ik.imagekit.io/tnc8pizf9e/${users[index].profilePicture}?tr=w-28,h-28',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    ));
  }
}
