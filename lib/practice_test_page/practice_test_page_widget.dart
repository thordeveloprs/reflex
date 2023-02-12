import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
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
              width: 50,
              height: 50,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: InkWell(
                          onTap: () async {
                            context.pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 29,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed('testingNew');
                        },
                        child: Text(
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
                                fontSize: 18,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.black,
                    size: 29,
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 2,
            ),
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 15, 10),
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
                                            fontSize: 16,
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
                                            fontSize: 15,
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
                      padding: EdgeInsetsDirectional.fromSTEB(15, 30, 0, 5),
                      child: Text(
                        'Sections',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDEDED),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
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
                                        0, 0, 0, 10),
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

                                        context.pushNamed(
                                          'PracticeQuetionsPageCopyCopy',
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
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          width: 100,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 10, 15, 10),
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
                                                                fontSize: 16,
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
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 20, 0),
                                                child: Icon(
                                                  Icons.arrow_right_alt,
                                                  color: Colors.black,
                                                  size: 25,
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
