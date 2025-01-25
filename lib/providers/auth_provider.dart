import 'dart:io';
import 'package:bkid_frontend/models/user.dart';
import 'package:bkid_frontend/services/auth_services.dart';
import 'package:bkid_frontend/services/client.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  static const tokenKey = "token";
  User? user;
  late String token;

  Future<bool> signup({
    required String username,
    required String password,
    required String pname, // Add Pname parameter
    required String email, // Add email parameter
  }) async {
    try {
      token = await AuthServices().signup(
        username: username,
        password: password,
        pname: pname, // Pass Pname
        email: email, // Pass email
      );
      if (token.isNotEmpty) {
        await setToken(token);
        print(token);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Sign up error: $e");
      return false;
    }
  }

  Future<bool> signin({
    required String username,
    required String password,
  }) async {
    try {
      token =
          await AuthServices().signin(username: username, password: password);
      if (token.isNotEmpty) {
        await setToken(token);
        print(token);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Sign in error: $e");
      return false;
    }
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenKey, token);

    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      try {
        user = User.fromJson(Jwt.parseJwt(token));
        Client.dio.options.headers = {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        };
      } catch (e) {
        print("Invalid token: $e");
        user = null;
      }
    } else {
      user = null;
    }
  }

  bool isAuth() {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      try {
        user = User.fromJson(Jwt.parseJwt(token));
        Client.dio.options.headers[HttpHeaders.authorizationHeader] =
            "Bearer $token";
        return true;
      } catch (e) {
        print("Invalid token: $e");
        return false;
      }
    }
    return false;
  }

  Future<void> initializeAuth() async {
    await _getToken();
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(tokenKey) ?? "";
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(tokenKey);
    token = "";

    Client.dio.options.headers.remove(HttpHeaders.authorizationHeader);
    notifyListeners();
  }
}
