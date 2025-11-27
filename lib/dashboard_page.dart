import 'package:flutter/material.dart';
import 'face_attendance_page.dart';
import 'student_data_page.dart';
import 'class_management_page.dart';
import 'attendance_report_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FaceClass Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuItem(
              context,
              'Absensi Wajah',
              Icons.camera_alt,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FaceAttendancePage(),
                ),
              ),
            ),
            _buildMenuItem(
              context,
              'Data Siswa',
              Icons.people,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentDataPage(),
                ),
              ),
            ),
            _buildMenuItem(
              context,
              'Manajemen Kelas',
              Icons.class_,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ClassManagementPage(),
                ),
              ),
            ),
            _buildMenuItem(
              context,
              'Rekap Kehadiran',
              Icons.bar_chart,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AttendanceReportPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
