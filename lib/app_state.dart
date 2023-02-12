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
    _accessToken = prefs.getString('ff_accessToken') ?? _accessToken;
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

  void removeAtIndexFromNumberOfTabs(int _index) {
    _numberOfTabs.removeAt(_index);
  }

  bool _homeVisibility = true;
  bool get homeVisibility => _homeVisibility;
  set homeVisibility(bool _value) {
    _homeVisibility = _value;
  }

  bool _testVisibility = false;
  bool get testVisibility => _testVisibility;
  set testVisibility(bool _value) {
    _testVisibility = _value;
  }

  bool _notesVisibility = false;
  bool get notesVisibility => _notesVisibility;
  set notesVisibility(bool _value) {
    _notesVisibility = _value;
  }

  String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJpZCI6OTcsInBob25lIjoiKzkxNzAyMjAwMTQzNSIsImV4cCI6MTY4OTQwOTQ5OSwiaWF0IjoxNjczODU3NDk5fQ.jNEEFn_BpF7JQoJEDB8lhEdKvujvuOHD12IrdP6_KFk';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
    prefs.setString('ff_accessToken', _value);
  }

  bool _isCreatedTest = true;
  bool get isCreatedTest => _isCreatedTest;
  set isCreatedTest(bool _value) {
    _isCreatedTest = _value;
  }

  int _createdTestOffset = 0;
  int get createdTestOffset => _createdTestOffset;
  set createdTestOffset(int _value) {
    _createdTestOffset = _value;
  }

  int _subTopicIndex = -1;
  int get subTopicIndex => _subTopicIndex;
  set subTopicIndex(int _value) {
    _subTopicIndex = _value;
  }

  List<String> _topicName = [];
  List<String> get topicName => _topicName;
  set topicName(List<String> _value) {
    _topicName = _value;
  }

  void addToTopicName(String _value) {
    _topicName.add(_value);
  }

  void removeFromTopicName(String _value) {
    _topicName.remove(_value);
  }

  void removeAtIndexFromTopicName(int _index) {
    _topicName.removeAt(_index);
  }

  String _uniqueString = '';
  String get uniqueString => _uniqueString;
  set uniqueString(String _value) {
    _uniqueString = _value;
  }

  int _pageNumber = 0;
  int get pageNumber => _pageNumber;
  set pageNumber(int _value) {
    _pageNumber = _value;
  }

  List<dynamic> _questionList = [];
  List<dynamic> get questionList => _questionList;
  set questionList(List<dynamic> _value) {
    _questionList = _value;
  }

  void addToQuestionList(dynamic _value) {
    _questionList.add(_value);
  }

  void removeFromQuestionList(dynamic _value) {
    _questionList.remove(_value);
  }

  void removeAtIndexFromQuestionList(int _index) {
    _questionList.removeAt(_index);
  }

  int _flag = 0;
  int get flag => _flag;
  set flag(int _value) {
    _flag = _value;
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
