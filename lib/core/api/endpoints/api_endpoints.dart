import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiEndpoints {
  static final String baseUrl = dotenv.get('BASE_URL');
}
