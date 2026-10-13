
import 'package:flutter/material.dart';
import 'package:praktek/list-view/ListView.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Listview(),
            ),
          );
        },
        child: const Text('Go to List View'),
      ),
    );
  }
}
