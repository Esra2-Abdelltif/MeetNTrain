import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meet_n_train_app/core/utils/color_manager.dart';
import 'package:meet_n_train_app/core/utils/font_manager.dart';
import 'package:meet_n_train_app/core/utils/string_manager.dart';
import 'package:meet_n_train_app/features/presentation/cubit/events_bloc.dart';
import 'package:meet_n_train_app/features/presentation/cubit/events_state.dart';
import 'package:meet_n_train_app/features/presentation/widgets/event_list.dart';
import 'package:intl/intl.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCubit, EventsState>(
        listener: (BuildContext context, EventsState state) {},
        builder: (BuildContext context, EventsState state) {
          EventsCubit cubit = EventsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(AppStrings.schedule),
              leading: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: AppColor.black,
                          style: BorderStyle.solid,
                        )),
                    child: Icon(
                      Icons.arrow_back_rounded,
                    )),
              ),
            ),
            body: state is EventsStateLoaded
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.height * 0.09,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.1,
                                      height:
                                          MediaQuery.of(context).size.height * 0.05,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColor.primaryColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: Icon(
                                          Icons.calendar_today,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .08,
                                      child: Row(
                                        children: [
                                          Text(cubit.showedDate == null ?  DateFormat('dd').format(DateTime.now()):  DateFormat('dd').format(cubit.showedDate!,),
                                            style: TextStyle(
                                                color: AppColor.black,
                                                fontFamily:
                                                    FontConstants.fontFamily,
                                                fontSize: 30),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cubit.showedDate == null ?  DateFormat('EEEE').format(DateTime.now()):
                                                  DateFormat('EEEE').format(
                                                    cubit.showedDate!,
                                                  ),
                                                  style: TextStyle(
                                                      color: AppColor.grey,
                                                      fontFamily: FontConstants
                                                          .fontFamily,
                                                      fontSize: 15),
                                                ),
                                                Text(cubit.showedDate == null ? DateFormat('MMM yyyy').format(DateTime.now()):
                                                  DateFormat('MMM yyyy').format(cubit.showedDate!,),
                                                  style: TextStyle(
                                                      color: AppColor.black,
                                                      fontFamily: FontConstants
                                                          .fontFamily,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),

                            Expanded(
                                child: EventsList(eventsList: state.event)),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  )),
          );
        });
  }
}
