import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentDataPage extends StatefulWidget {
  const StudentDataPage({super.key});

  @override
  State<StudentDataPage> createState() => _StudentDataPageState();
}

class _StudentDataPageState extends State<StudentDataPage> {
  Future<List<Map<String, dynamic>>> _fetchStudents() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('students')
        .get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Siswa'),
        backgroundColor: Color(0xFF556B2F),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Color(0xFF556B2F),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _fetchStudents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No students found'));
            } else {
              final students = snapshot.data!;
              return ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    elevation: 4,
                    color: Color.fromRGBO(232, 245, 232, 0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student['name'] ?? 'No name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFA500),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'ID: ${student['id'] ?? 'N/A'}',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Kelas: ${student['class'] ?? 'N/A'}',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Email: ${student['email'] ?? 'N/A'}',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Telepon: ${student['phone'] ?? 'N/A'}',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
