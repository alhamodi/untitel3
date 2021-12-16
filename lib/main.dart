import 'package:flutter/material.dart';
import 'package:untitled3/layout/cubit/cubit.dart';
import 'package:untitled3/layout/cubit/states.dart';
import 'package:untitled3/layout/home_screen.dart';
import 'package:untitled3/layout/onboarding.dart';
import 'package:untitled3/shared/cash_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/shared/components/my_bloc_observer.dart';
import 'package:untitled3/shared/theme.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  Widget? widget;

  bool? isDark = CacheHelper.getData('isDark');
  bool? showOnBoard = CacheHelper.getData('ShowOnBoard');
  Bloc.observer = MyBlocObserver();
  if (showOnBoard == false) {
    widget = HomePage();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(startWidget: widget, isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  Widget startWidget;

  MyApp({required this.startWidget, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AzkarCubit()..changeMode(fromCache: isDark),
      child: BlocConsumer<AzkarCubit, AzkarStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AzkarCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: startWidget,
              themeMode: cubit.appMode,
              theme: lightMode(),
              darkTheme: darkMode(),
            );
          }),
    );
  }
}
