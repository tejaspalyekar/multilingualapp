import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'lang_event.dart';
part 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangState()) {
    on<languageEvent>(changeCurrLang);
  }
  void changeCurrLang(languageEvent event, Emitter<LangState> emit) {
    emit((state.copywith(
        fallbackLocale: state.fallbackLocale == const Locale('en', 'US')
            ? const Locale('es', 'ES')
            : const Locale('en', 'US'))));
  }
}
