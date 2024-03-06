
import 'package:flutter/material.dart';
import '../util/app_constants_string.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppStringConstant.noPageFound,
      ),
    );
  }
}