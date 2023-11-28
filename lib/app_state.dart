import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _BuscaRecente = prefs.getStringList('ff_BuscaRecente') ?? _BuscaRecente;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _BuscaAtiva = false;
  bool get BuscaAtiva => _BuscaAtiva;
  set BuscaAtiva(bool _value) {
    _BuscaAtiva = _value;
  }

  bool _BuscaAtiva2 = false;
  bool get BuscaAtiva2 => _BuscaAtiva2;
  set BuscaAtiva2(bool _value) {
    _BuscaAtiva2 = _value;
  }

  List<String> _BuscaRecente = [];
  List<String> get BuscaRecente => _BuscaRecente;
  set BuscaRecente(List<String> _value) {
    _BuscaRecente = _value;
    prefs.setStringList('ff_BuscaRecente', _value);
  }

  void addToBuscaRecente(String _value) {
    _BuscaRecente.add(_value);
    prefs.setStringList('ff_BuscaRecente', _BuscaRecente);
  }

  void removeFromBuscaRecente(String _value) {
    _BuscaRecente.remove(_value);
    prefs.setStringList('ff_BuscaRecente', _BuscaRecente);
  }

  void removeAtIndexFromBuscaRecente(int _index) {
    _BuscaRecente.removeAt(_index);
    prefs.setStringList('ff_BuscaRecente', _BuscaRecente);
  }

  void updateBuscaRecenteAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _BuscaRecente[_index] = updateFn(_BuscaRecente[_index]);
    prefs.setStringList('ff_BuscaRecente', _BuscaRecente);
  }

  void insertAtIndexInBuscaRecente(int _index, String _value) {
    _BuscaRecente.insert(_index, _value);
    prefs.setStringList('ff_BuscaRecente', _BuscaRecente);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
