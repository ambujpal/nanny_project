import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nany/services/base_client.dart';
import 'package:nany/utils/constants.dart';
import 'package:nany/utils/utils.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isLoading1 = false;

  bool get isLoading => _isLoading;
  bool get isLoading1 => _isLoading1;
  List packageList = [];
  List currentBookingList = [];

  Future<void> getApiCallPackage(context) async {
    _isLoading = true;
    notifyListeners();

    String url = "${Constants.baseUrl}packages_list";

    try {
      var response = await BaseClient.getRequestWithoutAuthentication(url);

      debugPrint("Url: $url");
      debugPrint("Response after postRequest: $response");

      if (response == null) {
        Utils.errorMessage(context, "Received null response from server.");
        _isLoading = false;
        notifyListeners();
        return;
      }

      var responseModel = jsonDecode(response);
      debugPrint("ResponseModel: $responseModel");
      if (responseModel["status"] == "success") {
        Utils.succesMessage(context, responseModel["message"]);
        packageList.clear();
        packageList.addAll(responseModel["response"]);
        _isLoading = false;
        notifyListeners();
      } else {
        Utils.errorMessage(context, responseModel["message"]);
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      Utils.errorMessage(context, e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getApiCallCurrentBooking(context) async {
    _isLoading1 = true;
    notifyListeners();

    String url = "${Constants.baseUrl}current_booking_list";

    try {
      var response = await BaseClient.getRequestWithoutAuthentication(url);

      debugPrint("Url: $url");
      debugPrint("Response after postRequest: $response");

      if (response == null) {
        Utils.errorMessage(context, "Received null response from server.");
        _isLoading1 = false;
        notifyListeners();
        return;
      }

      var responseModel = jsonDecode(response);
      debugPrint("ResponseModel: $responseModel");
      if (responseModel["status"] == "success") {
        Utils.succesMessage(context, responseModel["message"]);
        currentBookingList.clear();
        currentBookingList.addAll(responseModel["response"]);
        _isLoading1 = false;
        notifyListeners();
      } else {
        Utils.errorMessage(context, responseModel["message"]);
        _isLoading1 = false;
        notifyListeners();
      }
    } catch (e) {
      Utils.errorMessage(context, e.toString());
      _isLoading1 = false;
      notifyListeners();
    }
  }
}
