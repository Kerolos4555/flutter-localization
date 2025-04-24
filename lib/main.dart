import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/cubit/language_cubit.dart';
import 'package:flutter_localization/cubit/language_states.dart';
import 'package:flutter_localization/routes/route_constants.dart';
import 'package:flutter_localization/routes/router.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit()..getSavedLanguage(),
      child: BlocBuilder<LanguageCubit, LanguageStates>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Localization',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: homeRoute,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: LanguageCubit.get(context).locale,
          );
        },
      ),
    );
  }
}
