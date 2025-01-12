import 'package:bkid_frontend/services/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthServices {

  //Sign up
  Future<String> signup({
    required String username,
    required String password,
  }) async {
    late String token;
    try {
      Response response = await Client.dio.post(
        "/auth/signup",
        data: FormData.fromMap({
          "username": username,
          "password": password,
        }),
      );
      token = response.data["token"];
    } catch (error) {
      print("error");
    }
    return token;
  }



  //Sign in
  Future<String> signin({
    required String username,
    required String password,
  }) async {
    Response response = await Client.dio.post("/auth/signin", data: {
      "username": username,
      "password": password,
    });
    return response.data["token"];
  }
}