import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _Token = await secureStorage.getString('ff_Token') ?? _Token;
    });
    await _safeInitAsync(() async {
      _photoList =
          (await secureStorage.getStringList('ff_photoList'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _photoList;
    });
    await _safeInitAsync(() async {
      _start = _latLngFromString(await secureStorage.getString('ff_start')) ??
          _start;
    });
    await _safeInitAsync(() async {
      _End = _latLngFromString(await secureStorage.getString('ff_End')) ?? _End;
    });
    await _safeInitAsync(() async {
      _Passport = await secureStorage.getString('ff_Passport') ?? _Passport;
    });
    await _safeInitAsync(() async {
      _Document1 = await secureStorage.getString('ff_Document1') ?? _Document1;
    });
    await _safeInitAsync(() async {
      _Document2 = await secureStorage.getString('ff_Document2') ?? _Document2;
    });
    await _safeInitAsync(() async {
      _startTime = await secureStorage.read(key: 'ff_startTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_startTime'))!)
          : _startTime;
    });
    await _safeInitAsync(() async {
      _EndTime = await secureStorage.read(key: 'ff_EndTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_EndTime'))!)
          : _EndTime;
    });
    await _safeInitAsync(() async {
      _PhotoCard = await secureStorage.getString('ff_PhotoCard') ?? _PhotoCard;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _workDone = true;
  bool get workDone => _workDone;
  set workDone(bool _value) {
    _workDone = _value;
  }

  String _Token = '';
  String get Token => _Token;
  set Token(String _value) {
    _Token = _value;
    secureStorage.setString('ff_Token', _value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_Token');
  }

  List<dynamic> _photoList = [];
  List<dynamic> get photoList => _photoList;
  set photoList(List<dynamic> _value) {
    _photoList = _value;
    secureStorage.setStringList(
        'ff_photoList', _value.map((x) => jsonEncode(x)).toList());
  }

  void deletePhotoList() {
    secureStorage.delete(key: 'ff_photoList');
  }

  void addToPhotoList(dynamic _value) {
    _photoList.add(_value);
    secureStorage.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromPhotoList(dynamic _value) {
    _photoList.remove(_value);
    secureStorage.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromPhotoList(int _index) {
    _photoList.removeAt(_index);
    secureStorage.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  void updatePhotoListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _photoList[_index] = updateFn(_photoList[_index]);
    secureStorage.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInPhotoList(int _index, dynamic _value) {
    _photoList.insert(_index, _value);
    secureStorage.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String _value) {
    _routeDistance = _value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String _value) {
    _routeDuration = _value;
  }

  LatLng? _start = LatLng(55.7533818, 37.6218572);
  LatLng? get start => _start;
  set start(LatLng? _value) {
    _start = _value;
    _value != null
        ? secureStorage.setString('ff_start', _value.serialize())
        : secureStorage.remove('ff_start');
  }

  void deleteStart() {
    secureStorage.delete(key: 'ff_start');
  }

  LatLng? _End = LatLng(55.6670601, 37.5628967);
  LatLng? get End => _End;
  set End(LatLng? _value) {
    _End = _value;
    _value != null
        ? secureStorage.setString('ff_End', _value.serialize())
        : secureStorage.remove('ff_End');
  }

  void deleteEnd() {
    secureStorage.delete(key: 'ff_End');
  }

  String _Passport = '';
  String get Passport => _Passport;
  set Passport(String _value) {
    _Passport = _value;
    secureStorage.setString('ff_Passport', _value);
  }

  void deletePassport() {
    secureStorage.delete(key: 'ff_Passport');
  }

  String _Document1 = '';
  String get Document1 => _Document1;
  set Document1(String _value) {
    _Document1 = _value;
    secureStorage.setString('ff_Document1', _value);
  }

  void deleteDocument1() {
    secureStorage.delete(key: 'ff_Document1');
  }

  String _Document2 = '';
  String get Document2 => _Document2;
  set Document2(String _value) {
    _Document2 = _value;
    secureStorage.setString('ff_Document2', _value);
  }

  void deleteDocument2() {
    secureStorage.delete(key: 'ff_Document2');
  }

  DateTime? _startTime = DateTime.fromMillisecondsSinceEpoch(1664434800000);
  DateTime? get startTime => _startTime;
  set startTime(DateTime? _value) {
    _startTime = _value;
    _value != null
        ? secureStorage.setInt('ff_startTime', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_startTime');
  }

  void deleteStartTime() {
    secureStorage.delete(key: 'ff_startTime');
  }

  DateTime? _EndTime = DateTime.fromMillisecondsSinceEpoch(1663830000000);
  DateTime? get EndTime => _EndTime;
  set EndTime(DateTime? _value) {
    _EndTime = _value;
    _value != null
        ? secureStorage.setInt('ff_EndTime', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_EndTime');
  }

  void deleteEndTime() {
    secureStorage.delete(key: 'ff_EndTime');
  }

  List<String> _time = ['11:00', '12:00'];
  List<String> get time => _time;
  set time(List<String> _value) {
    _time = _value;
  }

  void addToTime(String _value) {
    _time.add(_value);
  }

  void removeFromTime(String _value) {
    _time.remove(_value);
  }

  void removeAtIndexFromTime(int _index) {
    _time.removeAt(_index);
  }

  void updateTimeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _time[_index] = updateFn(_time[_index]);
  }

  void insertAtIndexInTime(int _index, String _value) {
    _time.insert(_index, _value);
  }

  int _numberPhotos = 0;
  int get numberPhotos => _numberPhotos;
  set numberPhotos(int _value) {
    _numberPhotos = _value;
  }

  int _refuseReason = 0;
  int get refuseReason => _refuseReason;
  set refuseReason(int _value) {
    _refuseReason = _value;
  }

  bool _visibleprogress = false;
  bool get visibleprogress => _visibleprogress;
  set visibleprogress(bool _value) {
    _visibleprogress = _value;
  }

  bool _VisibleButton = false;
  bool get VisibleButton => _VisibleButton;
  set VisibleButton(bool _value) {
    _VisibleButton = _value;
  }

  bool _visiblebuttonGreen = false;
  bool get visiblebuttonGreen => _visiblebuttonGreen;
  set visiblebuttonGreen(bool _value) {
    _visiblebuttonGreen = _value;
  }

  String _PhotoCard =
      'https://rgw-fittings.ru/uploads/product/000/98/thumbs/30_1626261890.jpeg';
  String get PhotoCard => _PhotoCard;
  set PhotoCard(String _value) {
    _PhotoCard = _value;
    secureStorage.setString('ff_PhotoCard', _value);
  }

  void deletePhotoCard() {
    secureStorage.delete(key: 'ff_PhotoCard');
  }

  String _photo = '';
  String get photo => _photo;
  set photo(String _value) {
    _photo = _value;
  }

  String _Ordinka = '';
  String get Ordinka => _Ordinka;
  set Ordinka(String _value) {
    _Ordinka = _value;
  }

  bool _newField = false;
  bool get newField => _newField;
  set newField(bool _value) {
    _newField = _value;
  }

  bool _image8 = false;
  bool get image8 => _image8;
  set image8(bool _value) {
    _image8 = _value;
  }

  String _photo41 =
      'https://rgw-fittings.ru/uploads/product/000/98/thumbs/30_1626261890.jpeg';
  String get photo41 => _photo41;
  set photo41(String _value) {
    _photo41 = _value;
  }

  String _photo42 =
      'https://rgw-fittings.ru/uploads/product/000/98/thumbs/30_1626261890.jpeg';
  String get photo42 => _photo42;
  set photo42(String _value) {
    _photo42 = _value;
  }

  bool _photoVerifError = false;
  bool get photoVerifError => _photoVerifError;
  set photoVerifError(bool _value) {
    _photoVerifError = _value;
  }

  String _slug = '';
  String get slug => _slug;
  set slug(String _value) {
    _slug = _value;
  }

  String _nextslug = '';
  String get nextslug => _nextslug;
  set nextslug(String _value) {
    _nextslug = _value;
  }

  String _clientTel = '7(999)999 99-99';
  String get clientTel => _clientTel;
  set clientTel(String _value) {
    _clientTel = _value;
  }

  int _nextsort = 0;
  int get nextsort => _nextsort;
  set nextsort(int _value) {
    _nextsort = _value;
  }

  int _prodslug = 0;
  int get prodslug => _prodslug;
  set prodslug(int _value) {
    _prodslug = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
