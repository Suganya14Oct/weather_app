
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'temp_settings_state.dart';

class TempSettingProvider with ChangeNotifier {

  TempSettingsState _state = TempSettingsState.initial();
  TempSettingsState get state => _state;

  void toggleTempUnit() {
    _state = _state.copyWith(tempUnit: _state.tempUnit == TempUnit.celsius ? TempUnit.fahrenheit : TempUnit.celsius);
    print('temp unit: $_state');
    notifyListeners();
  }
}