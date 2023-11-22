import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp.router(routerConfig: router));

/// This handles '/' and '/details'.
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        body: Column(children: [
          Center(
            child: TextButton(
                onPressed: () async {
                  final Uri url = Uri.parse('https://example.com/payment/123');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text("Open payment page")),
          ),
          const Text(
            "This button must open payment page in browsers without suggest current app "
            "but current ap is suggested because payment url part of app link !",
            textAlign: TextAlign.center,
          )
        ]),
      ),
      routes: [
        GoRoute(
          path: 'details',
          builder: (_, __) => Scaffold(
            appBar: AppBar(title: const Text('Details Screen')),
          ),
        ),
      ],
    ),
  ],
);
