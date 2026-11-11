import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:praktek/pages/output_eskul.dart';

class FormPageEskul extends StatefulWidget {
  const FormPageEskul({super.key});

  @override
  State<FormPageEskul> createState() => _FormPageEskulState();
}

class _FormPageEskulState extends State<FormPageEskul> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  List<String> listEskul = [
    "pramuka",
    "paskibra",
    "pmr",
    "futsal",
    "basket",
    "voli",
  ];

  List<String> listKelas = ["X", "XI", "XII"];

  List<String> listAgama = [
    "Islam",
    "Kristen",
    "Katolik",
    "Hindu",
    "Budha",
    "Konghucu",
  ];

  String _jk = "";
  String? _kelas;
  String? _agama;
  String? _eskul; // <-- DISEDIAKAN VARIABEL _eskul
  String _tglLahir = "";

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Registrasi"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "No telepon",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "No telepon tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                    if (!value.contains('@')) {
                      return "Email tidak valid";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Kelas",
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _kelas,
                  items: listKelas.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _kelas = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kelas tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Ekstrakurikuler",
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _eskul,
                  items: listEskul.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _eskul = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ekstrakurikuler tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Jenis Kelamin",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                RadioGroup<String>(
                  groupValue: _jk,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _jk = value;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      const Radio<String>(value: "Laki-laki"),
                      const Text("Laki-laki"),
                      const SizedBox(width: 16),
                      const Radio<String>(value: "Perempuan"),
                      const Text("Perempuan"),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: "Tanggal Lahir",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.date_range),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-MM-dd')
                          .format(pickedDate);
                      setState(() {
                        _dateController.text = formattedDate;
                        _tglLahir = formattedDate;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tanggal lahir tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Agama",
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _agama,
                  items: listAgama.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _agama = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Agama tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_jk.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Pilih jenis kelamin terlebih dahulu",
                            ),
                          ),
                        );
                        return;
                      }
                      if (_kelas == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Pilih kelas terlebih dahulu"),
                          ),
                        );
                        return;
                      }
                      if (_eskul == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Pilih eskul terlebih dahulu"),
                          ),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OutputFormScreenEskul(
                            nama: _nameController.text,
                            jk: _jk,
                            tgllahir: _tglLahir,
                            agama: _agama!,
                            kelas: _kelas!,
                            email: _emailController.text,
                            noTelp: _phoneController.text,
                            eskul: _eskul!,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
