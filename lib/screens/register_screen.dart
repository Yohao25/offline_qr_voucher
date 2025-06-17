import 'package:flutter/material.dart';
import 'qr_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final dniController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Persona')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Nombre')),
            TextField(controller: dniController, decoration: InputDecoration(labelText: 'DNI')),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Generar QR y Voucher'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => QrScreen(
                    name: nameController.text,
                    dni: dniController.text,
                  )
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}