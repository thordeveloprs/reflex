import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestListModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<int> intList = [];
  void addToIntList(int item) => intList.add(item);
  void removeFromIntList(int item) => intList.remove(item);
  void removeAtIndexFromIntList(int index) => intList.removeAt(index);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
