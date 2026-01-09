import 'package:flutter/material.dart';

import '../../core/api/endpoints/api_endpoints.dart';
import '../../core/functions/safe_print.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    safePrint(ApiEndpoints.baseUrl);
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Home Screen')],
        ),
      ),
    );
  }
}
