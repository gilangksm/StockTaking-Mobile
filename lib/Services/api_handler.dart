import 'dart:convert';
import 'package:http/http.dart' as http;

class APIHandler {
  static const String baseUrl = "https:192.168.3.89:7227/api/";

  static const String login = baseUrl + "login";
  static const String getProductionData = baseUrl + "DataProduction";
  static const String getWarehouseData = baseUrl + "DataWarehouse";
  static const String editProductionData = baseUrl + "DataProduction";
  static const String editWarehouseData = baseUrl + "DataWarehouse";

  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    final response = await http.get(Uri.parse(endpoint));
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> postRequest(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> putRequest(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse(endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> deleteRequest(String endpoint) async {
    final response = await http.delete(Uri.parse(endpoint));
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data from API");
    }
  }
}