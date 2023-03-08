import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bubble_track_for_test_details_model.dart';
export 'bubble_track_for_test_details_model.dart';

class BubbleTrackForTestDetailsWidget extends StatefulWidget {
  const BubbleTrackForTestDetailsWidget({
    Key? key,
    this.testId,
    this.first,
    this.offset,
    this.numberOfQuestions,
    this.customTestJson,
  }) : super(key: key);

  final String? testId;
  final int? first;
  final int? offset;
  final int? numberOfQuestions;
  final dynamic customTestJson;

  @override
  _BubbleTrackForTestDetailsWidgetState createState() =>
      _BubbleTrackForTestDetailsWidgetState();
}

class _BubbleTrackForTestDetailsWidgetState
    extends State<BubbleTrackForTestDetailsWidget> {
  late BubbleTrackForTestDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BubbleTrackForTestDetailsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 12.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 110.0,
                                height: 3.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF838383),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Color(0xFF00629F),
                                  size: 20.0,
                                ),
                              ),
                              Text(
                                'Question Tracker',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Icon(
                                Icons.cancel_outlined,
                                color: Color(0x0000629F),
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Color(0xFFA6A6A6),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Container(
                              height: 200.0,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final quetionList =
                                      FFAppState().questionList.toList();
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 1.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: quetionList.length,
                                    itemBuilder: (context, quetionListIndex) {
                                      final quetionListItem =
                                          quetionList[quetionListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 5.0),
                                        child: InkWell(
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().pageNumber =
                                                  quetionListIndex;
                                            });
                                            Navigator.pop(context);

                                            context.pushNamed(
                                              'ViewAnswerPage',
                                              queryParams: {
                                                'testId': serializeParam(
                                                  widget.testId,
                                                  ParamType.String,
                                                ),
                                                'customTestJson':
                                                    serializeParam(
                                                  widget.customTestJson,
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: getJsonField(
                                                        FFAppState()
                                                                .allQuestionsStatus[
                                                            quetionListIndex],
                                                        r'''$.userAnswer''',
                                                      ) !=
                                                      null
                                                  ? (getJsonField(
                                                            FFAppState()
                                                                    .allQuestionsStatus[
                                                                quetionListIndex],
                                                            r'''$.userAnswer.userAnswer''',
                                                          ) ==
                                                          getJsonField(
                                                            FFAppState()
                                                                    .allQuestionsStatus[
                                                                quetionListIndex],
                                                            r'''$.correctOptionIndex''',
                                                          )
                                                      ? Color(0xFF5EB85E)
                                                      : Color(0xFFFF2424))
                                                  : Color(0xFF5E5E5E),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              (quetionListIndex + 1).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
