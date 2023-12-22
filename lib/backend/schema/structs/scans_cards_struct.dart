// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ScansCardsStruct extends FFFirebaseStruct {
  ScansCardsStruct({
    String? bankName,
    String? cardID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bankName = bankName,
        _cardID = cardID,
        super(firestoreUtilData);

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  set bankName(String? val) => _bankName = val;
  bool hasBankName() => _bankName != null;

  // "cardID" field.
  String? _cardID;
  String get cardID => _cardID ?? '';
  set cardID(String? val) => _cardID = val;
  bool hasCardID() => _cardID != null;

  static ScansCardsStruct fromMap(Map<String, dynamic> data) =>
      ScansCardsStruct(
        bankName: data['bankName'] as String?,
        cardID: data['cardID'] as String?,
      );

  static ScansCardsStruct? maybeFromMap(dynamic data) => data is Map
      ? ScansCardsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bankName': _bankName,
        'cardID': _cardID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bankName': serializeParam(
          _bankName,
          ParamType.String,
        ),
        'cardID': serializeParam(
          _cardID,
          ParamType.String,
        ),
      }.withoutNulls;

  static ScansCardsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScansCardsStruct(
        bankName: deserializeParam(
          data['bankName'],
          ParamType.String,
          false,
        ),
        cardID: deserializeParam(
          data['cardID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ScansCardsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScansCardsStruct &&
        bankName == other.bankName &&
        cardID == other.cardID;
  }

  @override
  int get hashCode => const ListEquality().hash([bankName, cardID]);
}

ScansCardsStruct createScansCardsStruct({
  String? bankName,
  String? cardID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScansCardsStruct(
      bankName: bankName,
      cardID: cardID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScansCardsStruct? updateScansCardsStruct(
  ScansCardsStruct? scansCards, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    scansCards
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScansCardsStructData(
  Map<String, dynamic> firestoreData,
  ScansCardsStruct? scansCards,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (scansCards == null) {
    return;
  }
  if (scansCards.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && scansCards.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scansCardsData = getScansCardsFirestoreData(scansCards, forFieldValue);
  final nestedData = scansCardsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = scansCards.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScansCardsFirestoreData(
  ScansCardsStruct? scansCards, [
  bool forFieldValue = false,
]) {
  if (scansCards == null) {
    return {};
  }
  final firestoreData = mapToFirestore(scansCards.toMap());

  // Add any Firestore field values
  scansCards.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScansCardsListFirestoreData(
  List<ScansCardsStruct>? scansCardss,
) =>
    scansCardss?.map((e) => getScansCardsFirestoreData(e, true)).toList() ?? [];
