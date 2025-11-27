import 'package:flutter/material.dart';
import 'face_attendance_page.dart';
import 'student_data_page.dart';
import 'class_management_page.dart';
import 'attendance_report_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  _DashboardPageState() {
    _pages = [
      _HomeDashboard(onNavigate: _onNavigate),
      const FaceAttendancePage(),
      const StudentDataPage(),
      const ClassManagementPage(),
      const AttendanceReportPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNavigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FaceClass Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Absensi',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Siswa'),
          BottomNavigationBarItem(icon: Icon(Icons.class_), label: 'Kelas'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Rekap'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[200],
        backgroundColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _HomeDashboard extends StatelessWidget {
  final Function(int) onNavigate;

  const _HomeDashboard({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            () => onNavigate(1),
          ),
          _buildMenuItem(
            context,
            'Data Siswa',
            Icons.people,
            () => onNavigate(2),
          ),
          _buildMenuItem(
            context,
            'Manajemen Kelas',
            Icons.class_,
            () => onNavigate(3),
          ),
          _buildMenuItem(
            context,
            'Rekap Kehadiran',
            Icons.bar_chart,
            () => onNavigate(4),
          ),
        ],
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
