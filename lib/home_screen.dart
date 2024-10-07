import 'package:dark_light_mode_test/app_theme.dart';
import 'package:dark_light_mode_test/cubit/app_mode_cubit.dart';
import 'package:dark_light_mode_test/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<AppModeCubit, AppModeState>(
                  builder: (context, state) {
                    final imagePath = (state is AppModeLight)
                        ? "assets/svg_images/cloudy.png"
                        : "assets/svg_images/night.png";
                    return Column(
                      children: [
                        Image.asset(
                          imagePath,
                          width: double.infinity,
                          height: 400,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          state is AppModeLight ? "Light Mode" : "Dark Mode",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 40),
                BlocBuilder<AppModeCubit, AppModeState>(
                  builder: (context, state) {
                    final isLightMode = state is AppModeLight;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SwitchListTile(
                        title: const Text('Toggle Theme Mode'),
                        value: isLightMode,
                        onChanged: (value) {
                          final newThemeState =
                              value ? ThemeState.light : ThemeState.dark;
                          BlocProvider.of<AppModeCubit>(context)
                              .changeAppMode(newThemeState);
                        },
                        activeColor: AppTheme.lightMode.primaryColor,
                        inactiveThumbColor: AppTheme.darkMode.primaryColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
