// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PhotoStruct extends FFFirebaseStruct {
  PhotoStruct({
    String? imageLink,
    String? hash,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imageLink = imageLink,
        _hash = hash,
        super(firestoreUtilData);

  // "imageLink" field.
  String? _imageLink;
  String get imageLink => _imageLink ?? '';
  set imageLink(String? val) => _imageLink = val;

  bool hasImageLink() => _imageLink != null;

  // "hash" field.
  String? _hash;
  String get hash => _hash ?? '';
  set hash(String? val) => _hash = val;

  bool hasHash() => _hash != null;

  static PhotoStruct fromMap(Map<String, dynamic> data) => PhotoStruct(
        imageLink: data['imageLink'] as String?,
        hash: data['hash'] as String?,
      );

  static PhotoStruct? maybeFromMap(dynamic data) =>
      data is Map ? PhotoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'imageLink': _imageLink,
        'hash': _hash,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imageLink': serializeParam(
          _imageLink,
          ParamType.String,
        ),
        'hash': serializeParam(
          _hash,
          ParamType.String,
        ),
      }.withoutNulls;

  static PhotoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PhotoStruct(
        imageLink: deserializeParam(
          data['imageLink'],
          ParamType.String,
          false,
        ),
        hash: deserializeParam(
          data['hash'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PhotoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PhotoStruct &&
        imageLink == other.imageLink &&
        hash == other.hash;
  }

  @override
  int get hashCode => const ListEquality().hash([imageLink, hash]);
}

PhotoStruct createPhotoStruct({
  String? imageLink,
  String? hash,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PhotoStruct(
      imageLink: imageLink,
      hash: hash,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PhotoStruct? updatePhotoStruct(
  PhotoStruct? photo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    photo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPhotoStructData(
  Map<String, dynamic> firestoreData,
  PhotoStruct? photo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (photo == null) {
    return;
  }
  if (photo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && photo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final photoData = getPhotoFirestoreData(photo, forFieldValue);
  final nestedData = photoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = photo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPhotoFirestoreData(
  PhotoStruct? photo, [
  bool forFieldValue = false,
]) {
  if (photo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(photo.toMap());

  // Add any Firestore field values
  photo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPhotoListFirestoreData(
  List<PhotoStruct>? photos,
) =>
    photos?.map((e) => getPhotoFirestoreData(e, true)).toList() ?? [];
