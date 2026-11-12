import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HitungJarak(),
    );
  }
}

class HitungJarak extends StatefulWidget {
  const HitungJarak({super.key});

  @override
  State<HitungJarak> createState() => _HitungJarakState();
}

class _HitungJarakState extends State<HitungJarak> {
  final waktuCtrl = TextEditingController();
  final kecepatanCtrl = TextEditingController();
  String hasil = '';

  void hitung() {
    final t = double.tryParse(waktuCtrl.text);
    final v = double.tryParse(kecepatanCtrl.text);

    if (t == null || v == null) {
      setState(() => hasil = 'Isi angka dengan benar');
      return;
    }

    final s = t * v;

    setState(() => hasil = 'S = $t x $v = $s');
  }

  @override
  void dispose() {
    waktuCtrl.dispose();
    kecepatanCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menghitung Jarak (S)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Rumus: S = t x v',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: waktuCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 't = waktu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: kecepatanCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'v = kecepatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitung,
              child: const Text('Cari Jarak (S)'),
            ),
            const SizedBox(height: 20),
            Text(
              hasil,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
