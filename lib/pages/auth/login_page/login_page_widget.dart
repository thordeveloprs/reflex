import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());
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
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reflex',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 18.0, 0.0, 0.0),
                              child: Text(
                                'Reflex app guide your PG preparationn by focusing your attention on the most relevant previous year questions (PYQs). PYQs are crucial to understand the types of MCQs expected as well important topics to cover.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.7,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: InkWell(
                    onTap: () async {
                      _model.userJson = await actions.gmailLogin(
                        context,
                      );
                      FFAppState().update(() {
                        FFAppState().jwtToken = getJsonField(
                          _model.userJson,
                          r'''$.accessToken''',
                        ).toString();
                        FFAppState().userName = getJsonField(
                          _model.userJson,
                          r'''$.name''',
                        ).toString();
                        FFAppState().emailId = getJsonField(
                          _model.userJson,
                          r'''$.email''',
                        ).toString();
                        FFAppState().displayImage = getJsonField(
                          _model.userJson,
                          r'''$.profile''',
                        );
                      });
                      _model.userAccessInfo = await SignupGroup
                          .googleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall
                          .call(
                        email: FFAppState().emailId,
                        name: FFAppState().userName,
                        picture:
                            functions.getImgInStr(FFAppState().displayImage),
                      );
                      await actions.getJson(
                        (_model.userAccessInfo?.jsonBody ?? ''),
                      );
                      setState(() {
                        FFAppState().userIdInt = getJsonField(
                          (_model.userAccessInfo?.jsonBody ?? ''),
                          r'''$.id''',
                        );
                        FFAppState().subjectToken = getJsonField(
                          (_model.userAccessInfo?.jsonBody ?? ''),
                          r'''$.token''',
                        ).toString();
                        FFAppState().subjectToken1 = getJsonField(
                          (_model.userAccessInfo?.jsonBody ?? ''),
                          r'''$.token''',
                        ).toString();
                      });

                      setState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 5.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: SvgPicture.asset(
                                'assets/images/google-icon.svg',
                                width: 20.0,
                                height: 40.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              'Login Via Google',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 18.0, 20.0, 25.0),
                  child: Wrap(
                    spacing: 0.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        'By ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'tapping Logigin via google',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        ', you ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'acknowledge',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        '.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        'that ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'you ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'have ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'read the ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'have ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchURL('https://neetprep.com/tos');
                        },
                        child: Text(
                          'Privacy ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF457392),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchURL('https://neetprep.com/tos');
                        },
                        child: Text(
                          'Policy ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF457392),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                      Text(
                        'and agree ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'to the ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchURL('https://neetprep.com/tos');
                        },
                        child: Text(
                          'Term ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF457392),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchURL('https://neetprep.com/tos');
                        },
                        child: Text(
                          'of  ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF457392),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchURL('https://neetprep.com/tos');
                        },
                        child: Text(
                          'Services',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF457392),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (false)
                  InkWell(
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      final user = await signInWithGoogle(context);
                      if (user == null) {
                        return;
                      }

                      context.goNamedAuth('PracticePage', mounted);
                    },
                    child: Text(
                      'Hello World',
                      style: FlutterFlowTheme.of(context).bodyText1,
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
