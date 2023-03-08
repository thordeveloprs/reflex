import '/backend/api_requests/api_calls.dart';
import '/components/bubble_track_for_previous_answer/bubble_track_for_previous_answer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PreviousAnswersPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = false;

  int chkAnswer = 0;

  int min = 0;

  int sec = 59;

  int secondsPerQuestion = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get completed test attempt data with test result for a test attempt)] action in previousAnswersPage widget.
  ApiCallResponse? questionsList;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
