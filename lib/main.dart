import 'package:eriell_test_app/bloc/form_bloc.dart';
import 'package:eriell_test_app/bloc/form_event.dart';
import 'package:eriell_test_app/screen_dart/BlocFormScreen.dart';
import 'package:eriell_test_app/utils_dart/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen_dart/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FormBloc()..add(InitEvent()))
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
