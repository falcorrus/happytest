import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Token = prefs.getString('ff_Token') ?? _Token;
    });
    _safeInit(() {
      _photoList = prefs.getStringList('ff_photoList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _photoList;
    });
    _safeInit(() {
      _start = _latLngFromString(prefs.getString('ff_start')) ?? _start;
    });
    _safeInit(() {
      _End = _latLngFromString(prefs.getString('ff_End')) ?? _End;
    });
    _safeInit(() {
      _Passport = prefs.getString('ff_Passport') ?? _Passport;
    });
    _safeInit(() {
      _Document1 = prefs.getString('ff_Document1') ?? _Document1;
    });
    _safeInit(() {
      _Document2 = prefs.getString('ff_Document2') ?? _Document2;
    });
    _safeInit(() {
      _startTime = prefs.containsKey('ff_startTime')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_startTime')!)
          : _startTime;
    });
    _safeInit(() {
      _EndTime = prefs.containsKey('ff_EndTime')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_EndTime')!)
          : _EndTime;
    });
    _safeInit(() {
      _PhotoCard = prefs.getString('ff_PhotoCard') ?? _PhotoCard;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _scanAS = '';
  String get scanAS => _scanAS;
  set scanAS(String value) {
    _scanAS = value;
  }

  String _Token = '';
  String get Token => _Token;
  set Token(String value) {
    _Token = value;
    prefs.setString('ff_Token', value);
  }

  List<dynamic> _photoList = [];
  List<dynamic> get photoList => _photoList;
  set photoList(List<dynamic> value) {
    _photoList = value;
    prefs.setStringList(
        'ff_photoList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToPhotoList(dynamic value) {
    _photoList.add(value);
    prefs.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromPhotoList(dynamic value) {
    _photoList.remove(value);
    prefs.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromPhotoList(int index) {
    _photoList.removeAt(index);
    prefs.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  void updatePhotoListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _photoList[index] = updateFn(_photoList[index]);
    prefs.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInPhotoList(int index, dynamic value) {
    _photoList.insert(index, value);
    prefs.setStringList(
        'ff_photoList', _photoList.map((x) => jsonEncode(x)).toList());
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String value) {
    _routeDistance = value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String value) {
    _routeDuration = value;
  }

  LatLng? _start = const LatLng(55.7533818, 37.6218572);
  LatLng? get start => _start;
  set start(LatLng? value) {
    _start = value;
    value != null
        ? prefs.setString('ff_start', value.serialize())
        : prefs.remove('ff_start');
  }

  LatLng? _End = const LatLng(55.6670601, 37.5628967);
  LatLng? get End => _End;
  set End(LatLng? value) {
    _End = value;
    value != null
        ? prefs.setString('ff_End', value.serialize())
        : prefs.remove('ff_End');
  }

  String _Passport = '';
  String get Passport => _Passport;
  set Passport(String value) {
    _Passport = value;
    prefs.setString('ff_Passport', value);
  }

  String _Document1 = '';
  String get Document1 => _Document1;
  set Document1(String value) {
    _Document1 = value;
    prefs.setString('ff_Document1', value);
  }

  String _Document2 = '';
  String get Document2 => _Document2;
  set Document2(String value) {
    _Document2 = value;
    prefs.setString('ff_Document2', value);
  }

  DateTime? _startTime = DateTime.fromMillisecondsSinceEpoch(1664434800000);
  DateTime? get startTime => _startTime;
  set startTime(DateTime? value) {
    _startTime = value;
    value != null
        ? prefs.setInt('ff_startTime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_startTime');
  }

  DateTime? _EndTime = DateTime.fromMillisecondsSinceEpoch(1663830000000);
  DateTime? get EndTime => _EndTime;
  set EndTime(DateTime? value) {
    _EndTime = value;
    value != null
        ? prefs.setInt('ff_EndTime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_EndTime');
  }

  List<String> _time = ['11:00', '12:00'];
  List<String> get time => _time;
  set time(List<String> value) {
    _time = value;
  }

  void addToTime(String value) {
    _time.add(value);
  }

  void removeFromTime(String value) {
    _time.remove(value);
  }

  void removeAtIndexFromTime(int index) {
    _time.removeAt(index);
  }

  void updateTimeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _time[index] = updateFn(_time[index]);
  }

  void insertAtIndexInTime(int index, String value) {
    _time.insert(index, value);
  }

  int _numberPhotos = 0;
  int get numberPhotos => _numberPhotos;
  set numberPhotos(int value) {
    _numberPhotos = value;
  }

  int _refuseReason = 0;
  int get refuseReason => _refuseReason;
  set refuseReason(int value) {
    _refuseReason = value;
  }

  bool _visibleprogress = false;
  bool get visibleprogress => _visibleprogress;
  set visibleprogress(bool value) {
    _visibleprogress = value;
  }

  bool _VisibleButton = false;
  bool get VisibleButton => _VisibleButton;
  set VisibleButton(bool value) {
    _VisibleButton = value;
  }

  bool _visiblebuttonGreen = false;
  bool get visiblebuttonGreen => _visiblebuttonGreen;
  set visiblebuttonGreen(bool value) {
    _visiblebuttonGreen = value;
  }

  String _PhotoCard =
      'https://rgw-fittings.ru/uploads/product/000/98/thumbs/30_1626261890.jpeg';
  String get PhotoCard => _PhotoCard;
  set PhotoCard(String value) {
    _PhotoCard = value;
    prefs.setString('ff_PhotoCard', value);
  }

  String _photo = '';
  String get photo => _photo;
  set photo(String value) {
    _photo = value;
  }

  String _Ordinka = '';
  String get Ordinka => _Ordinka;
  set Ordinka(String value) {
    _Ordinka = value;
  }

  bool _image8 = false;
  bool get image8 => _image8;
  set image8(bool value) {
    _image8 = value;
  }

  String _photo41 =
      'https://rgw-fittings.ru/uploads/product/000/98/thumbs/30_1626261890.jpeg';
  String get photo41 => _photo41;
  set photo41(String value) {
    _photo41 = value;
  }

  String _photo42 =
      'https://rgw-fittings.ru/uploads/product/000/98/thumbs/30_1626261890.jpeg';
  String get photo42 => _photo42;
  set photo42(String value) {
    _photo42 = value;
  }

  bool _photoVerifError = false;
  bool get photoVerifError => _photoVerifError;
  set photoVerifError(bool value) {
    _photoVerifError = value;
  }

  String _slug = '';
  String get slug => _slug;
  set slug(String value) {
    _slug = value;
  }

  String _nextslug = '';
  String get nextslug => _nextslug;
  set nextslug(String value) {
    _nextslug = value;
  }

  String _clientTel = '7(999)999 99-99';
  String get clientTel => _clientTel;
  set clientTel(String value) {
    _clientTel = value;
  }

  int _nextsort = 0;
  int get nextsort => _nextsort;
  set nextsort(int value) {
    _nextsort = value;
  }

  int _prodslug = 0;
  int get prodslug => _prodslug;
  set prodslug(int value) {
    _prodslug = value;
  }

  String _bankName = '';
  String get bankName => _bankName;
  set bankName(String value) {
    _bankName = value;
  }

  String _status = '';
  String get status => _status;
  set status(String value) {
    _status = value;
  }

  bool _isPersonal = false;
  bool get isPersonal => _isPersonal;
  set isPersonal(bool value) {
    _isPersonal = value;
  }

  String _pdf = '';
  String get pdf => _pdf;
  set pdf(String value) {
    _pdf = value;
  }

  List<ScansCardsStruct> _scanCards = [];
  List<ScansCardsStruct> get scanCards => _scanCards;
  set scanCards(List<ScansCardsStruct> value) {
    _scanCards = value;
  }

  void addToScanCards(ScansCardsStruct value) {
    _scanCards.add(value);
  }

  void removeFromScanCards(ScansCardsStruct value) {
    _scanCards.remove(value);
  }

  void removeAtIndexFromScanCards(int index) {
    _scanCards.removeAt(index);
  }

  void updateScanCardsAtIndex(
    int index,
    ScansCardsStruct Function(ScansCardsStruct) updateFn,
  ) {
    _scanCards[index] = updateFn(_scanCards[index]);
  }

  void insertAtIndexInScanCards(int index, ScansCardsStruct value) {
    _scanCards.insert(index, value);
  }

  bool _IsScanBack = false;
  bool get IsScanBack => _IsScanBack;
  set IsScanBack(bool value) {
    _IsScanBack = value;
  }

  String _prevSlug = '';
  String get prevSlug => _prevSlug;
  set prevSlug(String value) {
    _prevSlug = value;
  }

  int _prevSort = 0;
  int get prevSort => _prevSort;
  set prevSort(int value) {
    _prevSort = value;
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
