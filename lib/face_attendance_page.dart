import 'package:flutter/material.dart';

class FaceAttendancePage extends StatelessWidget {
  const FaceAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absensi Wajah')),
      body: const Center(child: Text('Face Attendance Page')),
    );
  }
}
