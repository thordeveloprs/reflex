import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_test_page_model.dart';
export 'create_test_page_model.dart';

class CreateTestPageWidget extends StatefulWidget {
  const CreateTestPageWidget({Key? key}) : super(key: key);

  @override
  _CreateTestPageWidgetState createState() => _CreateTestPageWidgetState();
}

class _CreateTestPageWidgetState extends State<CreateTestPageWidget> {
  late CreateTestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTestPageModel());
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFD3E5F1),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      onTap: () async {
                        context.pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 29.0,
                      ),
                    ),
                  ),
                  Text(
                    'Create Your Test',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDEDED),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 0.0, 0.0),
                                        child: Text(
                                          'Test Type',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF858585),
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Mini Grand Test',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (!_model.isMiniTest)
                                                  InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.isMiniTest =
                                                            true;
                                                        _model.isGrandTest =
                                                            false;
                                                        _model.isCustomTest =
                                                            false;
                                                        _model.numberOfQuestions =
                                                            50;
                                                        _model.topicName = [];
                                                        _model.subTopicName =
                                                            [];
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.radio_button_off,
                                                      color: Colors.black,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                if (_model.isMiniTest)
                                                  Icon(
                                                    Icons.radio_button_checked,
                                                    color: Color(0xFF3474A1),
                                                    size: 20.0,
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '50 quetions, 60 minutes, from all the subjects',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFFAAAAAA),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Grand Test',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (!_model.isGrandTest)
                                                  InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.isMiniTest =
                                                            false;
                                                        _model.isGrandTest =
                                                            true;
                                                        _model.isCustomTest =
                                                            false;
                                                        _model.numberOfQuestions =
                                                            200;
                                                        _model.topicName = [];
                                                        _model.subTopicName =
                                                            [];
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.radio_button_off,
                                                      color: Colors.black,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                if (_model.isGrandTest)
                                                  Icon(
                                                    Icons.radio_button_checked,
                                                    color: Color(0xFF3474A1),
                                                    size: 20.0,
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '200 quetions, 210 minutes, from all the subjects',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFFAAAAAA),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Create Custom Test',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (!_model.isCustomTest)
                                                  InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.isMiniTest =
                                                            false;
                                                        _model.isGrandTest =
                                                            false;
                                                        _model.isCustomTest =
                                                            true;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.radio_button_off,
                                                      color: Colors.black,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                if (_model.isCustomTest)
                                                  Icon(
                                                    Icons.radio_button_checked,
                                                    color: Color(0xFF3474A1),
                                                    size: 20.0,
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 15.0),
                                        child: Text(
                                          '10, 20, 50, 100 or 200 quetions from choosen subjects',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFFAAAAAA),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 0.0, 0.0),
                                        child: Text(
                                          'Bookmarked Quetions',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF858585),
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'include bookmarked quetions',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (!_model.isBookMarked)
                                                  InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.isBookMarked =
                                                            true;
                                                        _model.bookMark = 1;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .check_box_outline_blank_outlined,
                                                      color: Colors.black,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                if (_model.isBookMarked)
                                                  InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.isBookMarked =
                                                            false;
                                                        _model.bookMark = 0;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.check_box,
                                                      color: Color(0xFF3474A1),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 15.0),
                                        child: Text(
                                          '50 quetions, 60 minutes, from all the subjects',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFFAAAAAA),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (_model.isCustomTest)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 0.0, 0.0),
                                          child: Text(
                                            'Number of Questions',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF858585),
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 5.0, 15.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '10 Questions',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (!_model.is10Que)
                                                    InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.is10Que = true;
                                                          _model.is20Que =
                                                              false;
                                                          _model.is50Que =
                                                              false;
                                                          _model.is100Que =
                                                              false;
                                                          _model.is200Que =
                                                              false;
                                                          _model.numberOfQuestions =
                                                              10;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.radio_button_off,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  if (_model.is10Que)
                                                    Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Color(0xFF3474A1),
                                                      size: 20.0,
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 5.0, 15.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '20 Questions',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (!_model.is20Que)
                                                    InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.is10Que =
                                                              false;
                                                          _model.is20Que = true;
                                                          _model.is50Que =
                                                              false;
                                                          _model.is100Que =
                                                              false;
                                                          _model.is200Que =
                                                              false;
                                                          _model.numberOfQuestions =
                                                              20;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.radio_button_off,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  if (_model.is20Que)
                                                    Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Color(0xFF3474A1),
                                                      size: 20.0,
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 5.0, 15.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '50 Questions',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (!_model.is50Que)
                                                    InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.is10Que =
                                                              false;
                                                          _model.is20Que =
                                                              false;
                                                          _model.is50Que = true;
                                                          _model.is100Que =
                                                              false;
                                                          _model.is200Que =
                                                              false;
                                                          _model.numberOfQuestions =
                                                              50;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.radio_button_off,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  if (_model.is50Que)
                                                    Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Color(0xFF3474A1),
                                                      size: 20.0,
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 5.0, 15.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '100 Questions',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (!_model.is100Que)
                                                    InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.is10Que =
                                                              false;
                                                          _model.is20Que =
                                                              false;
                                                          _model.is50Que =
                                                              false;
                                                          _model.is100Que =
                                                              true;
                                                          _model.is200Que =
                                                              false;
                                                          _model.numberOfQuestions =
                                                              100;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.radio_button_off,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  if (_model.is100Que)
                                                    Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Color(0xFF3474A1),
                                                      size: 20.0,
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 5.0, 15.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '200 Questions',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (!_model.is200Que)
                                                    InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.is10Que =
                                                              false;
                                                          _model.is20Que =
                                                              false;
                                                          _model.is50Que =
                                                              false;
                                                          _model.is100Que =
                                                              false;
                                                          _model.is200Que =
                                                              true;
                                                          _model.numberOfQuestions =
                                                              200;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.radio_button_off,
                                                        color: Colors.black,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  if (_model.is200Que)
                                                    Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Color(0xFF3474A1),
                                                      size: 20.0,
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.isCustomTest)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  'Choose subject',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF858585),
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            if (_model.isCustomTest)
                              Divider(
                                thickness: 1.0,
                              ),
                            if (_model.isCustomTest)
                              FutureBuilder<ApiCallResponse>(
                                future: TestGroup
                                    .getSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall
                                    .call(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  final columnGetSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersResponse =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final topicList = TestGroup
                                                  .getSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall
                                                  .subjectWithChapters(
                                                    columnGetSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children:
                                                List.generate(topicList.length,
                                                    (topicListIndex) {
                                              final topicListItem =
                                                  topicList[topicListIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        18.0,
                                                                        0.0,
                                                                        18.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    topicListItem,
                                                                    r'''$.name''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (!_model
                                                                        .topicName
                                                                        .contains(
                                                                            getJsonField(
                                                                      topicListItem,
                                                                      r'''$.id''',
                                                                    )))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.addToTopicName(getJsonField(
                                                                                topicListItem,
                                                                                r'''$.id''',
                                                                              ).toString());
                                                                              _model.subTopicName = functions
                                                                                  .getUpdatedList(
                                                                                      _model.subTopicName.toList(),
                                                                                      getJsonField(
                                                                                        topicListItem,
                                                                                        r'''$.topics.edges''',
                                                                                      )!,
                                                                                      'add')
                                                                                  .toList();
                                                                            });
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_box_outline_blank_outlined,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (_model
                                                                        .topicName
                                                                        .contains(
                                                                            getJsonField(
                                                                      topicListItem,
                                                                      r'''$.id''',
                                                                    )))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.removeFromTopicName(getJsonField(
                                                                                topicListItem,
                                                                                r'''$.id''',
                                                                              ).toString());
                                                                              _model.subTopicName = functions
                                                                                  .getUpdatedList(
                                                                                      _model.subTopicName.toList(),
                                                                                      getJsonField(
                                                                                        topicListItem,
                                                                                        r'''$.topics.edges''',
                                                                                      )!,
                                                                                      'remove')
                                                                                  .toList();
                                                                            });
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_box,
                                                                            color:
                                                                                Color(0xFF3474A1),
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await actions
                                                                            .getTabs(
                                                                          FFAppState()
                                                                              .subTopicIndex,
                                                                        );
                                                                        await actions
                                                                            .getTabs(
                                                                          topicListIndex,
                                                                        );
                                                                        if (topicListIndex ==
                                                                            FFAppState().subTopicIndex) {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().subTopicIndex =
                                                                                01;
                                                                            FFAppState().subTopicIndex =
                                                                                -1;
                                                                          });
                                                                          await actions
                                                                              .getTabs(
                                                                            10,
                                                                          );
                                                                        } else {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().subTopicIndex =
                                                                                topicListIndex;
                                                                            FFAppState().subTopicIndex =
                                                                                topicListIndex;
                                                                          });
                                                                        }
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (FFAppState()
                                                                  .subTopicIndex ==
                                                              topicListIndex)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEDEDED),
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final subTopicList =
                                                                        getJsonField(
                                                                      topicListItem,
                                                                      r'''$.topics.edges''',
                                                                    ).toList();
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          subTopicList
                                                                              .length,
                                                                          (subTopicListIndex) {
                                                                        final subTopicListItem =
                                                                            subTopicList[subTopicListIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              18.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  subTopicListItem,
                                                                                  r'''$.node.name''',
                                                                                ).toString().maybeHandleOverflow(
                                                                                      maxChars: 30,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (!_model.subTopicName.contains(functions.getString(
                                                                                      getJsonField(
                                                                                        subTopicListItem,
                                                                                        r'''$.node.name''',
                                                                                      ).toString(),
                                                                                      getJsonField(
                                                                                        subTopicListItem,
                                                                                        r'''$.node.id''',
                                                                                      ).toString())))
                                                                                    InkWell(
                                                                                      onTap: () async {
                                                                                        setState(() {
                                                                                          _model.subTopicName = functions
                                                                                              .getUniqueString(
                                                                                                  getJsonField(
                                                                                                    subTopicListItem,
                                                                                                    r'''$.node.name''',
                                                                                                  ).toString(),
                                                                                                  getJsonField(
                                                                                                    subTopicListItem,
                                                                                                    r'''$.node.id''',
                                                                                                  ).toString(),
                                                                                                  _model.subTopicName.toList())
                                                                                              .toList();
                                                                                        });
                                                                                        if (!functions.topicVisibility(
                                                                                            _model.subTopicName.toList(),
                                                                                            getJsonField(
                                                                                              topicListItem,
                                                                                              r'''$.topics.edges''',
                                                                                            )!,
                                                                                            'unchecked')) {
                                                                                          setState(() {
                                                                                            _model.addToTopicName(getJsonField(
                                                                                              topicListItem,
                                                                                              r'''$.id''',
                                                                                            ).toString());
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.check_box_outline_blank_outlined,
                                                                                        color: Colors.black,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                    ),
                                                                                  if (_model.subTopicName.contains(functions.getString(
                                                                                      getJsonField(
                                                                                        subTopicListItem,
                                                                                        r'''$.node.name''',
                                                                                      ).toString(),
                                                                                      getJsonField(
                                                                                        subTopicListItem,
                                                                                        r'''$.node.id''',
                                                                                      ).toString())))
                                                                                    InkWell(
                                                                                      onTap: () async {
                                                                                        setState(() {
                                                                                          _model.subTopicName = functions
                                                                                              .removeStrFromList(
                                                                                                  getJsonField(
                                                                                                    subTopicListItem,
                                                                                                    r'''$.node.name''',
                                                                                                  ).toString(),
                                                                                                  getJsonField(
                                                                                                    subTopicListItem,
                                                                                                    r'''$.node.id''',
                                                                                                  ).toString(),
                                                                                                  _model.subTopicName.toList())
                                                                                              .toList();
                                                                                          _model.removeFromTopicName(getJsonField(
                                                                                            topicListItem,
                                                                                            r'''$.id''',
                                                                                          ).toString());
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.check_box,
                                                                                        color: Color(0xFF3474A1),
                                                                                        size: 20.0,
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        FFAppState().subIds = functions.getJsonForIdsOfList(
                            _model.topicName.toList(), 'subjectId');
                        FFAppState().topicIds = functions.getJsonForIdsOfList(
                            _model.subTopicName.toList(), 'topicId');
                      });
                      _model.apiResult96m = await TestGroup
                          .createCustomTestAsPerSelectedParametersCall
                          .call(
                        numQuestions: _model.numberOfQuestions,
                        topicIdsJson: FFAppState().topicIds,
                        subjectIdsJson: FFAppState().subIds,
                        includeBookmarks: _model.bookMark,
                        authToken: FFAppState().subjectToken,
                      );
                      if ((_model.apiResult96m?.succeeded ?? true)) {
                        context.pushNamed('CreateAndPreviewTestPage');
                      }

                      setState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF00629F),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Create Test',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
