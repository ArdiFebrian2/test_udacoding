import 'package:flutter/material.dart';
import '../controllers/staff_crud_controller.dart';

class StaffCrudScreen extends StatefulWidget {
  @override
  _StaffCrudScreenState createState() => _StaffCrudScreenState();
}

class _StaffCrudScreenState extends State<StaffCrudScreen> {
  final StaffCrudController _controller = StaffCrudController();

  @override
  void initState() {
    super.initState();
    _loadStaffData();
  }

  Future<void> _loadStaffData() async {
    await _controller.loadStaffData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Tambah Staff'),
                    content: SingleChildScrollView(child: _buildStaffForm()),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Batal'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await _controller.saveStaff();
                          Navigator.pop(context);
                          await _loadStaffData();
                        },
                        child: Text('Simpan'),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.add),
              label: Text(
                'Tambah Staff',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _controller.staffList.length,
                itemBuilder: (context, index) {
                  final staff = _controller.staffList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        staff['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Level: ${staff['level']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              await _controller.editStaff(staff);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Edit Staff'),
                                  content: SingleChildScrollView(
                                      child: _buildStaffForm()),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Batal'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        await _controller.updateStaff(staff);
                                        Navigator.pop(context);
                                        await _loadStaffData();
                                      },
                                      child: Text('Simpan'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await _controller.deleteStaff(staff['id']);
                              await _loadStaffData();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaffForm() {
    return Column(
      children: [
        TextField(
          controller: _controller.nameController,
          decoration: InputDecoration(labelText: 'Nama'),
        ),
        TextField(
          controller: _controller.idController,
          decoration: InputDecoration(labelText: 'IDLibrary'),
        ),
        TextField(
          controller: _controller.emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: _controller.passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        TextField(
          controller: _controller.phoneController,
          decoration: InputDecoration(labelText: 'No HP'),
        ),
        TextField(
          controller: _controller.addressController,
          decoration: InputDecoration(labelText: 'Alamat'),
        ),
        DropdownButtonFormField(
          value: _controller.selectedLevel,
          items: ['Admin', 'Pengunjung']
              .map((level) => DropdownMenuItem(
                    value: level,
                    child: Text(level),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _controller.selectedLevel = value!;
            });
          },
          decoration: InputDecoration(labelText: 'Level'),
        ),
      ],
    );
  }
}
