import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic jsonCreate(
  String? photo,
  String? namePhoto,
) {
  return ({"PhotoName": namePhoto, "PhotoPath": photo});
}

List<dynamic> getHostory(List<dynamic> json) {
  List<dynamic> art = [
    {'Нет заявок': "совсем"}
  ];
  if (json.isEmpty) {
    return art;
  } else
    return json.toList();
}

LatLng? latLangFromApi(
  double? lat,
  double? lang,
) {
  double? latValid = lat;
  double? langValid = lang;
  if (lat == null || lang == null) {
    latValid == 0.00;
    langValid == 0.00;
  }
  LatLng? art = LatLng(latValid!, langValid!);
  return art;
}

LatLng latLong(List<String> json) {
  List<String> newJson = json[0].split(" ");
  LatLng art = LatLng(double.parse(newJson[1]), double.parse(newJson[0]));
  return art;
}

String statusFunc(String? button) {
  if (button == 'Получил продукт у конкурента') {
    return 'competitors';
  } else if (button == 'Не подходит продукт') {
    return 'different_product';
  } else if (button == 'Не устраивают условия') {
    return 'terms_not_satisfied';
  } else {
    return 'dont_want';
  }
}

String date(DateTime datet) {
  int year = datet.year;
  int month = datet.month;
  int day = datet.day;
  String monthString = '00';
  String dayString = '00';
  if (month < 10) {
    monthString = '0' + '$month';
  } else
    monthString = month.toString();
  if (day < 10) {
    dayString = '0' + '$day';
  } else
    dayString = day.toString();
  return ('$year' + '-' + '$monthString' + '-' + '$dayString');
}

String timeFunc(DateTime timet) {
  int hour = timet.hour;
  int minute = timet.minute;

  String hourString = '00';
  String minuteString = '00';
  if (hour < 10) {
    hourString = '0' + '$hour';
  } else
    hourString = hour.toString();
  if (minute < 10) {
    minuteString = '0' + '$minute';
  } else
    minuteString = minute.toString();
  return ('$hourString' + ':$minuteString');
}

String? photo(
  List<dynamic> json,
  int number,
) {
  for (var i = 0; i < json.length; i++) {
    var targetData = json[i] as Map<String, dynamic>?;
    if (targetData == null) {
      return ('empty');
    }
    if (targetData!['task_no'] == number) {
      return targetData['link'];
    }
  }
}

int? numberPhoto(String? string) {
  if (string == 'Пасспорт') {
    return 2;
  } else if (string == 'Селфи') {
    return 1;
  } else if (string == 'Документ 1') {
    return 3;
  }
}

String? textLat(LatLng? latlng) {
  var lat = latlng!.latitude;
  var lang = latlng!.longitude;
  return ('$lang' + '%2C' + '$lat');
}

bool? visibleButtonConfirm(List<String>? listUrl) {
  bool art = true;
  for (var i = 0; i < (listUrl!.length - 1); i++) {
    if (listUrl[i].length < 3) {
      art = false;
      return art;
    }
  }
  return art;
}

String extractDigits(String input) {
  if (input.isEmpty) {
    return ''; // возвращаем пустую строку, если входное значение пустое
  }

  String digitsOnly =
      input.replaceAll(RegExp(r'[^0-9]'), ''); // оставляем только цифры
  return digitsOnly;
}
