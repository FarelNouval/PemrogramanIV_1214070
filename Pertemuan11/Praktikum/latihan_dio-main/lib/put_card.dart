import 'package:flutter/material.dart';
import 'user.dart';

class PutCard extends StatelessWidget {
  final UserUpdate usrUpdate;

  const PutCard({Key? key, required this.usrUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity, // Membuat lebar container mengikuti ukuran layar
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.lightBlue[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Menyesuaikan ke kiri
        children: [
          _buildRow('Name', usrUpdate.name),
          const SizedBox(height: 8),
          _buildRow('Job', usrUpdate.job),
          const SizedBox(height: 8),
          _buildRow('Updated At', usrUpdate.updatedAt ?? 'No timestamp'),
        ],
      ),
    );
  }

  // Helper method untuk membangun setiap baris
  Widget _buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(': $value'),
        ),
      ],
    );
  }
}
