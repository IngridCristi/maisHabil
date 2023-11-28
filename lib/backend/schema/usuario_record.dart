import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuarioRecord extends FirestoreRecord {
  UsuarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Habilidade" field.
  String? _habilidade;
  String get habilidade => _habilidade ?? '';
  bool hasHabilidade() => _habilidade != null;

  // "Username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  void _initializeFields() {
    _habilidade = snapshotData['Habilidade'] as String?;
    _username = snapshotData['Username'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usuario');

  static Stream<UsuarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsuarioRecord.fromSnapshot(s));

  static Future<UsuarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsuarioRecord.fromSnapshot(s));

  static UsuarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsuarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsuarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsuarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsuarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsuarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsuarioRecordData({
  String? habilidade,
  String? username,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Habilidade': habilidade,
      'Username': username,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsuarioRecordDocumentEquality implements Equality<UsuarioRecord> {
  const UsuarioRecordDocumentEquality();

  @override
  bool equals(UsuarioRecord? e1, UsuarioRecord? e2) {
    return e1?.habilidade == e2?.habilidade && e1?.username == e2?.username;
  }

  @override
  int hash(UsuarioRecord? e) =>
      const ListEquality().hash([e?.habilidade, e?.username]);

  @override
  bool isValidKey(Object? o) => o is UsuarioRecord;
}
