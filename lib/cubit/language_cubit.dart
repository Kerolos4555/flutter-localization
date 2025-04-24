import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/cubit/language_states.dart';
import 'package:flutter_localization/helper/cache_language_helper.dart';

class LanguageCubit extends Cubit<LanguageStates> {
  LanguageCubit() : super(LanguageInitialState());

  static LanguageCubit get(context) => BlocProvider.of(context);

  Locale locale = const Locale('en');
  Future<void> getSavedLanguage() async {
    final String? cachedLanguage = await LanguageCacheHelper().getLocale();
    if (cachedLanguage != null) {
      locale = Locale(cachedLanguage);
    } else {
      locale = const Locale('en');
    }
    emit(ChangeLanguageState());
  }

  Future<void> changeLanguage({required String language}) async {
    await LanguageCacheHelper().setLocale(language);
    locale = Locale(language);
    emit(ChangeLanguageState());
  }
}
