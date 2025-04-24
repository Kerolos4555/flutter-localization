import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/cubit/language_cubit.dart';
import 'package:flutter_localization/cubit/language_states.dart';
import 'package:flutter_localization/models/languages.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settings,
        ),
      ),
      body: BlocConsumer<LanguageCubit, LanguageStates>(
        listener: (context, state) {
          if (state is ChangeLanguageState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Center(
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              hint: Text(
                AppLocalizations.of(context)!.changeLanguage,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              onChanged: (Language? language) {
                if (language != null) {
                  LanguageCubit.get(context).changeLanguage(
                    language: language.languageCode,
                  );
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            e.name,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
