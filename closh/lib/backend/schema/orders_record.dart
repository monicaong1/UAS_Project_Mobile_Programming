import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "items" field.
  List<CartStruct>? _items;
  List<CartStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "order_no" field.
  String? _orderNo;
  String get orderNo => _orderNo ?? '';
  bool hasOrderNo() => _orderNo != null;

  // "products_cart" field.
  List<DocumentReference>? _productsCart;
  List<DocumentReference> get productsCart => _productsCart ?? const [];
  bool hasProductsCart() => _productsCart != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _tax = castToType<double>(snapshotData['tax']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _total = castToType<double>(snapshotData['total']);
    _items = getStructList(
      snapshotData['items'],
      CartStruct.fromMap,
    );
    _paymentMethod = snapshotData['payment_method'] as String?;
    _orderNo = snapshotData['order_no'] as String?;
    _productsCart = getDataList(snapshotData['products_cart']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('orders').doc();

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? status,
  double? tax,
  DateTime? createdAt,
  double? total,
  String? paymentMethod,
  String? orderNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'tax': tax,
      'created_at': createdAt,
      'total': total,
      'payment_method': paymentMethod,
      'order_no': orderNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.status == e2?.status &&
        e1?.tax == e2?.tax &&
        e1?.createdAt == e2?.createdAt &&
        e1?.total == e2?.total &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.orderNo == e2?.orderNo &&
        listEquality.equals(e1?.productsCart, e2?.productsCart);
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.status,
        e?.tax,
        e?.createdAt,
        e?.total,
        e?.items,
        e?.paymentMethod,
        e?.orderNo,
        e?.productsCart
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
