import '/backend/api_requests/api_calls.dart';
import '/components/bubble_track_for_previous_answer/bubble_track_for_previous_answer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'previous_answers_page_model.dart';
export 'previous_answers_page_model.dart';

class PreviousAnswersPageWidget extends StatefulWidget {
  const PreviousAnswersPageWidget({
    Key? key,
    String? testId,
    int? first,
    int? offset,
    int? numberOfQuestions,
    this.customTestJson,
    this.min,
    this.sec,
    this.testAttemptId,
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
  final String? testAttemptId;

  @override
  _PreviousAnswersPageWidgetState createState() =>
      _PreviousAnswersPageWidgetState();
}

class _PreviousAnswersPageWidgetState extends State<PreviousAnswersPageWidget> {
  late PreviousAnswersPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreviousAnswersPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().flag) {
        setState(() {
          _model.isLoading = true;
        });
        _model.questionsList = await TestGroup
            .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
            .call(
          testAttemptId: widget.testAttemptId,
          authToken: FFAppState().subjectToken,
        );
        setState(() {
          FFAppState().questionList = TestGroup
              .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
              .questionsList(
                (_model.questionsList?.jsonBody ?? ''),
              )!
              .toList();
          FFAppState().testQueAnsList = functions
              .getTestQuestionsAnswerList(TestGroup
                  .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                  .questionsList(
                    (_model.questionsList?.jsonBody ?? ''),
                  )
                  .length)
              .toList();
          FFAppState().flag = false;
          FFAppState().secondsList = functions
              .getSecondsInEachPage(TestGroup
                  .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                  .questionsList(
                    (_model.questionsList?.jsonBody ?? ''),
                  )
                  .length)
              .toList();
          FFAppState().testAttemptId = widget.testAttemptId!;
          FFAppState().questionsList = (_model.questionsList?.jsonBody ?? '');
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
                              child: BubbleTrackForPreviousAnswerWidget(
                                testId: widget.testId,
                                customTestJson: widget.customTestJson,
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
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: functions
                                                                                      .getAnswerForPreviousTest(
                                                                                          FFAppState().questionsList,
                                                                                          getJsonField(
                                                                                            quetionListItem,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                          getJsonField(
                                                                                            quetionListItem,
                                                                                            r'''$.correctOptionIndex''',
                                                                                          ),
                                                                                          queNumbersIndex)
                                                                                      .toString() ==
                                                                                  '1'
                                                                              ? Color(0xFF5EB85E)
                                                                              : (functions
                                                                                          .getAnswerForPreviousTest(
                                                                                              FFAppState().questionsList,
                                                                                              getJsonField(
                                                                                                quetionListItem,
                                                                                                r'''$.id''',
                                                                                              ).toString(),
                                                                                              getJsonField(
                                                                                                quetionListItem,
                                                                                                r'''$.correctOptionIndex''',
                                                                                              ),
                                                                                              queNumbersIndex)
                                                                                          .toString() ==
                                                                                      '2'
                                                                                  ? Color(0xFFFF2424)
                                                                                  : Color(0xFF5E5E5E)),
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
