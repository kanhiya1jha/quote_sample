
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signifydemo/feature/quote/presentation/screen/quote_screen.dart';

import 'app_routes_constant.dart';
import 'not_screen_found.dart';

class AppRoutes {
  static final GoRouter _router = GoRouter(
      initialLocation: AppRoutesConstantName.applicantQuotePage,
      debugLogDiagnostics: true,
      routes: [
      GoRoute(
          path: AppRoutesConstantPath.applicantQuotePage,
          name: AppRoutesConstantName.applicantQuotePage,
          pageBuilder: (context, state) { return const MaterialPage(child: QuoteScreen());},
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
    );

    static GoRouter get router => _router;
}