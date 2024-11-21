import 'package:flutter/material.dart';

class Buat_Tugas extends StatefulWidget {
  @override
  Buat_TugasState createState() => Buat_TugasState();
}

class Buat_TugasState extends State<Buat_Tugas> {
  String _startPeriod = 'AM';
  String _endPeriod = 'PM';
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  String? _selectedCategory;

  final List<String> _categories = [
    'Tugas Kuliah',
    'Projek',
    'Jalan-jalan',
    'Pekerjaan kantor',
    'Freelance project',
    'Catatan',
  ];

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  Widget _buildCategoryBottomSheet() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 35, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectTime(context, true),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mulai jam',
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                            Container(
                              width: 130,
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white70)),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    _startTime != null
                                        ? _startTime!.format(context)
                                        : '08:00',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  DropdownButton<String>(
                                    dropdownColor: Colors.black,
                                    value: _startPeriod,
                                    items: ['AM', 'PM']
                                        .map((period) => DropdownMenuItem(
                                      value: period,
                                      child: Text(period, style: TextStyle(color: Colors.white)),
                                    ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _startPeriod = value!;
                                      });
                                    },
                                    underline: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectTime(context, false),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hingga jam',
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                            Container(
                              width: 130,
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.white70)),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    _endTime != null
                                        ? _endTime!.format(context)
                                        : '11:59',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  DropdownButton<String>(
                                    dropdownColor: Colors.black,
                                    value: _endPeriod,
                                    items: ['AM', 'PM']
                                        .map((period) => DropdownMenuItem(
                                      value: period,
                                      child: Text(period, style: TextStyle(color: Colors.white)),
                                    ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _endPeriod = value!;
                                      });
                                    },
                                    underline: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Kategori',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _categories.map((category) {
                    final bool isSelected = _selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        setModalState(() {
                          _selectedCategory = category;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.grey[900] : Colors.grey[700],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? Colors.white : Colors.white70,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(200, 40),
                    ),
                    child: Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Buat Tugas Baru',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Judul',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildCategoryBottomSheet();
                  },
                );
              },
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Kategori',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Buat_Tugas(),
    debugShowCheckedModeBanner: false,
  ));
}
