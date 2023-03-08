import '/backend/api_requests/api_calls.dart';
import '/components/bubble_track_for_test/bubble_track_for_test_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_page_model.dart';
export 'test_page_model.dart';

class TestPageWidget extends StatefulWidget {
  const TestPageWidget({
    Key? key,
    String? testId,
    int? first,
    int? offset,
    int? numberOfQuestions,
    this.customTestJson,
    this.min,
    this.sec,
  })  : this.testId = testId ?? 'dfgdfg',
        this.first = first ?? 0,
        this.offset = offset ?? 0,
        this.numberOfQuestions = numberOfQuestions ?? 0,
        super(key: key);

  final String testId;
  final int first;
  final int offset;
  final int numberOfQuestions;
  final dynamic customTestJson;
  final int? min;
  final int? sec;

  @override
  _TestPageWidgetState createState() => _TestPageWidgetState();
}

class _TestPageWidgetState extends State<TestPageWidget> {
  late TestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPageModel());

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
          FFAppState().testQueAnsList = functions
              .getTestQuestionsAnswerList(_model.newJsonList!.length)
              .toList();
          FFAppState().secondsList = functions
              .getSecondsInEachPage(_model.newJsonList!.length)
              .toList();
        });
        setState(() {
          _model.min = getJsonField(
            widget.customTestJson,
            r'''$.durationInMin''',
          );
          _model.sec = 59;
        });
        _model.instantTimer = InstantTimer.periodic(
          duration: Duration(milliseconds: 1000),
          callback: (timer) async {
            if (FFAppState().seconds == 0) {
              setState(() {
                _model.secondsPerQuestion = _model.secondsPerQuestion + 1;
              });
              setState(() {
                FFAppState().minutes = FFAppState().minutes + -1;
                FFAppState().seconds = 59;
              });
            } else {
              setState(() {
                _model.secondsPerQuestion = _model.secondsPerQuestion + 1;
              });
              setState(() {
                FFAppState().seconds = FFAppState().seconds + -1;
              });
            }

            setState(() {
              _model.isLoading = false;
            });
          },
          startImmediately: true,
        );
      } else {
        _model.instantTimer1 = InstantTimer.periodic(
          duration: Duration(milliseconds: 1000),
          callback: (timer) async {
            if (FFAppState().seconds == 0) {
              setState(() {
                _model.secondsPerQuestion = _model.secondsPerQuestion + 1;
              });
              setState(() {
                FFAppState().minutes = FFAppState().minutes + -1;
                FFAppState().seconds = 59;
              });
            } else {
              setState(() {
                _model.secondsPerQuestion = _model.secondsPerQuestion + 1;
              });
              setState(() {
                FFAppState().seconds = FFAppState().seconds + -1;
              });
            }

            setState(() {
              _model.isLoading = false;
            });
          },
          startImmediately: true,
        );
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
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Are you submiting the test ?'),
                                  content:
                                      Text('do you want to submit the test ?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          setState(() {
                            FFAppState().questionsListInInt = functions
                                .getQuestionIdListInInteger(
                                    FFAppState().questionList.toList(),
                                    FFAppState().testQueAnsList.toList())
                                .toList();
                            FFAppState().answerListInInt = functions
                                .getAnswerListInInteger(
                                    FFAppState().testQueAnsList.toList())
                                .toList();
                            FFAppState().secondsListInInt = functions
                                .getSecondsListInInt(
                                    FFAppState().secondsList.toList())
                                .toList();
                          });
                          _model.testAttemptId1 = await TestGroup
                              .createTestAttemptForATestByAUserCall
                              .call(
                            testId: getJsonField(
                              widget.customTestJson,
                              r'''$.id''',
                            ).toString(),
                            userId: functions
                                .getBase64OfUserId(FFAppState().userIdInt),
                            authToken: FFAppState().subjectToken,
                          );
                          _model.submitRes1 = await TestGroup
                              .updateTestAttemptForATestByAUserBasedOnQuestionsAttemptedAndTimeSpendEtcCall
                              .call(
                            testId: getJsonField(
                              widget.customTestJson,
                              r'''$.id''',
                            ).toString(),
                            userId: functions
                                .getBase64OfUserId(FFAppState().userIdInt),
                            authToken: FFAppState().subjectToken,
                            testAttemptId:
                                TestGroup.createTestAttemptForATestByAUserCall
                                    .testAttemptId(
                                      (_model.testAttemptId1?.jsonBody ?? ''),
                                    )
                                    .toString(),
                            userAnswersJsonStr:
                                functions.convertQuestionAndAnsIntoMapJson(
                                    FFAppState().questionsListInInt.toList(),
                                    FFAppState().answerListInInt.toList()),
                            userQuestionWiseDurationInSecJsonStr:
                                functions.convertQuestionAndAnsIntoMapJson(
                                    FFAppState().questionsListInInt.toList(),
                                    FFAppState().secondsListInInt.toList()),
                            visitedQuestionsJsonStr: '{}',
                            markedQuestionsJsonStr: '{}',
                            elapsedDurationInSec: 200,
                            currentQuestionOffset: 0,
                            completed: true,
                          );
                          _model.instantTimer?.cancel();
                          _model.instantTimer1?.cancel();
                          setState(() {
                            FFAppState().testAttemptId =
                                TestGroup.createTestAttemptForATestByAUserCall
                                    .testAttemptId(
                                      (_model.testAttemptId1?.jsonBody ?? ''),
                                    )
                                    .toString();
                          });

                          context.pushNamed(
                            'CreateTestResultPage',
                            queryParams: {
                              'customTestJson': serializeParam(
                                widget.customTestJson,
                                ParamType.JSON,
                              ),
                            }.withoutNulls,
                          );
                        }

                        setState(() {});
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 29.0,
                      ),
                    ),
                  ),
                  Text(
                    'Test',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: Text(
                      '${FFAppState().minutes.toString()} : ${FFAppState().seconds.toString()}',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          FFAppState().questionsListInInt = functions
                              .getQuestionIdListInInteger(
                                  FFAppState().questionList.toList(),
                                  FFAppState().testQueAnsList.toList())
                              .toList();
                          FFAppState().answerListInInt = functions
                              .getAnswerListInInteger(
                                  FFAppState().testQueAnsList.toList())
                              .toList();
                          FFAppState().secondsListInInt = functions
                              .getSecondsListInInt(
                                  FFAppState().secondsList.toList())
                              .toList();
                        });
                        _model.testAttemptId = await TestGroup
                            .createTestAttemptForATestByAUserCall
                            .call(
                          testId: getJsonField(
                            widget.customTestJson,
                            r'''$.id''',
                          ).toString(),
                          userId: functions
                              .getBase64OfUserId(FFAppState().userIdInt),
                          authToken: FFAppState().subjectToken,
                        );
                        _model.submitRes = await TestGroup
                            .updateTestAttemptForATestByAUserBasedOnQuestionsAttemptedAndTimeSpendEtcCall
                            .call(
                          testId: getJsonField(
                            widget.customTestJson,
                            r'''$.id''',
                          ).toString(),
                          userId: functions
                              .getBase64OfUserId(FFAppState().userIdInt),
                          authToken: FFAppState().subjectToken,
                          testAttemptId:
                              TestGroup.createTestAttemptForATestByAUserCall
                                  .testAttemptId(
                                    (_model.testAttemptId?.jsonBody ?? ''),
                                  )
                                  .toString(),
                          userAnswersJsonStr:
                              functions.convertQuestionAndAnsIntoMapJson(
                                  FFAppState().questionsListInInt.toList(),
                                  FFAppState().answerListInInt.toList()),
                          userQuestionWiseDurationInSecJsonStr:
                              functions.convertQuestionAndAnsIntoMapJson(
                                  FFAppState().questionsListInInt.toList(),
                                  FFAppState().secondsListInInt.toList()),
                          visitedQuestionsJsonStr: '{}',
                          markedQuestionsJsonStr: '{}',
                          elapsedDurationInSec: 200,
                          currentQuestionOffset: 0,
                          completed: true,
                        );
                        _model.instantTimer?.cancel();
                        _model.instantTimer1?.cancel();
                        setState(() {
                          FFAppState().testAttemptId =
                              TestGroup.createTestAttemptForATestByAUserCall
                                  .testAttemptId(
                                    (_model.testAttemptId?.jsonBody ?? ''),
                                  )
                                  .toString();
                        });

                        context.pushNamed(
                          'CreateTestResultPage',
                          queryParams: {
                            'customTestJson': serializeParam(
                              widget.customTestJson,
                              ParamType.JSON,
                            ),
                          }.withoutNulls,
                        );

                        setState(() {});
                      },
                      child: Text(
                        'Submit',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF3474A1),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
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
                              child: BubbleTrackForTestWidget(
                                testId: widget.testId,
                                customTestJson: widget.customTestJson,
                                min: functions.seeMinAndSec(_model.min),
                                sec: functions.seeMinAndSec(_model.sec),
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
                                                                          FFAppState().testQueAnsList = functions
                                                                              .insertValueInListInSpecificPosition(FFAppState().testQueAnsList.toList(), quetionListIndex, queNumbersIndex)
                                                                              .toList();
                                                                          FFAppState().secondsList = functions
                                                                              .insertSeconsInList(FFAppState().secondsList.toList(), quetionListIndex, _model.secondsPerQuestion)
                                                                              .toList();
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.secondsPerQuestion =
                                                                              0;
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
                                                                            color: FFAppState().testQueAnsList[quetionListIndex] < 4
                                                                                ? (FFAppState().testQueAnsList[quetionListIndex] == queNumbersIndex ? Color(0xFF5EB85E) : Color(0xFF5E5E5E))
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
