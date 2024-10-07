import 'package:dark_light_mode_test/app_theme.dart';
import 'package:dark_light_mode_test/cubit/app_mode_cubit.dart';
import 'package:dark_light_mode_test/home_screen.dart';
import 'package:dark_light_mode_test/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppModeCubit()..changeAppMode(ThemeState.init),
      child: BlocBuilder<AppModeCubit, AppModeState>(
        builder: (context, state) {
          if (state is AppModeLight) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightMode,
              
              home:  HomeScreen(),
            );
          } else if(state is AppModeDark ){
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.darkMode,
              home:  HomeScreen(),
            );
          }else{
 return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightMode,
              home:  HomeScreen(),
            );          }
        },
      ),
    );
  }
}
