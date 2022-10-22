import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_n_train_app/core/utils/color_manager.dart';
import 'package:meet_n_train_app/core/utils/font_manager.dart';
import 'package:meet_n_train_app/features/domain/entities/event_entity.dart';
import 'package:meet_n_train_app/features/presentation/widgets/dollar_container.dart';
import 'package:meet_n_train_app/features/presentation/widgets/image_container.dart';
import 'package:meet_n_train_app/features/presentation/widgets/users_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.42,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageContainer(
                        imagePath: event.images[0].url,
                        tag: event.tag,
                        spots: event.spots),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      DateFormat(
                        'EEEE dd MMM  yyyy . hh:mm a',
                      ).format(DateTime.parse(event.date)),
                      style: TextStyle(
                          color: AppColor.grey,
                          fontFamily: FontConstants.fontFamily,
                          fontSize: 12),
                    ),
                    Text(
                      event.title,
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 18,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        event.placeName,
                        style: TextStyle(
                            color: AppColor.grey,
                            fontFamily: FontConstants.fontFamily,
                            fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          Text(
                            '${DateTime.parse(event.finishDate).difference(DateTime.now()).inDays} days left',
                            style: TextStyle(
                                fontFamily: FontConstants.fontFamily,
                                color: AppColor.primaryColor,
                                fontSize: 10),
                          ),
                          const Spacer(),
                           event.paymentMethod == 'CASH'
                              ? const DollarContainer()
                              : event.paymentMethod == 'BOTH'
                                  ? Row(
                                      children:  [
                                        DollarContainer(),
                                        Icon(Icons.credit_card),
                                        Icon(Icons.payment),
                                      ],
                                    )
                                  : Row(
                                      children: const [
                                        Icon(Icons.credit_card),
                                        Icon(FontAwesomeIcons.creditCard,
                                            size: 19),
                                      ],
                                    ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child:
                          Text(event.price == 0 ? 'Free' : 'AED ${event.price}',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontFamily: FontConstants.fontFamily,
                              )),
                    ),
                    UsersList(users: event.users)
                  ]),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
