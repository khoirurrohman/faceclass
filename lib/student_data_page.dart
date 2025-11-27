import 'package:flutter/material.dart';

class StudentDataPage extends StatelessWidget {
  const StudentDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample student data
    final List<Map<String, String>> students = [
      {
        'name': 'Ahmad Rahman',
        'id': '001',
        'class': '10A',
        'email': 'ahmad.rahman@example.com',
        'phone': '081234567890',
      },
      {
        'name': 'Siti Nurhaliza',
        'id': '002',
        'class': '10A',
        'email': 'siti.nurhaliza@example.com',
        'phone': '081234567891',
      },
      {
        'name': 'Budi Santoso',
        'id': '003',
        'class': '10B',
        'email': 'budi.santoso@example.com',
        'phone': '081234567892',
      },
      {
        'name': 'Maya Sari',
        'id': '004',
        'class': '10B',
        'email': 'maya.sari@example.com',
        'phone': '081234567893',
      },
      {
        'name': 'Rizki Pratama',
        'id': '005',
        'class': '11A',
        'email': 'rizki.pratama@example.com',
        'phone': '081234567894',
      },
      {
        'name': 'Dewi Lestari',
        'id': '006',
        'class': '11A',
        'email': 'dewi.lestari@example.com',
        'phone': '081234567895',
      },
      {
        'name': 'Fajar Nugroho',
        'id': '007',
        'class': '11B',
        'email': 'fajar.nugroho@example.com',
        'phone': '081234567896',
      },
      {
        'name': 'Intan Permata',
        'id': '008',
        'class': '11B',
        'email': 'intan.permata@example.com',
        'phone': '081234567897',
      },
      {
        'name': 'Gilang Ramadhan',
        'id': '009',
        'class': '12A',
        'email': 'gilang.ramadhan@example.com',
        'phone': '081234567898',
      },
      {
        'name': 'Nadia Fitri',
        'id': '010',
        'class': '12A',
        'email': 'nadia.fitri@example.com',
        'phone': '081234567899',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Siswa'),
        backgroundColor: Color(0xFF556B2F),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Color(0xFF556B2F),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              color: Color(0xFFE8F5E8).withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student['name']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFA500),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ID: ${student['id']}',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Kelas: ${student['class']}',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Email: ${student['email']}',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Telepon: ${student['phone']}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
