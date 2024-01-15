// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// return string argument first each json "~fieldlng,fieldlat"last
Future<String> returnString(String first, List<dynamic> jsonList) async {
  // Get the first element of jsonList
  var item = jsonList[0];

  // Set second to the lng and lat values of item
  String second = "pt=${item['lng']},${item['lat']},flag";

  String result = first + second;

  for (var item in jsonList) {
    result += "~${item['lng']},${item['lat']},pm2lbl";
  }

  // Convert the result to an imagePath
  String imagePath = "${result}";

  return imagePath;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
