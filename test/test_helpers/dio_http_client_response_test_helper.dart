import 'package:dio/dio.dart';

Response<Map<String, dynamic>> dioClientSuccessfulHttpResponse({
  Map<String, dynamic>? responseData,
}) {
  Response<Map<String, dynamic>> successfulResponse = Response(
    data: responseData,
    requestOptions: RequestOptions(),
  );
  return successfulResponse;
}

DioException dioClientFailedHttpResponse() {
  DioException failedResponse = DioException(
    requestOptions: RequestOptions(),
    response: Response(
      requestOptions: RequestOptions(),
    ),
  );
  return failedResponse;
}
