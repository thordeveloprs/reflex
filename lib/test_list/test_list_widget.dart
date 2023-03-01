import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_list_model.dart';
export 'test_list_model.dart';

class TestListWidget extends StatefulWidget {
  const TestListWidget({
    Key? key,
    this.pdfLink,
  }) : super(key: key);

  final String? pdfLink;

  @override
  _TestListWidgetState createState() => _TestListWidgetState();
}

class _TestListWidgetState extends State<TestListWidget> {
  late TestListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestListModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlutterFlowPdfViewer(
                  networkPath: widget.pdfLink!,
                  height: 300.0,
                  horizontalScroll: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
