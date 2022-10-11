import 'package:flutter/material.dart';
import 'package:meet_n_train_app/core/utils/color_manager.dart';
import 'package:meet_n_train_app/features/domain/entities/tag_entity.dart';


class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {Key? key,
      required this.imagePath,
      required this.tag,
      required this.spotsLeft}): super(key: key);
  final String imagePath;
  final Tag tag;
  final int spotsLeft;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    double height = MediaQuery.of(context).size.height * 0.21;
    return Stack(
      children: [
        Container(

          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(
                    'https://ik.imagekit.io/tnc8pizf9e/$imagePath?tr=w-$width,h-$height',
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            height: 28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColor.white.withOpacity(0.8)),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://ik.imagekit.io/tnc8pizf9e/${tag.icon}?tr=w-22,h-22',
                          ),
                          fit: BoxFit.contain,
                        )),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    tag.title,
                    style: TextStyle(color:  AppColor.black, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom:10,
            left:12,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColor.white.withOpacity(0.8)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: spotsLeft == 0
                    ? Center(
                      child: Text(
                          'UnLimited spots',
                          style: TextStyle(color: AppColor.primaryColor, fontSize: 10),
                        ),
                    )
                    : Center(
                      child: Text(
                          '$spotsLeft Spots left',
                          style: TextStyle(color: AppColor.primaryColor, fontSize: 10),
                        ),
                    ),
              ),
            ))
      ],
    );
  }
}
