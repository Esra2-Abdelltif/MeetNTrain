import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train_app/features/presentation/cubit/events_bloc.dart';
import 'package:meet_n_train_app/features/presentation/widgets/event_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter/material.dart';

import '../../domain/entities/event_entity.dart';
import 'date_time_line.dart';

class EventsList extends StatefulWidget {
  const EventsList({Key? key, required this.eventsList}) : super(key: key);
  final List<Event> eventsList;

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  ScrollController scrollController = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.extentAfter == 0 &&
          EventsCubit.get(context).isLastPage) {
        EventsCubit.get(context).getEvent();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    EventsCubit cubit =  EventsCubit.get(context);
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      onRefresh: () {
        cubit.currentPage--;
        cubit.getEvent();
      },
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  width: 40,
                  child: DateTimeLine(
                    index: index,
                  )),
              SizedBox(
                child: EventCard(
                  event: widget.eventsList[index],
                ),
              ),
            ],
          );
        },

        itemCount: widget.eventsList.length,
      ),
    );
  }
}
