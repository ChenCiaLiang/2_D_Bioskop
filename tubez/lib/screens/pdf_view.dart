import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:tubez/screens/previewScreen.dart';
import 'package:tubez/model/pdfItem.dart';
import 'package:intl/intl.dart';

Future<void> createPDF(
  String name,
  double price,
  BuildContext context,
  List<Movie> soldMovies,
) async {
  final doc = pw.Document();
  final now = DateTime.now();
  final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

  final pdfTheme = pw.PageTheme(
    pageFormat: PdfPageFormat.a4,
    buildBackground: (pw.Context context) {
      return pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColor.fromHex('#FFBD59'), width: 1),
        ),
      );
    },
  );

  doc.addPage(
    pw.MultiPage(
        pageTheme: pdfTheme,
        header: (pw.Context context) {
          return headerPdf();
        },
        build: (pw.Context context) {
          return [
            // Title and general info
            pw.Text("Order Summary",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text("Name: $name", style: pw.TextStyle(fontSize: 12)),
            pw.Text("Total Price: Rp $price",
                style: pw.TextStyle(fontSize: 12)),
            pw.SizedBox(height: 20),
            // List of sold movies
            pw.Text("Sold Movies:",
                style:
                    pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            // Loop through the list of sold movies
            ...soldMovies.map((movie) {
              return pw.Text("${movie.name} - Rp ${movie.price}",
                  style: pw.TextStyle(fontSize: 12));
            }).toList(),
          ];
        },
        footer: (pw.Context context) {
          return pw.Container(
              color: PdfColors.amber, child: footerPDF(formattedDate));
        }),
  );

  Navigator.push(context,
      MaterialPageRoute(builder: (context) => PreviewScreen(doc: doc)));
}

pw.Header headerPdf() {
  return pw.Header(
      margin: pw.EdgeInsets.zero,
      outlineColor: PdfColors.amber50,
      outlineStyle: PdfOutlineStyle.normal,
      level: 5,
      decoration: pw.BoxDecoration(
        shape: pw.BoxShape.rectangle,
        gradient: pw.LinearGradient(
          colors: [PdfColor.fromHex('#FCDF8A'), PdfColor.fromHex("#F38381")],
          begin: pw.Alignment.topLeft,
          end: pw.Alignment.bottomRight,
        ),
      ),
      child: pw.Center(
        child: pw.Text(
          '-Modul 8 Library-',
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ));
}

pw.Center footerPDF(String formattedDate) => pw.Center(
    child: pw.Text('Created At $formattedDate',
        style: pw.TextStyle(fontSize: 10, color: PdfColors.blue)));
