import 'package:meet_n_train_app/core/utils/font_manager.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:meet_n_train_app/core/utils/color_manager.dart';
import 'package:meet_n_train_app/features/presentation/cubit/events_bloc.dart';
import 'package:meet_n_train_app/features/presentation/cubit/events_state.dart';

class DateTimeLine extends StatelessWidget {
  DateTimeLine({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    EventsCubit cubit = EventsCubit.get(context);
    cubit.emit(EventsStateLoaded(event: cubit.eventsCardList));
    cubit.currentDate = DateFormat('dd MMM').format(DateTime.parse(cubit.eventsdDateList[index]));
    cubit.showedDate = DateTime.parse(cubit.eventsdDateList[index]);
    return TimelineTile(
      afterLineStyle: LineStyle(color: AppColor.grey, thickness: 1),
      beforeLineStyle: LineStyle(color: AppColor.grey, thickness: 1),
      indicatorStyle: IndicatorStyle(
          width: 28,
          height: 50,
          indicator: Container(
            width: 28,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Text(
                      DateFormat('dd').format(DateTime.parse(cubit.eventsdDateList[index])),
                      style: TextStyle( color: AppColor.white, fontSize: 10,fontFamily: FontConstants.fontFamily,),
                    ),
                    Text(
                        DateFormat('EEE')
                            .format(DateTime.parse(cubit.eventsdDateList[index])),
                        style: TextStyle( color: AppColor.white, fontSize: 10,fontFamily: FontConstants.fontFamily,)
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
