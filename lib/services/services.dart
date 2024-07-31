import "dart:convert";

import "package:http/http.dart" as http;
import "package:pixle_task/model/employee_info.dart";

class Services {
  Future<List<EmployeeInfo>> getAll({int limit = 10}) async {
    const url = 'https://dummyjson.com/users';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final userList = json['users'] as List<dynamic>;
      final employdata = userList.map((e) {
        return EmployeeInfo.fromJson(e);
      }).toList();
      return employdata;
    }else{
      print("Failed to load employees: ${response.statusCode}");
      return [];
    }
  }
}