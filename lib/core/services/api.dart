import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tmor/constants.dart';
import 'package:tmor/helper/local_storage_data.dart';
import 'package:tmor/models/user_model.dart';

class API {
  Future<dynamic> post({
    required String file,
    required String action,
    @required dynamic body,
  }) async {
    http.Response response = await http.post(
      Uri.parse(
        '$baseURl/$file?action=$action',
      ),
      body: jsonEncode(body),
      headers: await header(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'There is an error with status code ${response.statusCode} and with body ${response.body}',
      );
    }
  }

//get
  Future<dynamic> get({
    required String file,
    required String action,
  }) async {
    http.Response response = await http.get(
      Uri.parse(
        '$baseURl/$file?action=$action',
      ),
      headers: await header(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'There is an error with status code ${response.statusCode}',
      );
    }
  }

  Future<Map<String, String>> header() async {
    var localUserData = await LocalStorageData().getData(false, 'user');

    User? userData =
        localUserData == null ? null : User.fromJSon(jsonDecode(localUserData));
    return {
      'Authorization': userData?.authenticationCode ?? '',
      'lang_code': Get.deviceLocale?.languageCode ?? 'en',
      'user_id': userData?.id ?? '',
      'Content-Type': ' application/json',
    };
  }
}
