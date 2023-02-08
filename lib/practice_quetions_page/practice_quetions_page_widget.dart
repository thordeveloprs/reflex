import '../backend/api_requests/api_calls.dart';
import '../components/quetion_tabs_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PracticeQuetionsPageWidget extends StatefulWidget {
  const PracticeQuetionsPageWidget({
    Key? key,
    this.testId,
    this.first,
    this.offset,
  }) : super(key: key);

  final String? testId;
  final int? first;
  final int? offset;

  @override
  _PracticeQuetionsPageWidgetState createState() =>
      _PracticeQuetionsPageWidgetState();
}

class _PracticeQuetionsPageWidgetState
    extends State<PracticeQuetionsPageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkingParameter(
        widget.testId!,
        widget.first!,
        widget.offset!,
      );
    });
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: PracticeGroup
          .getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
          .call(
        testId: widget.testId,
        first: widget.first,
        offset: widget.offset,
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
        final practiceQuetionsPageGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFEDEDED),
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
                Icon(
                  Icons.grid_view,
                  color: Color(0xFF00629F),
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
              child: QuetionTabsWidget(),
            ),
          ),
        );
      },
    );
  }
}
