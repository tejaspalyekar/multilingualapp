part of 'lang_bloc.dart';

@immutable
class LangState extends Equatable {
  final Locale fallbackLocale;
  const LangState({this.fallbackLocale = const Locale('en', 'US')});

  LangState copywith({Locale? fallbackLocale}) {
    return LangState(fallbackLocale: fallbackLocale ?? this.fallbackLocale);
  }

  @override
  List<Object?> get props => [fallbackLocale];
}
