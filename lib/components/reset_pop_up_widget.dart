import '/components/reset_surity_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reset_pop_up_model.dart';
export 'reset_pop_up_model.dart';

class ResetPopUpWidget extends StatefulWidget {
  const ResetPopUpWidget({
    Key? key,
    this.testId,
  }) : super(key: key);

  final String? testId;

  @override
  _ResetPopUpWidgetState createState() => _ResetPopUpWidgetState();
}

class _ResetPopUpWidgetState extends State<ResetPopUpWidget> {
  late ResetPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPopUpModel());
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
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x20000000),
                              barrierColor: Color(0x16000000),
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        1.0,
                                    child: ResetSurityPopUpWidget(
                                      testId: widget.testId,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Container(
                            width: 170.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFD3E5F1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            alignment: AlignmentDirectional(-0.4, 0.0),
                            child: Text(
                              'Reset Attempts',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
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
      ],
    );
  }
}
