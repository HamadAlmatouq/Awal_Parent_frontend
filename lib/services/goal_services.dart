import 'package:bkid_frontend/services/client.dart';
import 'package:dio/dio.dart';

class GoalServices {
  Future<void> createGoal(Map<String, dynamic> goalData) async {
    try {
      Response response = await Client.dio.post(
        "/parent/createGoal",
        data: goalData,
      );
      print("Goal creation response: ${response.data}");
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Goal creation error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Goal creation error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Goal creation error: $error");
        throw Exception(error.toString());
      }
    }
  }

  Future<List<Map<String, dynamic>>> getGoals(String kidName) async {
    try {
      Response response = await Client.dio.get(
        "/kid/getGoals",
        queryParameters: {"Kname": kidName},
      );
      return List<Map<String, dynamic>>.from(response.data);
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Get goals error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Get goals error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Get goals error: $error");
        throw Exception(error.toString());
      }
    }
  }

  Future<void> deleteGoal(String goalId) async {
    try {
      Response response = await Client.dio.delete(
        "/parent/deleteGoal",
        queryParameters: {"goalId": goalId},
      );
      print("Goal deletion response: ${response.data}");
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          print("Goal deletion error response: ${error.response?.data}");
          throw Exception(error.response?.data['message'] ?? 'Unknown error');
        } else {
          print("Goal deletion error: ${error.message}");
          throw Exception(error.message);
        }
      } else {
        print("Goal deletion error: $error");
        throw Exception(error.toString());
      }
    }
  }
}
