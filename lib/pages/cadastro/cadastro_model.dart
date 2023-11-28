import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cadastro_widget.dart' show CadastroWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroModel extends FlutterFlowModel<CadastroWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;
  // State field(s) for senhaConfirmar widget.
  FocusNode? senhaConfirmarFocusNode;
  TextEditingController? senhaConfirmarController;
  late bool senhaConfirmarVisibility;
  String? Function(BuildContext, String?)? senhaConfirmarControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaVisibility = false;
    senhaConfirmarVisibility = false;
  }

  void dispose() {
    emailFocusNode?.dispose();
    emailController?.dispose();

    senhaFocusNode?.dispose();
    senhaController?.dispose();

    senhaConfirmarFocusNode?.dispose();
    senhaConfirmarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
