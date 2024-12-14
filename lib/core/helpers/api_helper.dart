import 'dart:convert';
import 'package:ahdaf_task/core/constants/api_constants/api_constants.dart';
import 'package:ahdaf_task/core/enums/http_methods.dart';
import 'package:ahdaf_task/core/utils/failures/failures.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiHelperHttp {
  // Generic function for making HTTP requests
  Future<Either<Failures, T>> makeRequest<T>({
    required String endpoint,
    required String baseUrl,
    required HttpMethod method, // Use HttpMethod enum
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required T Function(Map<String, dynamic>) parseResponse,
    int retries = 3, // Number of retries in case of failure
  }) async {
    try {
      // Check connectivity
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult != ConnectivityResult.none) {
        Uri url = Uri.http(baseUrl, endpoint); // Construct URL

        http.Response response;
        try {
          // Prepare request based on method
          switch (method) {
            case HttpMethod.GET:
              response = await http.get(url, headers: headers);
              break;
            case HttpMethod.POST:
              response = await http.post(url,
                  body: jsonEncode(body), headers: headers);
              break;
            case HttpMethod.PUT:
              response =
                  await http.put(url, body: jsonEncode(body), headers: headers);
              break;
            case HttpMethod.DELETE:
              response = await http.delete(url, headers: headers);
              break;
            default:
              return Left(
                  ServerError(errorMessege: "Unsupported request method"));
          }

          // Handle response and status code
          return await _handleResponse<T>(response, parseResponse);
        } catch (e) {
          if (retries > 0) {
            // Retry the request if it failed
            return await makeRequest<T>(
              baseUrl: baseUrl,
              endpoint: endpoint,
              method: method,
              headers: headers,
              body: body,
              parseResponse: parseResponse,
              retries: retries - 1, // Decrease the retry count
            );
          }
          return Left(
              NetworkError(errorMessege: "Network error: ${e.toString()}"));
        }
      } else {
        // No internet connection
        return Left(NetworkError(errorMessege: "No internet connection"));
      }
    } catch (e) {
      return Left(
          Failures(errorMessege: e.toString())); // Catch any general exception
    }
  }

  // Helper function to handle the HTTP response
  Future<Either<Failures, T>> _handleResponse<T>(http.Response response,
      T Function(Map<String, dynamic>) parseResponse) async {
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Successfully received a response, parse it
        var responseBody = jsonDecode(response.body);
        T parsedData = parseResponse(responseBody);
        return right(parsedData);
      } else if (response.statusCode == 401) {
        // Unauthorized error, handle it appropriately
        return Left(ServerError(errorMessege: "Unauthorized access"));
      } else if (response.statusCode >= 500) {
        // Server-side errors
        return Left(
            ServerError(errorMessege: "Server error: ${response.statusCode}"));
      } else {
        // Handle other error codes (like 400, 404, etc.)
        var responseBody = jsonDecode(response.body);
        return Left(ServerError(
            errorMessege: responseBody['message'] ?? 'Unknown error'));
      }
    } catch (e) {
      return Left(
          ServerError(errorMessege: 'Error parsing response: ${e.toString()}'));
    }
  }
}

class ApiHelperDio {
  final Dio dio = Dio();

  // Generic function for making HTTP requests using Dio
  Future<Either<Failures, T>> makeRequest<T>({
    required String endpoint,
    required HttpMethod method, // Use HttpMethod enum
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required String baseUrl,
    required T Function(Map<String, dynamic>) parseResponse,
    int retries = 3, // Number of retries in case of failure
  }) async {
    try {
      // Check connectivity
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult != ConnectivityResult.none) {
        dio.options.baseUrl =
            "http://${baseUrl}"; // Ensure base URL includes the scheme
        dio.options.headers = headers ?? {}; // Set headers for Dio

        Response response;
        try {
          // Prepare request based on method
          switch (method) {
            case HttpMethod.GET:
              response = await dio.get(endpoint);
              break;
            case HttpMethod.POST:
              response = await dio.post(endpoint, data: body);
              break;
            case HttpMethod.PUT:
              response = await dio.put(endpoint, data: body);
              break;
            case HttpMethod.DELETE:
              response = await dio.delete(endpoint);
              break;
            default:
              return Left(
                  ServerError(errorMessege: "Unsupported request method"));
          }

          // Handle response and status code
          return await _handleResponse<T>(response, parseResponse);
        } catch (e) {
          if (retries > 0) {
            // Retry the request if it failed
            return await makeRequest<T>(
              baseUrl: baseUrl,
              endpoint: endpoint,
              method: method,
              headers: headers,
              body: body,
              parseResponse: parseResponse,
              retries: retries - 1, // Decrease the retry count
            );
          }
          return Left(
              NetworkError(errorMessege: "Network error: ${e.toString()}"));
        }
      } else {
        // No internet connection
        return Left(NetworkError(errorMessege: "No internet connection"));
      }
    } catch (e) {
      return Left(
          Failures(errorMessege: e.toString())); // Catch any general exception
    }
  }

  // Helper function to handle the HTTP response
  Future<Either<Failures, T>> _handleResponse<T>(
      Response response, T Function(Map<String, dynamic>) parseResponse) async {
    try {
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        // Successfully received a response, parse it
        var responseBody = response.data as Map<String, dynamic>;
        T parsedData = parseResponse(responseBody);
        return right(parsedData);
      } else if (response.statusCode == 401) {
        // Unauthorized error, handle it appropriately
        return Left(ServerError(errorMessege: "Unauthorized access"));
      } else if (response.statusCode != null && response.statusCode! >= 500) {
        // Server-side errors
        return Left(
            ServerError(errorMessege: "Server error: ${response.statusCode}"));
      } else {
        // Handle other error codes (like 400, 404, etc.)
        var responseBody = response.data as Map<String, dynamic>;
        return Left(ServerError(
            errorMessege: responseBody['message'] ?? 'Unknown error'));
      }
    } catch (e) {
      return Left(
          ServerError(errorMessege: 'Error parsing response: ${e.toString()}'));
    }
  }
}
