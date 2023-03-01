import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool is6MonthChecked = true;

  bool is1YearChecked = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for EmailTextField widget.
  TextEditingController? emailTextFieldController1;
  String? Function(BuildContext, String?)? emailTextFieldController1Validator;
  // State field(s) for EmailTextField widget.
  TextEditingController? emailTextFieldController2;
  String? Function(BuildContext, String?)? emailTextFieldController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    emailTextFieldController1?.dispose();
    emailTextFieldController2?.dispose();
  }

  /// Additional helper methods are added here.

}
