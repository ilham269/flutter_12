import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatihanContainer extends StatefulWidget {
  const LatihanContainer({super.key});

  @override
  State<LatihanContainer> createState() => _LatihanContainerState();
}

class _LatihanContainerState extends State<LatihanContainer> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // Dropdown variables
  String? _selectedKelas;
  final List<String> _kelasList = [
    'Kelas 10',
    'Kelas 11',
    'Kelas 12',
    'Akselerasi 1',
    'Akselerasi 2',
  ];

  // Checkbox variables
  final List<String> _eskulList = [
    'Pramuka',
    'Paskibra',
    'PMR',
    'Basket',
    'Futsal',
  ];
  final List<String> _selectedEskul = [];

  @override
  void dispose() {
    _namaController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Eskul"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Nama Lengkap
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Nama tidak boleh kosong" : null,
              ),
              const SizedBox(height: 16),

              // 2. No Telepone
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "No Telepon",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) =>
                    value!.isEmpty ? "No telepon tidak boleh kosong" : null,
              ),
              const SizedBox(height: 16),

              // 3. Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email tidak boleh kosong";
                  }
                  if (!value.contains("@")) {
                    return "Format email tidak valid";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 4. Kelas (Dropdown)
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Kelas",
                  border: OutlineInputBorder(),
                ),
                initialValue: _selectedKelas,
                items: _kelasList.map((String kelas) {
                  return DropdownMenuItem<String>(
                    value: kelas,
                    child: Text(kelas),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedKelas = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Silakan pilih kelas" : null,
              ),
              const SizedBox(height: 16),

              // 5. Eskul (Checkbox - Min 1, Max 2)
              const Text(
                "Pilih Ekstrakurikuler (Min 1, Max 2)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: _eskulList.map((eskul) {
                    return CheckboxListTile(
                      title: Text(eskul),
                      value: _selectedEskul.contains(eskul),
                      onChanged: (bool? isChecked) {
                        setState(() {
                          if (isChecked == true) {
                            if (_selectedEskul.length < 2) {
                              _selectedEskul.add(eskul);
                            } else {
                              // Validasi Maksimal 2
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Maksimal memilih 2 eskul!"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } else {
                            _selectedEskul.remove(eskul);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // 6. Tanggal Pendaftaran (Datepicker)
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Tanggal Pendaftaran",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dateController.text = DateFormat('yyyy-MM-dd')
                          .format(pickedDate);
                    });
                  }
                },
                validator: (value) =>
                    value!.isEmpty ? "Tanggal tidak boleh kosong" : null,
              ),
              const SizedBox(height: 24),

              // Tombol Submit
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Validasi Minimal 1 Eskul
                    if (_selectedEskul.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Pilih minimal 1 ekstrakurikuler!"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // Tampilkan hasil jika sukses
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Pendaftaran Berhasil"),
                        content: Text(
                          "Nama: ${_namaController.text}\n"
                          "No HP: ${_phoneController.text}\n"
                          "Email: ${_emailController.text}\n"
                          "Kelas: $_selectedKelas\n"
                          "Eskul: ${_selectedEskul.join(', ')}\n"
                          "Tanggal: ${_dateController.text}",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Daftar",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
