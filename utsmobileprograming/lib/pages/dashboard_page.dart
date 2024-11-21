import 'package:flutter/material.dart';
import 'list_jadwal.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000), // Warna latar belakang
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.white),
            Icon(Icons.account_circle, color: Colors.white),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Halo, Ainan!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBDBDBD),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Semoga harimu menyenangkan!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            // Tab Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTabButton('Tugasku', isSelected: true),
                SizedBox(width: 10),
                _buildTabButton('Projek'),
                SizedBox(width: 10),
                _buildTabButton('Catatan'),
              ],
            ),
            SizedBox(height: 20),
            // Cards untuk Next Events
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildEventCard(
                    icon: Icons.date_range_outlined,
                    title: 'Mobile Programming',
                    subtitle: '10.00',
                    date: '17 Oktober 2024',
                    color: Color(0xFFBDBDBD),
                  ),
                  _buildEventCard(
                    icon: Icons.healing,
                    title: 'Pulau Dewata',
                    subtitle: '06.00',
                    date: '24 Oktober 2024',
                    color: Color(0xFFBDBDBD),
                  ),
                  _buildEventCard(
                    icon: Icons.accessibility_new_rounded,
                    title: 'jogjakarta',
                    subtitle: '07.00',
                    date: '24 Desember 2024',
                    color: Color(0xFFBDBDBD),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Progress Header
            Text(
              'Progress',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            // List Progress
            Expanded(
              child: ListView(
                children: [
                  _buildProgressItem(
                      title: 'UTS Studi Islam', subtitle: '2 hari yang lalu'),
                  _buildProgressItem(
                      title: 'Checkout 11.11', subtitle: '6 hari yang lalu'),
                  _buildProgressItem(
                      title: 'Kerja Kelompok', subtitle: '7 hari yang lalu'),
                  _buildProgressItem(
                      title: 'MK Mobile Programing', subtitle: '7 hari yang lalu'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // Tab Button
  Widget _buildTabButton(String text, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFFFFFFF) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFFFFFFF)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.blueGrey : Color(0xFF6A5AE0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Event Card
  Widget _buildEventCard({
    required String title,
    required String subtitle,
    required String date,
    required Color color,
    required IconData icon
  }) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.black),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Progress Item
  Widget _buildProgressItem({required String title, required String subtitle}) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(Icons.check_circle, color: Color(0xFF000000)),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black, // Warna latar belakang BottomNavigationBar
      selectedItemColor: Colors.blueGrey, // Warna ikon yang dipilih
      unselectedItemColor: Colors.black, // Warna ikon yang tidak dipilih
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined),
          label: 'Jadwal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifikasi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Searchs',
        )
      ],
      onTap: (index) {
        // Navigasi antar halaman
        if (index == 0) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => DashboardPage()));
        } else if (index == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ListJadwalPage()));
        }
      },
    );
  }
}