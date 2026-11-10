import 'package:flutter/material.dart';
import 'package:praktek/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _routeButton(context, 'Masuk Profile', AppRoutes.about),
            _routeButton(context, 'Form Registrasi', AppRoutes.inputform),
            _routeButton(context, 'Form Pendaftaran Eskul', AppRoutes.inputeskul),
            _routeButton(context, 'Masuk List', AppRoutes.listView),
            _routeButton(
              context,
              'SingleChildScrollView',
              AppRoutes.singlechild,
            ),
            _routeButton(context, 'Latihan 3', AppRoutes.latihan3),
            _routeButton(context, 'Latihan 4', AppRoutes.latihan4),
            _routeButton(context, 'Latihan 5', AppRoutes.latihan5),
            _routeButton(context, 'Latihan 6', AppRoutes.latihan6),
            _routeButton(
              context,
              'Latihan Container',
              AppRoutes.latihanContainer,
            ),
            _routeButton(
              context,
              'Latihan Container 2',
              AppRoutes.latihanContainer2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _routeButton(BuildContext context, String label, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(label),
      ),
    );
  }
}
