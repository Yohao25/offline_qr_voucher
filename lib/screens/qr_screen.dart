import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class QrScreen extends StatelessWidget {
  final String name;
  final String dni;

  QrScreen({required this.name, required this.dni});

  @override
  Widget build(BuildContext context) {
    final data = 'Nombre: \$name\nDNI: \$dni\nFecha: \${DateTime.now()}';

    return Scaffold(
      appBar: AppBar(title: Text('Código QR')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(data: data, version: QrVersions.auto, size: 200),
            SizedBox(height: 20),
            Text('Nombre: \$name'),
            Text('DNI: \$dni'),
            ElevatedButton(
              child: Text('Imprimir Voucher'),
              onPressed: () => imprimirVoucher(),
            )
          ],
        ),
      ),
    );
  }

  void imprimirVoucher() {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text('VOUCHER DE REGISTRO', style: pw.TextStyle(fontSize: 24)),
            pw.SizedBox(height: 10),
            pw.Text('Nombre: \$name'),
            pw.Text('DNI: \$dni'),
            pw.Text('Fecha: \${DateTime.now()}'),
            pw.SizedBox(height: 20),
            pw.BarcodeWidget(
              data: 'Nombre: \$name\nDNI: \$dni',
              barcode: pw.Barcode.qrCode(),
              width: 150,
              height: 150,
            )
          ],
        ),
      )
    );

    Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }
}