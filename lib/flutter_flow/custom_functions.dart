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
  String str = name + strId;
  newList.add(str);
  return newList;
}

String getString(
  String strName,
  String strId,
) {
  return strName + strId;
}

List<String> removeStrFromList(
  String name,
  String strId,
  List<String> updatedList,
) {
  String str = name + strId;
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
      String str =
          subTopicJson[i]['node']['name'] + subTopicJson[i]['node']['id'];
      if (!subTopicList.contains(str)) {
        subTopicList.add(str);
      }
    }
  }

  if (tag == 'remove') {
    for (int i = 0; i < subTopicJson.length; i++) {
      String str =
          subTopicJson[i]['node']['name'] + subTopicJson[i]['node']['id'];
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
    String str = chapterJson[i]['node']['name'] + chapterJson[i]['node']['id'];
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
