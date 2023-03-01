import '/backend/api_requests/api_calls.dart';
import '/components/bubble_questions_widget.dart';
import '/components/report_aproblem_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'practice_quetions_page_model.dart';
export 'practice_quetions_page_model.dart';

class PracticeQuetionsPageWidget extends StatefulWidget {
  const PracticeQuetionsPageWidget({
    Key? key,
    String? testId,
    int? first,
    int? offset,
    int? numberOfQuestions,
  })  : this.testId = testId ?? 'dfgdfg',
        this.first = first ?? 0,
        this.offset = offset ?? 0,
        this.numberOfQuestions = numberOfQuestions ?? 0,
        super(key: key);

  final String testId;
  final int first;
  final int offset;
  final int numberOfQuestions;

  @override
  _PracticeQuetionsPageWidgetState createState() =>
      _PracticeQuetionsPageWidgetState();
}

class _PracticeQuetionsPageWidgetState
    extends State<PracticeQuetionsPageWidget> {
  late PracticeQuetionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticeQuetionsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().flag) {
        setState(() {
          _model.isLoading = true;
        });
        _model.apiResult4th = await PracticeGroup
            .getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
            .call(
          testId: widget.testId,
          first: widget.numberOfQuestions,
          offset: 0,
        );
        _model.newJsonList = await actions.chkJson(
          PracticeGroup
              .getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
              .testQuestions(
                (_model.apiResult4th?.jsonBody ?? ''),
              )!
              .toList(),
        );
        _model.statusList = await PracticeGroup
            .getStatusOfAllPracticeQuestionsForATestForAGivenUserCall
            .call(
          testIdInt: functions.getIntFromBase64(widget.testId),
        );
        _model.newStatusList = await actions.chkJson(
          PracticeGroup.getStatusOfAllPracticeQuestionsForATestForAGivenUserCall
              .allQuestions(
                (_model.statusList?.jsonBody ?? ''),
              )!
              .toList(),
        );
        setState(() {
          FFAppState().questionList = _model.newJsonList!.toList();
          FFAppState().flag = false;
          FFAppState().allQuestionsStatus = _model.newStatusList!.toList();
        });
        setState(() {
          _model.isLoading = false;
        });
      }
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFEDEDED),
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
                        context.pushNamed(
                          'PracticeTestPage',
                          queryParams: {
                            'teatId': serializeParam(
                              widget.testId,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 29.0,
                      ),
                    ),
                  ),
                  Text(
                    FFAppState().topicNameForEachPage,
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
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 1.0,
                          child: BubbleQuestionsWidget(
                            testId: widget.testId,
                            first: widget.first,
                            offset: widget.offset,
                            numberOfQuestions: widget.numberOfQuestions,
                          ),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                child: Icon(
                  Icons.grid_view,
                  color: Color(0xFF00629F),
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
              children: [
                if (!_model.isLoading)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Builder(
                                builder: (context) {
                                  final quetionList =
                                      FFAppState().questionList.toList();
                                  return Container(
                                    width: double.infinity,
                                    height: 500.0,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 50.0),
                                      child: PageView.builder(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: min(
                                                    valueOrDefault<int>(
                                                      FFAppState().pageNumber,
                                                      0,
                                                    ),
                                                    quetionList.length - 1)),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: quetionList.length,
                                        itemBuilder:
                                            (context, quetionListIndex) {
                                          final quetionListItem =
                                              quetionList[quetionListIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00FFFFFF),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFD3E5F1),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        (quetionListIndex +
                                                                                1)
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          5.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (getJsonField(
                                                                            FFAppState().allQuestionsStatus[quetionListIndex],
                                                                            r'''$.bookmarkQuestion''',
                                                                          ) !=
                                                                          null)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              FFAppState().allQuestionsStatus = functions.getupdatedBookmarkRemove(FFAppState().allQuestionsStatus.toList(), FFAppState().bookMarkEmptyJson, quetionListIndex).toList();
                                                                            });
                                                                            _model.apiResultdn0 =
                                                                                await PracticeGroup.createOrDeleteBookmarkForAPracticeQuestionByAUserCall.call(
                                                                              questionId: getJsonField(
                                                                                quetionListItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                              userId: functions.getBase64OfUserId(FFAppState().userIdInt),
                                                                              authToken: FFAppState().subjectToken,
                                                                            );

                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.bookmark_sharp,
                                                                            color:
                                                                                Color(0xFF00629F),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                            FFAppState().allQuestionsStatus[quetionListIndex],
                                                                            r'''$.bookmarkQuestion''',
                                                                          ) ==
                                                                          null)
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              FFAppState().allQuestionsStatus = functions.getupdatedBookmark(FFAppState().allQuestionsStatus.toList(), FFAppState().bookMarkEmptyJson, quetionListIndex).toList();
                                                                            });
                                                                            _model.apiResultdn1 =
                                                                                await PracticeGroup.createOrDeleteBookmarkForAPracticeQuestionByAUserCall.call(
                                                                              questionId: getJsonField(
                                                                                quetionListItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                              userId: functions.getBase64OfUserId(FFAppState().userIdInt),
                                                                              authToken: FFAppState().subjectToken,
                                                                            );

                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.bookmark_border,
                                                                            color:
                                                                                Color(0xFF00629F),
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 1.0,
                                                                            child:
                                                                                ReportAproblemWidget(
                                                                              testId: widget.testId,
                                                                              questionId: getJsonField(
                                                                                quetionListItem,
                                                                                r'''$.id''',
                                                                              ).toString(),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    color: Color(
                                                                        0xFF00629F),
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Html(
                                                              data:
                                                                  '${functions.converHtmlIntoString(getJsonField(
                                                                quetionListItem,
                                                                r'''$.question''',
                                                              ).toString())}',
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final queNumbers =
                                                                  FFAppState()
                                                                      .questionNumbers
                                                                      .toList();
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    queNumbers
                                                                        .length,
                                                                    (queNumbersIndex) {
                                                                  final queNumbersItem =
                                                                      queNumbers[
                                                                          queNumbersIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().allQuestionsStatus = functions
                                                                              .getUpdatedQuestionsStatusList(FFAppState().allQuestionsStatus.toList(), quetionListIndex, queNumbersIndex)
                                                                              .toList();
                                                                        });
                                                                        _model.apiResultixv = await PracticeGroup
                                                                            .createAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall
                                                                            .call(
                                                                          questionId:
                                                                              getJsonField(
                                                                            quetionListItem,
                                                                            r'''$.id''',
                                                                          ).toString(),
                                                                          userId:
                                                                              functions.getBase64OfUserId(FFAppState().userIdInt),
                                                                          userAnswer:
                                                                              queNumbersIndex,
                                                                          authToken:
                                                                              FFAppState().subjectToken,
                                                                        );

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            4.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: getJsonField(
                                                                                      FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                      r'''$.userAnswer''',
                                                                                    ) !=
                                                                                    null
                                                                                ? ((getJsonField(
                                                                                              FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                              r'''$.userAnswer.userAnswer''',
                                                                                            ) ==
                                                                                            getJsonField(
                                                                                              FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                              r'''$.correctOptionIndex''',
                                                                                            )) &&
                                                                                        (queNumbersIndex ==
                                                                                            getJsonField(
                                                                                              FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                              r'''$.correctOptionIndex''',
                                                                                            ))
                                                                                    ? Color(0xFF5EB85E)
                                                                                    : ((getJsonField(
                                                                                                  FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                  r'''$.correctOptionIndex''',
                                                                                                ) !=
                                                                                                queNumbersIndex) &&
                                                                                            (getJsonField(
                                                                                                  FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                  r'''$.userAnswer.userAnswer''',
                                                                                                ) !=
                                                                                                queNumbersIndex)
                                                                                        ? Color(0xFF5E5E5E)
                                                                                        : (getJsonField(
                                                                                                  FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                  r'''$.userAnswer.userAnswer''',
                                                                                                ) ==
                                                                                                queNumbersIndex
                                                                                            ? Color(0xFFFF2424)
                                                                                            : Color(0xFF5EB85E))))
                                                                                : Color(0xFF00629F),
                                                                            borderRadius:
                                                                                BorderRadius.circular(25.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                queNumbersItem.toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              if (getJsonField(
                                                                                    FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                    r'''$.userAnswer''',
                                                                                  ) !=
                                                                                  null)
                                                                                Text(
                                                                                  ' ( ${queNumbersIndex == 0 ? getJsonField(
                                                                                      quetionListItem,
                                                                                      r'''$.analytics.option1Percentage''',
                                                                                    ).toString() : (queNumbersIndex == 1 ? getJsonField(
                                                                                      quetionListItem,
                                                                                      r'''$.analytics.option2Percentage''',
                                                                                    ).toString() : (queNumbersIndex == 2 ? getJsonField(
                                                                                      quetionListItem,
                                                                                      r'''$.analytics.option3Percentage''',
                                                                                    ).toString() : getJsonField(
                                                                                      quetionListItem,
                                                                                      r'''$.analytics.option4Percentage''',
                                                                                    ).toString()))}% )',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                        fontWeight: FontWeight.w500,
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
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (_model.isLoading)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 200.0,
                      child: custom_widgets.CustomLoader(
                        width: double.infinity,
                        height: 200.0,
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
