import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool is6MonthChecked = true;

  bool is1YearChecked = false;

  String amount = '499.00';

  String title = '6 month access';

  String fee = '799.00';

  String cc = '216413';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Create payment for a user for a course and course offer and get checksum)] action in Container widget.
  ApiCallResponse? paymentDetails;
  // State field(s) for NameTextField widget.
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  // State field(s) for EmailTextField widget.
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  // State field(s) for PhoneTextField widget.
  TextEditingController? phoneTextFieldController;
  String? Function(BuildContext, String?)? phoneTextFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameTextFieldController?.dispose();
    emailTextFieldController?.dispose();
    phoneTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
