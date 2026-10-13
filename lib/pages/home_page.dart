import 'package:flutter/material.dart';
import 'package:praktek/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.about);
              },
              child: const Text('Masuk Profile'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.listView);
              },
              child: const Text('Masuk List'),
            ),
            SizedBox(height: 24,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.singlechild);
              },
              child: const Text('new page'),
            ),
          ],
        ),
      ),
    );
  }
}