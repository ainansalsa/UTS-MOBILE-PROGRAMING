import 'package:flutter/material.dart';
import 'buat_tugas.dart';

class ListJadwalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Jadwal', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Tambahkan aksi menu
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Header
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nov, 2024',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                // Baris tanggal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDateItem('17', 'Min', isSelected: true),
                    _buildDateItem('18', 'Sen'),
                    _buildDateItem('19', 'Sel'),
                    _buildDateItem('20', 'Rab'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Daftar Tugas
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Tugas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildTaskCard(
                              'UTS Mobile Programming', '10:00 - 14:00'),
                          SizedBox(height: 8),
                          _buildTaskCard('Ngerjakan Tugas', '18:00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // Navigasi ke halaman CreateTaskPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Buat_Tugas()),
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Jadwal'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Searchs')
        ],
        onTap: (index) {
          // Tambahkan navigasi jika diperlukan
        },
      ),
    );
  }

  Widget _buildDateItem(String day, String weekday, {bool isSelected = false}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(8.0),
          child: Text(
            day,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          weekday,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTaskCard(String title, String time) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.assignment, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(time),
        trailing: Icon(Icons.more_vert, color: Colors.black),
      ),
    );
  }
}
