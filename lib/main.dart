import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamban/core/themes/theme.dart';
import 'package:kamban/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:size_config/size_config.dart';

import 'core/router/routes.dart';
import 'core/themes/cubit/theme_cubit.dart';
import 'core/translations/translations.dart';
import 'features/home_page/presentation/cubits/project_cubit.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  await setup();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocalizations.supportedLocales,
      path: 'assets/translations',
      fallbackLocale: AppLocalizations.supportedLocales.first,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProjectsCubit>()..loadProjects()),
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
      ],
      child: SizeConfigInit(
        referenceHeight: 800,
        referenceWidth: 360,
        builder: (BuildContext context, Orientation orientation) {
          return Builder(builder: (context) {
            final isDarkTheme = context.watch<ThemeCubit>().isDarkTheme;
            // TODO: language translation

            return MaterialApp.router(
              title: 'Todoist App',
              darkTheme: AppTheme.darkTheme,
              theme: AppTheme.lightTheme,
              themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              routerConfig: routerConfig,
            );
          });
        },
      ),
    );
  }
}
