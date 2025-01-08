import 'package:flutter/material.dart'; // Mengimpor pustaka Material Design untuk antarmuka pengguna
import 'package:flutter_colorpicker/flutter_colorpicker.dart'; // Mengimpor pustaka untuk memilih warna
import 'package:intl/intl.dart'; // Mengimpor pustaka untuk memformat tanggal
import 'package:file_picker/file_picker.dart'; // Mengimpor pustaka untuk memilih file
import 'dart:io'; // Mengimpor pustaka IO untuk menangani file

import 'package:open_file/open_file.dart'; // Mengimpor pustaka untuk membuka file
import 'package:uts1/widget/round_button.dart'; // Mengimpor widget RoundButton kustom

class ListContacts extends StatefulWidget {
  @override
  _ListContactsState createState() => _ListContactsState(); // Membuat state untuk widget ListContacts
}

class _ListContactsState extends State<ListContacts> {
  final _formKey = GlobalKey<FormState>(); // Kunci untuk mengelola status form
  final TextEditingController _nameController = TextEditingController(); // Kontrol untuk input nama
  final TextEditingController _phoneController = TextEditingController(); // Kontrol untuk input nomor telepon
  final TextEditingController _dateController = TextEditingController(); // Kontrol untuk input tanggal
  Color _selectedColor = Colors.blue; // Warna default untuk pemilih warna
  String? _selectedFile; // Variabel untuk menyimpan nama file yang dipilih
  String? _dataFile; // Variabel untuk menyimpan nama file setelah dipilih
  File? _imageFile; // Variabel untuk menyimpan file gambar yang dipilih

  List<Map<String, dynamic>> contacts = []; // Daftar untuk menyimpan data kontak

  // Fungsi untuk memilih warna
  void _pickColor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pilih Warna"), // Judul dialog
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _selectedColor, // Menampilkan warna yang dipilih
              onColorChanged: (color) {
                setState(() {
                  _selectedColor = color; // Menyimpan warna yang dipilih
                });
                Navigator.pop(context); // Menutup dialog setelah memilih warna
              },
            ),
          ),
        );
      },
    );
  }

  // Fungsi untuk memilih file gambar
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(); // Memilih file
    if (result == null) return; // Jika tidak ada file yang dipilih, keluar
    final file = result.files.first;
    // Mengecek jika file yang dipilih adalah gambar
    if (file.extension == 'jpg' || file.extension == 'png' || file.extension == 'jpeg') {
      setState(() {
        _imageFile = File(file.path!); // Menyimpan file gambar
      });
    }
    setState(() {
      _dataFile = file.name; // Menyimpan nama file yang dipilih
    });
    _openFile(file); // Membuka file yang dipilih
  }

  // Fungsi untuk membuka file
  void _openFile(PlatformFile file) {
    OpenFile.open(file.path); // Membuka file dengan pustaka OpenFile
  }

  // Fungsi untuk mengirimkan form dan menyimpan kontak
  void _submitForm() {
    if (_formKey.currentState!.validate()) { // Validasi form
      setState(() {
        contacts.add({
          'name': _nameController.text, // Menambahkan nama kontak
          'phone': _phoneController.text, // Menambahkan nomor telepon
          'date': _dateController.text, // Menambahkan tanggal
          'color': _selectedColor, // Menambahkan warna
          'file': _imageFile != null ? _imageFile!.path : _selectedFile, // Menambahkan file gambar
        });

        // Reset form setelah submit
        _nameController.clear();
        _phoneController.clear();
        _dateController.clear();
        _selectedColor = Colors.blue;
        _imageFile = null; // Reset input gambar baru
        _selectedFile = null; // Reset jalur gambar lama
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kontak Tersimpan Brow!")), // Menampilkan pesan sukses
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Eusian Kabeh Atuh!")), // Menampilkan pesan jika form tidak valid
      );
    }
  }

  // Fungsi untuk menghapus kontak
  void _deleteContact(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Asli rek dihapus?"), // Judul konfirmasi
          content: const Text("Leungit ngke mun dihapus"), // Pesan konfirmasi
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog jika tidak ingin menghapus
              },
              child: const Text("Teu Jadi"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  contacts.removeAt(index); // Menghapus kontak setelah konfirmasi
                });
                Navigator.of(context).pop(); // Menutup dialog setelah menghapus
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Kontak Terhapus")), // Menampilkan pesan setelah menghapus
                );
              },
              child: const Text("Hapus"),
            ),
          ],
        );
      },
    );
  }

  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  // Fungsi untuk mengedit kontak
  void _editContact(int index) {
    final contact = contacts[index]; // Mengambil kontak yang dipilih
    _nameController.text = contact['name']; // Mengisi kontrol nama dengan data kontak
    _phoneController.text = contact['phone']; // Mengisi kontrol nomor dengan data kontak
    _dateController.text = contact['date']; // Mengisi kontrol tanggal dengan data kontak
    _selectedColor = contact['color']; // Mengisi warna dengan data kontak
    _selectedFile = contact['file']; // Menyimpan jalur file gambar sebelumnya
    _imageFile = null; // Reset input gambar baru

    setState(() {
      contacts.removeAt(index); // Menghapus kontak sementara untuk menghindari duplikasi
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "UTS",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Ngaran"), // Input nama
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kudu Aya Ngaran."; // Validasi nama
                      }
                      if (!RegExp(r"^[A-Z][a-z]*(\s[A-Z][a-z]*)+$").hasMatch(value)) {
                        return "Nama harus terdiri dari minimal 2 kata,\ntidak boleh mengandung angka/karakter khusus,\ndimulai dari huruf kapital.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: "Nomor Hengpon"), // Input nomor telepon
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kudu Aya No HP"; // Validasi nomor telepon
                      }
                      if (!RegExp(r"^62\d{8,13}$").hasMatch(value)) {
                        return "Nomor kudu 8 sampe 13 digitna dan \nkudu dimulai dengan 62."; // Validasi format nomor
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: "Tanggal",
                      hintText: "YYYY-MM-DD",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          final pickedDate = await showDatePicker( // Pemilih tanggal
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate); // Menyimpan tanggal
                            });
                          }
                        },
                      ),
                    ),
                    readOnly: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kudu Aya Tanggalna"; // Validasi tanggal
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text("Pilih Warna: ", style: TextStyle(fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: _pickColor, // Memilih warna
                        child: Container(
                          width: 24,
                          height: 24,
                          color: _selectedColor, // Menampilkan warna yang dipilih
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Poto Bebenguk', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Center(
                        child: RoundButton(
                          title: "Pilih Poto", // Tombol untuk memilih foto
                          onPressed: () {
                            _pickFile(); // Memilih file gambar
                          },
                        ),
                      ),
                      if (_dataFile != null) Text('File Name: $_dataFile'),
                      const SizedBox(height: 10),
                      if (_imageFile != null)
                        Image.file( // Menampilkan gambar yang dipilih
                          _imageFile!,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                    ],
                  ),
                  SizedBox(height: 20),
                  RoundButton(
                    title: "Submit", // Tombol untuk mengirimkan form
                    onPressed: () {
                      _submitForm(); // Mengirimkan form
                    }
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            const Text(
              "List Contact",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index]; // Menampilkan kontak
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: contact['file'] != null
                          ? CircleAvatar(
                              backgroundImage: FileImage(File(contact['file'])), // Menampilkan gambar kontak jika ada
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white), // Avatar default jika tidak ada gambar
                            ),
                      title: Text(contact['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contact['phone']),
                          Text(contact['date']),
                          SizedBox(height: 4),
                          Container(
                            height: 8,
                            width: 100,
                            color: contact['color'], // Menampilkan warna yang dipilih
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editContact(index), // Edit kontak
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteContact(index), // Hapus kontak
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
}
