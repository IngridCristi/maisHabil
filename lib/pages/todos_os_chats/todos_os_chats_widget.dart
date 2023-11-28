import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'todos_os_chats_model.dart';
export 'todos_os_chats_model.dart';

class TodosOsChatsWidget extends StatefulWidget {
  const TodosOsChatsWidget({Key? key}) : super(key: key);

  @override
  _TodosOsChatsWidgetState createState() => _TodosOsChatsWidgetState();
}

class _TodosOsChatsWidgetState extends State<TodosOsChatsWidget> {
  late TodosOsChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodosOsChatsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.search_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed('pesquisa1');
                    },
                  ),
                  Text(
                    'Todos os Chats',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.person,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('perfilUsuario');
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: StreamBuilder<List<ChatsRecord>>(
                  stream: queryChatsRecord(
                    queryBuilder: (chatsRecord) => chatsRecord
                        .where(
                          'users',
                          arrayContains: currentUserReference,
                        )
                        .orderBy('last_message_time', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewChatsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewChatsRecord =
                            listViewChatsRecordList[listViewIndex];
                        return StreamBuilder<FFChatInfo>(
                          stream: FFChatManager.instance
                              .getChatInfo(chatRecord: listViewChatsRecord),
                          builder: (context, snapshot) {
                            final chatInfo = snapshot.data ??
                                FFChatInfo(listViewChatsRecord);
                            return FFChatPreview(
                              onTap: () => context.pushNamed(
                                'ChatPage',
                                queryParameters: {
                                  'chatUser': serializeParam(
                                    chatInfo.otherUsers.length == 1
                                        ? chatInfo.otherUsersList.first
                                        : null,
                                    ParamType.Document,
                                  ),
                                  'chatRef': serializeParam(
                                    chatInfo.chatRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatUser': chatInfo.otherUsers.length == 1
                                      ? chatInfo.otherUsersList.first
                                      : null,
                                },
                              ),
                              lastChatText: chatInfo.chatPreviewMessage(),
                              lastChatTime: listViewChatsRecord.lastMessageTime,
                              seen: listViewChatsRecord.lastMessageSeenBy!
                                  .contains(currentUserReference),
                              title: chatInfo.chatPreviewTitle(),
                              userProfilePic: chatInfo.chatPreviewPic(),
                              color: Color(0xFFEEF0F5),
                              unreadColor: Colors.blue,
                              titleTextStyle: GoogleFonts.getFont(
                                'DM Sans',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                              dateTextStyle: GoogleFonts.getFont(
                                'DM Sans',
                                color: Color(0x73000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                              previewTextStyle: GoogleFonts.getFont(
                                'DM Sans',
                                color: Color(0x73000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 3.0, 3.0, 3.0),
                              borderRadius: BorderRadius.circular(0.0),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
