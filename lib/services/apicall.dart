// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_doctors/services/databasecall.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_doctors/utils/impact.dart';

class ApiCall {
  static Future<bool> requestTokens(
      BuildContext context, bool refreshedToken) async {
    late String requestType;
    late bool auth;

    if (refreshedToken == true) {
      requestType = "refresh token";
    } else {
      requestType = "access token";
    }

    const url = Impact.baseUrl + Impact.tokenEndpoint;
    final body = {
      "username": Impact.username,
      "password": Impact.password,
    };

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      final decodedBody = jsonDecode(response.body);
      final access = decodedBody["access"];
      final refresh = decodedBody["refresh"];
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString("access", access);
      await sp.setString("refresh", refresh);

      await showResponseDialog(context, response.statusCode, requestType);
      auth = true;
    } else {
      await showResponseDialog(context, response.statusCode, requestType);
      auth = false;
    }

    return auth;
  }

  static Future<void> requestData(
      BuildContext context, bool firstDatabaseEntry) async {
    String requestType = "data";
    // List<List<Calories>>? arrayDataCalories;
    List<List<dynamic>>? arraySumCalories;

    SharedPreferences sp = await SharedPreferences.getInstance();
    var access = sp.getString('access');

    if (JwtDecoder.isExpired(access!)) {
      await updateTokens(context);
      access = sp.getString('access');
    }

    final DateFormat intDateFormat = DateFormat("yyyy-MM-dd");

    final DateTime intStartDate = intDateFormat.parse(Impact.startDate);
    final DateTime intEndDate = intDateFormat.parse(Impact.endDate);
    final Duration dateRange = intEndDate.difference(intStartDate);
    final int rangeInDays = dateRange.inDays;

    final url =
        '${Impact.baseUrl}${Impact.caloriesEndpoint}${Impact.patientUsername}/daterange/start_date/${Impact.startDate}/end_date/${Impact.endDate}/';
    final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

    print('Calling: $url');
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      arraySumCalories = List.generate(rangeInDays + 1, (index) => []);
      // arrayDataCalories = List.generate(rangeInDays + 1, (index) => []);

      for (int i = 0; i <= rangeInDays; i++) {
        DateTime currentDate = intStartDate.add(Duration(days: i));
        arraySumCalories[i].add(currentDate);

        double sumCaloriesDay = 0;

        for (int j = 0; j < decodedResponse['data'][i]['data'].length; j++) {
          // final date = decodedResponse['data'][i]['date'];

          String value = decodedResponse['data'][i]['data'][j]['value'];
          double parsedValue = double.parse(value);
          sumCaloriesDay += parsedValue;

          /* final calories = Calories.fromJson(date, decodedResponse['data'][i]['data'][j]);

          arrayDataCalories[i].add(calories); */
        }

        arraySumCalories[i].add(sumCaloriesDay);
      }

      await DatabaseCall.saveData(
          context, arraySumCalories, firstDatabaseEntry);
    } else {
      // arrayDataCalories = null;
      arraySumCalories = null;
    }

    await showResponseDialog(context, response.statusCode, requestType);
    // await showCaloriesDialog(context, arraySumCalories!, firstDatabaseEntry);
  }

  static Future<void> pingServer(BuildContext context) async {
    String requestType = "ping";
    const url = Impact.baseUrl + Impact.pingEndpoint;
    final response = await http.get(Uri.parse(url));
    await showResponseDialog(context, response.statusCode, requestType);
  }
}

Future<void> updateTokens(BuildContext context) async {
  String requestType = "access token";
  final url = Impact.baseUrl + Impact.refreshEndpoint;
  SharedPreferences sp = await SharedPreferences.getInstance();
  final refresh = sp.getString('refresh');
  final body = {'refresh': refresh};

  print('Calling: $url');
  final response = await http.post(Uri.parse(url), body: body);

  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(response.body);
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('access', decodedResponse['access']);
    await sp.setString('refresh', decodedResponse['refresh']);
  }

  await showResponseDialog(context, response.statusCode, requestType);
}

Future<void> showResponseDialog(
    BuildContext context, int statusCode, String requestType) async {
  String message;

  if (statusCode == 200) {
    message =
        "Successful $requestType request\nHTTP status code: 200 (AUTHORIZED)";
  } else {
    message =
        "Unsuccessful $requestType request\nHTTP status code: $statusCode";
  }

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "API Call",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(message),
              const SizedBox(height: 10.0),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.black),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const Color(0xFFF5F6F9).withOpacity(0.6);
                    }
                    return const Color(0xFFF5F6F9);
                  }),
                  splashFactory: NoSplash.splashFactory,
                  shape: MaterialStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  elevation: MaterialStateProperty.all(1.0),
                ),
                child: const Text(
                  "OK",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
