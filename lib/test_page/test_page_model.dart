import '/backend/api_requests/api_calls.dart';
import '/components/bubble_track_for_test_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = false;

  int chkAnswer = 0;

  int min = 0;

  int sec = 59;

  int secondsPerQuestion = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Practice Questions for a test given id offset and first n questions)] action in TestPage widget.
  ApiCallResponse? apiResult4th;
  // Stores action output result for [Custom Action - chkJson] action in TestPage widget.
  List<dynamic>? newJsonList;
  // Stores action output result for [Backend Call - API (Get Status of all Practice Questions for a test for a given user)] action in TestPage widget.
  ApiCallResponse? statusList;
  // Stores action output result for [Custom Action - chkJson] action in TestPage widget.
  List<dynamic>? newStatusList;
  InstantTimer? instantTimer;
  InstantTimer? instantTimer1;
  // Stores action output result for [Backend Call - API (Create test attempt for a test by a user)] action in Icon widget.
  ApiCallResponse? testAttemptId1;
  // Stores action output result for [Backend Call - API (update test attempt for a test by a user based on questions attempted and time spend etc )] action in Icon widget.
  ApiCallResponse? submitRes1;
  // Stores action output result for [Backend Call - API (Create test attempt for a test by a user)] action in Text widget.
  ApiCallResponse? testAttemptId;
  // Stores action output result for [Backend Call - API (update test attempt for a test by a user based on questions attempted and time spend etc )] action in Text widget.
  ApiCallResponse? submitRes;
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Stores action output result for [Backend Call - API (Create answer for a practice question by a user with specific marked option )] action in Container widget.
  ApiCallResponse? apiResultixv;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    instantTimer?.cancel();
    instantTimer1?.cancel();
  }

  /// Additional helper methods are added here.

}
