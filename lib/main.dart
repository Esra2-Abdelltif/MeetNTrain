import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train_app/bloc_observer.dart';
import 'package:meet_n_train_app/core/network/cacheHelper.dart';
import 'package:meet_n_train_app/injection_container.dart';
import 'package:meet_n_train_app/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocater().init();
  await CacheHelper.init();
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

