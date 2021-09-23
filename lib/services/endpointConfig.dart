import 'package:http/http.dart' as http;

class FlavorValues {
  String baseUrl;
  final Map<Endpoint, String> endpoints;

  FlavorValues({required this.baseUrl, required this.endpoints});
}

enum Endpoint { querySong }

enum Request { get, post }

final FlavorValues config = FlavorValues(
    baseUrl: 'localhost:8080',
    endpoints: {Endpoint.querySong: '/api/querySong'});

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
    return response.body;
  } else {
    throw Exception(
        'Failed to fetch response with error code ${response.statusCode}');
  }
}
