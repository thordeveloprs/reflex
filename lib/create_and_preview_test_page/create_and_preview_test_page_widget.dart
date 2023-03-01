import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'create_and_preview_test_page_model.dart';
export 'create_and_preview_test_page_model.dart';

class CreateAndPreviewTestPageWidget extends StatefulWidget {
  const CreateAndPreviewTestPageWidget({Key? key}) : super(key: key);

  @override
  _CreateAndPreviewTestPageWidgetState createState() =>
      _CreateAndPreviewTestPageWidgetState();
}

class _CreateAndPreviewTestPageWidgetState
    extends State<CreateAndPreviewTestPageWidget>
    with TickerProviderStateMixin {
  late CreateAndPreviewTestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-400.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-400.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(400.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAndPreviewTestPageModel());
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
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            FFAppState().update(() {
                              FFAppState().isCreatedTest = true;
                            });
                          },
                          child: Container(
                            width: 130.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FFAppState().isCreatedTest
                                  ? Color(0xFF001F24)
                                  : Color(0xFFA6A6A6),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Create Your Test',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FFAppState().isCreatedTest
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            FFAppState().update(() {
                              FFAppState().isCreatedTest = false;
                            });
                          },
                          child: Container(
                            width: 130.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: !FFAppState().isCreatedTest
                                  ? Color(0xFF001F24)
                                  : Color(0xFFA6A6A6),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Previous Tests',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: !FFAppState().isCreatedTest
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (FFAppState().isCreatedTest)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 0.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed('CreateTestPage');
                            },
                            child: Text(
                              'Create Your Test',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF00629F),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          color: Colors.black,
                          size: 20.0,
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation']!),
                  ),
                if (FFAppState().isCreatedTest)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEDED),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 15.0, 0.0),
                        child: PagedListView<ApiPagingParams, dynamic>(
                          pagingController: () {
                            if (_model.pagingController != null) {
                              return _model.pagingController!;
                            }

                            _model.pagingController = PagingController(
                              firstPageKey: ApiPagingParams(
                                nextPageNumber: 0,
                                numItems: 0,
                                lastResponse: null,
                              ),
                            );
                            _model.pagingController!
                                .addPageRequestListener((nextPageMarker) {
                              TestGroup
                                  .listOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall
                                  .call(
                                authToken: FFAppState().subjectToken,
                                first: 10,
                                offset: nextPageMarker.nextPageNumber,
                              )
                                  .then(
                                      (listViewListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingResponse) {
                                final pageItems = TestGroup
                                    .listOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall
                                    .myCustomTests(
                                      listViewListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingResponse
                                          .jsonBody,
                                    )!
                                    .toList() as List;
                                final newNumItems =
                                    nextPageMarker.numItems + pageItems.length;
                                _model.pagingController!.appendPage(
                                  pageItems,
                                  (pageItems.length > 0)
                                      ? ApiPagingParams(
                                          nextPageNumber:
                                              nextPageMarker.nextPageNumber + 1,
                                          numItems: newNumItems,
                                          lastResponse:
                                              listViewListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingResponse,
                                        )
                                      : null,
                                );
                              });
                            });
                            return _model.pagingController!;
                          }(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, customTestListIndex) {
                              final customTestListItem = _model
                                  .pagingController!
                                  .itemList![customTestListIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 15.0, 15.0, 10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getJsonField(
                                              customTestListItem,
                                              r'''$.name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            'No. of Quetions;: ${getJsonField(
                                              customTestListItem,
                                              r'''$.numQuestions''',
                                            ).toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Text(
                                            'Duration: ${getJsonField(
                                              customTestListItem,
                                              r'''$.durationInMin''',
                                            ).toString()} Min',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (getJsonField(
                                                      customTestListItem,
                                                      r'''$.completedAttempt''',
                                                    ) !=
                                                    null)
                                                  InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        FFAppState()
                                                                .testAttemptId =
                                                            getJsonField(
                                                          customTestListItem,
                                                          r'''$.completedAttempt.id''',
                                                        ).toString();
                                                      });

                                                      context.pushNamed(
                                                        'CreateTestResultPage',
                                                        queryParams: {
                                                          'customTestJson':
                                                              serializeParam(
                                                            customTestListItem,
                                                            ParamType.JSON,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      'View Result',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF3474A1),
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                if (getJsonField(
                                                      customTestListItem,
                                                      r'''$.completedAttempt''',
                                                    ) ==
                                                    null)
                                                  InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'StartTestPage',
                                                        queryParams: {
                                                          'customTestJson':
                                                              serializeParam(
                                                            customTestListItem,
                                                            ParamType.JSON,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      'Start Test',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF3474A1),
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
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
                              );
                            },
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                  ),
                if (!FFAppState().isCreatedTest)
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future:
                            TestGroup.getPreviousYearTestsInTestsTabCall.call(
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final previousTestGetPreviousYearTestsInTestsTabResponse =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEDEDED),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final previousTestList = TestGroup
                                          .getPreviousYearTestsInTestsTabCall
                                          .previousTest(
                                            previousTestGetPreviousYearTestsInTestsTabResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: previousTestList.length,
                                    itemBuilder:
                                        (context, previousTestListIndex) {
                                      final previousTestListItem =
                                          previousTestList[
                                              previousTestListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          child: Container(
                                            width: 100.0,
                                            height: 120.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 15.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      previousTestListItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Text(
                                                    'No. of Quetions: ${getJsonField(
                                                      previousTestListItem,
                                                      r'''$.numQuestions''',
                                                    ).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        if (getJsonField(
                                                              previousTestListItem,
                                                              r'''$.completedAttempt''',
                                                            ) !=
                                                            null)
                                                          InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'PreviousTestResultPage',
                                                                queryParams: {
                                                                  'customTestJson':
                                                                      serializeParam(
                                                                    previousTestListItem,
                                                                    ParamType
                                                                        .JSON,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Text(
                                                              'View Result',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF3474A1),
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (getJsonField(
                                                              previousTestListItem,
                                                              r'''$.completedAttempt''',
                                                            ) ==
                                                            null)
                                                          InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'PreviousTestStartPage',
                                                                queryParams: {
                                                                  'customTestJson':
                                                                      serializeParam(
                                                                    previousTestListItem,
                                                                    ParamType
                                                                        .JSON,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Text(
                                                              'Start Test',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF3474A1),
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
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
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!);
                        },
                      ),
                    ),
                  ),
                wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => setState(() {}),
                  child: NavBarWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
