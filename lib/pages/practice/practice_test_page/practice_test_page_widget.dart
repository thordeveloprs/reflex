import '/backend/api_requests/api_calls.dart';
import '/components/reset_pop_up/reset_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'practice_test_page_model.dart';
export 'practice_test_page_model.dart';

class PracticeTestPageWidget extends StatefulWidget {
  const PracticeTestPageWidget({
    Key? key,
    this.teatId,
  }) : super(key: key);

  final String? teatId;

  @override
  _PracticeTestPageWidgetState createState() => _PracticeTestPageWidgetState();
}

class _PracticeTestPageWidgetState extends State<PracticeTestPageWidget> {
  late PracticeTestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticeTestPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().flag = true;
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
      future: PracticeGroup.getPracticeTestDetailsForAnExampleSubjectAnatomyCall
          .call(
        testId: widget.teatId,
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
        final practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse =
            snapshot.data!;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Colors.white,
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
                            setState(() {
                              FFAppState().pageNumber = 0;
                            });

                            context.pushNamed('PracticePage');
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
                          practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                              .jsonBody,
                          r'''$.data.test.name''',
                        ).toString().maybeHandleOverflow(
                              maxChars: 25,
                              replacement: '…',
                            ),
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Color(0x00FFFFFF),
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 1.0,
                              child: ResetPopUpWidget(
                                testId: widget.teatId,
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 29.0,
                    ),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 15.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getJsonField(
                                        practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                            .jsonBody,
                                        r'''$.data.test.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16.0,
                                          ),
                                    ),
                                    Text(
                                      'No of Quetions: ${getJsonField(
                                        practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                            .jsonBody,
                                        r'''$.data.test.numQuestions''',
                                      ).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w300,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 0.0, 5.0),
                      child: Text(
                        'Sections',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDEDED),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final practiceTestSections = PracticeGroup
                                      .getPracticeTestDetailsForAnExampleSubjectAnatomyCall
                                      .sections(
                                        practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                            .jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: practiceTestSections.length,
                                itemBuilder:
                                    (context, practiceTestSectionsIndex) {
                                  final practiceTestSectionsItem =
                                      practiceTestSections[
                                          practiceTestSectionsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: InkWell(
                                      onTap: () async {
                                        _model.offSet = await actions.getOffset(
                                          getJsonField(
                                            practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                .jsonBody,
                                            r'''$.data.test.sectionNumQues''',
                                          )!,
                                          practiceTestSectionsIndex,
                                        );
                                        setState(() {
                                          FFAppState().flag = true;
                                          FFAppState().pageNumber =
                                              _model.offSet!;
                                        });

                                        context.pushNamed(
                                          'PracticeQuetionsPage',
                                          queryParams: {
                                            'testId': serializeParam(
                                              widget.teatId,
                                              ParamType.String,
                                            ),
                                            'first': serializeParam(
                                              functions.numberOfQuestins(
                                                  getJsonField(
                                                    practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                        .jsonBody,
                                                    r'''$.data.test.sectionNumQues''',
                                                  )!,
                                                  practiceTestSectionsIndex),
                                              ParamType.int,
                                            ),
                                            'offset': serializeParam(
                                              _model.offSet,
                                              ParamType.int,
                                            ),
                                            'numberOfQuestions': serializeParam(
                                              getJsonField(
                                                practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                    .jsonBody,
                                                r'''$.data.test.numQuestions''',
                                              ),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );

                                        setState(() {});
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Container(
                                          width: 100.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 10.0, 15.0, 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        practiceTestSectionsItem,
                                                        r'''$[0]''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 30,
                                                            replacement: '…',
                                                          ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16.0,
                                                              ),
                                                    ),
                                                    Text(
                                                      '${functions.numberOfQuestins(getJsonField(
                                                            practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                                .jsonBody,
                                                            r'''$.data.test.sectionNumQues''',
                                                          )!, practiceTestSectionsIndex).toString()} quetions',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 20.0, 0.0),
                                                child: Icon(
                                                  Icons.arrow_right_alt,
                                                  color: Colors.black,
                                                  size: 25.0,
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
                            },
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
