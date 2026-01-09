import 'package:flutter/foundation.dart' show kDebugMode;

void safePrint(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}
