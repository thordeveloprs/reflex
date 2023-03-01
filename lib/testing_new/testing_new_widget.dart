import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'testing_new_model.dart';
export 'testing_new_model.dart';

class TestingNewWidget extends StatefulWidget {
  const TestingNewWidget({Key? key}) : super(key: key);

  @override
  _TestingNewWidgetState createState() => _TestingNewWidgetState();
}

class _TestingNewWidgetState extends State<TestingNewWidget> {
  late TestingNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestingNewModel());
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
              Container(
                width: double.infinity,
                height: 500.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FutureBuilder<ApiCallResponse>(
                  future: PracticeGroup
                      .getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
                      .call(
                    offset: FFAppState().pageNumber,
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
                    final pageViewGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse =
                        snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final queList = PracticeGroup
                                .getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
                                .testQuestions(
                                  pageViewGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse
                                      .jsonBody,
                                )
                                ?.toList() ??
                            [];
                        return Container(
                          width: double.infinity,
                          height: 500.0,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 50.0),
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: min(
                                          valueOrDefault<int>(
                                            FFAppState().pageNumber,
                                            0,
                                          ),
                                          queList.length - 1)),
                              scrollDirection: Axis.horizontal,
                              itemCount: queList.length,
                              itemBuilder: (context, queListIndex) {
                                final queListItem = queList[queListIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${queListIndex.toString()} - ${getJsonField(
                                        queListItem,
                                        r'''$.question''',
                                      ).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Builder(
                    builder: (context) {
                      final numList = FFAppState().numberOfTabs.toList();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(numList.length, (numListIndex) {
                            final numListItem = numList[numListIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: InkWell(
                                onTap: () async {
                                  setState(() {
                                    FFAppState().pageNumber = numListItem;
                                    FFAppState().pageNumber = numListItem;
                                  });
                                  _model.instantTimer = InstantTimer.periodic(
                                    duration: Duration(milliseconds: 100),
                                    callback: (timer) async {
                                      if (FFAppState().pageNumber >
                                          (_model.pageViewController?.page
                                                  ?.round() ??
                                              0)) {
                                        if (FFAppState().pageNumber ==
                                            (_model.pageViewController?.page
                                                    ?.round() ??
                                                0)) {
                                          _model.instantTimer?.cancel();
                                        } else {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      } else {
                                        if (FFAppState().pageNumber ==
                                            (_model.pageViewController?.page
                                                    ?.round() ??
                                                0)) {
                                          _model.instantTimer?.cancel();
                                        } else {
                                          await _model.pageViewController
                                              ?.previousPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      }
                                    },
                                    startImmediately: true,
                                  );
                                },
                                child: Container(
                                  width: 180.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF296F01),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    numListItem.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Button',
                options: FFButtonOptions(
                  width: 130.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
