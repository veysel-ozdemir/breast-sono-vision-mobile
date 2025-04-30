import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl =
      'http://${dotenv.env["API_HOST"]}:${dotenv.env["API_PORT"]}';
  static const String segmentationEndpoint = '/predict';
}
