import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  PDFScreen(this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          backgroundColor: color_primary_dark,
          title: ListTile(
            leading: Hero(
              tag: 'icon_laporan',
              child: Icon(
                icon_laporan,
                color: Colors.white,
              ),
            ),
            title: Hero(
              tag: 'text_laporan',
              child: Text(
                'Laporan',
                style: textstyle_appbar,
              ),
            ),
          ),
        ),
        path: pathPDF);
  }
}
