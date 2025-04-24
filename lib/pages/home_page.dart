import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/cubit/language_cubit.dart';
import 'package:flutter_localization/cubit/language_states.dart';
import 'package:flutter_localization/models/languages.dart';
import 'package:flutter_localization/widgets/drawer_list.dart';
import 'package:flutter_localization/widgets/main_form.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context)!.homePage,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          BlocBuilder<LanguageCubit, LanguageStates>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: DropdownButton<Language>(
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.white,
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
        ],
      ),
      drawer: const Drawer(
        child: DrawerList(),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: MainForm(),
      ),
    );
  }
}
