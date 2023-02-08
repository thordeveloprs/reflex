import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _jwtToken = prefs.getString('ff_jwtToken') ?? _jwtToken;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userName = '';
  String get userName => _userName;
  set userName(String _value) {
    _userName = _value;
  }

  String _emailId = '';
  String get emailId => _emailId;
  set emailId(String _value) {
    _emailId = _value;
  }

  String _displayImage = '';
  String get displayImage => _displayImage;
  set displayImage(String _value) {
    _displayImage = _value;
  }

  String _jwtToken = '';
  String get jwtToken => _jwtToken;
  set jwtToken(String _value) {
    _jwtToken = _value;
    prefs.setString('ff_jwtToken', _value);
  }

  List<dynamic> _practiceTestData = [];
  List<dynamic> get practiceTestData => _practiceTestData;
  set practiceTestData(List<dynamic> _value) {
    _practiceTestData = _value;
  }

  void addToPracticeTestData(dynamic _value) {
    _practiceTestData.add(_value);
  }

  void removeFromPracticeTestData(dynamic _value) {
    _practiceTestData.remove(_value);
  }

  List<int> _numberOfTabs = [];
  List<int> get numberOfTabs => _numberOfTabs;
  set numberOfTabs(List<int> _value) {
    _numberOfTabs = _value;
  }

  void addToNumberOfTabs(int _value) {
    _numberOfTabs.add(_value);
  }

  void removeFromNumberOfTabs(int _value) {
    _numberOfTabs.remove(_value);
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
