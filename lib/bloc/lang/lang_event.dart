part of 'lang_bloc.dart';

@immutable
abstract class LangEvent extends Equatable {
  const LangEvent();
  @override
  List<Object> get props => [];
}

class languageEvent extends LangEvent {}
