import 'package:flutter/material.dart';

class ClassManagementPage extends StatelessWidget {
  const ClassManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manajemen Kelas')),
      body: const Center(child: Text('Class Management Page')),
    );
  }
}
