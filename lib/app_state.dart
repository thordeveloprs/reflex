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
    _userIdInt = prefs.getInt('ff_userIdInt') ?? _userIdInt;
    if (prefs.containsKey('ff_memberShipRes')) {
      try {
        _memberShipRes = jsonDecode(prefs.getString('ff_memberShipRes') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _memberShipResIdList =
        prefs.getStringList('ff_memberShipResIdList')?.map((x) {
              try {
                return jsonDecode(x);
              } catch (e) {
                print("Can't decode persisted json. Error: $e.");
                return {};
              }
            }).toList() ??
            _memberShipResIdList;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userName = 'Thor Developers';
  String get userName => _userName;
  set userName(String _value) {
    _userName = _value;
  }

  String _emailId = 'thordeveloper.tech@gmail.com';
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

  bool _isPageLoad = true;
  bool get isPageLoad => _isPageLoad;
  set isPageLoad(bool _value) {
    _isPageLoad = _value;
  }

  List<int> _questionNumbers = [1, 2, 3, 4];
  List<int> get questionNumbers => _questionNumbers;
  set questionNumbers(List<int> _value) {
    _questionNumbers = _value;
  }

  void addToQuestionNumbers(int _value) {
    _questionNumbers.add(_value);
  }

  void removeFromQuestionNumbers(int _value) {
    _questionNumbers.remove(_value);
  }

  void removeAtIndexFromQuestionNumbers(int _index) {
    _questionNumbers.removeAt(_index);
  }

  String _numberOfTimes = '6 months';
  String get numberOfTimes => _numberOfTimes;
  set numberOfTimes(String _value) {
    _numberOfTimes = _value;
  }

  double _actualAmount = 799;
  double get actualAmount => _actualAmount;
  set actualAmount(double _value) {
    _actualAmount = _value;
  }

  double _discountAmount = 449;
  double get discountAmount => _discountAmount;
  set discountAmount(double _value) {
    _discountAmount = _value;
  }

  bool _flag = true;
  bool get flag => _flag;
  set flag(bool _value) {
    _flag = _value;
  }

  List<dynamic> _allQuestionsStatus = [];
  List<dynamic> get allQuestionsStatus => _allQuestionsStatus;
  set allQuestionsStatus(List<dynamic> _value) {
    _allQuestionsStatus = _value;
  }

  void addToAllQuestionsStatus(dynamic _value) {
    _allQuestionsStatus.add(_value);
  }

  void removeFromAllQuestionsStatus(dynamic _value) {
    _allQuestionsStatus.remove(_value);
  }

  void removeAtIndexFromAllQuestionsStatus(int _index) {
    _allQuestionsStatus.removeAt(_index);
  }

  String _mockUserName = 'Thor Developers';
  String get mockUserName => _mockUserName;
  set mockUserName(String _value) {
    _mockUserName = _value;
  }

  String _mockEmail = 'thordeveloper.tech@gmail.com';
  String get mockEmail => _mockEmail;
  set mockEmail(String _value) {
    _mockEmail = _value;
  }

  String _subjectToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTcyMDU4NCwiZW1haWwiOiJ0aG9yZGV2ZWxvcGVyLnRlY2hAZ21haWwuY29tIiwiZXhwIjoxNjkzMjIxMTY0LCJpYXQiOjE2Nzc2NjkxNjR9.LtxNWiwsBSTUGvpoBfdowHSRxp4Pk-_BIQUpuun_dow';
  String get subjectToken => _subjectToken;
  set subjectToken(String _value) {
    _subjectToken = _value;
  }

  dynamic _bookMarkEmptyJson = jsonDecode('{\"name\":\"xyz\"}');
  dynamic get bookMarkEmptyJson => _bookMarkEmptyJson;
  set bookMarkEmptyJson(dynamic _value) {
    _bookMarkEmptyJson = _value;
  }

  int _userIdInt = 0;
  int get userIdInt => _userIdInt;
  set userIdInt(int _value) {
    _userIdInt = _value;
    prefs.setInt('ff_userIdInt', _value);
  }

  String _mockProfilePic =
      'https://lh3.googleusercontent.com/a/AEdFTp6WiotPy2D7VWwzHoWTNxvqrZaLVGuQZSfIbG4N=s360-p-no';
  String get mockProfilePic => _mockProfilePic;
  set mockProfilePic(String _value) {
    _mockProfilePic = _value;
  }

  String _topicNameForEachPage = '';
  String get topicNameForEachPage => _topicNameForEachPage;
  set topicNameForEachPage(String _value) {
    _topicNameForEachPage = _value;
  }

  dynamic _topicIds = jsonDecode('[]');
  dynamic get topicIds => _topicIds;
  set topicIds(dynamic _value) {
    _topicIds = _value;
  }

  dynamic _subIds = jsonDecode('[]');
  dynamic get subIds => _subIds;
  set subIds(dynamic _value) {
    _subIds = _value;
  }

  List<int> _testQueAnsList = [];
  List<int> get testQueAnsList => _testQueAnsList;
  set testQueAnsList(List<int> _value) {
    _testQueAnsList = _value;
  }

  void addToTestQueAnsList(int _value) {
    _testQueAnsList.add(_value);
  }

  void removeFromTestQueAnsList(int _value) {
    _testQueAnsList.remove(_value);
  }

  void removeAtIndexFromTestQueAnsList(int _index) {
    _testQueAnsList.removeAt(_index);
  }

  List<int> _questionsListInInt = [];
  List<int> get questionsListInInt => _questionsListInInt;
  set questionsListInInt(List<int> _value) {
    _questionsListInInt = _value;
  }

  void addToQuestionsListInInt(int _value) {
    _questionsListInInt.add(_value);
  }

  void removeFromQuestionsListInInt(int _value) {
    _questionsListInInt.remove(_value);
  }

  void removeAtIndexFromQuestionsListInInt(int _index) {
    _questionsListInInt.removeAt(_index);
  }

  List<int> _answerListInInt = [];
  List<int> get answerListInInt => _answerListInInt;
  set answerListInInt(List<int> _value) {
    _answerListInInt = _value;
  }

  void addToAnswerListInInt(int _value) {
    _answerListInInt.add(_value);
  }

  void removeFromAnswerListInInt(int _value) {
    _answerListInInt.remove(_value);
  }

  void removeAtIndexFromAnswerListInInt(int _index) {
    _answerListInInt.removeAt(_index);
  }

  List<int> _secondsList = [];
  List<int> get secondsList => _secondsList;
  set secondsList(List<int> _value) {
    _secondsList = _value;
  }

  void addToSecondsList(int _value) {
    _secondsList.add(_value);
  }

  void removeFromSecondsList(int _value) {
    _secondsList.remove(_value);
  }

  void removeAtIndexFromSecondsList(int _index) {
    _secondsList.removeAt(_index);
  }

  List<int> _secondsListInInt = [];
  List<int> get secondsListInInt => _secondsListInInt;
  set secondsListInInt(List<int> _value) {
    _secondsListInInt = _value;
  }

  void addToSecondsListInInt(int _value) {
    _secondsListInInt.add(_value);
  }

  void removeFromSecondsListInInt(int _value) {
    _secondsListInInt.remove(_value);
  }

  void removeAtIndexFromSecondsListInInt(int _index) {
    _secondsListInInt.removeAt(_index);
  }

  String _testAttemptId = '';
  String get testAttemptId => _testAttemptId;
  set testAttemptId(String _value) {
    _testAttemptId = _value;
  }

  int _minutes = 0;
  int get minutes => _minutes;
  set minutes(int _value) {
    _minutes = _value;
  }

  int _seconds = 0;
  int get seconds => _seconds;
  set seconds(int _value) {
    _seconds = _value;
  }

  dynamic _questionsList;
  dynamic get questionsList => _questionsList;
  set questionsList(dynamic _value) {
    _questionsList = _value;
  }

  dynamic _testAttemptData;
  dynamic get testAttemptData => _testAttemptData;
  set testAttemptData(dynamic _value) {
    _testAttemptData = _value;
  }

  dynamic _memberShipRes;
  dynamic get memberShipRes => _memberShipRes;
  set memberShipRes(dynamic _value) {
    _memberShipRes = _value;
    prefs.setString('ff_memberShipRes', jsonEncode(_value));
  }

  List<dynamic> _memberShipResIdList = [];
  List<dynamic> get memberShipResIdList => _memberShipResIdList;
  set memberShipResIdList(List<dynamic> _value) {
    _memberShipResIdList = _value;
    prefs.setStringList(
        'ff_memberShipResIdList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToMemberShipResIdList(dynamic _value) {
    _memberShipResIdList.add(_value);
    prefs.setStringList('ff_memberShipResIdList',
        _memberShipResIdList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMemberShipResIdList(dynamic _value) {
    _memberShipResIdList.remove(_value);
    prefs.setStringList('ff_memberShipResIdList',
        _memberShipResIdList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMemberShipResIdList(int _index) {
    _memberShipResIdList.removeAt(_index);
    prefs.setStringList('ff_memberShipResIdList',
        _memberShipResIdList.map((x) => jsonEncode(x)).toList());
  }

  String _mid = 'GoodEd74716548680494';
  String get mid => _mid;
  set mid(String _value) {
    _mid = _value;
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
