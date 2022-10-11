import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train_app/config/theme/app_light_themes.dart';
import 'package:meet_n_train_app/features/presentation/screens/home_screen.dart';
import 'package:meet_n_train_app/injection_container.dart';
import 'features/presentation/cubit/events_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<EventsCubit>()..getEvent()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightthemes,
        home: HomeScreen(),
      ),
    );
  }
}


