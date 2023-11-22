import 'package:flutter/material.dart';
import 'package:mie_katalog_mobile/models/indomie.dart';
import 'package:mie_katalog_mobile/widgets/left_drawer.dart';

class DetailItem extends StatelessWidget {
  final Indomie mie;

  const DetailItem(this.mie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Indomie Katalog',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff482121),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text("Nama Indomie : ${mie.fields.name}"),
            Text("Mie amount : ${mie.fields.amount}"),
            Text("Mie price : ${mie.fields.price}"),
            const SizedBox(height: 10),
            Text("${mie.fields.description}"),
            SizedBox(height: 100),
            const Text("click on mie screen to go back"),
          ],
        ),
      ),
    );
  }
}
