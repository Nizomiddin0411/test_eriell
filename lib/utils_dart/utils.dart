import 'package:flutter/material.dart';

import '../screen_dart/succed_dart.dart';
import 'constants.dart';

goHome() async {
  Navigator.push(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) =>  SuccessScreen(),
    ),
  );
}