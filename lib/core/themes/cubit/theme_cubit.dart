import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../main.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.light());

  // Load the saved theme preference from SharedPreferences
  Future<void> loadTheme() async {
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(isDarkMode ? const ThemeState.dark() : const ThemeState.light());
  }

  bool get isDarkTheme => state is _Light;

  // Toggle theme
  Future<void> toggleTheme() async {
    final currentState = state;
    if (currentState is _Light) {
      emit(const ThemeState.dark());
      prefs.setBool('isDarkMode', true);
    } else {
      emit(const ThemeState.light());
      prefs.setBool('isDarkMode', false);
    }
  }
}
