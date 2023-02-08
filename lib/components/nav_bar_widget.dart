import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFD3E5F1),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                Text(
                  'Practice',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                  child: Icon(
                    Icons.edit_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text(
                  'Text',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                  child: Icon(
                    Icons.book_sharp,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text(
                  'Notes',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
