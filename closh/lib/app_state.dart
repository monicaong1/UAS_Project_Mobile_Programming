import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _sum = 0.0;
  double get sum => _sum;
  set sum(double _value) {
    _sum = _value;
  }

  List<CartStruct> _cartAppState = [];
  List<CartStruct> get cartAppState => _cartAppState;
  set cartAppState(List<CartStruct> _value) {
    _cartAppState = _value;
  }

  void addToCartAppState(CartStruct _value) {
    _cartAppState.add(_value);
  }

  void removeFromCartAppState(CartStruct _value) {
    _cartAppState.remove(_value);
  }

  void removeAtIndexFromCartAppState(int _index) {
    _cartAppState.removeAt(_index);
  }

  void updateCartAppStateAtIndex(
    int _index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    _cartAppState[_index] = updateFn(_cartAppState[_index]);
  }

  void insertAtIndexInCartAppState(int _index, CartStruct _value) {
    _cartAppState.insert(_index, _value);
  }

  int _counter = 0;
  int get counter => _counter;
  set counter(int _value) {
    _counter = _value;
  }

  String _isCreated = '';
  String get isCreated => _isCreated;
  set isCreated(String _value) {
    _isCreated = _value;
  }

  int _zero = 0;
  int get zero => _zero;
  set zero(int _value) {
    _zero = _value;
  }

  List<DocumentReference> _cartState = [];
  List<DocumentReference> get cartState => _cartState;
  set cartState(List<DocumentReference> _value) {
    _cartState = _value;
  }

  void addToCartState(DocumentReference _value) {
    _cartState.add(_value);
  }

  void removeFromCartState(DocumentReference _value) {
    _cartState.remove(_value);
  }

  void removeAtIndexFromCartState(int _index) {
    _cartState.removeAt(_index);
  }

  void updateCartStateAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cartState[_index] = updateFn(_cartState[_index]);
  }

  void insertAtIndexInCartState(int _index, DocumentReference _value) {
    _cartState.insert(_index, _value);
  }

  String _defaultImage =
      'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?q=80&w=1894&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  String get defaultImage => _defaultImage;
  set defaultImage(String _value) {
    _defaultImage = _value;
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
