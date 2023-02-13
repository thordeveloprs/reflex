import '../backend/api_requests/api_calls.dart';
import '../components/bubble_questions_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'practice_quetions_page_copy_copy_model.dart';
export 'practice_quetions_page_copy_copy_model.dart';

class PracticeQuetionsPageCopyCopyWidget extends StatefulWidget {
  const PracticeQuetionsPageCopyCopyWidget({
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
  _PracticeQuetionsPageCopyCopyWidgetState createState() =>
      _PracticeQuetionsPageCopyCopyWidgetState();
}

class _PracticeQuetionsPageCopyCopyWidgetState
    extends State<PracticeQuetionsPageCopyCopyWidget>
    with TickerProviderStateMixin {
  late PracticeQuetionsPageCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-100, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticeQuetionsPageCopyCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLoading = true;
      });
      _model.apiResult4th = await MockServeCall.call();
      _model.newJsonList = await actions.chkJson(
        MockServeCall.testQuestions(
          (_model.apiResult4th?.jsonBody ?? ''),
        )!
            .toList(),
      );
      setState(() {
        FFAppState().questionList = _model.newJsonList!.toList();
        FFAppState().flag = 1;
      });
      setState(() {
        _model.isLoading = false;
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
                  Text(
                    'Anatomy',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18,
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
                          height: MediaQuery.of(context).size.height * 1,
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
                  size: 29,
                ),
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
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Builder(
                                builder: (context) {
                                  final quetionList =
                                      FFAppState().questionList.toList();
                                  return Container(
                                    width: double.infinity,
                                    height: 500,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 50),
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
                                              Container(
                                                width: double.infinity,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final numOfqueList = functions
                                                        .getNumberOfTabs(
                                                            quetionListIndex,
                                                            FFAppState()
                                                                .questionList
                                                                .toList())
                                                        .toList();
                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            numOfqueList.length,
                                                            (numOfqueListIndex) {
                                                          final numOfqueListItem =
                                                              numOfqueList[
                                                                  numOfqueListIndex];
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        FFAppState().pageNumber =
                                                                            numOfqueListItem -
                                                                                1;
                                                                      });

                                                                      context.pushNamed(
                                                                          'PracticeQuetionsPageCopyCopy');
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 90,
                                                                      height:
                                                                          40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFD3E5F1),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        numOfqueListItem
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (numOfqueListIndex ==
                                                                      0)
                                                                    Container(
                                                                      width: 90,
                                                                      height: 8,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation']!),
                                                                ],
                                                              ),
                                                              Container(
                                                                width: 2,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF5E5E5E),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                              ),
                                                            ],
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00FFFFFF),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        10,
                                                                        15,
                                                                        0),
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
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (getJsonField(
                                                                            quetionListItem,
                                                                            r'''$.bookmarkQuestion''',
                                                                          ) !=
                                                                          null)
                                                                        Icon(
                                                                          Icons
                                                                              .bookmark_sharp,
                                                                          color:
                                                                              Color(0xFF00629F),
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      if (getJsonField(
                                                                            quetionListItem,
                                                                            r'''$.bookmarkQuestion''',
                                                                          ) ==
                                                                          null)
                                                                        Icon(
                                                                          Icons
                                                                              .bookmark_border,
                                                                          color:
                                                                              Color(0xFF00629F),
                                                                          size:
                                                                              24,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .more_vert,
                                                                  color: Color(
                                                                      0xFF00629F),
                                                                  size: 24,
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
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          50,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: getJsonField(
                                                                                  quetionListItem,
                                                                                  r'''$.userAnswer''',
                                                                                ) !=
                                                                                null
                                                                            ? ((getJsonField(
                                                                                          quetionListItem,
                                                                                          r'''$.userAnswer.userAnswer''',
                                                                                        ) ==
                                                                                        getJsonField(
                                                                                          quetionListItem,
                                                                                          r'''$.correctOptionIndex''',
                                                                                        )) &&
                                                                                    (getJsonField(
                                                                                          quetionListItem,
                                                                                          r'''$.correctOptionIndex''',
                                                                                        ) ==
                                                                                        queNumbersIndex)
                                                                                ? Color(0xFF5EB85E)
                                                                                : ((getJsonField(
                                                                                              quetionListItem,
                                                                                              r'''$.correctOptionIndex''',
                                                                                            ) !=
                                                                                            queNumbersIndex) &&
                                                                                        (getJsonField(
                                                                                              quetionListItem,
                                                                                              r'''$.userAnswer.userAnswer''',
                                                                                            ) !=
                                                                                            queNumbersIndex)
                                                                                    ? Color(0xFFA6A6A6)
                                                                                    : (getJsonField(
                                                                                              quetionListItem,
                                                                                              r'''$.userAnswer.userAnswer''',
                                                                                            ) ==
                                                                                            queNumbersIndex
                                                                                        ? Color(0xFFFF2743)
                                                                                        : Color(0xFF5EB85E))))
                                                                            : Color(0xFF00629F),
                                                                        borderRadius:
                                                                            BorderRadius.circular(25),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
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
                                                                                quetionListItem,
                                                                                r'''$.userAnswer''',
                                                                              ) !=
                                                                              null)
                                                                            Text(
                                                                              ' (${queNumbersIndex == 0 ? getJsonField(
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
                                                                                ).toString()))} %)',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                        ],
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
                      height: 200,
                      child: custom_widgets.CustomLoader(
                        width: double.infinity,
                        height: 200,
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
