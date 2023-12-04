import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SizeRecord extends FirestoreRecord {
  SizeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "small" field.
  int? _small;
  int get small => _small ?? 0;
  bool hasSmall() => _small != null;

  // "medium" field.
  int? _medium;
  int get medium => _medium ?? 0;
  bool hasMedium() => _medium != null;

  // "large" field.
  int? _large;
  int get large => _large ?? 0;
  bool hasLarge() => _large != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _small = castToType<int>(snapshotData['small']);
    _medium = castToType<int>(snapshotData['medium']);
    _large = castToType<int>(snapshotData['large']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('size')
          : FirebaseFirestore.instance.collectionGroup('size');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('size').doc();

  static Stream<SizeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SizeRecord.fromSnapshot(s));

  static Future<SizeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SizeRecord.fromSnapshot(s));

  static SizeRecord fromSnapshot(DocumentSnapshot snapshot) => SizeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SizeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SizeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SizeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SizeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSizeRecordData({
  int? small,
  int? medium,
  int? large,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'small': small,
      'medium': medium,
      'large': large,
    }.withoutNulls,
  );

  return firestoreData;
}

class SizeRecordDocumentEquality implements Equality<SizeRecord> {
  const SizeRecordDocumentEquality();

  @override
  bool equals(SizeRecord? e1, SizeRecord? e2) {
    return e1?.small == e2?.small &&
        e1?.medium == e2?.medium &&
        e1?.large == e2?.large;
  }

  @override
  int hash(SizeRecord? e) =>
      const ListEquality().hash([e?.small, e?.medium, e?.large]);

  @override
  bool isValidKey(Object? o) => o is SizeRecord;
}
