import 'dart:convert';

import 'package:http/http.dart' as http;

class FlavorValues {
  String baseUrl;
  final Map<Endpoint, String> endpoints;

  FlavorValues({required this.baseUrl, required this.endpoints});
}

enum Endpoint { querySong, hmoe } // add endpoint

enum Request { get, post }

final FlavorValues config = FlavorValues(
    baseUrl:
        'https://shrouded-anchorage-67754.herokuapp.com', // base service url
    endpoints: {
      Endpoint.querySong: '/dialogflow/message',
      Endpoint.hmoe: '/home'
    }); // update endpoints with urls

String finalUrl(Endpoint ep) {
  final url = '${config.baseUrl}${config.endpoints[ep]}';
  return url;
}

Future httpClient(String url, Request req, {Map<String, dynamic>? body}) async {
  final k = Uri.parse(url);
  var response;

  req == Request.get
      ? response = await http.get(k)
      : response = await http.post(k, body: body);

  if (response.statusCode == 200) {
    var result = response.body;
    result = json.decode(result);
    return result;
  } else {
    throw Exception(
        'Failed to fetch response with error code ${response.statusCode}');
  }
}
