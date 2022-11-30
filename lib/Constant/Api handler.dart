import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

enum REQUEST_TYPE {
  GET,
  POST,
  PUT,
  DELETE,
}


Future<dynamic> httpRequest(REQUEST_TYPE requestType, String url, dynamic data,) async {
  data = jsonEncode(data);

  print(url);
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      switch (requestType) {
        case REQUEST_TYPE.GET:
          return http.get(Uri.parse(url),);
          break;

        case REQUEST_TYPE.POST:
          return http.post(Uri.parse(url),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              },body: data);
          break;
        case REQUEST_TYPE.PUT:
          return http.put(Uri.parse(url),headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
            body: data,);
          break;
        case REQUEST_TYPE.DELETE:
          return http.delete(Uri.parse(url), body: data,);
          break;
      }
    }
  } on SocketException catch (_) {

    return http.Response(jsonEncode({'error_description' : 'Please connect to Internet'}), 400);
  }
}