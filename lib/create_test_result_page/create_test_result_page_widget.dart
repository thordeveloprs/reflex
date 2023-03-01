import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_test_result_page_model.dart';
export 'create_test_result_page_model.dart';

class CreateTestResultPageWidget extends StatefulWidget {
  const CreateTestResultPageWidget({
    Key? key,
    this.customTestJson,
  }) : super(key: key);

  final dynamic customTestJson;

  @override
  _CreateTestResultPageWidgetState createState() =>
      _CreateTestResultPageWidgetState();
}

class _CreateTestResultPageWidgetState
    extends State<CreateTestResultPageWidget> {
  late CreateTestResultPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTestResultPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().testQueAnsList = [];
      });
    });
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

    return FutureBuilder<ApiCallResponse>(
      future: TestGroup
          .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
          .call(
        testAttemptId: FFAppState().testAttemptId,
        authToken: FFAppState().subjectToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final createTestResultPageGetCompletedTestAttemptDataWithTestResultForATestAttemptResponse =
            snapshot.data!;
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
                            context.pushNamed('CreateAndPreviewTestPage');
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 29.0,
                          ),
                        ),
                      ),
                      Text(
                        getJsonField(
                          widget.customTestJson,
                          r'''$.name''',
                        ).toString(),
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 135.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              widget.customTestJson,
                                              r'''$.name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Date: Feb 9, 2023, 11:35 AM',
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Status: Completed',
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 10.0),
                                    child: InkWell(
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().flag = true;
                                        });

                                        context.pushNamed(
                                          'ViewAnswerPage',
                                          queryParams: {
                                            'testId': serializeParam(
                                              getJsonField(
                                                widget.customTestJson,
                                                r'''$.id''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'first': serializeParam(
                                              getJsonField(
                                                widget.customTestJson,
                                                r'''$.numQuestions''',
                                              ),
                                              ParamType.int,
                                            ),
                                            'offset': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                            'numberOfQuestions': serializeParam(
                                              getJsonField(
                                                widget.customTestJson,
                                                r'''$.numQuestions''',
                                              ),
                                              ParamType.int,
                                            ),
                                            'customTestJson': serializeParam(
                                              widget.customTestJson,
                                              ParamType.JSON,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 180.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF00629F),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                'View answers',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_right_alt,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
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
                                              'Stats',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF858585),
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 5.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Correct Answers',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFAAAAAA),
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  TestGroup
                                                      .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                                                      .correctAnswerCount(
                                                        createTestResultPageGetCompletedTestAttemptDataWithTestResultForATestAttemptResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF5EB85E),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Incorrect Answers',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFAAAAAA),
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  TestGroup
                                                      .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                                                      .incorrectAnswerCount(
                                                        createTestResultPageGetCompletedTestAttemptDataWithTestResultForATestAttemptResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 10.0, 15.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Total Marks',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFAAAAAA),
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  TestGroup
                                                      .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                                                      .totalMarks(
                                                        createTestResultPageGetCompletedTestAttemptDataWithTestResultForATestAttemptResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
