import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class NetworkService {
  final String apiKey;
  final String baseUrl;

  NetworkService({
    required this.apiKey,
    required this.baseUrl,
  });

  // GET method to fetch data
  Future<dynamic> get(String endpoint,
      {Map<String, String>? queryParams}) async {
    try {
      final uri = Uri.https(baseUrl, endpoint, queryParams);
      final response = await _makeRequest(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body); // Parse the JSON response body
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // POST method to send data
  Future<dynamic> post(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final uri = Uri.https(baseUrl, endpoint);
      final response =
          await _makeRequest(uri, method: 'POST', body: body, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to send data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Private method to handle API requests
  Future<http.Response> _makeRequest(
    Uri uri, {
    String method = 'GET',
    dynamic body,
    Map<String, String>? headers,
  }) async {
    final defaultHeaders = {
      'X-RapidAPI-Key': apiKey,
      'Content-Type': 'application/json',
    };

    final requestHeaders =
        headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;

    final request = method == 'POST'
        ? http.post(uri, headers: requestHeaders, body: json.encode(body))
        : http.get(uri, headers: requestHeaders);

    return await request;
  }

  // Retry mechanism for temporary network issues (simple retry with a delay)
  Future<http.Response> _retryRequest(Uri uri, {int retryCount = 3}) async {
    int retries = 0;
    while (retries < retryCount) {
      try {
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          return response;
        } else {
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      } catch (e) {
        if (retries < retryCount) {
          retries++;
          await Future.delayed(const Duration(seconds: 2)); // wait before retrying
        } else {
          rethrow;
        }
      }
    }
    throw Exception('Max retries reached');
  }
}
