import 'dart:async' show FutureOr;

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_initializer.config.dart';

final getIt = GetIt.instance..debugEventsEnabled = kDebugMode;

@InjectableInit(preferRelativeImports: true)
FutureOr<void> configureDependencies() async => getIt.init();
