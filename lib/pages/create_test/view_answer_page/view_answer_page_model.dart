import '/backend/api_requests/api_calls.dart';
import '/components/bubble_track_for_test_details/bubble_track_for_test_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewAnswerPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = false;

  int chkAnswer = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Practice Questions for a test given id offset and first n questions)] action in ViewAnswerPage widget.
  ApiCallResponse? apiResult4th;
  // Stores action output result for [Custom Action - chkJson] action in ViewAnswerPage widget.
  List<dynamic>? newJsonList;
  // Stores action output result for [Backend Call - API (Get Status of all Practice Questions for a test for a given user)] action in ViewAnswerPage widget.
  ApiCallResponse? statusList;
  // Stores action output result for [Custom Action - chkJson] action in ViewAnswerPage widget.
  List<dynamic>? newStatusList;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
