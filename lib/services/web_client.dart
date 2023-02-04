import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:pokedex/services/http_interceptors.dart';

class WebClient {
  static const String url = "https://pokeapi.co/api/v2";
  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: const Duration(seconds: 120),
  );
}
