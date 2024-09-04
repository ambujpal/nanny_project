import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nany/services/app_exceptions.dart';
import 'package:nany/services/exception_handler.dart';

class BaseClient {
  static const int timeOutDuration = 35;

  // Get Request without Authentication
  static Future<dynamic> getRequestWithoutAuthentication(String url) async {
    try {
      debugPrint("Request URL: $url");
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      ).timeout(const Duration(seconds: timeOutDuration));

      return handleResponse(response);
    } catch (e) {
      ExceptionHandler.getExceptionString(e);
    }
  }

// post requeat without authentication

  static Future<dynamic> postRequestWithoutAuthentication(
      String url, dynamic payload) async {
    try {
      debugPrint("Request URL: $url");
      debugPrint("Request Payload: ${jsonEncode(payload)}");
      var response = await http
          .post(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(payload),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      debugPrint("Request ststus code: ${response.statusCode}");
      return handleResponse(response);
    } catch (e) {
      ExceptionHandler.getExceptionString(e);
    }
  }

// Get Request with Authentication
  static Future<dynamic> getRequestWithAuthentication(String url) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
      ).timeout(const Duration(seconds: timeOutDuration));

      return handleResponse(response);
    } catch (e) {
      ExceptionHandler.getExceptionString(e);
    }
  }

// post requeat with authentication
  static Future<dynamic> postRequestWithAuthentication(
      String url, dynamic payload) async {
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            headers: {
              "Accept": "application/json",
              "content-type": "application/json",
            },
            body: jsonEncode(payload),
          )
          .timeout(const Duration(seconds: timeOutDuration));

      return handleResponse(response);
    } catch (e) {
      ExceptionHandler.getExceptionString(e);
    }
  }

// delete requeat with authentication
  static Future<dynamic> deleteRequestWithAuthentication(
      String url, dynamic payload) async {
    try {
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
      ).timeout(const Duration(seconds: timeOutDuration));

      return handleResponse(response);
    } catch (e) {
      ExceptionHandler.getExceptionString(e);
    }
  }
}

dynamic handleResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body;
      return responseJson;
    case 201:
      var responseJson = response.body;
      return responseJson;
    case 400:
      throw BadRequestException(jsonDecode(response.body)["message"]);
    case 401:
      throw UnAuthorizedException(jsonDecode(response.body)["message"]);
    case 403:
      throw UnAuthorizedException(jsonDecode(response.body)["message"]);
    case 404:
      throw NotFoundException(jsonDecode(response.body)["message"]);
    case 500:
      throw FetchDataException("Internal server error");
    default:
      FetchDataException("Something went wrong!  ${response.statusCode}");
  }
}
