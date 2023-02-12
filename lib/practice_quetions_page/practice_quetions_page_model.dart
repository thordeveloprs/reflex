import '../backend/api_requests/api_calls.dart';
import '../components/quetion_tabs_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PracticeQuetionsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Practice Questions for a test given id offset and first n questions)] action in PracticeQuetionsPage widget.
  ApiCallResponse? apiResult4th;
  // Model for QuetionTabs component.
  late QuetionTabsModel quetionTabsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    quetionTabsModel = createModel(context, () => QuetionTabsModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
