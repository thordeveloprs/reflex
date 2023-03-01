import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../../auth/auth_util.dart';

int numberOfQuestins(
  List<dynamic> listOfNumber,
  int indexNumber,
) {
  print(listOfNumber);
  return listOfNumber[indexNumber];
}

List<dynamic> getJsonList(List<dynamic> questionList) {
  List<dynamic> newList = questionList;

  return newList;
}

List<String> getUniqueString(
  String name,
  String strId,
  List<String> newList,
) {
  String str = strId;
  newList.add(str);
  return newList;
}

String getString(
  String strName,
  String strId,
) {
  return strId;
}

List<String> removeStrFromList(
  String name,
  String strId,
  List<String> updatedList,
) {
  String str = strId;
  updatedList.remove(str);
  return updatedList;
}

List<String> getUpdatedList(
  List<String> subTopicList,
  List<dynamic> subTopicJson,
  String tag,
) {
  if (tag == 'add') {
    for (int i = 0; i < subTopicJson.length; i++) {
      String str = subTopicJson[i]['node']['id'];
      if (!subTopicList.contains(str)) {
        subTopicList.add(str);
      }
    }
  }

  if (tag == 'remove') {
    for (int i = 0; i < subTopicJson.length; i++) {
      String str = subTopicJson[i]['node']['id'];
      subTopicList.remove(str);
    }
  }

  print(subTopicList.length);
  return subTopicList;
}

bool topicVisibility(
  List<String> chapterString,
  List<dynamic> chapterJson,
  String tag,
) {
  int flag = 0;
  for (int i = 0; i < chapterJson.length; i++) {
    String str = chapterJson[i]['node']['id'];
    if (!chapterString.contains(str)) {
      flag = 1;
    }
  }

  if (flag == 1) {
    print('unchecked');
    return true;
  } else {
    return false;
  }
}

String converHtmlIntoString(String htmlString) {
  print(htmlString);

  return htmlString;
}

List<int> getAnswerListInInteger(List<int> testQueAnsList) {
  List<int> newList = [];
  for (int i = 0; i < testQueAnsList.length; i++) {
    if (testQueAnsList[i] != 100) {
      newList.add(testQueAnsList[i]);
    }
  }
  print(newList);
  return newList;
}

List<int> getNumberOfTabs(
  int currentIndex,
  List<dynamic> listForLength,
) {
  List<int> newList = [];
  for (int i = currentIndex; i < listForLength.length; i++) {
    newList.add(++currentIndex);
  }
  return newList;
}

List<dynamic> getupdatedBookmarkRemove(
  List<dynamic> statusList,
  dynamic jsonValue,
  int position,
) {
  for (int i = 0; i < statusList.length; i++) {
    if (i == position) {
      statusList[i]['bookmarkQuestion'] = null;
      break;
    }
  }
  return statusList;
}

int getIntFromBase64(String idInBase64) {
  List<String> splittedBase64 = [];

  Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
  // String encoded = stringToBase64Url.encode(idInBase64);
  String decoded = stringToBase64Url.decode(idInBase64);
  print(decoded.split(':'));
  splittedBase64 = decoded.split(':');

  return int.parse(splittedBase64[1]);
}

DateTime getDate(
  DateTime currentDateTime,
  int numberOfDays,
) {
  return currentDateTime.add(Duration(days: numberOfDays));
}

List<dynamic> getupdatedBookmark(
  List<dynamic> statusList,
  dynamic jsonValue,
  int position,
) {
  for (int i = 0; i < statusList.length; i++) {
    if (i == position) {
      statusList[i]['bookmarkQuestion'] = jsonValue;
      break;
    }
  }
  return statusList;
}

String? getBase64OfUserId(int userIdInt) {
  String userIdStr = "User:" + userIdInt.toString();
  Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
  String encoded = stringToBase64Url.encode(userIdStr);
  print(encoded);
  return encoded;
}

List<dynamic> getUpdatedQuestionsStatusList(
  List<dynamic> oldAnswerList,
  int intdexNumber,
  int answer,
) {
  for (int i = 0; i < oldAnswerList.length; i++) {
    if (i == intdexNumber) {
      oldAnswerList[i]['userAnswer'] = {"userAnswer": answer};
    }
  }
  return oldAnswerList;
}

int getTotalOfAllStatus(
  List<dynamic> queStatusList,
  String category,
) {
  int result = 0;

  // for bookmarks total
  if (category == 'bookmark') {
    for (int i = 0; i < queStatusList.length; i++) {
      if (queStatusList[i]['bookmarkQuestion'] != null) {
        result++;
      }
    }
  }

  // for unAttempt total
  if (category == 'unattempt') {
    for (int i = 0; i < queStatusList.length; i++) {
      if (queStatusList[i]['userAnswer'] == null) {
        result++;
      }
    }
  }

  // for correcr answer total
  if (category == 'correct') {
    for (int i = 0; i < queStatusList.length; i++) {
      if (queStatusList[i]['userAnswer'] != null) {
        if (queStatusList[i]['userAnswer']['userAnswer'] ==
            queStatusList[i]['correctOptionIndex']) {
          result++;
        }
      }
    }
  }

  // for incorrecr answer total
  if (category == 'incorrect') {
    for (int i = 0; i < queStatusList.length; i++) {
      if (queStatusList[i]['userAnswer'] != null) {
        if (queStatusList[i]['userAnswer']['userAnswer'] !=
            queStatusList[i]['correctOptionIndex']) {
          result++;
        }
      }
    }
  }

  return result;
}

List<int> getTestQuestionsAnswerList(int lengthOfCustomTest) {
  List<int> newList = [];
  for (int i = 0; i < lengthOfCustomTest; i++) {
    newList.add(100);
  }

  return newList;
}

List<int> insertValueInListInSpecificPosition(
  List<int> queAnsList,
  int position,
  int element,
) {
  // queAnsList.insert(position, element);
  queAnsList[position] = element;
  print(queAnsList);
  return queAnsList;
}

String convertQuestionAndAnsIntoMapJson(
  List<int> question,
  List<int> answer,
) {
  List<String> resultList = [];
  for (int i = 0; i < question.length; i++) {
    resultList.add('\\"${question[i]}\\": \\"${answer[i]}\\"');
  }

  String result = '{';
  result += resultList.join(", ");
  result += ('}');
  return result;
}

List<int> getQuestionIdListInInteger(
  List<dynamic> queList,
  List<int> testQueAnsList,
) {
  List<int> newList = [];
  for (int i = 0; i < queList.length; i++) {
    if (testQueAnsList[i] != 100) {
      String idStr = queList[i]['id'];
      Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
      String decoded = stringToBase64Url.decode(idStr);
      newList.add(int.parse(decoded.split(':')[1]));
    }
  }
  print(newList);
  return newList;
}

List<int> getSecondsPerQueList(
  List<int> secondsList,
  int sewconds,
) {
  secondsList.add(sewconds);
  print(secondsList);
  return secondsList;
}

List<int> getSecondsInEachPage(int lengthOfCustomTest) {
  List<int> newList = [];
  for (int i = 0; i < lengthOfCustomTest; i++) {
    newList.add(13000);
  }

  return newList;
}

List<int> insertSeconsInList(
  List<int> queAnsList,
  int position,
  int element,
) {
  if (queAnsList[position] < 300) {
    queAnsList[position] = queAnsList[position] + element;
  } else {
    queAnsList[position] = element;
  }

  print(queAnsList);
  return queAnsList;
}

List<int> getSecondsListInInt(List<int> testQueAnsList) {
  List<int> newList = [];
  for (int i = 0; i < testQueAnsList.length; i++) {
    if (testQueAnsList[i] != 13000) {
      newList.add(testQueAnsList[i]);
    }
  }
  print(newList);
  return newList;
}

dynamic getJsonForIdsOfList(
  List<String> subOrTopIdsList,
  String tag,
) {
  List<int> newList = [];

  if (tag == 'subjectId') {
    if (subOrTopIdsList.length != 0) {
      for (int i = 0; i < subOrTopIdsList.length; i++) {
        String idStr = subOrTopIdsList[i];
        Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
        String decoded = stringToBase64Url.decode(idStr);
        newList.add(int.parse(decoded.split(':')[1]));
      }
    }
  } else {
    if (subOrTopIdsList.length != 0) {
      for (int i = 0; i < subOrTopIdsList.length; i++) {
        String idStr = subOrTopIdsList[i];
        Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
        String decoded = stringToBase64Url.decode(idStr);
        newList.add(int.parse(decoded.split(':')[1]));
      }
    }
  }

  print(newList);

  return newList;
}

int seeMinAndSec(int minSec) {
  print("Hello");
  print(minSec);
  return minSec;
}
