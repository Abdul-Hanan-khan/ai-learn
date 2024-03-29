import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'quran_theme_event.dart';
part 'quran_theme_state.dart';

class QuranThemeBloc extends HydratedBloc<QuranThemeEvent, QuranThemeState> {
  QuranThemeBloc()
      : super(
          QuranThemeState(
            showUrduTranslation: true,
              showEnglishTranslation: true,
            translationMode: 'Urdu',
            withArabs: true,
            quranFontSize: 24,
            quranFontFamily: 'Uthman',
            translationFontSize: 16,
            translationFontFamily: 'Jameel',
          ),
        ) {
    on<QuranThemeEvent>((event, emit) async {
      if (event is ShowTranslation) {
        emit(QuranThemeState(
          showUrduTranslation: event.showUrdu,
          showEnglishTranslation: event.showEnglish,
          translationMode: state.translationMode,
          withArabs: state.withArabs,
          quranFontSize: state.quranFontSize,
          quranFontFamily: state.quranFontFamily,
          translationFontSize: state.translationFontSize,
          translationFontFamily: state.translationFontFamily,
        ));
      }
      if (event is SwitchTranslationMode) {
        emit(QuranThemeState(
          showUrduTranslation: state.showUrduTranslation,
          showEnglishTranslation: state.showEnglishTranslation,
          translationMode: event.mode,
          withArabs: state.withArabs,
          quranFontSize: state.quranFontSize,
          quranFontFamily: state.quranFontFamily,
          translationFontSize: state.translationFontSize,
          translationFontFamily: state.translationFontFamily,
        ));
      }
      if (event is ShowWithArab) {
        emit(QuranThemeState(
          showUrduTranslation: state.showUrduTranslation,
          showEnglishTranslation: state.showEnglishTranslation,
          translationMode: state.translationMode,
          withArabs: event.show,
          quranFontSize: state.quranFontSize,
          quranFontFamily: state.quranFontFamily,
          translationFontSize: state.translationFontSize,
          translationFontFamily: state.translationFontFamily,
        ));
      }
      if (event is AddQuranFontSize) {
        emit(QuranThemeState(
          showUrduTranslation: state.showUrduTranslation,
          showEnglishTranslation: state.showEnglishTranslation,
          translationMode: state.translationMode,
          withArabs: state.withArabs,
          quranFontSize: state.quranFontSize + 1,
          quranFontFamily: state.quranFontFamily,
          translationFontSize: state.translationFontSize,
          translationFontFamily: state.translationFontFamily,
        ));
      }
      if (event is ReduceQuranFontSize) {
        emit(QuranThemeState(
          showUrduTranslation: state.showUrduTranslation,
          showEnglishTranslation: state.showEnglishTranslation,
          translationMode: state.translationMode,
          withArabs: state.withArabs,
          quranFontSize: state.quranFontSize - 1,
          quranFontFamily: state.quranFontFamily,
          translationFontSize: state.translationFontSize,
          translationFontFamily: state.translationFontFamily,
        ));
      }
      if (event is SetQuranFontFamily) {
        emit(QuranThemeState(
          showUrduTranslation: state.showUrduTranslation,
          showEnglishTranslation: state.showEnglishTranslation,
          translationMode: state.translationMode,
          withArabs: state.withArabs,
          quranFontSize: state.quranFontSize,
          quranFontFamily: event.family,
          translationFontSize: state.translationFontSize,
          translationFontFamily: state.translationFontFamily,
        ));
      }
      if (event is AddTranslationFontSize) {
        emit(QuranThemeState(
          showUrduTranslation: state.showUrduTranslation,
          showEnglishTranslation: state.showEnglishTranslation,
          translationMode: state.translationMode,
          withArabs: state.withArabs,
          quranFontSize: state.quranFontSize,
          quranFontFamily: state.quranFontFamily,
          translationFontSize: state.translationFontSize + 1,
          translationFontFamily: state.translationFontFamily,
        ));
      }
      if (event is ReduceTranslationFontSize) {
        emit(QuranThemeState(
          showUrduTranslation: state.showUrduTranslation,
          showEnglishTranslation: state.showEnglishTranslation,
          translationMode: state.translationMode,
          withArabs: state.withArabs,
          quranFontSize: state.quranFontSize,
          quranFontFamily: state.quranFontFamily,
          translationFontSize: state.translationFontSize - 1,
          translationFontFamily: state.translationFontFamily,
        ));
      }
      if (event is SetTranslationFontFamily) {
        emit(QuranThemeState(
          showUrduTranslation: state.showUrduTranslation,
          showEnglishTranslation: state.showEnglishTranslation,
          translationMode: state.translationMode,
          withArabs: state.withArabs,
          quranFontSize: state.quranFontSize,
          quranFontFamily: state.quranFontFamily,
          translationFontSize: state.translationFontSize,
          translationFontFamily: event.family,
        ));
      }
    });
  }

  Stream<QuranThemeState> mapEventToState(
    QuranThemeEvent event,
  ) async* {}

  @override
  QuranThemeState? fromJson(Map<String, dynamic> json) {
    try {
      return QuranThemeState(
        showUrduTranslation: json['showUrduTranslation'] as bool,
          showEnglishTranslation: json['showEnglishTranslation'] as bool,
        translationMode: json['translationMode'].toString(),
        withArabs: json['withArabs'] as bool,
        quranFontSize: json['quranFontSize'] as double,
        quranFontFamily: json['quranFontFamily'].toString(),
        translationFontSize: json['translationFontSize'] as double,
        translationFontFamily: json['translationFontFamily'].toString(), 
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(QuranThemeState state) {
    try {
      return {
        'showTranslation': state.showUrduTranslation,
        'translationMode': state.translationMode,
        'withArabs': state.withArabs,
        'quranFontSize': state.quranFontSize,
        'quranFontFamily': state.quranFontFamily,
        'translationFontSize': state.translationFontSize,
        'translationFontFamily': state.translationFontFamily,
      };
    } catch (e) {
      return null;
    }
  }
}
